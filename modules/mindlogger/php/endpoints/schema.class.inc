<?php declare(strict_types=1);
/**
 * This implements the Schema endpoint class
 *
 * PHP Version 8
 *
 * @category Mindlogger
 * @package  Mindlogger
 * @author   Dzmitry Yahur <dyagur@scnsoft.com>
 * @license  http://www.gnu.org/licenses/gpl-3.0.txt GPLv3
 * @link     https://github.com/aces/Loris
 */

namespace LORIS\mindlogger\Endpoints;

use \Psr\Http\Message\ServerRequestInterface;
use \Psr\Http\Message\ResponseInterface;
use \LORIS\mindlogger\Endpoint;

/**
 * A class for handling the /schema endpoint.
 *
 * @category Mindlogger
 * @package  Mindlogger
 * @author   Dzmitry Yahur <dyagur@scnsoft.com>
 * @license  http://www.gnu.org/licenses/gpl-3.0.txt GPLv3
 * @link     https://github.com/aces/Loris
 */
class Schema extends Endpoint
{
    const INSTRUMENT_SUBGROUP_NAME = "Mindlogger instruments";

    /**
     * @var \Database
     */
    private $db;

    public function __construct(\LORIS\LorisInstance $loris)
    {
        $this->db = \NDB_Factory::singleton()->database();

        parent::__construct($loris);
    }

    /**
     * Permission checks
     *
     * @param \User $user The requesting user
     *
     * @return boolean true if access is permitted
     */
    private function _hasAccess(\User $user)
    {
        return $user->hasPermission('mindlogger_schema_create');
    }

    /**
     * Return which methods are supported by this endpoint.
     *
     * @return array supported HTTP methods
     */
    protected function allowedMethods(): array
    {
        return ['POST'];
    }

    /**
     * Versions of the Mindlogger API which are supported by this
     * endpoint.
     *
     * @return array a list of supported API versions.
     */
    protected function supportedVersions(): array
    {
        return ["v1",];
    }


    /**
     * Handles a request starts with /schema
     *
     * @param ServerRequestInterface $request The incoming PSR7 request
     *
     * @return ResponseInterface The outgoing PSR7 response
     */
    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $user = $request->getAttribute('user');

        if ($user instanceof \LORIS\AnonymousUser) {
            return new \LORIS\Http\Response\JSON\Unauthorized();
        }

        if (!$this->_hasAccess($user)) {
            return new \LORIS\Http\Response\JSON\Forbidden();
        }

        switch ($request->getMethod()) {
            case 'POST':
                return $this->_handlePOST($request);

            case 'OPTIONS':
                return (new \LORIS\Http\Response())
                    ->withHeader('Allow', $this->allowedMethods());

            default:
                return new \LORIS\Http\Response\JSON\MethodNotAllowed(
                    $this->allowedMethods()
                );
        }
    }

    /**
     * Handle a POST request to the /schema endpoint
     *
     * @param ServerRequestInterface $request The incoming PSR7 request
     *
     * @return ResponseInterface The outgoing PSR7 response
     */
    private function _handlePOST(ServerRequestInterface $request): ResponseInterface
    {
        $data = json_decode((string) $request->getBody(), true);

        try {
            $this->db->beginTransaction();

            foreach ($data as $versionSchema) {
                $version = $versionSchema['version'];
                $schema = $versionSchema['applet'];

                $appletId     = $schema['id'];
                $appletName   = $schema['displayName'];
                $activitiesSchema = $schema['activities'];

                $existingActivities = $this->getExistingActivities($appletId, $version);
                $instrumentSubgroupId = $this->getSubgroupId();

                foreach ($activitiesSchema as $activity) {
                    $activityId = $activity['id'];
                    //Do not proceed already exists entries
                    if (in_array($activityId, $existingActivities)) {
                        continue;
                    }

                    $this->saveSchema($appletId, $appletName, $version, $activity);
                    $this->makeInstrument($activityId, $instrumentSubgroupId, $activity["name"] . ' ' . $version);
                }
            }

            $this->db->commit();

            return new \LORIS\Http\Response\JsonResponse(["status" => "OK"]);
        } catch (\Exception $e) {
            $this->db->rollback();
            return new \LORIS\Http\Response\JSON\BadRequest(
                $e->getMessage()
            );
        }
    }

    public function getExistingActivities($appletId, $version)
    {
        return $this->db->pselectCol("SELECT ActivityID FROM instrument_mindlogger_schema WHERE AppletID = ? AND Version = ?", [$appletId, $version]);
    }

    public function getSubgroupId()
    {
        return $this->db->pselectOneInt("SELECT ID FROM test_subgroups WHERE Subgroup_name = ?", [self::INSTRUMENT_SUBGROUP_NAME]);
    }


    /**
     * Create an instrument in the database
     *
     * @param string $testName The name of the instrument
     * @param string $fullName The full name of the instrument
     *
     * @return void
     */
    protected function makeInstrument(string $testName, int $subgroupId, string $fullName): void
    {
        $this->db->insertIgnore(
            'test_names',
            [
                'Test_name'     => $testName,
                'Full_name'     => $fullName,
                'Sub_group'     => $subgroupId,
                'IsDirectEntry' => 0,
            ]
        );
    }

    public function saveSchema($appletId, $appletName, $version, $data)
    {
        $this->db->unsafeInsert(
            'instrument_mindlogger_schema',
            [
                'AppletID'       => $appletId,
                'AppletName'     => $appletName,
                'Version'        => $version,
                'ActivityID'     => $data['id'],
                'ActivitySchema' => json_encode($data),
            ]
        );
    }
}