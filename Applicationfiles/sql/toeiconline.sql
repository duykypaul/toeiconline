-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: toeiconline
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `commentid` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `listenguidelineid` bigint(20) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  KEY `fk_user_comment` (`userid`),
  KEY `fk_listenguideline_comment` (`listenguidelineid`),
  CONSTRAINT `fk_listenguideline_comment` FOREIGN KEY (`listenguidelineid`) REFERENCES `listenguideline` (`listenguidelineid`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examination`
--

DROP TABLE IF EXISTS `examination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `examination` (
  `examinationid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`examinationid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examination`
--

LOCK TABLES `examination` WRITE;
/*!40000 ALTER TABLE `examination` DISABLE KEYS */;
INSERT INTO `examination` VALUES (1,'Bài thi 1','2019-08-04 02:53:55',NULL);
/*!40000 ALTER TABLE `examination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examinationquestion`
--

DROP TABLE IF EXISTS `examinationquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `examinationquestion` (
  `examinationquestionid` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `question` text,
  `paragraph` text,
  `option1` varchar(300) DEFAULT NULL,
  `option2` varchar(300) DEFAULT NULL,
  `option3` varchar(300) DEFAULT NULL,
  `option4` varchar(300) DEFAULT NULL,
  `correctanswer` varchar(10) DEFAULT NULL,
  `examinationid` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`examinationquestionid`),
  KEY `fk_examinationquestion_examination` (`examinationid`),
  CONSTRAINT `fk_examinationquestion_examination` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`examinationid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examinationquestion`
--

LOCK TABLES `examinationquestion` WRITE;
/*!40000 ALTER TABLE `examinationquestion` DISABLE KEYS */;
INSERT INTO `examinationquestion` VALUES (1,'examination/image_1.jpg','examination/audio_1.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','A',1,'2019-08-04 02:53:55',NULL,'PHOTO'),(2,'examination/image_2.jpg','examination/audio_2.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','B',1,'2019-08-04 02:53:55',NULL,'PHOTO'),(3,NULL,'examination/audio_3.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','B',1,'2019-08-04 02:53:56',NULL,'QUESTION_RESPONSE'),(4,NULL,'examination/audio_4.mp3','Listen to the question and the three responses. Choose the response that best answers the question:',NULL,'A. The man is diving into the water','B. The man is fishing from the railing','C. The man is packing up his fishing gear','D. The man is purchasing some fish','A',1,'2019-08-04 02:53:56',NULL,'QUESTION_RESPONSE'),(5,NULL,NULL,'Read the passage and choose the correct answer:','Eli Finance, the largest real estate financier in the Middle East by market value and total assets, today proudly announced that it received the award for the “Best Financial Services Company in the UAE” during the 2008 Liquid Real Estate Awards ceremony organized by Euromoney. Euromoney Liquid Real Estate Awards honor the world’s leading institutions for their ability to innovate and develop new products and services to meet the market’s demand in today’s increasingly challenging financial environment, as well as make the most efficient use of the inherent strengths within their organization. Speaking on the occasion, Mr. Ismael Alharmi, Chief Executive Officer of Eli Finance said, “We are honored to receive this prestigious award and I would like to thank our staff at Eli for their efforts',NULL,NULL,NULL,NULL,NULL,1,'2019-08-04 02:53:56',NULL,'SINGLE_PASSAGE'),(6,NULL,NULL,'What is the subject of the news report?',NULL,'A. A national park','B. A local zoo','C. Commercial products','D. Landscaping land','B',1,'2019-08-04 02:53:56',NULL,'SINGLE_PASSAGE'),(7,NULL,NULL,'According to the speaker, what does Algonquin National Park have?',NULL,'A. Unique rock formations','B. A lot of different animals','C. Unusual potted plants','D. Beautiful waterfalls','A',1,'2019-08-04 02:53:56',NULL,'SINGLE_PASSAGE'),(8,NULL,NULL,'What do some people expect will happen?',NULL,'A. The wildlife will relocate','B. It will increase local business',' C. New homes will be built','D. They will change their minds','B',1,'2019-08-04 02:53:56',NULL,'SINGLE_PASSAGE');
/*!40000 ALTER TABLE `examinationquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exercise` (
  `exerciseid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`exerciseid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'Bài tập nghe 1','2019-07-31 14:44:19',NULL,'listening'),(2,'Bài tập đọc 1','2019-07-31 14:44:19',NULL,'reading');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercisequestion`
--

DROP TABLE IF EXISTS `exercisequestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exercisequestion` (
  `exercisequestionid` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `question` text NOT NULL,
  `option1` varchar(300) NOT NULL,
  `option2` varchar(300) NOT NULL,
  `option3` varchar(300) NOT NULL,
  `option4` varchar(300) NOT NULL,
  `correctanswer` varchar(10) NOT NULL,
  `exerciseid` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`exercisequestionid`),
  KEY `fk_exercisequestion_exercise` (`exerciseid`),
  CONSTRAINT `fk_exercisequestion_exercise` FOREIGN KEY (`exerciseid`) REFERENCES `exercise` (`exerciseid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercisequestion`
--

LOCK TABLES `exercisequestion` WRITE;
/*!40000 ALTER TABLE `exercisequestion` DISABLE KEYS */;
INSERT INTO `exercisequestion` VALUES (1,'exercise/image_1.jpg','exercise/audio_1.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','A',1,'2019-07-31 14:45:00','2019-08-03 03:30:28'),(2,'exercise/image_2.jpg','exercise/audio_2.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','B',1,'2019-07-31 14:45:00','2019-08-03 03:30:32'),(3,'exercise/image_3.jpg','exercise/audio_3.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','C',1,'2019-07-31 14:45:00','2019-08-03 03:30:36'),(4,'exercise/image_4.jpg','exercise/audio_4.mp3','Look at the picture and listen to the sentences in the Part 1 TOEIC Test. Choose the sentence that best describes the picture:','A','B','C','D','D',1,'2019-07-31 14:45:00','2019-08-03 03:30:41'),(5,NULL,NULL,'I dont think he will remember the appointment you remind him.','so','if','unless','lest','C',2,'2019-07-31 14:45:00',NULL),(6,NULL,NULL,'The river has overflowed his banks _____ it has been raining continuously for several days.','still','yet','when','as','D',2,'2019-07-31 14:45:00',NULL),(7,NULL,NULL,'Those village folk are poor _____ they always seem so contented.','still','yet','when','as','C',2,'2019-07-31 14:45:00',NULL),(8,NULL,NULL,'he was not interested in music, he agreed to go to the concert.','still','yet','when','as','A',2,'2019-07-31 14:45:01',NULL);
/*!40000 ALTER TABLE `exercisequestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listenguideline`
--

DROP TABLE IF EXISTS `listenguideline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `listenguideline` (
  `listenguidelineid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `createddate` timestamp NOT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`listenguidelineid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listenguideline`
--

LOCK TABLES `listenguideline` WRITE;
/*!40000 ALTER TABLE `listenguideline` DISABLE KEYS */;
INSERT INTO `listenguideline` VALUES (33,'Unit 1: Kỹ năng luyện nghe tranh VẬT trong PART 1 - Picture Description','listenguideline\\unit_1ky_nang_luyen_nghe_toeic_phan_tranh_vat_trong_bai_thi_toeic1.png','<p><strong>Hướng dẫn c&aacute;ch l&agrave;m b&agrave;i thi TOEIC Part 1 - c&acirc;u hỏi tranh về vật</strong></p>\r\n\r\n<h2><a href=\"https://docs.google.com/forms/d/e/1FAIpQLSdETfiyW50X3LQmy4_whov2gt_CmOt_X5bEsi3mBoaLIiJP0A/viewform\" rel=\"nofollow\" target=\"_blank\"><img alt=\"\" src=\"https://www.anhngumshoa.com//uploads/images/userfiles/thi_thu.gif\" /></a></h2>\r\n\r\n<p><strong>Phần&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">Luyện nghe TOEIC</a>&nbsp;PART&nbsp;1&nbsp;Nghe tranh bao gồm 10 c&acirc;u hỏi tương ứng với 6 c&acirc;u hỏi luyện nghe tranh. &nbsp;Đ&acirc;y cũng được đ&aacute;nh gi&aacute; l&agrave; phần nghe l&agrave;m kh&oacute; th&iacute; sinh rất nhiều trong kỳ thi TOEIC, n&ecirc;n c&aacute;c em phải luyện tập thật kỹ để c&oacute; thể đưa ra đ&aacute;p &aacute;n ch&iacute;nh x&aacute;c cho bức tranh nh&eacute;! Trong b&agrave;i thi TOEIC listening - phần tranh vật chia l&agrave;m 2 loại tranh l&agrave; tranh trong nh&agrave; v&agrave; tranh ngo&agrave;i trời.&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Đối với tranh trong nh&agrave; (indoor pictures), trọng t&acirc;m nghe tập trung v&agrave;o những đồ vật trong một căn ph&ograve;ng hoặc trong một office</p>\r\n	</li>\r\n	<li>\r\n	<p>Đối với tranh ngo&agrave;i trời outdoor pictures), trọng t&acirc;m nghe l&agrave; cảnh vật xung quanh</p>\r\n	</li>\r\n</ul>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><u><em><strong>C&aacute;c em c&oacute; thể tham khảo th&ecirc;m:&nbsp;</strong></em></u></p>\r\n\r\n			<ul>\r\n				<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-12-bi-quyet-nghe-tranh-chi-co-mot-nhan-vat-picture-34949.html\" rel=\"dofollow\">B&iacute; quyết nghe tranh chỉ c&oacute; một nh&acirc;n vật - Picture</a></strong></li>\r\n				<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-13-chien-thuat-nghe-tranh-co-nhieu-nhan-vat-picture-34950.html\" rel=\"dofollow\">Chiến thuật nghe tranh c&oacute; nhiều nh&acirc;n vật - Picture</a></strong></li>\r\n				<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-14-chien-thuat-nghe-tranh-mieu-ta-vi-tri-va-trang-thai-cua-su-vat-picture-34951.html\" rel=\"dofollow\">Chiến thuật nghe tranh Mi&ecirc;u tả vị tr&iacute; v&agrave; trạng th&aacute;i của sự vật - Picture</a></strong></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. HƯỚNG DẪN KỸ NĂNG NGHE&nbsp;<u>TRANH VẬT</u></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Sau đ&acirc;y l&agrave; một số&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/unit-1-ky-nang-luyen-nghe-tranh-vat-trong-part-1-picture-description-34851.html\" rel=\"dofollow\">Kỹ năng Luyện nghe TOEIC phần tranh vật trong b&agrave;i thi TOEIC</a>&nbsp;c&aacute;c bạn c&oacute; thể &aacute;p dụng trong qu&aacute; tr&igrave;nh luyện tập của m&igrave;nh.&nbsp;</strong></p>\r\n\r\n<p><br />\r\n<strong>Bước 1: Nghi&ecirc;n cứu tranh v&agrave; nghe kĩ 4 đ&aacute;p &aacute;n trong l&uacute;c&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">luyện thi TOEIC</a>&nbsp;part 1</strong><br />\r\n<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X&aacute;c định chủ ngữ của c&acirc;u<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quan s&aacute;t vị tr&iacute; của vật trong mối quan hệ với vật kh&aacute;c. Mối quan hệ n&agrave;y được thể hiện qua c&aacute;c cụm giới từ chỉ vị tr&iacute;: v&iacute; dụ: in front of, behind&hellip;.<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Để &yacute; những chi tiết nhỏ nhặt nhất của tranh<br />\r\n<br />\r\n<strong>Bước 2: Cẩn thận với bẫy của&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">đề thi TOEIC</a></strong><br />\r\n<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Để &yacute; với một số từ&nbsp;<em>&ldquo;all, every, both, none&hellip;&rdquo;</em><br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cẩn thận với những từ đ&ocirc;ng &acirc;m-similar sounding<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chắc chắn nghe xong 4 lựa chọn mới đưa ra c&acirc;u trả lời<br />\r\n<br />\r\n<strong>Bước 3: Luyện tập để đạt mức điểm cao hơn</strong><br />\r\n<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Học danh s&aacute;ch những vật ở những nơi hay xuất hiện trong đề thi TOEIC<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; L&agrave;m quen với những cụm trạng từ chỉ nơi chốn bắt đầu bằng giới từ<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; L&agrave;m quen với dạng c&acirc;u bị động<br />\r\n-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Luyện nghe những động từ c&oacute; dạng-ed (V-ed) trong c&acirc;u<br />\r\n&nbsp;<br />\r\nTr&ecirc;n đ&acirc;y l&agrave; 3 bước căn bản trong phần nghe tranh mi&ecirc;u tả vật. Để t&igrave;m hiểu th&ecirc;m về chủ điểm từ mới cũng như danh s&aacute;ch những động từ dạng &ndash;ed hay xuất hiện trong k&igrave; thi TOEIC, c&aacute;c bạn c&oacute; thể tham khảo th&ecirc;m ở Level 500-750 v&agrave; 750-990<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>2. LUYỆN TẬP</strong></p>\r\n\r\n<p><em>Để củng cố cho c&aacute;c em kiến thức phần luyện nghe tiếng Anh phần tranh Ảnh th&igrave; c&aacute;c bạn h&atilde;y l&agrave;m th&ecirc;m&nbsp;một số b&agrave;i luyện tập&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">kỹ năng luyện nghe TOEIC</a>&nbsp;phần tranh vật trong b&agrave;i thi TOEIC nh&eacute;!. C&oacute; 3 b&agrave;i luyện tập d&agrave;nh cho bạn:</em></p>\r\n\r\n<ul>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/test/ky-nang-nghe-tranh-vat-trong-bai-thi-toeic-part-1-unit-1-14356.html\" rel=\"dofollow\">Luyện tập luyện nghe TOEIC phần tranh vật 1</a></strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/test/ky-nang-nghe-tranh-vat-trong-bai-thi-toeic-part-2-unit-1-14357.html\" rel=\"dofollow\">Luyện tập luyện nghe TOEIC phần tranh vật 2</a></strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/test/ky-nang-nghe-tranh-vat-trong-bai-thi-toeic-part-3-unit-1-14385.html\" rel=\"dofollow\">Luyện tập luyện nghe TOEIC phần tranh vật&nbsp;3</a></strong></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Với c&aacute;c b&agrave;i luyện tập nghe n&agrave;y c&aacute;c em c&oacute; luyện nghe &nbsp;2 - 3 lần sẽ hiểu v&agrave; nghe được nội dung trong b&agrave;i nghe tốt hơn, đừng nản ch&iacute; khi em chỉ nghe 1 lần m&agrave; chưa hiểu g&igrave;? H&atilde;y luyện tập dần dần kỹ năng sẽ &nbsp;tiến bộ l&ecirc;n c&aacute;c em nh&eacute;!. Sau khi học xong Unit 1 c&aacute;c em c&oacute; thể chuyển đến những b&agrave;i học tiếp theo để học nh&eacute;!</p>\r\n\r\n<ul>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-2-ky-nang-nghe-tranh-ve-nguoi-trong-part-1-picture-description-34853.html\" rel=\"dofollow\">Unit 2: Kỹ năng nghe tranh về NGƯỜI trong PART 1 - Picture Description</a></strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-3-ky-nang-nghe-cau-hoi-where-trong-part-2-question-response-34852.html\" rel=\"dofollow\">Unit 3: Kỹ năng nghe c&acirc;u hỏi WHERE trong PART 2 - Question Response</a></strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-4-ky-nang-nghe-cau-hoi-when-trong-part-2-question-response-34854.html\" rel=\"dofollow\">Unit 4: Kỹ năng nghe c&acirc;u hỏi WHEN trong PART 2 - Question Response</a></strong></li>\r\n</ul>\r\n','2019-07-28 00:31:01','2019-07-28 14:51:37'),(34,'Unit 2: Kỹ năng nghe tranh về NGƯỜI trong PART 1 - Picture Description','listenguideline\\unit_2_ky_nang_nghe_tranh_nguoi_trong_bai_thi_toeic.png','<p><strong>Hướng dẫn c&aacute;ch l&agrave;m b&agrave;i thi TOEIC Part 1 - c&acirc;u hỏi tranh về người</strong></p>\r\n\r\n<p><a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">Luyện nghe TOEIC&nbsp;</a>Phần nghe tranh l&agrave; phần đầu ti&ecirc;n của một&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">b&agrave;i thi TOEIC</a>. Phần tranh bao gồm 10 c&acirc;u hỏi, sau mỗi c&acirc;u hỏisẽ l&agrave; 4 lựa chọn. Trong 10 tranh, chủ yếu 70-80 % l&agrave; c&acirc;u hỏi c&oacute; sự xuất hiện của người, c&ograve;n lại l&agrave; tranh mi&ecirc;u tả vật.</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p><u><em><strong>Bạn c&oacute; thể xem th&ecirc;m một số b&agrave;i viết chia sẻ hay tr&ecirc;n website:</strong></em></u></p>\r\n\r\n			<ul>\r\n				<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/top-5-nguon-thi-thu-toeic-online-mien-phi-va-tot-nhat-36939.html\" rel=\"dofollow\">Top 5 nguồn thi thử TOEIC online miễn ph&iacute; v&agrave; tốt nhất</a>&nbsp;</strong></li>\r\n				<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/tong-hop-cac-meo-lam-bai-thi-toeic-part-1-people-description-37282.html\" rel=\"dofollow\">Tổng hợp c&aacute;c mẹo l&agrave;m b&agrave;i thi TOEIC part 1 - People Description</a>&nbsp;</strong></li>\r\n				<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/tai-lieu-luyen-thi-toeic-trong-30-ngay-cho-nguoi-moi-bat-dau-37237.html\" rel=\"dofollow\">T&agrave;i liệu luyện thi TOEIC trong 30 ng&agrave;y cho người mới bắt đầu</a>&nbsp;</strong></li>\r\n			</ul>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>V&igrave; vậy, việc nắm một số&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/unit-2-ky-nang-nghe-tranh-ve-nguoi-trong-part-1-picture-description-34853.html\" rel=\"dofollow\"><strong>Kỹ năng nghe tranh người trong b&agrave;i thi TOEIC</strong></a>&nbsp;n&agrave;y đ&oacute;ng một vai tr&ograve; quan trọng trong việc n&acirc;ng cao điểm số cho th&iacute; sinh.</p>\r\n\r\n<p>Trước khi đi v&agrave;o chiến thuật nghe tranh dạng n&agrave;y một c&aacute;ch hiệu quả, t&ocirc;i muốn nhấn mạnh đến 2 điểm sau:</p>\r\n\r\n<ul>\r\n	<li>Đối với loại tranh c&oacute; một người xuất hiện,<em>&nbsp;trọng t&acirc;m ch&uacute; &yacute; l&agrave; h&agrave;nh động của người đ&oacute;</em></li>\r\n	<li>Đối với loại tranh c&oacute; nhiều người xuất hiện c&ugrave;ng một l&uacute;c,<em>&nbsp;trọng t&acirc;m ch&uacute; &yacute; l&agrave; h&agrave;nh động chung v&agrave; sự tương t&aacute;c giữa c&aacute;c đối tượng với nhau</em></li>\r\n</ul>\r\n\r\n<p><strong>1. HƯỚNG DẪN KỸ NĂNG NGHE&nbsp;<u>TRANH NGƯỜI</u></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sau đ&acirc;y l&agrave; một số bước chiến thuật cơ bản gi&uacute;p c&aacute;c bạn đạt được hiệu quả nghe trong l&uacute;c<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">&nbsp;luyện thi TOEIC</a>:<br />\r\n<br />\r\n<strong>Bước 1: Nghe c&aacute;c lựa chọn v&agrave; nghi&ecirc;n cứu tranh một c&aacute;ch cẩn thận khi&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">học luyện nghe TOEIC</a></strong><br />\r\n<br />\r\n-&nbsp; &nbsp;X&aacute;c định chủ ngữ của c&acirc;u trong tranh<br />\r\n-&nbsp; &nbsp;Người ở trong tranh đang h&agrave;nh động c&oacute; ph&ugrave; hợp với h&agrave;nh động được mi&ecirc;u tả trong c&acirc;u kh&ocirc;ng?<br />\r\n-&nbsp; &nbsp;T&acirc;n ngữ của động từ c&oacute; ch&iacute;nh x&aacute;c kh&ocirc;ng?<br />\r\n-&nbsp; &nbsp;Nơi chốn trong tranh c&oacute; ph&ugrave; hợp với mi&ecirc;u tả trong c&acirc;u kh&ocirc;ng?<br />\r\n- &nbsp;&nbsp;<strong><em>Ch&uacute; &yacute; rằng, c&acirc;u trả lời c&oacute; thể l&agrave; c&acirc;u mi&ecirc;u tả đồ vật (things) ở trong tranh</em></strong><br />\r\n<br />\r\n<strong>Bước 2: Cẩn thận với&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">bẫy của đề thi TOEIC</a></strong><br />\r\n<br />\r\n-&nbsp; Để &yacute; với một số từ &ldquo;all, every, both, none&hellip;&rdquo;<br />\r\n-&nbsp; Cẩn thận với những từ đ&ocirc;ng &acirc;m-similar sounding<br />\r\n-&nbsp; Chắc chắn nghe xong 4 lựa chọn mới đưa ra c&acirc;u trả lời<br />\r\n<br />\r\n<strong>Bước 3: Luyện tập để đạt được điểm cao hơn</strong><br />\r\n<br />\r\n-&nbsp; &nbsp;L&agrave;m quen với những cụm từ hay xuất hiện trong TOEIC c&oacute; chứa h&agrave;nh động v&agrave; cử chỉ của nh&acirc;n vật<br />\r\n-&nbsp; &nbsp;Quen với những động từ ở dạng-ing (V-ing)<br />\r\n-&nbsp; &nbsp;Học từ mới cụ thể được d&ugrave;ng trong một số địa điểm thường xuất hiện trong k&igrave; thi TOEIC<br />\r\n<br />\r\nTr&ecirc;n đ&acirc;y l&agrave; 3 bước căn bản trong phần nghe tranh mi&ecirc;u tả người. Để t&igrave;m hiểu th&ecirc;m về chủ điểm từ mới cũng như danh s&aacute;ch những động từ dạng &ndash;ing hay xuất hiện trong k&igrave; thi TOEIC, c&aacute;c bạn c&oacute; thể tham khảo th&ecirc;m ở&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/lo-trinh-luyen-thi-toeic-cho-muc-tieu-500-750-34807.html\" rel=\"dofollow\">Level 500-750&nbsp;</a>v&agrave;&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/level-750-990-c3364.html\" rel=\"dofollow\">750-990</a>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>2. LUYỆN TẬP</strong><br />\r\n<em>Để củng cố cho c&aacute;c em kiến thức phần luyện nghe tiếng Anh phần tranh&nbsp;th&igrave; c&aacute;c bạn h&atilde;y l&agrave;m th&ecirc;m&nbsp;một số b&agrave;i luyện tập&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">kỹ năng luyện nghe TOEIC</a>&nbsp;phần tranh người&nbsp;trong b&agrave;i thi TOEIC nh&eacute;!. C&oacute; 3 b&agrave;i luyện tập d&agrave;nh cho bạn:</em></p>\r\n\r\n<p><br />\r\n➢&nbsp;<strong><a href=\"https://www.anhngumshoa.com/test/ky-nang-nghe-tranh-nguoi-trong-bai-thi-toeic-part-1-unit-2-14358.html\" rel=\"dofollow\">B&agrave;i tập luyện kỹ năng nghe tranh người - B&agrave;i&nbsp;1</a></strong><br />\r\n➢&nbsp;<strong><a href=\"https://www.anhngumshoa.com/test/ky-nang-nghe-tranh-nguoi-trong-bai-thi-toeic-part-2-unit-2-14359.html\" rel=\"dofollow\">B&agrave;i tập luyện kỹ năng nghe tranh người - B&agrave;i&nbsp;2</a></strong><br />\r\n➢&nbsp;<a href=\"https://www.anhngumshoa.com/test/ky-nang-nghe-tranh-nguoi-trong-bai-thi-toeic-part-3-unit-2-14384.html\" rel=\"dofollow\"><strong>B&agrave;i tập luyện kỹ năng nghe tranh người - B&agrave;i&nbsp;3</strong></a></p>\r\n','2019-07-28 00:32:54','2019-07-28 21:37:45'),(35,'Unit 2.2. Một số điểm cần lưu ý khi làm bài nghe tranh PART 1 - TOEIC','listenguideline\\unit_2_2.png','<p><strong>Những lưu &yacute; quan trọng khi l&agrave;m b&agrave;i thi nghe tranh - Picture Description để học vi&ecirc;n tr&aacute;nh nhầm lẫn</strong></p>\r\n\r\n<p>Kiến thức đ&atilde; vững, mọi thứ đ&atilde; chuẩn bị sẵn s&agrave;ng. Tuy nhi&ecirc;n, trong qu&aacute; tr&igrave;nh&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">luyện nghe TOEIC</a>, &nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">luyện thi TOEIC</a>&nbsp;nếu ch&uacute;ng ta kh&ocirc;ng c&oacute; một số kĩ năng thi mặc d&ugrave; nhỏ nhặt cũng c&oacute; thể khiến bạn mất điểm rất nhiều. H&atilde;y ch&uacute; &yacute; một số điểm sau đ&acirc;y để đạt được hiệu quả cao nhất:<br />\r\n<br />\r\n<strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nắm được điểm cốt yếu của&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/luyen-thi-toeic-online-mien-phi-tren-anh-ngu-ms-hoa-34937.html\" rel=\"dofollow\">đề thi TOEIC</a></strong></p>\r\n\r\n<ul>\r\n	<li>C&aacute;c đ&aacute;p &aacute;n cho sẵn của 3-4 c&acirc;u hỏi đầu ti&ecirc;n thường c&oacute; chủ ngữ l&agrave; người. Để chọn đ&aacute;p &aacute;n đ&uacute;ng, bạn h&atilde;y tập trung quan s&aacute;t động t&aacute;c của người trong h&igrave;nh</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Trong c&acirc;u 4-5, tr&ecirc;n 90% trường hợp sẽ c&oacute; một c&acirc;u c&oacute; đ&aacute;p &aacute;n được tr&igrave;nh b&agrave;y ở thể bị động với chủ ngữ l&agrave; vật. Đ&aacute;p &aacute;n đ&uacute;ng l&agrave; đ&aacute;p &aacute;n mi&ecirc;u tả tổng thể, c&ograve;n những đ&aacute;p &aacute;n mi&ecirc;u tả trạng th&aacute;i hay động t&aacute;c m&agrave; ta nh&igrave;n thấy r&otilde; trong h&igrave;nh thường kh&ocirc;ng phải l&agrave; đ&aacute;p &aacute;n đ&uacute;ng.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Những đ&aacute;p &aacute;n cho sẵn c&oacute; động từ được gắn them c&aacute;c tiếp đầu ngữ như: re, un, dis th&igrave; tỉ lệ đ&uacute;ng của ch&uacute;ng l&agrave; dưới 20%</li>\r\n</ul>\r\n\r\n<p>&nbsp;<br />\r\n<strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ph&acirc;n bố thời gian hợp l&iacute; l&uacute;c&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">học TOEIC</a></strong></p>\r\n\r\n<ul>\r\n	<li>Trước khi bắt đầu Part 1, c&aacute;c bạn c&oacute; 1ph&uacute;t 25 gi&acirc;y để nghe Direction v&agrave; Sample Question. H&atilde;y tận dụng thời gian n&agrave;y để đọc c&acirc;u hỏi Part 3 (Short conversation)</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Sau khi nghe xong 4 đ&aacute;p &aacute;n của mỗi&nbsp; c&acirc;u hỏi, băng sẽ dừng lại khoảng 5 gi&acirc;y. Trong thời gian n&agrave;y, bạn chỉ giải quyết c&acirc;u hỏi đ&oacute; trong 3 gi&acirc;y, 2 gi&acirc;y c&ograve;n lại d&ugrave;ng v&agrave;o việc ph&acirc;n t&iacute;ch h&igrave;nh tiếp theo. Nếu 3 gi&acirc;y tr&ocirc;i qua m&agrave; bạn kh&ocirc;ng trả lời được, nếu bạn kh&ocirc;ng trả lời được th&igrave; đừng lo lắng v&igrave; lo lắng sẽ khiến bạn mất nhiều thời gian hơn, kh&ocirc;ng nhớ ra được đ&aacute;p &aacute;n đ&uacute;ng. Bạn h&atilde;y đo&aacute;n v&agrave; nhanh ch&oacute;ng chuyển sang c&acirc;u tiếp theo.</li>\r\n</ul>\r\n\r\n<p><img alt=\" Một số điểm cần lưu ý trong quá trình nghe tranh bài thi TOEIC\" longdesc=\"https://www.anhngumshoa.com/tin-tuc/M%E1%BB%99t%20s%E1%BB%91%20%C4%91i%E1%BB%83m%20c%E1%BA%A7n%20l%C6%B0u%20%C3%BD%20trong%20qu%C3%A1%20tr%C3%ACnh%20nghe%20tranh%20b%C3%A0i%20thi%20TOEIC,%20luy%E1%BB%87n%20thi%20toeic\" src=\"http://www.ceohcm.com/wp-content/uploads/2010/06/s7.jpg\" /></p>\r\n\r\n<p>&nbsp;<br />\r\n<strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phương ph&aacute;p nghe v&agrave; trả lời đ&aacute;p &aacute;n&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">b&agrave;i luyện nghe TOEIC</a></strong></p>\r\n\r\n<ul>\r\n	<li>Một nguy&ecirc;n tắc trong qu&aacute; tr&igrave;nh nghe Tranh đ&oacute; l&agrave; việc bạn t&igrave;m đ&aacute;p &aacute;n sai để loại trừ chứ kh&ocirc;ng cố gắng t&igrave;m đ&aacute;p &aacute;n đ&uacute;ng ngay từ đầu. V&iacute; dụ, đ&aacute;p &aacute;n sai l&agrave; đ&aacute;p &aacute;n c&oacute; chủ ngữ, t&acirc;n ngữ, nơi chốn sai với m&ocirc; tả trong tranh. Điều n&agrave;y l&agrave; điểm mấu chốt để bạn gi&agrave;nh được điểm tối đa.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Khi quan s&aacute;t h&igrave;nh trong qu&aacute; tr&igrave;nh nghe, bạn n&ecirc;n thực hiện tất cả tr&ecirc;n quyển Test paper&nbsp; (đề thi) lu&ocirc;n, đ&aacute;nh dấu đ&aacute;p &aacute;n đ&uacute;ng&nbsp; b&ecirc;n dưới h&igrave;nh, kh&ocirc;ng n&ecirc;n đ&aacute;nh dấu lu&ocirc;n v&agrave;o tờ Answer sheet&nbsp; (Phiếu trả lời). Trong thời gian 5 gi&acirc;y, bạn mới sử dụng đến n&oacute;.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Đề thi thường c&oacute; khuynh hướng đưa ra những chi tiết nhỏ nhặt trong c&aacute;c bức ảnh v&agrave;o đ&aacute;p &aacute;n, n&ecirc;n nếu kh&ocirc;ng quan s&aacute;t h&igrave;nh thật tỉ mỉ, bạn c&oacute; thể bị mắc bẫy. Bạn tr&aacute;nh để tờ Answer sheet l&agrave;m ph&acirc;n t&aacute;n tư tưởng của bạn</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Trong qu&aacute; tr&igrave;nh t&ocirc; v&agrave;o phiếu đ&aacute;p &aacute;n, ch&uacute; &yacute; t&ocirc; trọn đ&aacute;p &aacute;n v&igrave; c&aacute;c bạn t&ocirc; r&otilde;, đậm n&eacute;t th&igrave; m&aacute;y mới nhận dạng được. Nếu bạn muốn thay đổi đ&aacute;p &aacute;n, n&ecirc;n tr&aacute;nh trường hợp x&oacute;a kh&ocirc;ng hết đ&aacute;p &aacute;n, coi như c&acirc;u ấy bạn bị mất điểm.</li>\r\n</ul>\r\n\r\n<p>Tr&ecirc;n đ&acirc;y l&agrave; một số chia sẻ, kinh nghiệm của t&ocirc;i về&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">phương ph&aacute;p luyện nghe TOEIC&nbsp;</a>phần tranh. Nếu c&oacute; thắc mắc g&igrave;, t&ocirc;i rất sẵn l&ograve;ng giải đ&aacute;p.</p>\r\n','2019-07-28 00:33:37',NULL),(36,'Unit 3: Kỹ năng nghe câu hỏi WHERE trong PART 2 - Question Response','listenguideline\\','<p><strong>Ms Hoa hướng dẫn bạn luyện tập dạng c&acirc;u hỏi Where - một dạng quan trọng trong phần 2 Luyện nghe TOEIC - Question &amp; Response gi&uacute;p bạn đạt kết quả cao trong kỳ thi TOEIC</strong></p>\r\n\r\n<p><em>Dạng c&acirc;u hỏi Where l&agrave; một dạng quan trọng trong phần 2&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">Luyện nghe TOEIC</a>&nbsp;- Question &amp; Response l&uacute;c bạn&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">học TOEIC</a>. C&acirc;u hỏi thường hỏi th&iacute; sinh về nơi chốn xảy ra một h&agrave;nh động hay sự việc n&agrave;o đ&oacute;. C&aacute;c bạn ần ch&uacute; &yacute; một số điểm đặc biệt sau đ&acirc;y:</em><br />\r\n-&nbsp; &nbsp;Thường c&oacute; 3-4 c&acirc;u hỏi về Where trong đề thi TOEIC<br />\r\n-&nbsp; &nbsp;Đ&aacute;p &aacute;n lựa chọn thường phải l&agrave; cụm trạng từ chỉ nơi chốn hoặc một c&acirc;u ho&agrave;n chỉnh</p>\r\n\r\n<hr />\r\n<p><u><em><strong>Xem th&ecirc;m b&agrave;i học mới:</strong></em></u></p>\r\n\r\n<ul>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-4-ky-nang-nghe-cau-hoi-when-trong-part-2-question-response-34854.html\" rel=\"dofollow\">Unit 4: Kỹ năng nghe c&acirc;u hỏi WHEN trong PART 2 - Question Response</a></strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-5-ky-nang-nghe-cau-hoi-what-trong-part-2-question-response-34855.html\" rel=\"dofollow\">Unit 5: Kỹ năng nghe c&acirc;u hỏi WHAT trong PART 2 - Question Response</a></strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/unit-6-ky-nang-nghe-cau-hoi-who-trong-part-2-question-response-34856.html\" rel=\"dofollow\">Unit 6: Kỹ năng nghe c&acirc;u hỏi WHO trong PART 2 - Question Response</a></strong></li>\r\n</ul>\r\n\r\n<ul>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>1. HƯỚNG DẪN KỸ NĂNG NGHE&nbsp;<u>WHERE -&nbsp;QUESTION</u></strong></p>\r\n\r\n<p><strong>C&aacute;c bước luyện kỹ năng nghe c&acirc;u hỏi WHERE phần Question &amp; Response</strong><br />\r\n<br />\r\n<strong>Bước 1: Nghe 3 lựa chọn v&agrave; quyết định lựa chọn ch&iacute;nh x&aacute;c nhất</strong><br />\r\n<br />\r\n-&nbsp; &nbsp;Ch&uacute; &yacute; nghe danh từ chỉ nơi chốn, thường được thể hiện qua những cụm giới từ chỉ nơi chốn<br />\r\n-&nbsp; &nbsp;Loại những c&acirc;u trả lời bắt đầu bằng Yes/ No hoặc loại những th&ocirc;ng tin kh&ocirc;ng li&ecirc;n quan, v&iacute; dụ th&ocirc;n tin về thời gian, nguy&ecirc;n nh&acirc;n<br />\r\n<br />\r\n<strong>Bước 2: Để &yacute; đến&nbsp;<a href=\"https://www.anhngumshoa.com/tin-tuc/phuong-phap-va-meo-luyen-nghe-toeic-dat-diem-cao-35170.html\" rel=\"dofollow\">bẫy luyện nghe TOEIC&nbsp;</a>l&uacute;c&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">luyện thi TOEIC</a></strong><br />\r\n<br />\r\n-&nbsp; &nbsp; Để &yacute; đến lỗi d&ugrave;ng th&igrave; v&agrave; sự ph&ugrave; hợp giữa Chủ ngữ v&agrave; Động từ (Subject-Verb agreement)<br />\r\n-&nbsp; &nbsp; Cẩn thận với những từ đồng &acirc;m (Similar sounding)<br />\r\n-&nbsp; &nbsp; C&acirc;u trả lời c&oacute; thể l&agrave; lựa chọn cung cấp th&ocirc;ng tin về một người hoặc một nh&oacute;m người&nbsp; nếu c&acirc;u hỏi về nguồn gốc của c&aacute;i g&igrave;<br />\r\n-&nbsp; &nbsp; C&acirc;u trả lời c&oacute; thể ở dạng &ldquo;I don&rsquo;t know&rdquo;<br />\r\n<br />\r\n<strong>Bước 3: Luyện tập để đạt kết quả cao hơn</strong></p>\r\n\r\n<p><br />\r\n-&nbsp; Bạn c&oacute; thể&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">luyện thi TOEIC online</a>&nbsp;tr&ecirc;n&nbsp;<a href=\"https://www.anhngumshoa.com/\" rel=\"dofollow\">website luyện thi TOEIC online</a>&nbsp;www.mshoatoeic.com<br />\r\n-&nbsp; L&agrave;m quen với những cụm từ chứa giới từ chỉ vị tr&iacute; v&agrave; hướng<br />\r\n-&nbsp; L&agrave;m quen với c&aacute;ch ph&aacute;t &acirc;m của những cụm từ&nbsp; chỉ nơi chốn thường xuy&ecirc;n xuất hiện trong đề thi TOEIC: buildings, cities, countries&hellip;<br />\r\n&nbsp;</p>\r\n\r\n<p><strong>2. LUYỆN TẬP</strong></p>\r\n\r\n<p>Nếu c&aacute;c bạn c&oacute; c&acirc;u hỏi g&igrave;, c&ocirc;&nbsp;rất sẵn l&ograve;ng chia sẻ. Sau đ&acirc;y l&agrave; một số b&agrave;i luyện tập về loại c&acirc;u hỏi n&agrave;y.&nbsp;<strong>B&agrave;i tập luyện nghe c&acirc;u hỏi WHERE&nbsp;bạn h&atilde;y&nbsp;<a href=\"https://www.anhngumshoa.com/test/bai-tap-luyen-nghe-cau-hoi-where-phan-question-response-unit-3-14360.html\" rel=\"dofollow\">Click để l&agrave;m luyện tập</a></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tr&ecirc;n đ&acirc;y l&agrave; c&aacute;c bước gi&uacute;p c&aacute;c bạn cơ bản c&oacute; thể trả lời c&aacute;c c&acirc;u hỏi li&ecirc;n quan đến Where-question. Để t&igrave;m hiểu s&acirc;u hơn về c&aacute;c cấu tr&uacute;c trả lời thường gặp đồng thời những cụm từ chỉ nơi chốn thường xuất hiện trong đề thi TOEIC, c&aacute;c bạn tham khảo một số t&agrave;i liệu Luyện nghe chuy&ecirc;n s&acirc;u nh&eacute;!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><u><em><strong>T&agrave;i liệu tham khảo:</strong></em></u></p>\r\n\r\n<ul>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/tron-bo-tai-lieu-new-eye-new-ear-of-the-toeic-full-pdf-audio-37233.html\" rel=\"dofollow\">Trọn bộ t&agrave;i liệu NEW EYE, NEW EAR of the TOEIC {FULL PDF + AUDIO}</a>&nbsp;</strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/tron-bo-tai-lieu-hoc-online-toeic-4-ky-nang-mien-phi-pdf-audio-video-37137.html\" rel=\"dofollow\">TRỌN BỘ T&Agrave;I LIỆU HỌC ONLINE TOEIC 4 KỸ NĂNG MIỄN PH&Iacute; (PDF + AUDIO + VIDEO)</a>&nbsp;</strong></li>\r\n	<li><strong><a href=\"https://www.anhngumshoa.com/tin-tuc/full-pdf-audio-tron-bo-tai-lieu-luyen-nghe-toeic-cho-moi-cap-do-37146.html\" rel=\"dofollow\">TRỌN BỘ T&Agrave;I LIỆU luyện nghe Toeic cho mọi cấp độ - hết &quot;điếc&quot; tiếng Anh</a>&nbsp;</strong></li>\r\n</ul>\r\n','2019-07-28 00:35:17','2019-07-28 14:19:15');
/*!40000 ALTER TABLE `listenguideline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `result` (
  `resultid` bigint(20) NOT NULL AUTO_INCREMENT,
  `listenscore` int(11) NOT NULL,
  `readingscore` int(11) NOT NULL,
  `examinationid` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`resultid`),
  KEY `fk_result_examination` (`examinationid`),
  KEY `fk_result_user` (`userid`),
  CONSTRAINT `fk_result_examination` FOREIGN KEY (`examinationid`) REFERENCES `examination` (`examinationid`),
  CONSTRAINT `fk_result_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,3,0,1,22,'2019-08-04 13:31:34',NULL),(2,2,0,1,22,'2019-08-04 13:38:21',NULL),(3,0,0,1,22,'2019-08-04 13:38:52',NULL),(4,3,0,1,22,'2019-08-04 13:46:36',NULL),(5,3,0,1,22,'2019-08-04 14:02:33',NULL),(6,4,1,1,22,'2019-08-04 14:03:20',NULL),(7,4,1,1,22,'2019-08-04 14:03:24',NULL),(8,0,0,1,22,'2019-08-04 14:05:28',NULL),(9,0,0,1,22,'2019-08-04 14:06:03',NULL),(10,0,0,1,22,'2019-08-04 14:10:47',NULL);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `roleid` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(300) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_user_role` (`roleid`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','admin','2019-07-11 16:22:25',1),(15,'phihoan','123456','Phí Xuân Hoàn','2019-07-26 08:23:27',2),(16,'ductt','123456','Trần Tiến Đức','2019-07-26 08:30:30',2),(17,'giangsky','123456','Nguyễn Trường Giang ','2019-07-26 08:30:31',2),(20,'duylong','123456','Lê Duy Long','2019-07-26 08:30:31',2),(21,'trangmin','123456','Nguyễn Thị Trang','2019-07-26 08:30:31',2),(22,'duykypaul','123456','Lê Duy Kỳ','2019-07-26 08:30:31',1),(23,'xuanthu','123456','Trần Xuân Thu','2019-07-26 08:44:02',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-14  9:31:21
