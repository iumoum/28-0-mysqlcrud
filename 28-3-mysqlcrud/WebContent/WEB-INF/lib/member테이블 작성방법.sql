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

-- 테이블 jjdev2의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) DEFAULT NULL,
  `member_age` int(11) DEFAULT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.member: ~1 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
	(1, '홍01', 20);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 jjdev2의 구조를 덤프합니다. member_addr
CREATE TABLE IF NOT EXISTS `member_addr` (
  `member_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL DEFAULT '0',
  `member_addr_content` text,
  PRIMARY KEY (`member_addr_no`),
  KEY `FK__member` (`member_no`),
  CONSTRAINT `FK__member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table jjdev2.member_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
