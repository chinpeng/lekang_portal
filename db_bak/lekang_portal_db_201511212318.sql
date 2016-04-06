/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : lekang_portal_db

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-11-21 23:18:26
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
  `data` varchar(256) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hierarchy_id` (`hierarchy_id`),
  CONSTRAINT `hierarchy_id` FOREIGN KEY (`hierarchy_id`) REFERENCES `hierarchy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hierarchy
-- ----------------------------
INSERT INTO `hierarchy` VALUES ('0', 'root', '-1', null, null);
INSERT INTO `hierarchy` VALUES ('1', '走进乐康', '0', 'aboutus.jsp', null);
INSERT INTO `hierarchy` VALUES ('2', '乐康简介', '1', 'aboutus.jsp', null);
INSERT INTO `hierarchy` VALUES ('3', '中心环境', '1', 'aboutus.jsp', null);
INSERT INTO `hierarchy` VALUES ('4', '重点设备', '1', 'aboutus.jsp', null);
INSERT INTO `hierarchy` VALUES ('5', '专家团队', '1', 'aboutus.jsp', null);
INSERT INTO `hierarchy` VALUES ('6', '加入乐康', '1', 'aboutus.jsp', null);
INSERT INTO `hierarchy` VALUES ('7', '健康ABC', '0', 'health.jsp', null);
INSERT INTO `hierarchy` VALUES ('8', '体检常识', '7', 'health.jsp', null);
INSERT INTO `hierarchy` VALUES ('9', '体检问答', '7', 'health.jsp', null);
INSERT INTO `hierarchy` VALUES ('10', '健康资讯', '7', 'health.jsp', null);
INSERT INTO `hierarchy` VALUES ('11', '健康课堂', '7', 'health.jsp', null);
INSERT INTO `hierarchy` VALUES ('12', '我要体检', '0', 'tijian.jsp', null);
INSERT INTO `hierarchy` VALUES ('13', '体检套餐', '12', 'tijian.jsp', null);
INSERT INTO `hierarchy` VALUES ('14', '专项筛查', '12', 'tijian.jsp', null);
INSERT INTO `hierarchy` VALUES ('15', '团队预约', '12', 'tijian.jsp', null);
INSERT INTO `hierarchy` VALUES ('16', '个人预约', '12', 'tijian.jsp', null);
INSERT INTO `hierarchy` VALUES ('17', '体检须知', '12', 'tijian.jsp', null);
INSERT INTO `hierarchy` VALUES ('18', '报告查询', '0', 'baogao.jsp', null);
INSERT INTO `hierarchy` VALUES ('19', '团队报告', '18', 'baogao.jsp', null);
INSERT INTO `hierarchy` VALUES ('20', '个人报告', '18', 'baogao.jsp', null);
INSERT INTO `hierarchy` VALUES ('21', '报告解读', '18', 'baogao.jsp', null);
INSERT INTO `hierarchy` VALUES ('22', '满意度调查', '18', 'baogao.jsp', null);
INSERT INTO `hierarchy` VALUES ('23', '健康管理', '0', 'healthmanager.jsp', null);
INSERT INTO `hierarchy` VALUES ('24', '健康测评', '23', 'healthmanager.jsp', null);
INSERT INTO `hierarchy` VALUES ('25', '健康评估', '23', 'healthmanager.jsp', null);
INSERT INTO `hierarchy` VALUES ('26', '健康咨询', '23', 'healthmanager.jsp', null);
INSERT INTO `hierarchy` VALUES ('27', '健康干预', '23', 'healthmanager.jsp', null);
INSERT INTO `hierarchy` VALUES ('28', '预约就医', '23', 'healthmanager.jsp', null);
INSERT INTO `hierarchy` VALUES ('29', '健康护航', '0', 'healthhuhang.jsp', null);
INSERT INTO `hierarchy` VALUES ('30', '运动护航', '29', 'healthhuhang.jsp', null);
INSERT INTO `hierarchy` VALUES ('31', '营养护航', '29', 'healthhuhang.jsp', null);
