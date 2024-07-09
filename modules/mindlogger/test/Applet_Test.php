<?php

namespace LORIS\mindlogger\Test;

use \PHPUnit\Framework\TestCase;
use Psr\Http\Message\ServerRequestInterface;
use \LORIS\mindlogger\Endpoints\Applet;
use \LORIS\LorisInstance;

class Applet_Test extends TestCase
{
    private $dbMock;

    protected function setUp(): void
    {
        $this->dbMock = $this->createMock(\Database::class);

        $this->singletonMock = $this->getMockBuilder(\NDB_Factory::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->singletonMock->method('database')->willReturn($this->dbMock);

        \NDB_Factory::setInstance($this->singletonMock);
    }

    public function testHandleMissingAppletId()
    {
        $loris = $this->createMock(LorisInstance::class);
        $applet = new Applet($loris);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('pathparts')->willReturn([]);

        $response = $applet->handle($request);

        $this->assertInstanceOf(\LORIS\Http\Response\JSON\BadRequest::class, $response);
        $this->assertEquals(json_encode(['error' => 'Applet ID is missed']), (string) $response->getBody());
    }

    public function testHandleNotFound()
    {
        $loris = $this->createMock(LorisInstance::class);
        $applet = new Applet($loris);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('pathparts')->willReturn([0, 123, 'not_visits']);

        $response = $applet->handle($request);

        $this->assertInstanceOf(\LORIS\Http\Response\JSON\NotFound::class, $response);
    }

    public function testHandleVisitsValidRequest()
    {
        $loris = $this->createMock(LorisInstance::class);

        $this->dbMock->method('pselect')->willReturn([
            ['CandID' => '1', 'Visit_label' => 'V1', 'Test_name' => 'abc'],
            ['CandID' => '1', 'Visit_label' => 'V2', 'Test_name' => 'abc'],
            ['CandID' => '2', 'Visit_label' => 'V1', 'Test_name' => 'def'],
        ]);

        $applet = new Applet($loris);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('pathparts')->willReturn([0, 123, 'visits']);

        $response = $applet->handle($request);

        $this->assertInstanceOf(\LORIS\Http\Response\JSON\OK::class, $response);

        $expectedData = [
            'abc' => [['CandID' => '1', 'Visits' => ['V1', 'V2']]],
            'def' => [['CandID' => '2', 'Visits' => ['V1']]],
        ];

        $this->assertEquals($expectedData, json_decode((string) $response->getBody(), true));
    }

    public function testHandleAnswersValidRequest()
    {
        $loris = $this->createMock(LorisInstance::class);

        $this->dbMock->method('pselectCol')->willReturn([
            '{"abc123__1.1__def456__field1": "data1"}',
            '{"cba321__1.1__fed654__field2": "data2"}',
        ]);

        $applet = new Applet($loris);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('pathparts')->willReturn([0, 123, 'answers']);

        $response = $applet->handle($request);

        $this->assertInstanceOf(\LORIS\Http\Response\JSON\OK::class, $response);

        $expectedData = [
            'def456',
            'fed654'
        ];

        $this->assertEquals($expectedData, json_decode((string) $response->getBody(), true));
    }

    public static function setUpBeforeClass(): void
    {
        spl_autoload_register(
            function ($class) {
                if (strpos($class, "LORIS\\mindlogger\\") === 0) {
                    $fpath = __DIR__ . "/../php/"
                        . strtolower(substr($class, strlen("LORIS\\mindlogger\\")))
                        . ".class.inc";
                    $fpath = str_replace('\\', '/', $fpath);
                    if (!file_exists($fpath)) {
                        throw new \NotFound(
                            "Test autoload. File `$fpath` " .
                            "does not exist"
                        );
                    }
                    include $fpath;
                }
            }
        );
    }
}
