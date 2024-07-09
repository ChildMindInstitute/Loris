<?php

namespace LORIS\mindlogger\Test;

use PHPUnit\Framework\TestCase;
use Loris\Behavioural\NDB_BVL_Instrument_Mindlogger;
use LORIS\LorisInstance;

class NDB_BVL_Instrument_Mindlogger_Test extends TestCase
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

    public function testSetup()
    {
        $instrument = new NDB_BVL_Instrument_Mindlogger(
            $this->getLorisInstance(),
            $this->getLorisInstance()->getModule("instruments"),
            '',
            '',
            ''
        );

        $instrument->setup('commentID', 'page');

        // Assuming the parent setup method does not throw any exceptions
        $this->assertTrue(true);
    }

    public function testGetFullName()
    {
        $instrument = new NDB_BVL_Instrument_Mindlogger(
            $this->getLorisInstance(),
            $this->getLorisInstance()->getModule("instruments"),
            '',
            '',
            ''
        );

        $this->assertEquals("Mindlogger Applet", $instrument->getFullName());
    }

    public function testLoadInstrumentFile()
    {
        $mock = $this->getMockBuilder(NDB_BVL_Instrument_Mindlogger::class)
            ->setConstructorArgs([
                $this->getLorisInstance(),
                $this->getLorisInstance()->getModule("instruments"),
                '',
                '',
                '',
            ])
            ->onlyMethods(['getSchemaByActivityId'])
            ->getMock();

        $mock->expects($this->once())
            ->method('getSchemaByActivityId')
            ->with('123')
            ->willReturn($this->getTestData());

        $mock->loadInstrumentFile('123');

        $this->assertEquals('applet name (Activity 1 for all items, 1.1)', $mock->getFullName());
        $this->assertCount(1, $mock->getSubtestList());
        $this->assertEquals('Activity 1 for all items', $mock->getSubtestList()[0]['Name']);
        $this->assertEquals('Test description', $mock->getSubtestList()[0]['Description']);
    }

    public static function setUpBeforeClass(): void
    {
        spl_autoload_register(
            function ($class) {
                include __DIR__ . '/../../instruments/php/dictionaryitem.class.inc';
                if (strpos($class, "Loris\\Behavioural\\") === 0) {
                    $fpath = __DIR__ . "/../../../php/libraries/"
                        . strtolower(substr($class, strlen("Loris\\Behavioural\\")))
                        . ".class.inc";
                    $fpath = str_replace('\\', '/', $fpath);
                    if (!file_exists($fpath)) {
                        throw new \NotFound(
                            "Test autoload: file `$fpath` " .
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

    public function getTestData()
    {
        return [
            'ActivitySchema' => '{"id":"8f1b7244-ca83-4613-85ba-e2b2c03e2de1","name":"Activity 1 for all items","description":"Test description","splash_screen":"","image":"","order":1,"createdAt":"2023-12-20T14:52:06.604563","items":[{"id":"c0be15d8-787c-4819-8c38-6f3e09a3e51c","question":"Choose one","responseType":"singleSelect","responseValues":{"options":[{"id":"3dbd294c-5c84-4fbf-b6d6-cbb87064cfcb","text":"first","alert":null,"color":null,"image":null,"score":null,"value":0,"tooltip":null,"is_hidden":false},{"id":"48df0b62-3ecd-4ec3-aec6-6a2b6f1cf7cb","text":"second","alert":null,"color":null,"image":null,"score":null,"value":1,"tooltip":null,"is_hidden":false},{"id":"f5333235-07ac-4473-85a6-be5fa883d3d5","text":"third","alert":null,"color":null,"image":null,"score":null,"value":2,"tooltip":null,"is_hidden":false}],"palette_name":null},"config":{"timer":0,"add_scores":false,"add_tokens":null,"set_alerts":false,"add_tooltip":false,"set_palette":false,"skippable_item":false,"randomize_options":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_single_selection","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"878f4b3d-3a43-437d-aa01-a74c8669fece","question":"choose more than one","responseType":"multiSelect","responseValues":{"options":[{"id":"c78e1aaf-5c29-4d8e-be6d-26ff5c1559a1","text":"first","alert":null,"color":null,"image":null,"score":null,"value":0,"tooltip":null,"is_hidden":false},{"id":"c803ec0a-fe67-4712-9be3-d9837bae21bb","text":"second","alert":null,"color":null,"image":null,"score":null,"value":1,"tooltip":null,"is_hidden":false},{"id":"a8aa888e-9ba1-412b-8937-2dea36fb6599","text":"third","alert":null,"color":null,"image":null,"score":null,"value":2,"tooltip":null,"is_hidden":false}],"palette_name":null},"config":{"timer":0,"add_scores":false,"add_tokens":null,"set_alerts":false,"add_tooltip":false,"set_palette":false,"skippable_item":false,"randomize_options":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_multi_selection","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"bb00cc63-0f7b-450c-84c5-b020df0c9f18","question":"some text for slider","responseType":"slider","responseValues":{"alerts":null,"scores":null,"max_image":null,"max_label":"max","max_value":5,"min_image":null,"min_label":"min","min_value":0},"config":{"timer":0,"add_scores":false,"set_alerts":false,"skippable_item":false,"show_tick_marks":false,"show_tick_labels":false,"continuous_slider":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_slider","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"1646a3d0-70ac-4dad-849d-236266d587fa","question":"some text for number selection","responseType":"numberSelect","responseValues":{"max_value":3,"min_value":0},"config":{"skippable_item":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_number_selection","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"78813612-72df-43cd-8193-8afd55d17791","question":"text for test time range","responseType":"timeRange","responseValues":null,"config":{"timer":0,"skippable_item":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_time_range","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"e49a31ea-5b8e-4bc2-850d-4a336df9ae00","question":"text for test geolocation","responseType":"geolocation","responseValues":null,"config":{"timer":0,"skippable_item":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_geolocation","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"394d5726-2926-401c-b54e-8db9fb19da97","question":"text for test date","responseType":"date","responseValues":null,"config":{"timer":0,"skippable_item":false,"remove_back_button":false,"additional_response_option":{"text_input_option":false,"text_input_required":false}},"name":"test_date","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"4ee5050d-23b0-4162-af6e-517c9aa3df4b","question":"text for test slider rows","responseType":"sliderRows","responseValues":{"rows":[{"id":"b51835a4-cbed-4616-ba7a-7eb1f4a0dc0b","label":"label1","alerts":null,"scores":null,"max_image":null,"max_label":"max1","max_value":5,"min_image":null,"min_label":"min1","min_value":1},{"id":"67b42a02-58d9-488a-89b4-0f0c6739952f","label":"label2","alerts":null,"scores":null,"max_image":null,"max_label":"max2","max_value":10,"min_image":null,"min_label":"min2","min_value":6}]},"config":{"timer":0,"add_scores":false,"set_alerts":false,"skippable_item":false,"remove_back_button":false},"name":"test_slider_rows","isHidden":false,"conditionalLogic":null,"allowEdit":true},{"id":"fb1a9d61-16a0-4959-ac46-87c8ca4d46a3","question":"text for test single selection per row","responseType":"singleSelectRows","responseValues":{"rows":[{"id":"d9df243d-0fd2-4139-951b-b42e5abb18f2","tooltip":null,"row_name":"row1","row_image":null},{"id":"37894dbf-cb7d-4903-8f69-e17b452c8f7a","tooltip":null,"row_name":"row2","row_image":null},{"id":"3fdc38c6-6271-4aea-93f6-3f04a13ad9a7","tooltip":null,"row_name":"row3","row_image":null}],"options":[{"id":"697b53e8-fd24-4965-8fa0-24565cd9df88","text":"opt1","image":null,"tooltip":null},{"id":"6208e37d-65cc-436c-bf59-3f768ebd194f","text":"opt2","image":null,"tooltip":null},{"id":"528f8364-16e2-465d-82af-3c72267e7300","text":"opt3","image":null,"tooltip":null}],"data_matrix":null},"config":{"timer":0,"add_scores":false,"add_tokens":null,"set_alerts":false,"add_tooltip":false,"skippable_item":false,"remove_back_button":false},"name":"test_single_selection_per_row","isHidden":false,"conditionalLogic":null,"allowEdit":true}]}',
            'ActivityID' => 123,
            'AppletName' => 'applet name',
            'Version' => '1.1'
        ];
    }
}
