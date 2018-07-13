-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- jjdev2 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `jjdev2` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `jjdev2`;


-- 테이블 jjdev2의 구조를 덤프합니다. student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) DEFAULT NULL,
  `student_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.student: ~23 rows (대략적)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_name`, `student_age`) VALUES
	(1, '송원민', 25),
	(2, '탁재은', 23),
	(3, '최윤석', 25),
	(4, '구해성', 20),
	(5, '이광재', 28),
	(6, '김준영', 25),
	(7, '박원우', 26),
	(8, '이응빈', 24),
	(9, '김호순', 25),
	(10, '송유빈', 22),
	(11, '김진우', 25),
	(12, '현희문', 26),
	(13, '김정연', 17),
	(14, '김지완', 26),
	(15, '서연문', 26),
	(16, '김소희', 26),
	(17, '최지수', 25),
	(18, '이경선', 26),
	(19, '정민수', 25),
	(20, '공세준', 32),
	(21, '이원상', 30),
	(22, '전재현', 26),
	(23, '정규룡', 26);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. student_address
CREATE TABLE IF NOT EXISTS `student_address` (
  `student_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL DEFAULT '0',
  `student_address_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_address_no`),
  KEY `FK_student_address_student` (`student_no`),
  CONSTRAINT `FK_student_address_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.student_address: ~26 rows (대략적)
/*!40000 ALTER TABLE `student_address` DISABLE KEYS */;
INSERT INTO `student_address` (`student_address_no`, `student_no`, `student_address_content`) VALUES
	(35, 1, '김동'),
	(36, 2, '님동'),
	(37, 3, '딤동'),
	(38, 4, '림동'),
	(39, 5, '밈동'),
	(40, 2, '빔동'),
	(41, 3, '심동'),
	(42, 4, '임동'),
	(43, 6, '빔동'),
	(44, 7, '심동'),
	(45, 8, '임동'),
	(46, 9, '짐동'),
	(47, 10, '침동'),
	(48, 11, '킴동'),
	(49, 12, '팀동'),
	(50, 13, '핌동'),
	(51, 14, '힘동'),
	(52, 15, '고길동'),
	(53, 16, '동녘동'),
	(54, 17, '가동'),
	(55, 18, '나동'),
	(56, 19, '다동'),
	(57, 20, '라동'),
	(58, 21, '마동'),
	(59, 22, '바동'),
	(60, 23, '사동');
/*!40000 ALTER TABLE `student_address` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. student_score
CREATE TABLE IF NOT EXISTS `student_score` (
  `student_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_score_no`),
  KEY `FK__student` (`student_no`),
  CONSTRAINT `FK__student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table jjdev2.student_score: ~1 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(8, 1, 11);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
