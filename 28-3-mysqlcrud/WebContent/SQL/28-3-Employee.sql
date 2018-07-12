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


-- 테이블 jjdev2의 구조를 덤프합니다. employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  `employee_age` int(10) NOT NULL,
  PRIMARY KEY (`employee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.employee: ~15 rows (대략적)
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


-- 테이블 jjdev2의 구조를 덤프합니다. employee_address
CREATE TABLE IF NOT EXISTS `employee_address` (
  `employee_address_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) NOT NULL,
  `employee_address_content` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_address_no`),
  KEY `FK_employ_address_employee` (`employee_no`),
  CONSTRAINT `FK_employee_address_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.employee_address: ~4 rows (대략적)
/*!40000 ALTER TABLE `employee_address` DISABLE KEYS */;
INSERT INTO `employee_address` (`employee_address_no`, `employee_no`, `employee_address_content`) VALUES
	(1, 1, '전라북도 전주시 덕진구'),
	(2, 3, '전라북도 전주시 덕진구'),
	(3, 1, '삼천동 1가'),
	(4, 2, '전주시 어디');
/*!40000 ALTER TABLE `employee_address` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. employee_score
CREATE TABLE IF NOT EXISTS `employee_score` (
  `employee_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`employee_score_no`),
  KEY `FK_employee_report_employee` (`employee_no`),
  CONSTRAINT `FK_employee_report_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.employee_score: ~10 rows (대략적)
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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
