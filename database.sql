-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: counselling_system
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `counselling_messages`
--

DROP TABLE IF EXISTS `counselling_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counselling_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` int NOT NULL,
  `sender_role` enum('student','teacher') NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `confidential` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `counselling_messages_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `counselling_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counselling_messages`
--

LOCK TABLES `counselling_messages` WRITE;
/*!40000 ALTER TABLE `counselling_messages` DISABLE KEYS */;
INSERT INTO `counselling_messages` VALUES (1,1,'student','can you remove all those** cause i am not able to undertsand your response? btw dont know i feel lonely','2025-12-22 12:48:52',0),(2,2,'student','can you remove all those** cause i am not able to undertsand your response? btw dont know i feel lonely','2025-12-22 13:54:12',0),(3,2,'teacher','Hey there, it\'s okay to feel confused or overwhelmed sometimes. It\'s important to take things one step at a time and not feel pressured to understand everything immediately. Let\'s break down the issue together and see what we can do to help.\r\n\r\nFirst, I understand that you may be struggling to understand my response because of feeling lonely. Loneliness can make it hard to concentrate and focus on complex topics like this. It\'s crucial to know that you\'re not alone in feeling lonely, and that there are people who care about you.\r\n\r\nLet\'s take a step back and look at the situation. What are the specific things that you find difficult to understand? Are there any particular points or concepts that seem confusing or overwhelming? Once we understand the source of your confusion, we can work on addressing it together.\r\n\r\nRemember, there\'s no rush to understand everything perfectly right away. Take your time, ask questions, and don\'t hesitate to clarify any points that you\'re unsure about. Learning is an ongoing process, and it\'s okay to make mistakes along the way.\r\n\r\nLet\'s work together to break down these concepts into smaller, more manageable steps. We can use simple language, break down complex terms, and provide examples to illustrate the concepts. We\'ll also explore different learning methods that you find enjoyable to ensure that you\'re engaged and retaining the information.\r\n\r\nRemember, it\'s important to be patient with yourself and allow yourself to learn at your own pace. I\'m here to support you and provide guidance along the way. Let\'s take this journey together and see how you can overcome this feeling of being lonely and learn to understand my responses better.','2025-12-22 14:16:58',0),(4,4,'teacher','I\'m listening. Please continue the conversation and tell me what\'s on your mind.','2025-12-22 19:21:17',0),(5,3,'teacher','I\'m listening. Please share the conversation you\'d like me to respond to.','2025-12-24 11:49:53',0),(6,5,'teacher','I\'m listening. How can I help you today? Is there anything I can do to support you in your college application journey?','2025-12-24 13:57:33',0),(7,6,'teacher','I\'m listening. How can I help you today? Is there anything I can do to support you in your college application journey? hOW DO YPU FEL NOW','2025-12-24 14:28:33',0),(8,1,'student','hello, i just wanted to tell that i am thankful for your help while i was struggling on my own','2025-12-24 15:02:13',0),(9,6,'student','i am feeling peer pressure for my internals','2025-12-24 15:02:58',1),(10,1,'student','hello, i just wanted to tell that i am thankful for your help while i was struggling on my own','2025-12-24 15:20:03',0),(11,6,'student','i am feeling peer pressure for my internals\r\n\r\n','2025-12-24 15:21:47',1),(12,2,'student','thank you for your support, i am really thankfull','2025-12-24 15:27:57',0),(13,8,'teacher','Hi dear, I am here to listen and provide support in any way I can. What would you like to talk about today? Is there anything on your mind that I can help you with?','2025-12-25 16:58:50',0),(14,8,'student','I was facing trouble with my family problem and needed someone to share','2025-12-25 17:00:17',1),(15,8,'teacher','It\'s understandable that you\'re facing challenges with your family. Family problems can be incredibly difficult, and it\'s important to know that you\'re not alone. I\'m here to listen and provide support in any way I can. Is there anything on your mind that you\'d like to talk about today?','2025-12-25 17:01:21',0),(16,2,'teacher','You\'re very welcome! I\'m glad I could be of help. It\'s important to know that we can all struggle with understanding sometimes, especially when we\'re feeling lonely. Remember, it\'s okay to take things one step at a time and not feel pressured to understand everything immediately. Let\'s take a step back and break down the issue together, and I\'ll be here to support you every step of the way.','2026-01-13 14:49:14',0),(17,8,'student','hbj','2026-01-13 14:50:11',1),(18,11,'teacher','I\'m here to listen and offer support. How can I help you today? Is there anything I can do to make your college journey a little easier?','2026-01-16 12:36:32',0),(19,11,'student','Can you help me with memory tricks to remember all the program\'s logic ?','2026-01-16 12:37:56',1),(20,12,'student','I am facing difficulties with my assignments','2026-01-16 12:52:41',1),(21,11,'teacher','Helping with memory tricks can definitely be helpful in college. It can make studying and remembering information easier. Is there a specific technique or method that the program uses for its logic? Please don\'t hesitate to share your concerns and any specific challenges you\'re facing related to memory. I\'m here to offer suggestions and recommend helpful resources that may assist you in improving your memory skills.','2026-01-16 15:26:38',0),(22,12,'teacher','I hear that you\'re facing some challenges with your assignments. It\'s completely understandable to feel overwhelmed with deadlines and academic responsibilities. Is there anything specific that\'s causing you difficulty? Is there a particular subject or assignment that you\'re struggling with? Would you like to talk about it in more detail? I\'m here to support you and help you navigate through these challenges.','2026-01-16 15:28:07',0),(23,11,'student','i want to know how stack program works','2026-01-16 15:29:40',0),(24,12,'student','i waanted help with my maths assignments','2026-01-16 15:34:09',0),(25,12,'student','also with my dsa assignments\r\n','2026-01-16 15:41:18',0),(26,12,'teacher','I understand that you\'re facing difficulties with your assignments, especially in maths and DSA. It\'s completely normal to feel overwhelmed with deadlines and academic responsibilities. Could you tell me a little more about what\'s specifically causing you difficulty with your math and DSA assignments? Is there a particular subject or assignment that you\'re struggling with? Would you like to discuss it in more detail? I\'m here to support you and help you navigate through these challenges.','2026-01-16 15:45:43',0),(27,12,'student','i did not understand the poissons distribution with respect to probability chapter in maths','2026-01-16 15:46:54',0),(28,12,'teacher','Is there a specific topic or problem that you\'re struggling with? Would you like to go over it in more detail? Remember, I\'m here to support you and help you navigate through these challenges.','2026-01-16 15:51:56',0),(29,12,'student','the derivation of mean and variance of poissions distribution is difficult to me. pleae help me with that','2026-01-16 15:59:35',0),(30,12,'teacher','okay, tell me the page no','2026-01-16 16:30:54',0),(31,12,'student','page no 335','2026-01-16 16:31:21',0),(32,12,'teacher','okay dear, i\'ll look through it and contact you','2026-01-16 16:32:13',0),(33,12,'student','ok','2026-01-16 16:32:58',0),(34,12,'teacher','i will teach you tomorrow during the luch break','2026-01-16 16:36:50',0),(35,11,'teacher','okay','2026-01-16 16:39:15',0),(36,1,'teacher','is there anything i can help with','2026-01-16 16:44:31',0),(37,1,'teacher','if yes, please let me know','2026-01-16 16:48:26',0),(38,1,'student','nothing madam, thanks for your support','2026-01-16 16:49:10',0),(39,13,'student','I needed help with my OS assignments','2026-01-17 18:35:23',0),(40,14,'student','I needed help with my OS assignments','2026-01-17 18:36:04',1),(41,13,'teacher','Hey dear! I hear you\'re struggling with your OS assignments. I\'m here to help. What specifically are you having trouble with? Is there anything I can assist you with?','2026-01-17 18:37:05',0),(42,14,'teacher','I hear you. It can be really difficult to keep up with all the different assignments and deadlines, especially when you\'re juggling other priorities. Is there anything I can do to help you with your OS assignments? Tell me what you\'re struggling with, and I\'ll do my best to provide support and guidance.','2026-01-17 18:38:06',0),(43,15,'student','This counselling request is in response to the teacher-initiated counselling request.','2026-01-20 14:41:09',0),(44,16,'student','This counselling request is in response to the teacher-initiated counselling request.','2026-01-20 19:48:45',0),(45,17,'student','This counselling request is in response to the teacher-initiated counselling request.','2026-01-20 19:52:57',0),(46,18,'student','This counselling request is in response to the teacher-initiated counselling request.','2026-01-20 21:41:15',0);
/*!40000 ALTER TABLE `counselling_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counselling_requests`
--

DROP TABLE IF EXISTS `counselling_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counselling_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `problem` text,
  `category` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_closed` tinyint DEFAULT '0',
  `confidential` tinyint(1) DEFAULT '0',
  `linked_teacher_request_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `counselling_requests_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counselling_requests`
--

LOCK TABLES `counselling_requests` WRITE;
/*!40000 ALTER TABLE `counselling_requests` DISABLE KEYS */;
INSERT INTO `counselling_requests` VALUES (1,2,'what is 5+8?','Academic','Completed','2025-12-23 10:38:10',1,0,NULL),(2,2,'i am not able to concentrate on my studies, and peer pressure','Mental','Pending','2025-12-23 10:38:10',0,0,NULL),(3,2,'I am having peer pressure','Mental','Pending','2025-12-23 10:38:10',0,0,NULL),(4,2,'I am feeling distracted, don\'t know where to start condfused','Mental','Pending','2025-12-23 10:38:10',0,0,NULL),(5,2,'i am not able to study','Academic','Pending','2025-12-24 13:56:34',0,0,NULL),(6,2,'I AM FEELING UNWELL','Health','Pending','2025-12-24 14:27:38',0,0,NULL),(7,2,'I am depressed','Mental','Pending','2025-12-24 14:31:03',0,0,NULL),(8,2,'I am not able to concentrate on my studies','Academic','Pending','2025-12-25 16:57:15',1,1,NULL),(9,2,'not feeling well','Mental','Pending','2026-01-16 11:31:12',0,0,NULL),(10,2,'i am depressed','Mental','Pending','2026-01-16 11:43:11',0,0,NULL),(11,2,'I am facing difficulties with dsa programs','Academic','Teacher Responded','2026-01-16 12:35:05',0,0,NULL),(12,2,'I am facing difficulties with my assignments','Academic','Teacher Responded','2026-01-16 12:52:41',0,0,NULL),(13,2,'I needed help with my OS assignments','Academic','Completed','2026-01-17 18:35:23',1,0,NULL),(14,2,'I needed help with my OS assignments','Academic','Completed','2026-01-17 18:36:04',1,0,NULL),(15,2,'This counselling request is in response to the teacher-initiated counselling request.','Academic','Pending','2026-01-20 14:41:09',0,0,5),(16,3,'This counselling request is in response to the teacher-initiated counselling request.','Academic','Pending','2026-01-20 19:48:44',0,0,12),(17,3,'This counselling request is in response to the teacher-initiated counselling request.','Academic','Pending','2026-01-20 19:52:57',0,0,13),(18,3,'This counselling request is in response to the teacher-initiated counselling request.','Academic','Pending','2026-01-20 21:41:15',0,0,15);
/*!40000 ALTER TABLE `counselling_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counselling_responses`
--

DROP TABLE IF EXISTS `counselling_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counselling_responses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` int DEFAULT NULL,
  `ai_response` text,
  `teacher_response` text,
  `completed_at` datetime DEFAULT NULL,
  `student_feedback` text,
  `student_rating` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `counselling_responses_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `counselling_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counselling_responses`
--

LOCK TABLES `counselling_responses` WRITE;
/*!40000 ALTER TABLE `counselling_responses` DISABLE KEYS */;
INSERT INTO `counselling_responses` VALUES (1,1,'The answer to 5+8 is 13.','The answer to 5+8 is 13.','2025-12-22 10:36:05','I felt good after speaking to my teacher. helpful',5),(2,2,'Okay, this sounds really tough. It\'s incredibly common to struggle with concentration when you\'re dealing with both academic pressure *and* the influence of peer pressure. It’s fantastic that you’re recognizing this and wanting to address it – that’s a huge first step. Let\'s break this down and explore some strategies.\r\n\r\n**1. Understanding the Root of the Problem:**\r\n\r\n* **What specifically is distracting you during studying?**  Be really specific. Is it:\r\n    * **Social media?** (Scrolling, notifications)\r\n    * **Thoughts about friends?** (Wishing you were with them, worrying about what they think)\r\n    * **Physical discomfort?** (Temperature, posture, noise)\r\n    * **Feeling overwhelmed by the material?** (Not understanding it, feeling like it\'s too much)\r\n    * **Low energy/mood?** (Hunger, lack of sleep, anxiety)\r\n* **What kind of peer pressure are you experiencing?** This is crucial. It could be:\r\n    * **Pressure to party/socialize?** (Feeling like you *have* to go out even if you don’t want to)\r\n    * **Pressure to keep up with their grades?** (Comparing yourself and feeling inadequate)\r\n    * **Pressure to make certain choices?** (Trying to fit in, even if it\'s not genuine)\r\n    * **Pressure to engage in risky behaviors?** (This deserves immediate attention – see resources below)\r\n\r\n**2. Tackling Concentration Issues:**\r\n\r\n* **The Pomodoro Technique:** Work in focused 25-minute intervals, followed by a 5-minute break. After 4 Pomodoros, take a longer 20-30 minute break.  This helps with focus and prevents burnout.\r\n* **Minimize Distractions:**\r\n    * **Phone:** Put it on \"Do Not Disturb\" or in another room. Seriously, this is often the biggest culprit.\r\n    * **Social Media:** Use website blockers (Freedom, Cold Turkey, StayFocusd) to limit your access during study times.\r\n    * **Environment:** Find a quiet study space – library, coffee shop (with headphones), or a dedicated area in your home. Let people around you know you need focused time.\r\n* **Break Down Tasks:** Large assignments feel overwhelming. Break them into smaller, more manageable steps. Celebrate each small accomplishment.\r\n* **Active Recall:** Don\'t just passively read. Test yourself frequently, try to explain concepts out loud, or create flashcards.\r\n* **Take Regular Breaks:**  Get up, stretch, walk around, get some fresh air. Your brain needs a rest.\r\n* **Prioritize Sleep, Nutrition, and Exercise:** These are *foundational*.  Lack of sleep, unhealthy food, and no exercise will significantly impair your concentration and mood.\r\n\r\n**3. Addressing Peer Pressure:**\r\n\r\n* **Recognize It\'s Okay to Say No:** You are not obligated to do anything that makes you uncomfortable.  Practice saying \"No, thank you\" confidently and politely.  You don\'t need to give lengthy explanations. \"I\'m studying\" is often enough.\r\n* **Understand Your Values:** What’s important to *you*?  Connecting with your values can help you resist pressure that goes against them.\r\n* **Surround Yourself with Supportive Friends:** Choose friends who respect your goals and priorities, and who encourage you to be yourself.\r\n* **Have an Exit Strategy:** If you do go to a social event, have a plan for leaving if you\'re feeling pressured.\r\n* **Reframe the Situation:**  Instead of seeing peer pressure as a threat, consider it an opportunity to demonstrate your self-discipline and values.  Often, people who pressure others are insecure themselves.\r\n\r\n**4. Mental and Emotional Wellbeing:**\r\n\r\n* **Stress Management Techniques:**  Try deep breathing exercises, meditation, yoga, or mindfulness.  Even 5-10 minutes a day can make a difference.\r\n* **Journaling:** Writing down your thoughts and feelings can help you process them and reduce anxiety.\r\n* **Talk to Someone:**  This is incredibly important.  Talk to a trusted friend, family member, counselor, or therapist.  Just talking about it can relieve a lot of pressure.\r\n\r\n**Resources:**\r\n\r\n* **SAMHSA National Helpline:** 1-800-662-HELP (4357) (Substance Abuse and Mental Health Services Administration) - Free, confidential support.  [https://www.samhsa.gov/find-help/national-helpline](https://www.samhsa.gov/find-help/national-helpline)\r\n* **Crisis Text Line:** Text HOME to 741741 -  Free, 24/7 crisis support.\r\n* **Your School Counselor:**  They can offer academic support, guidance, and resources.\r\n* **MentalHealth.gov:** [https://www.mentalhealth.gov/](https://www.mentalhealth.gov/) – Information and resources on mental health conditions.\r\n\r\n**Important Note:**  If you\'re experiencing thoughts of self-harm or feeling overwhelmed, please seek professional help immediately.  Don\'t hesitate to reach out to a crisis hotline or mental health professional.\r\n\r\n**To help me give you more tailored advice, could you tell me a little more about:**\r\n\r\n*   **What subjects are you studying?** (This can help me understand the nature of the academic pressure)\r\n*   **What does the peer pressure look like specifically?** (e.g., “My friends always invite me to parties,” or “They keep talking about how much better their grades are than mine.”)\r\n*   **On a scale of 1 to 10, how would you rate your overall stress level right now?** (1 being low, 10 being very high)','Okay, this sounds really tough. It\'s incredibly common to struggle with concentration when you\'re dealing with both academic pressure *and* the influence of peer pressure. It’s fantastic that you’re recognizing this and wanting to address it – that’s a huge first step. Let\'s break this down and explore some strategies.\r\n\r\n**1. Understanding the Root of the Problem:**\r\n\r\n* **What specifically is distracting you during studying?**  Be really specific. Is it:\r\n    * **Social media?** (Scrolling, notifications)\r\n    * **Thoughts about friends?** (Wishing you were with them, worrying about what they think)\r\n    * **Physical discomfort?** (Temperature, posture, noise)\r\n    * **Feeling overwhelmed by the material?** (Not understanding it, feeling like it\'s too much)\r\n    * **Low energy/mood?** (Hunger, lack of sleep, anxiety)\r\n* **What kind of peer pressure are you experiencing?** This is crucial. It could be:\r\n    * **Pressure to party/socialize?** (Feeling like you *have* to go out even if you don’t want to)\r\n    * **Pressure to keep up with their grades?** (Comparing yourself and feeling inadequate)\r\n    * **Pressure to make certain choices?** (Trying to fit in, even if it\'s not genuine)\r\n    * **Pressure to engage in risky behaviors?** (This deserves immediate attention – see resources below)\r\n\r\n**2. Tackling Concentration Issues:**\r\n\r\n* **The Pomodoro Technique:** Work in focused 25-minute intervals, followed by a 5-minute break. After 4 Pomodoros, take a longer 20-30 minute break.  This helps with focus and prevents burnout.\r\n* **Minimize Distractions:**\r\n    * **Phone:** Put it on \"Do Not Disturb\" or in another room. Seriously, this is often the biggest culprit.\r\n    * **Social Media:** Use website blockers (Freedom, Cold Turkey, StayFocusd) to limit your access during study times.\r\n    * **Environment:** Find a quiet study space – library, coffee shop (with headphones), or a dedicated area in your home. Let people around you know you need focused time.\r\n* **Break Down Tasks:** Large assignments feel overwhelming. Break them into smaller, more manageable steps. Celebrate each small accomplishment.\r\n* **Active Recall:** Don\'t just passively read. Test yourself frequently, try to explain concepts out loud, or create flashcards.\r\n* **Take Regular Breaks:**  Get up, stretch, walk around, get some fresh air. Your brain needs a rest.\r\n* **Prioritize Sleep, Nutrition, and Exercise:** These are *foundational*.  Lack of sleep, unhealthy food, and no exercise will significantly impair your concentration and mood.\r\n\r\n**3. Addressing Peer Pressure:**\r\n\r\n* **Recognize It\'s Okay to Say No:** You are not obligated to do anything that makes you uncomfortable.  Practice saying \"No, thank you\" confidently and politely.  You don\'t need to give lengthy explanations. \"I\'m studying\" is often enough.\r\n* **Understand Your Values:** What’s important to *you*?  Connecting with your values can help you resist pressure that goes against them.\r\n* **Surround Yourself with Supportive Friends:** Choose friends who respect your goals and priorities, and who encourage you to be yourself.\r\n* **Have an Exit Strategy:** If you do go to a social event, have a plan for leaving if you\'re feeling pressured.\r\n* **Reframe the Situation:**  Instead of seeing peer pressure as a threat, consider it an opportunity to demonstrate your self-discipline and values.  Often, people who pressure others are insecure themselves.\r\n\r\n**4. Mental and Emotional Wellbeing:**\r\n\r\n* **Stress Management Techniques:**  Try deep breathing exercises, meditation, yoga, or mindfulness.  Even 5-10 minutes a day can make a difference.\r\n* **Journaling:** Writing down your thoughts and feelings can help you process them and reduce anxiety.\r\n* **Talk to Someone:**  This is incredibly important.  Talk to a trusted friend, family member, counselor, or therapist.  Just talking about it can relieve a lot of pressure.\r\n\r\n**Resources:**\r\n\r\n* **SAMHSA National Helpline:** 1-800-662-HELP (4357) (Substance Abuse and Mental Health Services Administration) - Free, confidential support.  [https://www.samhsa.gov/find-help/national-helpline](https://www.samhsa.gov/find-help/national-helpline)\r\n* **Crisis Text Line:** Text HOME to 741741 -  Free, 24/7 crisis support.\r\n* **Your School Counselor:**  They can offer academic support, guidance, and resources.\r\n* **MentalHealth.gov:** [https://www.mentalhealth.gov/](https://www.mentalhealth.gov/) – Information and resources on mental health conditions.\r\n\r\n**Important Note:**  If you\'re experiencing thoughts of self-harm or feeling overwhelmed, please seek professional help immediately.  Don\'t hesitate to reach out to a crisis hotline or mental health professional.\r\n\r\n**To help me give you more tailored advice, could you tell me a little more about:**\r\n\r\n*   **What subjects are you studying?** (This can help me understand the nature of the academic pressure)\r\n*   **What does the peer pressure look like specifically?** (e.g., “My friends always invite me to parties,” or “They keep talking about how much better their grades are than mine.”)\r\n*   **On a scale of 1 to 10, how would you rate your overall stress level right now?** (1 being low, 10 being very high)','2025-12-22 11:43:26',NULL,NULL),(3,4,NULL,'I\'m listening. Please continue the conversation and tell me what\'s on your mind.','2025-12-22 19:21:18',NULL,NULL),(4,3,NULL,'I\'m listening. Please share the conversation you\'d like me to respond to.','2025-12-24 11:49:54',NULL,NULL),(5,5,NULL,'I\'m listening. How can I help you today? Is there anything I can do to support you in your college application journey?','2025-12-24 13:57:34','I felt relieved after this counselling session. Thankful.',4),(6,6,NULL,'I\'m listening. How can I help you today? Is there anything I can do to support you in your college application journey? hOW DO YPU FEL NOW','2025-12-24 14:28:33',NULL,NULL),(7,8,NULL,'Hi dear, I am here to listen and provide support in any way I can. What would you like to talk about today? Is there anything on your mind that I can help you with?','2025-12-25 16:58:51','',4),(8,8,NULL,'It\'s understandable that you\'re facing challenges with your family. Family problems can be incredibly difficult, and it\'s important to know that you\'re not alone. I\'m here to listen and provide support in any way I can. Is there anything on your mind that you\'d like to talk about today?','2025-12-25 17:01:22','',4),(9,2,NULL,'You\'re very welcome! I\'m glad I could be of help. It\'s important to know that we can all struggle with understanding sometimes, especially when we\'re feeling lonely. Remember, it\'s okay to take things one step at a time and not feel pressured to understand everything immediately. Let\'s take a step back and break down the issue together, and I\'ll be here to support you every step of the way.','2026-01-13 14:49:15',NULL,NULL),(10,8,NULL,NULL,NULL,'',4),(11,11,NULL,'I\'m here to listen and offer support. How can I help you today? Is there anything I can do to make your college journey a little easier?','2026-01-16 12:36:32',NULL,NULL),(12,11,NULL,'Helping with memory tricks can definitely be helpful in college. It can make studying and remembering information easier. Is there a specific technique or method that the program uses for its logic? Please don\'t hesitate to share your concerns and any specific challenges you\'re facing related to memory. I\'m here to offer suggestions and recommend helpful resources that may assist you in improving your memory skills.','2026-01-16 15:26:39',NULL,NULL),(13,12,NULL,'I hear that you\'re facing some challenges with your assignments. It\'s completely understandable to feel overwhelmed with deadlines and academic responsibilities. Is there anything specific that\'s causing you difficulty? Is there a particular subject or assignment that you\'re struggling with? Would you like to talk about it in more detail? I\'m here to support you and help you navigate through these challenges.','2026-01-16 15:28:08',NULL,NULL),(14,12,NULL,'I understand that you\'re facing difficulties with your assignments, especially in maths and DSA. It\'s completely normal to feel overwhelmed with deadlines and academic responsibilities. Could you tell me a little more about what\'s specifically causing you difficulty with your math and DSA assignments? Is there a particular subject or assignment that you\'re struggling with? Would you like to discuss it in more detail? I\'m here to support you and help you navigate through these challenges.','2026-01-16 15:45:44',NULL,NULL),(15,12,NULL,'Is there a specific topic or problem that you\'re struggling with? Would you like to go over it in more detail? Remember, I\'m here to support you and help you navigate through these challenges.','2026-01-16 15:51:56',NULL,NULL),(16,12,NULL,'okay, tell me the page no','2026-01-16 16:30:55',NULL,NULL),(17,12,NULL,'okay dear, i\'ll look through it and contact you','2026-01-16 16:32:13',NULL,NULL),(18,12,NULL,'i will teach you tomorrow during the luch break','2026-01-16 16:36:50',NULL,NULL),(19,11,NULL,'okay','2026-01-16 16:39:16',NULL,NULL),(20,1,NULL,'is there anything i can help with','2026-01-16 16:44:32','I felt good after speaking to my teacher. helpful',5),(21,1,NULL,'if yes, please let me know','2026-01-16 16:48:26','I felt good after speaking to my teacher. helpful',5),(22,1,NULL,NULL,NULL,'I felt good after speaking to my teacher. helpful',5),(23,13,NULL,'Hey dear! I hear you\'re struggling with your OS assignments. I\'m here to help. What specifically are you having trouble with? Is there anything I can assist you with?','2026-01-17 18:37:06',NULL,NULL),(24,14,NULL,'I hear you. It can be really difficult to keep up with all the different assignments and deadlines, especially when you\'re juggling other priorities. Is there anything I can do to help you with your OS assignments? Tell me what you\'re struggling with, and I\'ll do my best to provide support and guidance.','2026-01-17 18:38:06','It was a helpfull session',4),(25,14,NULL,NULL,NULL,'It was a helpfull session',4),(26,13,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `counselling_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_performance`
--

DROP TABLE IF EXISTS `student_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_performance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject` varchar(100) NOT NULL,
  `marks` int DEFAULT NULL,
  `attendance_percentage` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_student_subject` (`student_id`,`subject`),
  CONSTRAINT `student_performance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_performance_chk_1` CHECK ((`marks` between 0 and 100)),
  CONSTRAINT `student_performance_chk_2` CHECK ((`attendance_percentage` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_performance`
--

LOCK TABLES `student_performance` WRITE;
/*!40000 ALTER TABLE `student_performance` DISABLE KEYS */;
INSERT INTO `student_performance` VALUES (1,1,'Maths',35,40,'2026-01-20 14:13:47'),(2,2,'Physics',78,82,'2026-01-20 14:13:47'),(3,3,'Chemistry',55,70,'2026-01-20 14:13:47'),(4,4,'Biology',30,60,'2026-01-20 14:13:47');
/*!40000 ALTER TABLE `student_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `assigned_teacher_id` int DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `fk_students_teacher` (`assigned_teacher_id`),
  CONSTRAINT `fk_students_teacher` FOREIGN KEY (`assigned_teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,3,1,NULL,NULL,NULL),(2,4,1,NULL,NULL,NULL),(3,5,1,NULL,NULL,NULL),(4,9,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_counselling_requests`
--

DROP TABLE IF EXISTS `teacher_counselling_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_counselling_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `student_id` int NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `message` text,
  `status` enum('Pending','Accepted','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `responded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `teacher_counselling_requests_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  CONSTRAINT `teacher_counselling_requests_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_counselling_requests`
--

LOCK TABLES `teacher_counselling_requests` WRITE;
/*!40000 ALTER TABLE `teacher_counselling_requests` DISABLE KEYS */;
INSERT INTO `teacher_counselling_requests` VALUES (1,1,2,'Academic','','Accepted','2026-01-20 08:17:28','2026-01-20 08:17:58'),(2,1,2,'Personal','','Accepted','2026-01-20 08:39:15','2026-01-20 08:46:53'),(3,1,2,'Academic','','Accepted','2026-01-20 08:42:16','2026-01-20 08:46:49'),(4,1,2,'Personal','','Accepted','2026-01-20 08:50:48','2026-01-20 08:51:34'),(5,1,2,'Personal','','Accepted','2026-01-20 09:10:32','2026-01-20 09:10:56'),(6,1,2,'Career','','Accepted','2026-01-20 09:20:16','2026-01-20 09:20:47'),(7,1,2,'Career','','Accepted','2026-01-20 09:21:22','2026-01-20 09:24:00'),(8,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Pending','2026-01-20 13:52:15',NULL),(9,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Pending','2026-01-20 13:55:13',NULL),(10,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Pending','2026-01-20 13:55:18',NULL),(11,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Accepted','2026-01-20 14:13:55','2026-01-20 16:05:50'),(12,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Accepted','2026-01-20 14:18:20','2026-01-20 14:18:35'),(13,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Accepted','2026-01-20 14:22:34','2026-01-20 14:22:53'),(14,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Pending','2026-01-20 16:10:48',NULL),(15,1,3,'Academic','Based on your recent marks and attendance records, a counselling session is recommended.','Accepted','2026-01-20 16:10:53','2026-01-20 16:11:10');
/*!40000 ALTER TABLE `teacher_counselling_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,7,NULL,NULL,NULL),(2,8,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `USN` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USN` (`USN`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Admin User','ADMIN001','scrypt:32768:8:1$qnVtvvJ6hhVIYoxA$47048a0ecc912007e281fe446538cb3def003af10ed1a37f86b3fa3227c179fbc5030f10f3e2a113057fe6fb436b0c41c17dd7a964f0bda47cf2a734234552bc','admin'),(3,'ABHISTA','STUD001','scrypt:32768:8:1$ztOe2aorTp1oHi2k$0ba561eb9c647b41f8c091fbc0a01a3de07175e8c92d430146e09c987dd58a873036f898b62f2ec7953671bee2fe956b5b6d912774f4ab3b633d6fd8df5218e2','student'),(4,'ALMAS','STUD002','scrypt:32768:8:1$NAwmnRUzVv5Li0iR$fb0942f5dc1857e01eaf50898628f4f81bc884eb4963ba61c3ea1aa6005272eb6bae2343ee1081d635070986e8bfb4c024513c83a5897d5598de3e3de6b26853','student'),(5,'AISHWARYA','STUD003','scrypt:32768:8:1$KtU1zI6rxIOkvPKt$2c526d869e90147ed1f9eb35ff916f3a4c51055996b92801d749322bc78832b44aa73632d9b8668744187a4e42371c9f53a1a07232ae8dd1f65469e5386a23a4','student'),(6,'SINCHANA P','ADMIN002','scrypt:32768:8:1$miA0YHehN6OPTmwX$07d427d22ab3d26cd8524e77c196cce4db508d2fbbeb44451a1c36d5d8625cc33de0f7b889de5739dec4254a2e5cd55005bb31499d73511653c635c5a0fd96fb','admin'),(7,'PREKSHA','TEACH001','scrypt:32768:8:1$bJYCu44Cd4ywtIyV$53297233b694f89ab4eaa95780cb1195992f9681f2156b6c53a23825ad74af0806099894be9b6f3a4c9d623f5602c2942ae9ba701f2de4e4df2ebde2adade6ce','teacher'),(8,'JHANVI','TEACH002','scrypt:32768:8:1$cvx9Ft54IKzaOpVF$33a677ad011dc1dd6c913810a6a0cd1e6c7a643ada88b36b73db9afcedc674cea3d15187fad3482fb2876659b54997e166928c2675cb7111c47271f1e4bdb481','teacher'),(9,'CHINMAYI','STUD004','scrypt:32768:8:1$0A5jTYsOMhspdigi$9d9e0b84217fc17dcd230a70f23ec0d64fce3cdc05597a297048ec5083a1f17741c7c2999afd506749c461f92cadd607b8b815d54256979bfc27e6cd2849ae36','student');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'counselling_system'
--

--
-- Dumping routines for database 'counselling_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-20 22:51:12
