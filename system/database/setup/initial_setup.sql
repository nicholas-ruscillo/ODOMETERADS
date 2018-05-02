-- credentials and database name should be changes for production instances
-- this following scripts should be run separately from the DB table and DATA scripts as ROOT

create database odometerads default character set utf8 default collate utf8_general_ci;
create user odometerads;
grant all on odometerads.* to odometerads@localhost identified by 'odometerads';



--  tables and database scripts
--  should be run as the user created from the above step

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-05:00";
SET names utf8;

--
-- Table structure for table `users`
--
CREATE TABLE IF NOT EXISTS users (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11)  DEFAULT 0,
  `email` varchar(128)  DEFAULT NULL,
  `password` varchar(128)  DEFAULT NULL,
  `Company` varchar(64) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Address1` varchar(64) DEFAULT NULL,
  `Address2` varchar(64) DEFAULT NULL,
  `City` varchar(64) DEFAULT NULL,
  `Province` varchar(64) DEFAULT NULL,
  `Postal` varchar(16) DEFAULT NULL,
  `AccountType` char(1) DEFAULT,
  `LastLoginDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY ('uid'),
  KEY `onEmail` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

INSERT INTO `users` (`uid`, `rid`, `email`, `password`) VALUES
(1, 1, 'nic@285solutions.com', '6b7650c2bf078561af2489fb5dfbaf47');

--
-- Table structure for table `roles`
--
CREATE TABLE IF NOT EXISTS `roles` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(32)  DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

INSERT INTO roles ('rid','Description') VALUES
(1, 'Admin'),
(2, 'User');

--
-- Table structure for table `images`
--
CREATE TABLE IF NOT EXISTS `images` (
  `imid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT 0,
  `Title` varchar(64) DEFAULT NULL,
  `Description` varchar(512)  DEFAULT NULL,
  `Path` varchar(256)  DEFAULT NULL,
  `URL` varchar(256)  DEFAULT NULL,
  `Paid` char(1) DEFAULT 'N',
  `PaidDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`imid`),
  KEY `on_uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

--
-- Table structure for table `ads`
--
CREATE TABLE IF NOT EXISTS `ads` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `imid` int(11) DEFAULT 0,
  `uid` int(11) DEFAULT 0,
  `Title` varchar(64) DEFAULT NULL,
  `Description` varchar(512)  DEFAULT NULL,
  `Path` varchar(256)  DEFAULT NULL,
  `URL` varchar(256)  DEFAULT NULL,
  `Paid` char(1) DEFAULT 'N',
  `PaidDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `on_imid` (`imid`),
  KEY `on_uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

--
-- Table structure for table `imgpay`
--
CREATE TABLE IF NOT EXISTS `imgpay` (
  `ipid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT 0,
  `imid` int(11) DEFAULT 0,
  `payment` numeric(10,2)  DEFAULT 0.00,
  `chequeno` int(11)  DEFAULT 0,
  `paid` char(1) DEFAULT 'N',
  `PayDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `PayBy` varchar(32) DEFAULT NULL,
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ipid`),
  KEY `on_uid` (`uid`),
  KEY `on_imid` (`imid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;

--
-- Table structure for table `adpay`
--
CREATE TABLE IF NOT EXISTS `adpay` (
  `apid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT 0,
  `adid` int(11) DEFAULT 0,
  `revenue` numeric(10,2)  DEFAULT 0.00,
  `transcode` varchar(256)  DEFAULT NULL,
  `paid` char(1) DEFAULT 'N',
  `PayDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `PayBy` varchar(32) DEFAULT NULL,
  `CreateDt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `CreateBy` varchar(32) DEFAULT NULL,
  `UpdateDt` timestamp DEFAULT '0000-00-00 00:00:00',
  `UpdateBy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`apid`),
  KEY `on_uid` (`uid`),
  KEY `on_imid` (`adid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;
