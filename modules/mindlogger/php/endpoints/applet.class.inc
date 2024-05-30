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

        if ($pathparts[2] != 'visits') {
            return new \LORIS\Http\Response\JSON\NotFound();
        }

        $appletId = $pathparts[1];

        $result = $this->getVisits($appletId);

        $candidates = [];
        $data = [];
        foreach ($result as $entry) {
            $candidates[$entry['CandID']][] = $entry['Visit_label'];
        }

        foreach ($candidates as $candidateId => $entry) {
            $data[] = [
                'CandID' => $candidateId,
                'Visits' => array_unique($entry),
            ];
        }

        return new \LORIS\Http\Response\JSON\OK($data);
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
            LEFT JOIN flag f ON (s.ID = f.SessionID)
            LEFT JOIN instrument_mindlogger_schema ims ON (ims.ActivityId = f.Test_name)
            LEFT JOIN conflicts_unresolved cu
                ON (cu.CommentId1 = f.CommentID OR cu.CommentID2 = f.CommentID)
            LEFT JOIN candidate c USING (CandID)
            WHERE
                c.Active = 'Y'
                AND s.Active = 'Y'
                AND f.Data_entry = 'In Progress'
                AND ims.AppletId = :appletId
                AND f.CommentID NOT LIKE 'DDE%'
            GROUP BY
                s.ID,
                s.Date_visit,
                f.Test_name,
                f.CommentID,
                s.Current_stage,
                s.Screening,
                s.Approval
            ORDER BY s.Visit_label, f.Test_name, f.CommentID",
            ['appletId' => $appletId]
        );
    }
}
