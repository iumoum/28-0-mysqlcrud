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

-- 테이블 jjdev2의 구조를 덤프합니다. teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_age` int(10) NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.teacher: ~0 rows (대략적)
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


-- 테이블 jjdev2의 구조를 덤프합니다. teacher_address
CREATE TABLE IF NOT EXISTS `teacher_address` (
  `teacher_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `teacher_address_content` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_address_no`),
  KEY `FK_teacher_address_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_address_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.teacher_address: ~0 rows (대략적)
/*!40000 ALTER TABLE `teacher_address` DISABLE KEYS */;
INSERT INTO `teacher_address` (`teacher_address_no`, `teacher_no`, `teacher_address_content`) VALUES
	(1, 1, '전주시 어딘가'),
	(2, 6, '에란겔시 미라마구 사녹동'),
	(3, 9, '토미아파트 벡터 호'),
	(4, 14, '전주시 완산구');
/*!40000 ALTER TABLE `teacher_address` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. teacher_score
CREATE TABLE IF NOT EXISTS `teacher_score` (
  `score_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`score_no`),
  KEY `FK_teacher_score_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_score_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.teacher_score: ~0 rows (대략적)
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
