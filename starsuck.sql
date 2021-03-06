/*
Navicat MySQL Data Transfer

Source Server         : pickme
Source Server Version : 50723
Source Host           : 47.95.7.10:3306
Source Database       : startsuck

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-08-06 20:50:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agenda`
-- ----------------------------
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `agenda_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  `detail_time` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `agenda_type` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`agenda_id`),
  KEY `agenda_star_id` (`star_id`),
  CONSTRAINT `agenda_star_id` FOREIGN KEY (`star_id`) REFERENCES `star_info` (`star_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agenda
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT '',
  `like_num` int(10) unsigned zerofill DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `parent_comm_id` (`parent_comment_id`),
  KEY `comment_post_id` (`post_id`),
  KEY `comment_user_id` (`user_id`),
  CONSTRAINT `comment_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`) ON UPDATE CASCADE,
  CONSTRAINT `comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `parent_comm_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`comment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  `img` varchar(255) DEFAULT '',
  `title` varchar(255) DEFAULT '',
  `news_url` varchar(255) DEFAULT '',
  `source` varchar(255) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_star_id` (`star_id`),
  CONSTRAINT `news_star_id` FOREIGN KEY (`star_id`) REFERENCES `star_info` (`star_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `offical_account`
-- ----------------------------
DROP TABLE IF EXISTS `offical_account`;
CREATE TABLE `offical_account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL DEFAULT '',
  `star_id` int(11) NOT NULL,
  `account_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`account_id`),
  KEY `account_stra_id` (`star_id`),
  CONSTRAINT `account_stra_id` FOREIGN KEY (`star_id`) REFERENCES `star_info` (`star_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of offical_account
-- ----------------------------

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `like_num` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_user_id` (`user_id`),
  CONSTRAINT `post_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for `production`
-- ----------------------------
DROP TABLE IF EXISTS `production`;
CREATE TABLE `production` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(255) DEFAULT '',
  `pro_type` tinyint(3) unsigned zerofill DEFAULT NULL,
  `star_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_star_id` (`star_id`),
  CONSTRAINT `pro_star_id` FOREIGN KEY (`star_id`) REFERENCES `star_info` (`star_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of production
-- ----------------------------

-- ----------------------------
-- Table structure for `rank_list`
-- ----------------------------
DROP TABLE IF EXISTS `rank_list`;
CREATE TABLE `rank_list` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(255) DEFAULT '',
  `star_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `rank` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `list_star_id` (`star_id`),
  CONSTRAINT `list_star_id` FOREIGN KEY (`star_id`) REFERENCES `star_info` (`star_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rank_list
-- ----------------------------

-- ----------------------------
-- Table structure for `star_info`
-- ----------------------------
DROP TABLE IF EXISTS `star_info`;
CREATE TABLE `star_info` (
  `star_id` int(11) NOT NULL AUTO_INCREMENT,
  `star_name` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `weibost_daily_rank` int(10) unsigned zerofill DEFAULT NULL,
  `asians_daily_rank` int(10) unsigned zerofill DEFAULT NULL,
  `weibostar_power_daily_rank` int(10) unsigned zerofill DEFAULT NULL,
  `weixinstar_right_daily_rank` int(10) unsigned zerofill DEFAULT NULL,
  `weixinstar_power_daily_rank` int(10) unsigned zerofill DEFAULT NULL,
  `average_rank` int(10) unsigned zerofill DEFAULT NULL,
  `average_highest_rank` int(10) unsigned zerofill DEFAULT NULL,
  `baidu_index` int(10) unsigned zerofill DEFAULT NULL,
  `current_weibofans_num` int(10) unsigned zerofill DEFAULT NULL,
  `yesterday_weibofans_num` int(10) unsigned zerofill DEFAULT NULL,
  `current_insfans_num` int(10) unsigned zerofill DEFAULT NULL,
  `yesterday_insfans_num` int(10) unsigned zerofill DEFAULT NULL,
  `tvshow_num` int(10) unsigned zerofill DEFAULT NULL,
  `ads_num` int(10) unsigned zerofill DEFAULT NULL,
  `banner` varchar(255) DEFAULT '',
  PRIMARY KEY (`star_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of star_info
-- ----------------------------
INSERT INTO `star_info` VALUES ('1', '吴亦凡', null, '0000000100', '0000000200', '0000000300', '0000000400', '0000000500', '0000000600', '0000000700', '0000000800', '0000000900', '0000001000', '0000000090', '0000000009', '0000000020', '0000000012', '');
INSERT INTO `star_info` VALUES ('2', '易烊千玺', null, '0000000200', '0000000322', '0000000003', '0000000023', '0000000014', '0000000008', '0000000008', '0000009099', '0000010022', '0000023333', '0000032222', '0000009897', '0000000030', '0000000032', '');
INSERT INTO `star_info` VALUES ('3', '蔡徐坤', null, '0000000200', '0000000333', '0000000005', '0000000022', '0000000003', '0000000008', '0000000009', '0000006756', '0000022133', '0000045333', '0000023456', '0000034523', '0000000021', '0000000010', '');

-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `imgs` varchar(255) DEFAULT '',
  `source` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`state_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `state_account_id` FOREIGN KEY (`account_id`) REFERENCES `offical_account` (`account_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of state
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `uesr_name` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'copy', '12345');
INSERT INTO `user_info` VALUES ('2', 'test', '12344');
INSERT INTO `user_info` VALUES ('3', 'test01', '32232');
INSERT INTO `user_info` VALUES ('4', 'test02', '34221');

-- ----------------------------
-- Table structure for `user_star_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_star_relation`;
CREATE TABLE `user_star_relation` (
  `user_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  `follow_time` date DEFAULT NULL,
  `support_num` int(10) unsigned zerofill DEFAULT NULL,
  KEY `relation_user_id` (`user_id`),
  KEY `relation_star_id` (`star_id`),
  CONSTRAINT `relation_star_id` FOREIGN KEY (`star_id`) REFERENCES `star_info` (`star_id`),
  CONSTRAINT `relation_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_star_relation
-- ----------------------------
INSERT INTO `user_star_relation` VALUES ('1', '1', '2018-08-01', '0000000021');
INSERT INTO `user_star_relation` VALUES ('1', '2', '2018-08-02', '0000000032');
INSERT INTO `user_star_relation` VALUES ('2', '1', '2018-08-01', '0000000012');
INSERT INTO `user_star_relation` VALUES ('3', '3', '2018-06-05', '0000000043');
INSERT INTO `user_star_relation` VALUES ('4', '3', '2018-07-12', '0000000024');
