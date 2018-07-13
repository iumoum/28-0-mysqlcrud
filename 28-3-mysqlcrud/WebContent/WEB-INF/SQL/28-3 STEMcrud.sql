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

-- stemcrud 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `stemcrud` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `stemcrud`;


-- 테이블 stemcrud의 구조를 덤프합니다. employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  `employee_age` int(10) NOT NULL,
  PRIMARY KEY (`employee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.employee: ~15 rows (대략적)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_no`, `employee_name`, `employee_age`) VALUES
	(1, '서연문', 26),
	(2, '김지완', 26),
	(3, '전재현', 26),
	(4, '정규룡', 26),
	(5, '현희문', 26),
	(6, '김진우', 25),
	(7, '송유빈', 21),
	(8, '김정연', 17),
	(9, '송원민', 25),
	(10, '탁재은', 23),
	(11, '이광재', 31),
	(12, '정민수', 25),
	(14, '김호순', 25),
	(15, '김준영', 25),
	(16, '김소희', 26);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. employee_address
CREATE TABLE IF NOT EXISTS `employee_address` (
  `employee_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) NOT NULL,
  `employee_address_content` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_address_no`),
  KEY `FK_employ_address_employee` (`employee_no`),
  CONSTRAINT `FK_employee_address_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.employee_address: ~4 rows (대략적)
/*!40000 ALTER TABLE `employee_address` DISABLE KEYS */;
INSERT INTO `employee_address` (`employee_address_no`, `employee_no`, `employee_address_content`) VALUES
	(1, 1, '전라북도 전주시 덕진구'),
	(2, 3, '전라북도 전주시 덕진구'),
	(3, 1, '삼천동 1가'),
	(4, 2, '전주시 어디');
/*!40000 ALTER TABLE `employee_address` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. employee_score
CREATE TABLE IF NOT EXISTS `employee_score` (
  `employee_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`employee_score_no`),
  KEY `FK_employee_report_employee` (`employee_no`),
  CONSTRAINT `FK_employee_report_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.employee_score: ~10 rows (대략적)
/*!40000 ALTER TABLE `employee_score` DISABLE KEYS */;
INSERT INTO `employee_score` (`employee_score_no`, `employee_no`, `score`) VALUES
	(1, 1, 94),
	(2, 2, 99),
	(3, 3, 90),
	(4, 4, 95),
	(5, 5, 95),
	(6, 6, 98),
	(7, 7, 95),
	(8, 8, 91),
	(9, 9, 94),
	(10, 9, 94);
/*!40000 ALTER TABLE `employee_score` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_age` int(10) NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.member: ~23 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
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
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. member_address
CREATE TABLE IF NOT EXISTS `member_address` (
  `member_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `member_address_content` varchar(50) NOT NULL,
  PRIMARY KEY (`member_address_no`),
  KEY `FK_member_address_member` (`member_no`),
  CONSTRAINT `FK_member_address_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.member_address: ~4 rows (대략적)
/*!40000 ALTER TABLE `member_address` DISABLE KEYS */;
INSERT INTO `member_address` (`member_address_no`, `member_no`, `member_address_content`) VALUES
	(1, 1, '전주시 어딘가'),
	(2, 6, '에란겔시 미라마구 사녹동'),
	(3, 9, '토미아파트 벡터 호'),
	(4, 14, '전주시 완산구');
/*!40000 ALTER TABLE `member_address` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. member_score
CREATE TABLE IF NOT EXISTS `member_score` (
  `score_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`score_no`),
  KEY `FK_member_score_member` (`member_no`),
  CONSTRAINT `FK_member_score_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.member_score: ~23 rows (대략적)
/*!40000 ALTER TABLE `member_score` DISABLE KEYS */;
INSERT INTO `member_score` (`score_no`, `member_no`, `score`) VALUES
	(1, 1, 70),
	(2, 2, 80),
	(3, 3, 90),
	(4, 4, 40),
	(5, 5, 50),
	(6, 6, 69),
	(7, 7, 89),
	(8, 8, 79),
	(9, 9, 99),
	(10, 10, 99),
	(11, 11, 99),
	(12, 12, 99),
	(13, 13, 99),
	(14, 14, 1),
	(15, 15, 88),
	(16, 16, 88),
	(17, 17, 76),
	(18, 18, 94),
	(19, 19, 26),
	(20, 20, 56),
	(21, 21, 54),
	(22, 22, 88),
	(23, 23, 95);
/*!40000 ALTER TABLE `member_score` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) DEFAULT NULL,
  `student_age` int(10) DEFAULT NULL,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.student: ~23 rows (대략적)
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


-- 테이블 stemcrud의 구조를 덤프합니다. student_address
CREATE TABLE IF NOT EXISTS `student_address` (
  `student_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL DEFAULT '0',
  `student_address_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_address_no`),
  KEY `FK_student_address_student` (`student_no`),
  CONSTRAINT `FK_student_address_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.student_address: ~26 rows (대략적)
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


-- 테이블 stemcrud의 구조를 덤프합니다. student_score
CREATE TABLE IF NOT EXISTS `student_score` (
  `student_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_score_no`),
  KEY `FK__student` (`student_no`),
  CONSTRAINT `FK__student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table stemcrud.student_score: ~1 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(8, 1, 11);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_age` int(10) NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.teacher: ~23 rows (대략적)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_no`, `teacher_name`, `teacher_age`) VALUES
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
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. teacher_address
CREATE TABLE IF NOT EXISTS `teacher_address` (
  `teacher_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `teacher_address_content` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_address_no`),
  KEY `FK_teacher_address_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_address_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.teacher_address: ~4 rows (대략적)
/*!40000 ALTER TABLE `teacher_address` DISABLE KEYS */;
INSERT INTO `teacher_address` (`teacher_address_no`, `teacher_no`, `teacher_address_content`) VALUES
	(1, 1, '전주시 어딘가'),
	(2, 6, '에란겔시 미라마구 사녹동'),
	(3, 9, '토미아파트 벡터 호'),
	(4, 14, '전주시 완산구');
/*!40000 ALTER TABLE `teacher_address` ENABLE KEYS */;


-- 테이블 stemcrud의 구조를 덤프합니다. teacher_score
CREATE TABLE IF NOT EXISTS `teacher_score` (
  `score_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`score_no`),
  KEY `FK_teacher_score_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_score_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table stemcrud.teacher_score: ~23 rows (대략적)
/*!40000 ALTER TABLE `teacher_score` DISABLE KEYS */;
INSERT INTO `teacher_score` (`score_no`, `teacher_no`, `score`) VALUES
	(1, 1, 70),
	(2, 2, 80),
	(3, 3, 90),
	(4, 4, 40),
	(5, 5, 50),
	(6, 6, 69),
	(7, 7, 89),
	(8, 8, 79),
	(9, 9, 99),
	(10, 10, 99),
	(11, 11, 99),
	(12, 12, 99),
	(13, 13, 99),
	(14, 14, 1),
	(15, 15, 88),
	(16, 16, 88),
	(17, 17, 76),
	(18, 18, 94),
	(19, 19, 26),
	(20, 20, 56),
	(21, 21, 54),
	(22, 22, 88),
	(23, 23, 95);
/*!40000 ALTER TABLE `teacher_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
