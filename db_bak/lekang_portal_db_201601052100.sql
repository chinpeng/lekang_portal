/*
Navicat MySQL Data Transfer

Source Server         : lekang_db
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : lekang_portal_db

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-01-06 22:26:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `hierarchy_id` int(11) NOT NULL,
  `data` varchar(10240) DEFAULT '',
  `timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hierarchy_id` (`hierarchy_id`),
  CONSTRAINT `hierarchy_id` FOREIGN KEY (`hierarchy_id`) REFERENCES `hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p><img alt=\"\" src=\"/lekang_portal/upload/images/linux%E5%88%86%E6%9E%90%E5%B7%A5%E5%85%B7.png\" style=\"height:373px; width:568px\" /></p>\r\n', '1452085943439');
INSERT INTO `content` VALUES ('2', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p><img alt=\"\" src=\"/lekang_portal/upload/images/%E7%A3%81%E7%9B%98IO%E7%9A%84%E8%AE%A1%E7%AE%97%E5%85%AC%E5%BC%8F(1).jpg\" style=\"height:192px; width:440px\" /></p>\r\n', '1452086028071');
INSERT INTO `content` VALUES ('3', '1452086134280', '3', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p style=\"text-align:center\">test</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/lekang_portal/upload/images/TCP%E7%8A%B6%E6%80%81%E5%8F%98%E8%BF%81%E5%9B%BE.gif\" style=\"height:632px; width:501px\" /></p>\r\n', '1452086235267');
INSERT INTO `content` VALUES ('4', '1452086244835', '4', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>hello world</p>\r\n', '1452086284537');

-- ----------------------------
-- Table structure for hierarchy
-- ----------------------------
DROP TABLE IF EXISTS `hierarchy`;
CREATE TABLE `hierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `path` varchar(256) DEFAULT NULL,
  `miaoshu` varchar(256) DEFAULT '',
  `type` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hierarchy
-- ----------------------------
INSERT INTO `hierarchy` VALUES ('0', 'root', '-1', null, null, '0000000000');
INSERT INTO `hierarchy` VALUES ('1', '走进乐康', '0', 'aboutus.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('2', '乐康简介', '1', 'aboutus.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('3', '中心环境', '1', 'aboutus.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('4', '重点设备', '1', 'aboutus.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('5', '专家团队', '1', 'aboutus.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('6', '加入乐康', '1', 'aboutus.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('7', '健康ABC', '0', 'health.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('8', '体检常识', '7', 'health.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('9', '体检问答', '7', 'health.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('10', '健康资讯', '7', 'health.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('11', '健康课堂', '7', 'health.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('12', '我要体检', '0', 'tijian.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('13', '体检套餐', '12', 'tijian.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('14', '专项筛查', '12', 'tijian.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('15', '团队预约', '12', 'tijian.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('16', '个人预约', '12', 'tijian.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('17', '体检须知', '12', 'tijian.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('18', '报告查询', '0', 'baogao.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('19', '团队报告', '18', 'baogao.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('20', '个人报告', '18', 'baogao.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('21', '报告解读', '18', 'baogao.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('22', '满意度调查', '18', 'baogao.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('23', '健康管理', '0', 'healthmanager.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('24', '健康测评', '23', 'healthmanager.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('25', '健康评估', '23', 'healthmanager.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('26', '健康咨询', '23', 'healthmanager.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('27', '健康干预', '23', 'healthmanager.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('28', '预约就医', '23', 'healthmanager.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('29', '健康护航', '0', 'healthhuhang.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('30', '运动护航', '29', 'healthhuhang.jsp', null, '0000000001');
INSERT INTO `hierarchy` VALUES ('31', '营养护航', '29', 'healthhuhang.jsp', null, '0000000001');

-- ----------------------------
-- Table structure for taocan
-- ----------------------------
DROP TABLE IF EXISTS `taocan`;
CREATE TABLE `taocan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `count` bigint(10) unsigned zerofill DEFAULT NULL,
  `evaluate` int(1) unsigned zerofill DEFAULT NULL,
  `price` float DEFAULT NULL,
  `availability` varchar(1024) DEFAULT NULL,
  `packageMeaning` varchar(1024) DEFAULT NULL,
  `mainItems` varchar(1024) DEFAULT NULL,
  `diseaseScreening` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taocan
-- ----------------------------
INSERT INTO `taocan` VALUES ('1', '个人基础普通体检B套餐（男）', '0000001289', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病');
