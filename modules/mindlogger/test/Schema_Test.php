<?php

namespace LORIS\mindlogger\Test;

use LORIS\AnonymousUser;
use LORIS\Http\Response\JSON\Forbidden;
use LORIS\Http\Response\JSON\MethodNotAllowed;
use LORIS\Http\Response\JSON\Unauthorized;
use LORIS\mindlogger\Endpoints\Schema;
use Psr\Http\Message\ServerRequestInterface;
use \LORIS\LorisInstance;

class Schema_Test extends \PHPUnit\Framework\TestCase
{
    protected function setUp(): void
    {
        $this->dbMock = $this->createMock(\Database::class);

        $this->singletonMock = $this->getMockBuilder(\NDB_Factory::class)
            ->disableOriginalConstructor()
            ->getMock();

        $this->singletonMock->method('database')->willReturn($this->dbMock);

        \NDB_Factory::setInstance($this->singletonMock);
    }

    public function testAllowedMethods()
    {
        $schema = new Schema($this->getLorisInstance());
        $this->assertEquals(['POST'], $this->invokeMethod($schema, 'allowedMethods'));
    }

    public function testSupportedVersions()
    {
        $schema = new Schema($this->getLorisInstance());
        $this->assertEquals(['v1'], $this->invokeMethod($schema, 'supportedVersions'));
    }

    public function testHandleUnauthorized()
    {
        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('user')->willReturn(new AnonymousUser());

        $schema = new Schema($this->getLorisInstance());
        $response = $schema->handle($request);

        $this->assertInstanceOf(Unauthorized::class, $response);
    }

    public function testHandleForbidden()
    {
        $user = $this->createMock(\User::class);
        $user->method('hasPermission')->willReturn(false);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('user')->willReturn($user);

        $schema = new Schema($this->getLorisInstance());
        $response = $schema->handle($request);

        $this->assertInstanceOf(Forbidden::class, $response);
    }

    public function testHandleMethodNotAllowed()
    {
        $user = $this->createMock(\User::class);
        $user->method('hasPermission')->willReturn(true);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('user')->willReturn($user);
        $request->method('getMethod')->willReturn('GET');

        $schema = new Schema($this->getLorisInstance());
        $response = $schema->handle($request);

        $this->assertInstanceOf(MethodNotAllowed::class, $response);
    }

    public function testHandlePost()
    {
        $user = $this->createMock(\User::class);
        $user->method('hasPermission')->willReturn(true);

        $request = $this->createMock(ServerRequestInterface::class);
        $request->method('getAttribute')->with('user')->willReturn($user);
        $request->method('getMethod')->willReturn('POST');

        $body = '[{
    "version": "2.1.1",
    "applet": {
        "id": "new7a944-22d8-1858-d681-d5a900000000",
        "displayName": "NKI RS2 Daily Activities (New) (copy)",
        "description": "Daily questions about physical and mental health, NIMH content",
        "activities": [
            {
                "id": "64e7a7dd-22d8-1858-d681-ca8f00000000",
                "name": "Pre-Questionnaire",
                "description": "Pre-assessment questions",
                "order": 1,
                "createdAt": "2023-08-24T19:02:28.313000",
                "items": [
                    {
                        "question": "A1 Question 1",
                        "responseType": "singleSelect",
                        "responseValues": {
                            "paletteName": null,
                            "options": [
                                {
                                    "id": "6ea85b60-1bd7-410f-80bd-557fc8eae63d",
                                    "text": "1",
                                    "image": null,
                                    "score": 1,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": "A1 Danger 1",
                                    "value": 0
                                },
                                {
                                    "id": "0124a056-aa9e-4596-b685-88cff50c045c",
                                    "text": "2",
                                    "image": null,
                                    "score": 2,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 1
                                },
                                {
                                    "id": "39ba88f9-cdc9-4027-927c-6e76c11af97e",
                                    "text": "3",
                                    "image": null,
                                    "score": 3,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 2
                                }
                            ]
                        },
                        "name": "A1_Single_Selection_1",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "c9a9a761-2f06-42e0-9f0a-97329ac0a03f"
                    },
                    {
                        "question": "A1 Question 2",
                        "responseType": "multiSelect",
                        "responseValues": {
                            "paletteName": null,
                            "options": [
                                {
                                    "id": "2f41738b-9174-4da5-98f4-c6b2a0ded64a",
                                    "text": "1",
                                    "image": null,
                                    "score": 1,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": "A1 Danger 2",
                                    "value": 0
                                },
                                {
                                    "id": "aedfd5cb-2613-4456-a872-3effe01710e6",
                                    "text": "2",
                                    "image": null,
                                    "score": 2,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 1
                                },
                                {
                                    "id": "d2150ba2-c413-402a-96f1-19fec92757f5",
                                    "text": "3",
                                    "image": null,
                                    "score": 3,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 2
                                }
                            ]
                        },
                        "name": "A1_Multiple_Selection",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "a24a90b8-5067-4c30-835c-4751ba20c1c3"
                    },
                    {
                        "question": "A1 Question 3",
                        "responseType": "slider",
                        "responseValues": {
                            "minLabel": "Min",
                            "maxLabel": "Max",
                            "minValue": 1,
                            "maxValue": 3,
                            "minImage": null,
                            "maxImage": null,
                            "scores": [
                                1,
                                2,
                                3
                            ],
                            "alerts": [
                                {
                                    "value": 1,
                                    "minValue": null,
                                    "maxValue": null,
                                    "alert": "A1 Danger 3"
                                }
                            ]
                        },
                        "name": "A1_Slider",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "4658a2c0-4829-4c32-b30c-53c3be6f3cde"
                    },
                    {
                        "question": "Write The text",
                        "responseType": "text",
                        "responseValues": null,
                        "config": {
                            "removeBackButton": false,
                            "skippableItem": false,
                            "maxResponseLength": 311,
                            "correctAnswerRequired": false,
                            "correctAnswer": "",
                            "numericalResponseRequired": false,
                            "responseDataIdentifier": false,
                            "responseRequired": false,
                            "isIdentifier": null
                        },
                        "name": "A1_Text",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "13ba415d-6c44-4bdd-84a8-0d610a765557",
                        "order": 4
                    },
                    {
                        "question": "Choone number",
                        "responseType": "numberSelect",
                        "responseValues": {
                            "minValue": 10,
                            "maxValue": 11
                        },
                        "config": {
                            "removeBackButton": false,
                            "skippableItem": false,
                            "additionalResponseOption": {
                                "textInputOption": false,
                                "textInputRequired": false
                            }
                        },
                        "name": "A1_Number",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "ba11bb70-6663-4d40-a93a-abfcf31e6277",
                        "order": 5
                    }
                ]
            },
            {
                "id": "64e7a7dd-22d8-1858-d681-ca9000000000",
                "name": "EMA Assessment (Evening)",
                "description": "A2 evening questionnaire",
                "order": 2,
                "createdAt": "2023-08-24T19:02:28.313000",
                "items": [
                    {
                        "question": "A2 Question 1",
                        "responseType": "singleSelect",
                        "responseValues": {
                            "paletteName": null,
                            "options": [
                                {
                                    "id": "6ea85b60-1bd7-410f-80bd-557fc8eae631",
                                    "text": "1",
                                    "image": null,
                                    "score": 1,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": "A2 Danger 1",
                                    "value": 0
                                },
                                {
                                    "id": "0124a056-aa9e-4596-b685-88cff50c0452",
                                    "text": "2",
                                    "image": null,
                                    "score": 2,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 1
                                },
                                {
                                    "id": "39ba88f9-cdc9-4027-927c-6e76c11af973",
                                    "text": "3",
                                    "image": null,
                                    "score": 3,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 2
                                }
                            ]
                        },
                        "name": "A2_Single_Selection_1",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "c9a9a761-2f06-42e0-9f0a-97329ac0a034"
                    },
                    {
                        "question": "A2 Question 2",
                        "responseType": "multiSelect",
                        "responseValues": {
                            "paletteName": null,
                            "options": [
                                {
                                    "id": "2f41738b-9174-4da5-98f4-c6b2a0ded645",
                                    "text": "1",
                                    "image": null,
                                    "score": 1,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": "A2 Danger 2",
                                    "value": 0
                                },
                                {
                                    "id": "aedfd5cb-2613-4456-a872-3effe0171066",
                                    "text": "2",
                                    "image": null,
                                    "score": 2,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 1
                                },
                                {
                                    "id": "d2150ba2-c413-402a-96f1-19fec92757f7",
                                    "text": "3",
                                    "image": null,
                                    "score": 3,
                                    "tooltip": null,
                                    "isHidden": false,
                                    "color": null,
                                    "alert": null,
                                    "value": 2
                                }
                            ]
                        },
                        "name": "A2_Multiple_Selection",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "a24a90b8-5067-4c30-835c-4751ba20c1c8"
                    },
                    {
                        "question": "A2 Question 3",
                        "responseType": "slider",
                        "responseValues": {
                            "minLabel": "Min",
                            "maxLabel": "Max",
                            "minValue": 1,
                            "maxValue": 3,
                            "minImage": null,
                            "maxImage": null,
                            "scores": [
                                1,
                                2,
                                3
                            ],
                            "alerts": [
                                {
                                    "value": 1,
                                    "minValue": null,
                                    "maxValue": null,
                                    "alert": "A2 Danger 3"
                                }
                            ]
                        },
                        "name": "A2_Slider",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "4658a2c0-4829-4c32-b30c-53c3be6f3cd9"
                    },
                    {
                        "question": "Write The text",
                        "responseType": "text",
                        "responseValues": null,
                        "config": {
                            "removeBackButton": false,
                            "skippableItem": false,
                            "maxResponseLength": 311,
                            "correctAnswerRequired": false,
                            "correctAnswer": "",
                            "numericalResponseRequired": false,
                            "responseDataIdentifier": false,
                            "responseRequired": false,
                            "isIdentifier": null
                        },
                        "name": "A2_Text",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "13ba415d-6c44-4bdd-84a8-0d610a765559",
                        "order": 4
                    },
                    {
                        "question": "Choone number",
                        "responseType": "numberSelect",
                        "responseValues": {
                            "minValue": 10,
                            "maxValue": 11
                        },
                        "config": {
                            "removeBackButton": false,
                            "skippableItem": false,
                            "additionalResponseOption": {
                                "textInputOption": false,
                                "textInputRequired": false
                            }
                        },
                        "name": "A2_Number",
                        "isHidden": false,
                        "conditionalLogic": null,
                        "allowEdit": true,
                        "id": "ba11bb70-6663-4d40-a93a-abfcf31e6279",
                        "order": 5
                    }
                ]
            }
        ]
    }
}]';

        $request->method('getBody')->willReturn($body);

        $this->dbMock->expects($this->once())->method('beginTransaction');
        $this->dbMock->expects($this->once())->method('commit');
        $schema = $this->getMockBuilder(Schema::class)
            ->setConstructorArgs([$this->getLorisInstance()])
            ->onlyMethods(['getSubgroupId'])
            ->getMock();

        $schema->method('getSubgroupId')->willReturn(1);

        $this->dbMock->expects($this->exactly(2))->method('unsafeInsert');

        $this->invokeMethod($schema, '_handlePost', [$request]);
    }


    public function invokeMethod(&$object, $methodName, array $parameters = array())
    {
        $reflection = new \ReflectionClass(get_class($object));
        $method = $reflection->getMethod($methodName);
        $method->setAccessible(true);

        return $method->invokeArgs($object, $parameters);
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

    /**
     * @return LorisInstance|(LorisInstance&object&\PHPUnit\Framework\MockObject\MockObject)|(LorisInstance&\PHPUnit\Framework\MockObject\MockObject)|(object&\PHPUnit\Framework\MockObject\MockObject)|\PHPUnit\Framework\MockObject\MockObject
     */
    public function getLorisInstance()
    {
        return $this->createMock(LorisInstance::class);
    }
}
