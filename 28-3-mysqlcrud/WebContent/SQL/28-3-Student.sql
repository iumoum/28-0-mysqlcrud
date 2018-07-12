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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.student: ~7 rows (대략적)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_name`, `student_age`) VALUES
	(1, '김공일', 11),
	(2, '김공이', 12),
	(3, '김공삼', 13),
	(4, '김공사', 14),
	(5, '김공오', 15),
	(6, '김공육', 16),
	(17, '김공칠', 17);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. student_address
CREATE TABLE IF NOT EXISTS `student_address` (
  `student_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL DEFAULT '0',
  `student_address_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_address_no`),
  KEY `FK_student_address_student` (`student_no`),
  CONSTRAINT `FK_student_address_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.student_address: ~7 rows (대략적)
/*!40000 ALTER TABLE `student_address` DISABLE KEYS */;
INSERT INTO `student_address` (`student_address_no`, `student_no`, `student_address_content`) VALUES
	(28, 3, '삼성동'),
	(29, 4, '경암동'),
	(30, 2, '군산시 문화동'),
	(31, 1, '군산시 금암동'),
	(32, 5, '오역동'),
	(33, 6, '개포동'),
	(34, 17, '도림동');
/*!40000 ALTER TABLE `student_address` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. student_score
CREATE TABLE IF NOT EXISTS `student_score` (
  `student_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_score_no`),
  KEY `FK__student` (`student_no`),
  CONSTRAINT `FK__student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table jjdev2.student_score: ~7 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(1, 1, 100),
	(2, 2, 33),
	(3, 3, 44),
	(4, 4, 555),
	(5, 5, 66),
	(6, 6, 77),
	(7, 17, 88);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
