SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `issues_history`;
LOCK TABLES `issues_history` WRITE;
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (1,'admin','2016-09-01 18:47:54','assignee',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (2,'normal','2016-09-01 18:47:54','priority',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (3,'2','2016-09-01 18:47:55','centerID',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (4,'Need form added','2016-09-01 18:47:55','title',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (5,'Behavioural Instruments','2016-09-01 18:47:55','category',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (6,'300001','2016-09-01 18:47:55','comment',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (7,'admin','2016-09-01 18:47:55','comment',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (8,'2016-09-01 10:47:54','2016-09-01 18:47:56','comment',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (9,'high','2016-09-01 18:49:25','priority',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (10,'feedback','2016-09-01 18:49:36','status',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (11,'closed','2016-09-01 18:49:55','status',14,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (12,'admin','2016-09-01 18:51:46','assignee',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (13,'2','2016-09-01 18:51:46','centerID',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (14,'Need form added','2016-09-01 18:51:47','title',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (15,'Behavioural Instruments','2016-09-01 18:51:47','category',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (16,'300002','2016-09-01 18:51:47','comment',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (17,'admin','2016-09-01 18:51:47','comment',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (18,'2016-09-01 10:51:46','2016-09-01 18:51:47','comment',15,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (19,'admin','2016-09-02 20:30:38','assignee',16,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (20,'new issue to test assignee notification','2016-09-02 20:30:38','title',16,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (21,'Examiners','2016-09-02 20:30:38','category',16,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (22,'16','2016-09-02 20:30:39','module',16,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (23,'tester','2016-09-02 20:30:39','comment',16,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (24,'2016-09-02 12:30:38','2016-09-02 20:30:39','comment',16,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (25,'tester','2016-09-02 20:31:45','assignee',17,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (26,'another ticket to test assignment notification','2016-09-02 20:31:46','title',17,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (27,'tester','2016-09-02 20:31:46','comment',17,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (28,'2016-09-02 12:31:45','2016-09-02 20:31:46','comment',17,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (29,'admin','2016-09-02 20:33:47','assignee',18,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (30,'ticket 3 testing email','2016-09-02 20:33:47','title',18,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (31,'tester','2016-09-02 20:33:48','comment',18,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (32,'2016-09-02 12:33:47','2016-09-02 20:33:48','comment',18,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (33,'admin','2016-09-02 21:59:55','assignee',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (34,'feedback','2016-09-02 21:59:55','status',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (35,'urgent','2016-09-02 21:59:55','priority',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (36,'3','2016-09-02 21:59:56','centerID',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (37,'testing if assignee gets email  - new ticket','2016-09-02 21:59:56','title',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (38,'Examiners','2016-09-02 21:59:56','category',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (39,'17','2016-09-02 21:59:56','module',19,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (40,'tester','2016-09-02 22:02:29','assignee',20,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (41,'feedback','2016-09-02 22:02:29','status',20,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (42,'urgent','2016-09-02 22:02:30','priority',20,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (43,'testing if assignee gets email upon ticket update+re-assign','2016-09-02 22:02:30','title',20,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (44,'Imaging','2016-09-02 22:02:30','category',20,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (46,'admin','2016-09-02 22:04:38','assignee',20,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (47,'tester','2016-09-02 23:45:40','assignee',21,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (48,'ticket to end all tickets ','2016-09-02 23:45:40','title',21,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (49,'tester','2016-09-02 23:46:33','assignee',22,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (50,'ticket to end all tickets ','2016-09-02 23:46:33','title',22,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (51,'tester','2016-09-02 23:46:49','assignee',23,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (52,'3','2016-09-02 23:46:49','centerID',23,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (53,'ticket to end all tickets ','2016-09-02 23:46:49','title',23,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (54,'tester','2016-09-02 23:46:56','assignee',24,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (55,'ticket to end all tickets ','2016-09-02 23:46:57','title',24,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (56,'tester','2016-09-02 23:47:01','assignee',25,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (57,'ticket to end all tickets ','2016-09-02 23:47:01','title',25,'tester');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (58,'tester','2016-09-07 01:19:21','assignee',26,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (59,'2','2016-09-07 01:19:21','centerID',26,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (60,'testing site population','2016-09-07 01:19:21','title',26,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (61,'Behavioural Battery','2016-09-07 01:19:21','category',26,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (62,'17','2016-09-07 01:19:21','module',26,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (63,'test','2016-09-07 01:38:06','assignee',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (64,'3','2016-09-07 01:38:06','centerID',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (65,'test ticket with visit label','2016-09-07 01:38:06','title',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (66,'Behavioural Instruments','2016-09-07 01:38:06','category',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (67,'9','2016-09-07 01:38:07','module',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (68,'300002','2016-09-07 01:38:07','comment',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (69,'2','2016-09-07 01:39:23','sessionID',27,'admin');
INSERT INTO `issues_history` (`issueHistoryID`, `newValue`, `dateAdded`, `fieldChanged`, `issueID`, `addedBy`) VALUES (70,'2','2016-09-07 02:19:59','sessionID',27,'admin');
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS=1;
