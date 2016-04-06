/*
Navicat MySQL Data Transfer

Source Server         : lekang_portal_db
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : lekang_portal_db

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-03-15 21:11:32
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p><img alt=\"\" src=\"/lekang_portal/upload/images/linux%E5%88%86%E6%9E%90%E5%B7%A5%E5%85%B7.png\" style=\"height:373px; width:568px\" /></p>\r\n', '1452085943439');
INSERT INTO `content` VALUES ('2', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p><img alt=\"\" src=\"/lekang_portal/upload/images/%E7%A3%81%E7%9B%98IO%E7%9A%84%E8%AE%A1%E7%AE%97%E5%85%AC%E5%BC%8F(1).jpg\" style=\"height:192px; width:440px\" /></p>\r\n', '1452086028071');
INSERT INTO `content` VALUES ('3', '1452086134280', '3', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p style=\"text-align:center\">test</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/lekang_portal/upload/images/TCP%E7%8A%B6%E6%80%81%E5%8F%98%E8%BF%81%E5%9B%BE.gif\" style=\"height:632px; width:501px\" /></p>\r\n', '1452086235267');
INSERT INTO `content` VALUES ('4', '1452086244835', '4', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>hello world</p>\r\n', '1452086284537');
INSERT INTO `content` VALUES ('5', '1455171581984', '5', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>asdf asdf asfd asd fas fsa</p>\r\n\r\n<p><img alt=\"\" src=\"/lekang_portal/upload/images/test(1).jpg\" style=\"height:307px; width:550px\" /></p>\r\n', '1455171695385');
INSERT INTO `content` VALUES ('6', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test</p>\r\n', '1455171760860');
INSERT INTO `content` VALUES ('7', '1452086244835', '4', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>重点设备1222</p>\r\n', '1455171834628');
INSERT INTO `content` VALUES ('8', '1452086244835', '4', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><h1><span style=\"font-size:72px\"><span style=\"font-family:verdana,geneva,sans-serif\">重点设备1222</span></span></h1>\r\n', '1455171881418');
INSERT INTO `content` VALUES ('9', '1452086244835', '4', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><span style=\"font-size:72px\">水电费高额阿萨德飞金啊三分大赛地方</span></p>\r\n', '1455171958123');
INSERT INTO `content` VALUES ('10', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test</p>\r\n', '1455548807355');
INSERT INTO `content` VALUES ('11', '1452086134280', '3', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test1</p>\r\n', '1455548873712');
INSERT INTO `content` VALUES ('12', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test</p>\r\n', '1455549075393');
INSERT INTO `content` VALUES ('13', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test</p>\r\n', '1455549100664');
INSERT INTO `content` VALUES ('14', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test</p>\r\n', '1455549920536');
INSERT INTO `content` VALUES ('15', '1452085888697', '2', '<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%><p>test</p>\r\n', '1455550693511');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `pic_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taocan
-- ----------------------------
INSERT INTO `taocan` VALUES ('1', '中老年体检', '按目的', null);
INSERT INTO `taocan` VALUES ('2', '个人基础体检', '按目的', null);
INSERT INTO `taocan` VALUES ('3', '个人高端体检', '按目的', null);
INSERT INTO `taocan` VALUES ('4', '女性体检', '按目的', null);
INSERT INTO `taocan` VALUES ('5', '年轻人体检', '按目的', null);
INSERT INTO `taocan` VALUES ('6', '围绝经期(更年期)检测', '按人群', null);
INSERT INTO `taocan` VALUES ('7', '亚健康体检', '按人群', null);
INSERT INTO `taocan` VALUES ('8', '防癌、癌症危险筛查', '按人群', null);
INSERT INTO `taocan` VALUES ('9', '免疫力套餐', '按人群', null);
INSERT INTO `taocan` VALUES ('10', '心脑血管体检', '按人群', null);
INSERT INTO `taocan` VALUES ('11', '富贵病筛查', '按人群', null);
INSERT INTO `taocan` VALUES ('12', '单位体检', '按团体', null);
INSERT INTO `taocan` VALUES ('13', '团体中层', '按团体', null);
INSERT INTO `taocan` VALUES ('14', '团体高层', '按团体', null);

-- ----------------------------
-- Table structure for taocaninfo
-- ----------------------------
DROP TABLE IF EXISTS `taocaninfo`;
CREATE TABLE `taocaninfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tcid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `count` bigint(10) unsigned zerofill DEFAULT NULL,
  `evaluate` int(1) unsigned zerofill DEFAULT NULL,
  `price` float DEFAULT NULL,
  `availability` varchar(1024) DEFAULT NULL,
  `packageMeaning` varchar(1024) DEFAULT NULL,
  `mainItems` varchar(1024) DEFAULT NULL,
  `diseaseScreening` varchar(1024) DEFAULT NULL,
  `desc_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `tcid` (`tcid`) USING BTREE,
  CONSTRAINT `tcid` FOREIGN KEY (`tcid`) REFERENCES `taocan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taocaninfo
-- ----------------------------
INSERT INTO `taocaninfo` VALUES ('1', '1', '中老年体检B套餐（男）', '0000001290', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病', null);
INSERT INTO `taocaninfo` VALUES ('2', '2', '个人基础普通体检B套餐（男）', '0000001290', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病', '');
INSERT INTO `taocaninfo` VALUES ('3', '3', '个人高端体检B套餐（男）', '0000001290', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病', '');
INSERT INTO `taocaninfo` VALUES ('4', '12', '单位体检B套餐（男）', '0000001290', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病', '');
INSERT INTO `taocaninfo` VALUES ('5', '13', '团体中层体检B套餐（男）', '0000001290', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病', '');
INSERT INTO `taocaninfo` VALUES ('6', '14', '团体高层体检B套餐（男）', '0000001290', '5', '2417', '适用于所有男性', '可对男性身体健康状况做整体评估和疾病筛查。', '一般状况检查,内科,普检,直肠指检,眼压测定等', '肿瘤、心、脑血管、呼吸系统、消化系统、骨及关节疾病', '');

-- ----------------------------
-- Table structure for zhuanjia
-- ----------------------------
DROP TABLE IF EXISTS `zhuanjia`;
CREATE TABLE `zhuanjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `introduction` varchar(3096) NOT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhuanjia
-- ----------------------------
INSERT INTO `zhuanjia` VALUES ('1', '徐军美', '男', '49', '麻醉学专家', '湘雅二医院麻醉教研室主任，主任医师，博士生导师。任中华医学会麻醉学专业委员会委员等学术职务十个。成功解决小儿复杂先心手术的麻醉难题，解决困难气道管理，开展序贯式双肺移植的麻醉、舒适麻醉。主持国家自然科学基金课题2项，发表 SCI论文9篇，国内核心期刊论文140余篇。', null);
INSERT INTO `zhuanjia` VALUES ('2', '易著文', '男', '66', '儿童肾病专家', '儿科原主任，主任医师，博士生导师。从事儿科临床工作40余年，在小儿肾脏病和小儿结核病方面有较深造诣。湖南省教学名师。组织制定我国儿童血液净化标准操作规程，主编第六版《儿科学》、《小儿临床肾脏病学》、《实用小儿结核病学》和《儿科血液净化技术》等著作。', null);
INSERT INTO `zhuanjia` VALUES ('3', '谢光荣', '男', '60', '教授', '【个人简历】湖南医学院本科毕业后于70年代末期攻读我国著名的第一代精神医学专家，原湘雅医学院院长凌敏猷教授的研究生，获硕士学位，继而获医学博士学位。毕业后一直在该校从事医疗、科研和教学工作。1993年起任精神医学教研室和研究室主任。\r\n【专业介绍】 是临床精神医学学术带头人。长期在临床第一线工作，具有很强的实干能力，能全面处理各种精神和心理问题，2001年被评为湖南省十佳精神科医师。多年来担任省内外疑难病例会诊、咨询和高干的诊疗工作，是省内外疑难病例会诊咨询专家。主攻抑郁症，从80年代初期即与美国专家开展协作研究，已积累数千例完整病历资料。并获国家自然科学基金和省科研基金资助。是该校博士研究生导师。多次参加国际学术会议。获各级科技成果奖6项。\r\n【学术成果】先后在国内外发表学术论文60余篇，编写专业书籍8部，发表译文数十篇。', null);
