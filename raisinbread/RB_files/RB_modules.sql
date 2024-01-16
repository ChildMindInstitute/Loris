SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `modules`;
LOCK TABLES `modules` WRITE;
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (1,'acknowledgements','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (2,'api','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (3,'behavioural_qc','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (4,'brainbrowser','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (5,'bvl_feedback','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (6,'candidate_list','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (7,'candidate_parameters','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (8,'configuration','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (9,'conflict_resolver','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (10,'create_timepoint','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (11,'dashboard','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (12,'data_release','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (13,'datadict','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (15,'dicom_archive','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (16,'document_repository','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (17,'examiner','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (18,'genomic_browser','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (19,'help_editor','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (20,'imaging_browser','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (21,'imaging_qc','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (22,'imaging_uploader','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (23,'instrument_builder','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (24,'instrument_list','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (25,'instrument_manager','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (26,'instruments','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (27,'issue_tracker','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (28,'login','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (29,'media','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (30,'mri_violations','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (31,'new_profile','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (32,'next_stage','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (33,'publication','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (34,'server_processes_manager','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (35,'statistics','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (36,'survey_accounts','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (37,'timepoint_list','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (38,'user_accounts','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (39,'battery_manager','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (40,'module_manager','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (41,'electrophysiology_browser','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (42,'my_preferences','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (43,'candidate_profile','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (44,'dqt','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (45,'api_docs','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (46,'dictionary','Y');
INSERT INTO `modules` (`ID`, `Name`, `Active`) VALUES (47,'electrophysiology_uploader','Y');
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
