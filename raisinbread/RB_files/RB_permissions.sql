SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `permissions`;
LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (1,'superuser','Superuser - supersedes all permissions',NULL,NULL,1);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (2,'user_accounts','User Accounts - Own Sites',38,'View/Create/Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (3,'user_accounts_multisite','User Accounts - All Sites',38,'View/Create/Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (4,'context_help','Help documentation',19,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (5,'bvl_feedback','Feedback Threads',5,'Create/Edit',1);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (6,'imaging_browser_qc','Status',20,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (8,'send_to_dcc','Send to DCC',24,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (9,'unsend_to_dcc','Reverse Send from DCC',24,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (10,'access_all_profiles','Candidates and Timepoints - All Sites',6,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (11,'data_entry','Candidates and Timepoints - Own Sites',6,'View/Create',1);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (12,'examiner_view','Add and Certify Examiners - Own Sites',17,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (13,'examiner_multisite','Add and Certify Examiners - All Sites',17,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (17,'conflict_resolver','Resolve Conflicts',9,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (18,'data_dict_view','Parameter Type Descriptions',13,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (19,'violated_scans_view_allsites','Violated Scans - All Sites',30,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (22,'config','Settings',8,'View/Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (23,'imaging_browser_view_site','Imaging Scans - Own Sites',20,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (24,'imaging_browser_view_allsites','Imaging Scans - All Sites',20,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (25,'dicom_archive_view_allsites','DICOMs - All Sites',15,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (28,'instrument_builder','Instrument Forms',23,'Create/Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (29,'data_dict_edit','Parameter Type Descriptions',13,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (31,'candidate_parameter_view','Candidate Information',7,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (32,'candidate_parameter_edit','Candidate Information',7,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (33,'genomic_browser_view_site','Genomic Data - Own Sites',18,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (34,'genomic_browser_view_allsites','Genomic Data - All Sites',18,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (35,'document_repository_view','Documents',16,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (36,'document_repository_delete','Documents',16,'Delete',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (37,'server_processes_manager','Processes',34,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (38,'imaging_uploader','Imaging Scans',22,'View/Upload',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (39,'acknowledgements_view','Acknowledgee List',1,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (40,'acknowledgements_edit','Acknowledgee List',1,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (41,'dataquery_view','Cross-Modality Data',44,'View/Download',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (42,'genomic_data_manager','Genomic Files',18,'Upload',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (43,'media_write','Candidate Media Files',29,'Edit/Upload/Delete',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (44,'media_read','Candidate Media Files',29,'View/Download',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (45,'issue_tracker_reporter','Create/Edit Own Issues and Comment on All Issues',27,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (46,'issue_tracker_developer','Close/Edit/Re-assign/Comment on All Issues',27,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (47,'imaging_browser_phantom_allsites','Phantom Scans - All Sites',20,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (48,'imaging_browser_phantom_ownsite','Phantom Scans - Own Sites',20,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (49,'instrument_manager_read','Installed Instruments',25,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (50,'instrument_manager_write','Upload and Install Instruments',25,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (51,'data_release_upload','Release Files',12,'Upload',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (52,'data_release_edit_file_access','Grant Other Users Access to Releases',12,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (53,'publication_view','Publication Projects',33,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (54,'publication_propose','Propose Publication Projects',33,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (55,'publication_approve','Accept/Reject Publication Projects',33,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (56,'data_release_view','Release Files',12,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (57,'candidate_dob_edit','Dates of Birth',7,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (58,'battery_manager_view','Battery Entries',39,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (59,'battery_manager_edit','Battery Entries',39,'Create/Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (60,'electrophysiology_browser_view_allsites','EEGs - All Sites',41,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (61,'electrophysiology_browser_view_site','EEGs - Own Sites',41,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (62,'module_manager_view','Installed Modules',40,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (63,'module_manager_edit','Installed Modules',40,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (64,'candidate_dod_edit','Dates of Death',7,'Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (65,'violated_scans_view_ownsite','Violated Scans - Own Sites',30,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (66,'document_repository_edit','Documents',16,'Edit/Upload',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (67,'survey_accounts_view','Candidate Surveys',36,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (68,'imaging_quality_control_view','Flagged Imaging Entries',21,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (69,'behavioural_quality_control_view','Flagged Behavioural Entries',3,'View',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (70,'api_docs','API Documentation: View LORIS API Manual',NULL,NULL,2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (71,'electrophysiology_browser_edit_annotations','Annotations',41,'Create/Edit',2);
INSERT INTO `permissions` (`permID`, `code`, `description`, `moduleID`, `action`, `categoryID`) VALUES (72,'monitor_eeg_uploads','Monitor EEG uploads',47,'Create/Edit',2);

UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
