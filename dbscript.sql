CREATE DATABASE `jupiter` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `db_config` (
  `project_id` int(11) DEFAULT NULL,
  `release_id` varchar(45) DEFAULT NULL,
  `rdbms_name` varchar(45) DEFAULT NULL,
  `environment` varchar(45) DEFAULT NULL,
  `javaJarPath` varchar(100) DEFAULT NULL,
  `jdbcString` varchar(45) DEFAULT NULL,
  `userName` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Unique_key` (`project_id`,`release_id`,`environment`,`config_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `email_notification` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_server` varchar(45) DEFAULT NULL,
  `mail_port` varchar(5) DEFAULT NULL,
  `from_mail` varchar(45) DEFAULT NULL,
  `to_mail` mediumtext,
  `subject` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `env_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `release_id` int(11) DEFAULT NULL,
  `environment_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `project_path` varchar(100) DEFAULT NULL,
  `server_details` varchar(100) DEFAULT NULL,
  `ssh_keys` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `notifications` (
  `category` varchar(20) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description1` varchar(100) DEFAULT NULL,
  `description2` varchar(500) DEFAULT NULL,
  `notifications` varchar(20) DEFAULT NULL,
  `readStatus` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `postexe_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defect_mgmt_tool` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `cookie` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `defect_creation_mode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `project_config` (
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) DEFAULT NULL,
  `release_id` varchar(45) DEFAULT NULL,
  `workspace` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `scm_config` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `api_token` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `repository_url` varchar(100) DEFAULT NULL,
  `scm_tool` varchar(45) DEFAULT NULL,
  `ssh_keys` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `release_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `project_id_UNIQUE` (`project_id`,`release_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `test_execution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_execution_id` char(40) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `release_id` int(11) DEFAULT NULL,
  `environment_name` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `result` longtext,
  `error_details` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_execution_id_UNIQUE` (`test_execution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `test_execution_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_execution_id` char(40) DEFAULT NULL,
  `feature` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
CREATE TABLE `user_details` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `last_login` varchar(45) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT 'jupiter',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



