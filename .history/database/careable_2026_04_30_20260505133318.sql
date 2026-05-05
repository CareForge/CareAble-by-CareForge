/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : careable

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2026-04-30 12:25:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `userId` (`userId`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `application`
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `applicationId` int(11) NOT NULL AUTO_INCREMENT,
  `empId` int(11) DEFAULT NULL,
  `jobRole` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`applicationId`),
  KEY `empId` (`empId`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`empId`) REFERENCES `employer` (`empId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of application
-- ----------------------------

-- ----------------------------
-- Table structure for `assessments`
-- ----------------------------
DROP TABLE IF EXISTS `assessments`;
CREATE TABLE `assessments` (
  `assessmentId` int(11) NOT NULL AUTO_INCREMENT,
  `caregiverId` int(11) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`assessmentId`),
  KEY `caregiverId` (`caregiverId`),
  CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`caregiverId`) REFERENCES `caregiver` (`caregiverId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of assessments
-- ----------------------------

-- ----------------------------
-- Table structure for `caregiver`
-- ----------------------------
DROP TABLE IF EXISTS `caregiver`;
CREATE TABLE `caregiver` (
  `caregiverId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`caregiverId`),
  KEY `userId` (`userId`),
  CONSTRAINT `caregiver_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of caregiver
-- ----------------------------

-- ----------------------------
-- Table structure for `employer`
-- ----------------------------
DROP TABLE IF EXISTS `employer`;
CREATE TABLE `employer` (
  `empId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `companyName` varchar(150) DEFAULT NULL,
  `contactNo` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(3) NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`empId`),
  KEY `userId` (`userId`),
  CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of employer
-- ----------------------------

-- ----------------------------
-- Table structure for `experience`
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `expId` int(11) NOT NULL AUTO_INCREMENT,
  `caregiverId` int(11) NOT NULL,
  `experience` text DEFAULT NULL,
  PRIMARY KEY (`expId`),
  KEY `caregiverId` (`caregiverId`),
  CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`caregiverId`) REFERENCES `caregiver` (`caregiverId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of experience
-- ----------------------------

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `q_id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(12) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer1` text DEFAULT NULL,
  `answer2` text DEFAULT NULL,
  `answer3` text DEFAULT NULL,
  `answer4` text DEFAULT NULL,
  `correct_answer` int(4) DEFAULT NULL,
  `status` enum('Deleted','Active') DEFAULT 'Active',
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', 'CK_mcq', 'Which of the following is a sign of dehydration?', 'Sweating', 'Dry mouth', 'High energy', 'Loud speech', '2', 'Active');
INSERT INTO `questions` VALUES ('2', 'CK_mcq', 'The correct way to lift a patient is:', 'Bend your back', 'Use your legs', 'Twist your body', 'Pull quickly', '2', 'Active');
INSERT INTO `questions` VALUES ('3', 'CK_mcq', 'What is the normal body temperature range?', '34–35°C', '36–37.5°C', '38–40°C', '30–32°C', '2', 'Active');
INSERT INTO `questions` VALUES ('4', 'CK_mcq', 'Which condition affects memory and thinking skills?', 'Asthma', 'Diabetes', 'Dementia', 'Arthritis', '3', 'Active');
INSERT INTO `questions` VALUES ('5', 'CK_mcq', 'What is the first step in infection control?', 'Wear gloves', 'Wash hands', 'Take medicine', 'Call doctor', '2', 'Active');
INSERT INTO `questions` VALUES ('6', 'CK_mcq', 'What should you do if a patient falls?', 'Lift immediately', 'Check injuries first', 'Ignore', 'Leave', '2', 'Active');
INSERT INTO `questions` VALUES ('7', 'CK_mcq', 'Which diet is suitable for diabetic patients?', 'High sugar', 'Balanced low sugar', 'Only fats', 'Only protein', '2', 'Active');
INSERT INTO `questions` VALUES ('8', 'CK_mcq', 'What does PPE stand for?', 'Patient Protection Equipment', 'Personal Protective Equipment', 'Public Protection Equipment', 'Private Protection Equipment', '2', 'Active');
INSERT INTO `questions` VALUES ('9', 'CK_mcq', 'Pressure sores are caused by:', 'Too much walking', 'Prolonged pressure', 'Eating too much', 'Talking', '2', 'Active');
INSERT INTO `questions` VALUES ('10', 'CK_mcq', 'Which is a sign of stroke?', 'Smile evenly', 'Both arms strong', 'Slurred speech', 'Normal vision', '3', 'Active');
INSERT INTO `questions` VALUES ('11', 'CK_mcq', 'What is the most important step before providing care?', 'Start immediately', 'Ask family', 'Identify the patient correctly', 'Call doctor', '3', 'Active');
INSERT INTO `questions` VALUES ('12', 'CK_mcq', 'How often should hands be washed in caregiving?', 'Once a day', 'Only when dirty', 'Before and after each patient contact', 'Once a week', '3', 'Active');
INSERT INTO `questions` VALUES ('13', 'CK_mcq', 'What should you do if a patient has difficulty breathing?', 'Ignore', 'Give food', 'Seek immediate medical help', 'Let them sleep', '3', 'Active');
INSERT INTO `questions` VALUES ('14', 'CK_mcq', 'What is a key principle of person-centered care?', 'Treat everyone the same', 'Respect individual preferences', 'Ignore patient opinion', 'Follow only family decisions', '2', 'Active');
INSERT INTO `questions` VALUES ('15', 'CK_mcq', 'What should you do after using gloves?', 'Reuse them', 'Put in pocket', 'Dispose and wash hands', 'Give to another caregiver', '3', 'Active');
INSERT INTO `questions` VALUES ('16', 'SB_mcq', 'You are assisting a client with their morning routine when they suddenly collapse and become unresponsive. After ensuring the area is safe, what is your immediate next step?', 'Call the client’s emergency contact person', 'Try to move the client to their bed or a chair', 'Call 000 immediately and follow the dispatcher\'s instructions', 'Check the care plan for any history of fainting', '3', 'Active');
INSERT INTO `questions` VALUES ('17', 'SB_mcq', 'A client living with dementia becomes verbally aggressive and begins throwing objects during a meal. How should you respond?', 'Firmly tell the client that their behavior is unacceptable and will not be tolerated', 'Remain calm, move to a safe distance, and try to identify if an environmental trigger is causing the distress', 'Quickly restrain the client’s arms to prevent them from throwing more objects', 'Leave the room immediately and go home for the day', '2', 'Active');
INSERT INTO `questions` VALUES ('18', 'SB_mcq', 'Shortly after a shift change, you realize you accidentally gave a client the wrong dosage of their medication. What is your first obligation?', 'Wait until the next dose and give less to balance it out', 'Immediately notify your supervisor and monitor the client for any adverse reactions', 'Update the medication log to show the correct dose was given', 'Call the client’s doctor for a new prescription without telling your agency', '2', 'Active');
INSERT INTO `questions` VALUES ('19', 'SB_mcq', 'A client’s daughter offers you a $200 cash bonus for your service. How do you handle this?', 'Accept it as a private gift', 'Accept it but warn her not to repeat', 'Politely decline and explain it is against professional policy', 'Ask for a gift card instead', '3', 'Active');
INSERT INTO `questions` VALUES ('20', 'SB_mcq', 'You are caring for a non-verbal client pointing at their stomach and crying. How should you assess?', 'Assume they are hungry and give food', 'Use visual aids and observe body language, then check for physical symptoms', 'Ignore as normal behavior', 'Give painkiller without consulting nurse', '2', 'Active');
INSERT INTO `questions` VALUES ('21', 'SB_mcq', 'A client refuses to shower despite the care plan. What is your response?', 'Force them to follow the schedule', 'Threaten with consequences', 'Respect refusal, offer alternative, and document it', 'Call family to convince them', '3', 'Active');
INSERT INTO `questions` VALUES ('22', 'SB_mcq', 'You notice unexplained bruises on a client. What must you do?', 'Ignore as age-related', 'Document and report as safeguarding concern', 'Ask other caregivers casually', 'Post online for advice', '2', 'Active');
INSERT INTO `questions` VALUES ('23', 'SB_mcq', 'You feel exhausted after multiple double shifts. What is the professional action?', 'Push through it', 'Speak to manager and request adjustment', 'Take long breaks secretly', 'Call in sick last minute', '2', 'Active');
INSERT INTO `questions` VALUES ('24', 'SB_mcq', 'A colleague skips manual handling steps risking safety. What do you do?', 'Ignore it', 'Fix it later yourself', 'Discuss privately and report if continues', 'Complain to family', '3', 'Active');
INSERT INTO `questions` VALUES ('25', 'SB_mcq', 'A client fasting for religious reasons conflicts with medication schedule. What do you do?', 'Force them to eat', 'Consult client and healthcare professional to adjust safely', 'Dismiss their beliefs', 'Skip medication without telling', '2', 'Active');

-- ----------------------------
-- Table structure for `skills`
-- ----------------------------
DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `skillsId` int(11) NOT NULL AUTO_INCREMENT,
  `caregiverId` int(11) NOT NULL,
  `skill` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`skillsId`),
  KEY `caregiverId` (`caregiverId`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`caregiverId`) REFERENCES `caregiver` (`caregiverId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of skills
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userRole` enum('ADMIN','CAREGIVER','EMPLOYER') NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
