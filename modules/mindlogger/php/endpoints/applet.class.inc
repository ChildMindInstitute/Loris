<?php declare(strict_types=1);

namespace LORIS\mindlogger\Endpoints;

use LORIS\mindlogger\Endpoint;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class Applet extends Endpoint
{
    public function __construct(\LORIS\LorisInstance $loris)
    {
        $this->db = \NDB_Factory::singleton()->database();
        parent::__construct($loris);
    }

    protected function allowedMethods(): array
    {
        return ['GET'];
    }

    protected function supportedVersions(): array
    {
        return ["v1",];
    }

    private function _hasAccess(\User $user)
    {
        return $user->hasPermission('mindlogger_schema_create');
    }

    public function handle(ServerRequestInterface $request) : ResponseInterface
    {
        $pathparts = $request->getAttribute('pathparts');

        if (!isset($pathparts[1])) {
            return new \LORIS\Http\Response\JSON\BadRequest(
                'Applet ID is missed'
            );
        }

        $appletId = $pathparts[1];
        switch ($pathparts[2]) {
            case 'visits':
                $data = $this->handleVisits($appletId);
                break;
            case 'versions':
                $data = $this->handleVersions($appletId);
                break;
            case 'answers':
                $data = $this->handleAnswers($appletId);
                break;
            default:
                return new \LORIS\Http\Response\JSON\NotFound();
        }

        return new \LORIS\Http\Response\JSON\OK($data);
    }

    private function handleVisits($appletId)
    {
        $result = $this->getVisits($appletId);

        $activities = [];
        $data = [];
        foreach ($result as $entry) {
            if (!isset($activities[$entry['Test_name']][$entry['CandID']])) {
                $activities[$entry['Test_name']][$entry['CandID']] = [];
            }

            $activities[$entry['Test_name']][$entry['CandID']][] = $entry['Visit_label'];
        }

        foreach ($activities as $activityId => $candidates) {
            foreach ($candidates as $candidateId => $entry) {
                $data[$activityId][] = [
                    'CandID' => $candidateId,
                    'Visits' => array_unique($entry),
                ];
            }
        }

        return $data;
    }

    private function handleVersions($appletId)
    {
        return $this->getAppletVersions($appletId);
    }

    private function handleAnswers($appletId)
    {
        $activities = $this->getActivitiesDataByAppletId($appletId);
        $answers = [];

        foreach ($activities as $activity) {
            $activity = json_decode($activity, true);

            foreach ($activity as $activityKey => $item) {
                $parts = explode('__', $activityKey);

                if (isset($parts[2])) {
                    $answers[] = $parts[2];
                }
            }
        }

        return $answers;
    }

    public function getVisits($appletId)
    {
        return $this->db->pselect(
            "
            SELECT
                f.Test_name,
                c.CandID,
                s.Visit_label
            FROM session s
            JOIN flag f ON (s.ID = f.SessionID)
            JOIN instrument_mindlogger_schema ims ON (ims.ActivityId = f.Test_name)
            JOIN candidate c USING (CandID)
            WHERE
                c.Active = 'Y'
                AND ims.AppletId = :appletId
            GROUP BY
                s.ID,
                f.Test_name
            ",
            ['appletId' => $appletId]
        );
    }

    private function getAppletVersions($appletId)
    {
        return $this->db->pselectCol("
            SELECT `Version` FROM `instrument_mindlogger_schema` WHERE `AppletId` = ? GROUP BY `Version`
        ", [$appletId]);
    }

    private function getActivitiesDataByAppletId($appletId)
    {
        return $this->db->pselectCol("
            SELECT `flag`.`Data` FROM `flag`
            JOIN `instrument_mindlogger_schema` ON flag.Test_name = instrument_mindlogger_schema.ActivityID
            WHERE instrument_mindlogger_schema.`AppletId` = ? AND `flag`.Data IS NOT NULL
        ", [$appletId]);
    }
}
