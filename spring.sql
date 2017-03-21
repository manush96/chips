-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2017 at 06:53 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spring`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` bigint(20) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `article_desc` varchar(255) NOT NULL,
  `article_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `date_added`, `article_desc`, `article_name`) VALUES
(1, '2016-07-03 23:52:13', '++--++--++--++--++--', '1234567890'),
(2, '2016-07-05 14:24:29', 'HDGIHFGSDU', 'agsfadh');

-- --------------------------------------------------------

--
-- Table structure for table `attempts`
--

CREATE TABLE `attempts` (
  `id` int(5) NOT NULL,
  `client_id` int(10) NOT NULL,
  `OTP` int(6) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attempts`
--

INSERT INTO `attempts` (`id`, `client_id`, `OTP`, `timestamp`) VALUES
(1, 3, 501549, '2017-03-21 16:16:20'),
(2, 3, 777759, '2017-03-21 16:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `data_attempt` int(11) NOT NULL DEFAULT '0',
  `otp_attempt` int(11) NOT NULL DEFAULT '1',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`id`, `client_id`, `data_attempt`, `otp_attempt`, `date`) VALUES
(1, 3, 5, 3, '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL,
  `blocked` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(20) DEFAULT NULL,
  `privilege` int(11) NOT NULL DEFAULT '0',
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `blocked`, `contact`, `privilege`, `username`) VALUES
(1, 0, '9426451295', 1, 'vatsal512'),
(2, 1, '9998061964', 0, 'asf'),
(3, 0, '9099017732', 0, 'arise');

-- --------------------------------------------------------

--
-- Table structure for table `db_master`
--

CREATE TABLE `db_master` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_pool_size` varchar(255) DEFAULT NULL,
  `min_pool_size` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `connectionstring` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_master`
--

INSERT INTO `db_master` (`id`, `description`, `max_pool_size`, `min_pool_size`, `name`, `password`, `connectionstring`, `url`, `username`) VALUES
(2, 'MYSQL DATABASE with user="root"', '200', '10', 'MYSQL ROOT', '', '0', 'jdbc:mysql://localhost:3306/spring', 'ROOT'),
(3, 'MYSQL DATABASE with user="abc"', '200', '10', 'MYSQL ABC', 'abc', '0', 'jdbc:mysql://localhost:3306/spring', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `max_attempts`
--

CREATE TABLE `max_attempts` (
  `id` int(11) NOT NULL,
  `max_attempts` int(11) NOT NULL DEFAULT '5',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `max_attempts`
--

INSERT INTO `max_attempts` (`id`, `max_attempts`, `date`) VALUES
(1, 5, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE `query` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `query`
--

INSERT INTO `query` (`id`, `description`, `name`, `query`, `status`) VALUES
(1, 'This is Sql Query.', 'JSON test', 'select * from query', 0),
(2, 'This is query for queryin.', 'SelectId', 'select * from user', 0),
(3, 'This is Query for all data for username.', 'SearchUsername', 'select * from user where username=$', 1),
(4, 'This is report metadata query.', 'Selectreport', 'select * from report', 0),
(5, 'This is all password query.', 'Find All passwords', 'select password,id from user', 0),
(6, 'This is AND query.', 'AND query', 'select username,password from user where id=$ AND username=$', 2),
(16, 'This is oracle query.', 'Test', 'select id,username from user', 0),
(27, 'This query requires user input.', 'UserInput', 'select * from user where id=$', 1),
(28, 'db_master', 'fairQuery', 'select name,url,max_pool_size,min_pool_size from db_master ', 0),
(29, 'paramquery it is', 'paramquery', 'SELECT * from report where report_name=$ and db_id=$', 2),
(30, 'db_master input', 'db input', 'select name,url,max_pool_size,min_pool_size from db_master where username=$', 1),
(31, 'testerrrr', 'tester', 'SELECT * from article where id=$', 1),
(32, 'Budhyo is a freaking noob', 'Budhyo_noob', 'bas bavv thai gyu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `queryin`
--

CREATE TABLE `queryin` (
  `id` int(11) NOT NULL,
  `param_name` varchar(255) DEFAULT NULL,
  `param_type` varchar(255) DEFAULT NULL,
  `query_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queryin`
--

INSERT INTO `queryin` (`id`, `param_name`, `param_type`, `query_id`) VALUES
(3, 'report_name', 'String', 29),
(4, 'db_id', 'Int', 29),
(5, 'username', 'string', 3),
(6, 'id', 'int', 6),
(7, 'username', 'string', 6),
(8, 'id', 'int', 27),
(9, 'username', 'string', 30),
(10, 'id', 'Integer', 31);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `db_id` int(11) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `query_id` int(11) NOT NULL,
  `report_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `db_id`, `display_name`, `query_id`, `report_name`) VALUES
(1, 3, '', 1, 'report1'),
(2, 3, 'query_in_ID', 2, 'queryinreport'),
(3, 2, '', 3, 'All For Usrname'),
(4, 3, '', 4, 'All reports'),
(5, 2, 'Encrypted_Passwords, User_id', 5, 'All Passwords'),
(6, 2, 'User_Username, User_Password', 6, 'AND query report for user'),
(7, 2, 'emp_id,emp_name', 16, 'testing'),
(8, 3, '', 27, 'All for Id value'),
(9, 2, 'DataBase_Name, URL, Max_Pool_Size, Min_Pool_Size', 28, 'All for db_master'),
(10, 3, '', 29, 'param report'),
(11, 2, 'DataBase_Name, URL, Max_Pool_Size, Min_Pool_Size', 30, 'Db master Details for input'),
(12, 2, 'cfgt', 2, 'hgf'),
(13, 2, '', 32, 'noob'),
(14, 2, 'cgjp', 1, 'vhb');

-- --------------------------------------------------------

--
-- Table structure for table `scheduler`
--

CREATE TABLE `scheduler` (
  `id` int(11) NOT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `report_id` varchar(255) DEFAULT NULL,
  `start_time` varchar(100) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `freq_hour` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheduler`
--

INSERT INTO `scheduler` (`id`, `job_name`, `report_id`, `start_time`, `email_id`, `freq_hour`) VALUES
(1, 'JOB task', '1', '23:58', NULL, NULL),
(2, 'All reports', '4', '23:57', 'vatsal512@zapak.com', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `username`, `date_created`, `phone_no`, `role`) VALUES
(1, '40f49a5a5f5d0d8f91e19a8983339cd8', 'vatsal', '2016-07-26 06:00:29', '1234567890', 0),
(2, 'e10adc3949ba59abbe56e057f20f883e', 'vatsal', '2016-07-26 06:01:56', '9876543210', 0),
(3, 'lZpuZ+iovP5ieHQXv9b3pg==', 'vismay', '2016-07-30 20:31:02', '8282828282', 0),
(4, '3gTCvVtIQCScgPOZ1q1AgA==', 'alphaa', '2016-07-31 06:50:41', '1234567890', 0),
(5, 'IwS7olhgNKAr1bYMkUUjYg==', 'bitabita', '2016-08-01 18:18:48', '1234567890', 0),
(6, 'lZpuZ+iovP5ieHQXv9b3pg==', 'Vortexx', '2016-08-02 10:30:09', '9898989898', 0),
(7, 'XutzCg+ydWWs1c8FasRcAA==', 'vortex', '2016-08-10 10:20:57', '1234568789', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `attempts`
--
ALTER TABLE `attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_master`
--
ALTER TABLE `db_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `max_attempts`
--
ALTER TABLE `max_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queryin`
--
ALTER TABLE `queryin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK91B14154EF9A75AC` (`query_id`);

--
-- Indexes for table `scheduler`
--
ALTER TABLE `scheduler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `attempts`
--
ALTER TABLE `attempts`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `db_master`
--
ALTER TABLE `db_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `max_attempts`
--
ALTER TABLE `max_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `query`
--
ALTER TABLE `query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `queryin`
--
ALTER TABLE `queryin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `scheduler`
--
ALTER TABLE `scheduler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
