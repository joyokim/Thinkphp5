/*
Navicat MySQL Data Transfer

Source Server         : 10.134.158.143
Source Server Version : 50712
Source Host           : 10.134.158.143:3306
Source Database       : ke

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-12-12 15:41:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `admin_id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员账号id',
  `account` varchar(64) NOT NULL COMMENT '登陆账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `creat_time` int(10) unsigned DEFAULT NULL COMMENT '账号创建时间',
  PRIMARY KEY (`admin_id`,`account`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'admin', 'admin', null);

-- ----------------------------
-- Table structure for tp_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group`;
CREATE TABLE `tp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_auth_group
-- ----------------------------
INSERT INTO `tp_auth_group` VALUES ('1', '账号管理员', '1', '1,2,3,6,7,8,9,10,11,');
INSERT INTO `tp_auth_group` VALUES ('2', '课程管理员', '1', '1,3,6,7,8,9,10,');
INSERT INTO `tp_auth_group` VALUES ('3', '课程查看员', '1', '1,6,8,9,10,');
INSERT INTO `tp_auth_group` VALUES ('4', '新加组', '1', '1,6,');
INSERT INTO `tp_auth_group` VALUES ('7', '新加组2', '1', '1,');

-- ----------------------------
-- Table structure for tp_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group_access`;
CREATE TABLE `tp_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_auth_group_access
-- ----------------------------
INSERT INTO `tp_auth_group_access` VALUES ('1', '2');
INSERT INTO `tp_auth_group_access` VALUES ('2', '1');
INSERT INTO `tp_auth_group_access` VALUES ('3', '3');
INSERT INTO `tp_auth_group_access` VALUES ('4', '3');
INSERT INTO `tp_auth_group_access` VALUES ('5', '3');
INSERT INTO `tp_auth_group_access` VALUES ('6', '3');
INSERT INTO `tp_auth_group_access` VALUES ('7', '2');
INSERT INTO `tp_auth_group_access` VALUES ('8', '3');
INSERT INTO `tp_auth_group_access` VALUES ('9', '2');
INSERT INTO `tp_auth_group_access` VALUES ('10', '3');
INSERT INTO `tp_auth_group_access` VALUES ('11', '3');
INSERT INTO `tp_auth_group_access` VALUES ('12', '3');

-- ----------------------------
-- Table structure for tp_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_auth_rule
-- ----------------------------
INSERT INTO `tp_auth_rule` VALUES ('1', 'home-index-index', '课程列表', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('2', 'home-login-creataccount', '创建账号', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('3', 'home-index-creatCourse', '新建课程', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('6', 'home-login-updateAccount', '修改密码', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('7', 'home-index-courseUp', '编辑课程', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('8', 'home-index-signQrcode', '导出二维码', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('9', 'home-index-getUrl', '获取课程链接', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('10', 'home-index-export_file_excel', '导出签到表', '1', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('11', 'home-index-getSignList', '查看签到信息', '1', '1', '');

-- ----------------------------
-- Table structure for tp_course
-- ----------------------------
DROP TABLE IF EXISTS `tp_course`;
CREATE TABLE `tp_course` (
  `course_id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '课程名',
  `creat_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `course_time_start` int(10) unsigned DEFAULT NULL COMMENT '课程开始时间',
  `course_time_end` int(10) unsigned DEFAULT NULL COMMENT '课程结束时间',
  `course_place` varchar(255) DEFAULT NULL COMMENT '主会场',
  `course_speaker` varchar(255) DEFAULT NULL COMMENT '主讲人',
  `course_sign_id` bigint(19) unsigned DEFAULT NULL COMMENT '课程验证号',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_course
-- ----------------------------
INSERT INTO `tp_course` VALUES ('1', '天天向上', '1478161626', '1478131200', null, null, null, '1334');
INSERT INTO `tp_course` VALUES ('2', '新课程1', '1478161626', '1478217600', null, null, null, '2254');
INSERT INTO `tp_course` VALUES ('3', '课程1', '1478229768', '1478131200', null, null, null, '3980');
INSERT INTO `tp_course` VALUES ('4', '课程2', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('5', '课程3', '1478229768', '1478131200', null, null, null, '5807');
INSERT INTO `tp_course` VALUES ('6', '课程4', '1478229768', '1478131200', null, null, null, '6212');
INSERT INTO `tp_course` VALUES ('7', '课程5', '1478229768', '1478131200', null, null, null, '7751');
INSERT INTO `tp_course` VALUES ('8', '课程6', '1478229768', '1478131200', null, null, null, '8834');
INSERT INTO `tp_course` VALUES ('9', '课程7', '1478229768', '1478131200', null, null, null, '9764');
INSERT INTO `tp_course` VALUES ('10', '课程8', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('11', '课程9', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('12', '课程10', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('13', '课程11', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('14', '课程12', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('15', '课程13', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('16', '课程14', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('17', '课程15', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('18', '课程16', '1478229768', '1478131200', '1478131201', null, null, '0');
INSERT INTO `tp_course` VALUES ('19', '课程17', '1478229768', '1478131200', '1478131200', null, null, '0');
INSERT INTO `tp_course` VALUES ('20', '课程18', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('21', '课程19', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('22', '课程20', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('23', '课程21', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('24', '课程22', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('25', '课程23', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('26', '课程24', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('27', '课程25', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('28', '课程26', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('29', '课程27', '1478229768', '1478131200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('30', '11月7号课程', '1478481960', '1478476800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('31', '', '1478481971', '28800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('32', '', '1478481986', '28800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('33', '', '1478481991', '28800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('34', '', '1478482233', '28800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('35', '', '1478482295', '28800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('36', '1', '1478482666', '1478476800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('37', '12', '1478489354', '1478563200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('38', '1111', '1478489500', '1478649600', '1478649700', null, null, '0');
INSERT INTO `tp_course` VALUES ('39', '111', '1478491045', '1478476800', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('40', '5点20课程', '1478510623', '1478539200', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('41', '7号5点35课程', '1478511403', '1478540100', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('42', '7号5点35课程', '1478511498', '1478511300', null, null, null, '0');
INSERT INTO `tp_course` VALUES ('43', '新课程', '1478568241', '1478568000', '1478571600', 'c1', null, '0');
INSERT INTO `tp_course` VALUES ('44', '这是一个新的课程安排你们觉得呢这是一个新的课程安排你们觉得呢这是一个新的课程安排你们觉得呢这是一个新的课程安排你们觉得呢这是一个新的课程安排你们觉得呢这是一个新的课程安排你们觉得呢这是一个新的课程安排你们觉得呢', '1478585358', '1478671500', '1478675100', '这里', null, '0');
INSERT INTO `tp_course` VALUES ('45', '超级课程签到表超级课程签到表超级课程签到表超级课程签到表超级课程签到表超级课程签到表超级课程签到表超级课程签到表超级课程签到表', '1478585471', '1478585400', '1478589000', '超级课程签到表', null, '0');
INSERT INTO `tp_course` VALUES ('46', '新课程1', '1478738991', '1478741100', '1478742600', '9点半', null, '0');
INSERT INTO `tp_course` VALUES ('47', '课程1', '1478826718', '1478826600', '1478827800', '1', null, '0');
INSERT INTO `tp_course` VALUES ('48', '课程23', '1478826745', '1478829600', '1478832300', '22', null, '0');
INSERT INTO `tp_course` VALUES ('49', '课程33', '1478831150', '1478916000', '1478918700', '地点', null, '0');
INSERT INTO `tp_course` VALUES ('50', '课程333', '1478831182', '1478916000', '1478918700', '地点2', null, '0');
INSERT INTO `tp_course` VALUES ('51', '2016-11-15日课程', '1479200080', '1479200100', '1479202200', '这里', null, '0');
INSERT INTO `tp_course` VALUES ('52', '交付任务', '1479283109', '1479369300', '1479371400', '财会资讯办公室', null, '52118');
INSERT INTO `tp_course` VALUES ('53', '不能创建今天之前任务', '1479283253', '1479283200', '1479285000', '财会资讯', null, '53108');
INSERT INTO `tp_course` VALUES ('54', '数码回执', '1479450555', '1479450300', '1479452400', '资讯办公室1', null, '54796');
INSERT INTO `tp_course` VALUES ('55', '新课程', '1479687972', '1479690000', '1479692700', '3c会议室', null, '55726');
INSERT INTO `tp_course` VALUES ('56', '新课程2', '1479688042', '1479690000', '1479692700', '3B会议室', null, '56883');
INSERT INTO `tp_course` VALUES ('57', '新建课程2016-11-21', '1479700816', '1479700500', '1479700800', 'win7', null, '57161');
INSERT INTO `tp_course` VALUES ('58', 'xi', '1479708813', '1479708600', '1479709800', 'xi', null, '58245');
INSERT INTO `tp_course` VALUES ('59', 'xin', '1479710465', '1479710100', '1479711600', 'li', null, null);
INSERT INTO `tp_course` VALUES ('60', '22日上午课程', '1479781714', '1479798900', '1479800400', 'win7', null, '60104');
INSERT INTO `tp_course` VALUES ('61', 'php7', '1480315188', '1480323900', '1480325400', '财会资讯办公室', null, '61363');
INSERT INTO `tp_course` VALUES ('62', 'test', '1480315538', '1480474500', '1480492500', 'test', null, '62173');
INSERT INTO `tp_course` VALUES ('63', '使用模型新增', '1480324260', '1480324200', '1480325400', 'win7', null, '63279');
INSERT INTO `tp_course` VALUES ('64', 'test', '1480570425', '1480586400', '1480597200', '台北虎躍阿基米德', null, '64189');
INSERT INTO `tp_course` VALUES ('65', '12', '1480664378', '1480664100', '1480671300', 'win7', null, '65699');
INSERT INTO `tp_course` VALUES ('66', 'test', '1481188096', '1481364000', '1481374500', 'test', null, '66773');
INSERT INTO `tp_course` VALUES ('67', '今天', '1481333932', '1481333880', '1481385000', '这里', null, '67181');
INSERT INTO `tp_course` VALUES ('68', '今天课程使用模型新增', '1481526811', '1481526780', '1481529600', '在这里', '小西', '68800');

-- ----------------------------
-- Table structure for tp_sign
-- ----------------------------
DROP TABLE IF EXISTS `tp_sign`;
CREATE TABLE `tp_sign` (
  `sign_id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '签到id',
  `course_id` bigint(19) NOT NULL COMMENT '课程id',
  `creat_time` int(10) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '工号',
  `user_name` varchar(64) NOT NULL COMMENT '姓名',
  `user_department` varchar(255) NOT NULL COMMENT '部门',
  `sign_ip` varchar(255) DEFAULT NULL COMMENT '登陆ip',
  `sign_place` varchar(255) DEFAULT NULL COMMENT '签到地点',
  PRIMARY KEY (`sign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_sign
-- ----------------------------
INSERT INTO `tp_sign` VALUES ('1', '64', '1479106620', 'F3233253', '向玉龙', '财会资讯', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('2', '64', '1479106825', 'F3210511', '熊罡', '财会资讯', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('3', '64', '1479107396', '1111111', '1123', '1235', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('4', '64', '1479107445', '111111', '214', '424', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('5', '64', '1479107992', '123111', 'dasd', 'dsaf', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('6', '64', '1479172947', '12312', '1223', '121212', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('7', '64', '1479173142', '12344', '1234', '141423', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('8', '64', '1479173244', '123445', '1234', '141423', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('9', '64', '1479173254', '1234155', '1234', '12344', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('10', '64', '1479173567', '123412545', '123', '1234', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('11', '64', '1479173984', '1234455', '124', '124', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('12', '64', '1479174079', '12223', '1223', '3131', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('13', '64', '1479174097', '1233213', '24124', '24241', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('14', '64', '1479183150', '12345768', '123', '123', '0.0.0.0', null);
INSERT INTO `tp_sign` VALUES ('15', '51', '1479201136', 'F3233253', '向玉龙', '财会资讯', '0.0.0.0', 'D13');
INSERT INTO `tp_sign` VALUES ('16', '53', '1479284089', 'F3233253', '向玉龙', '123', '0.0.0.0', '123');
INSERT INTO `tp_sign` VALUES ('17', '60', '1479782352', 'F3233253', '向玉龙', '财会资讯', '127.0.0.1', 'D13办公室');
INSERT INTO `tp_sign` VALUES ('18', '60', '1479783189', 'F3210511', '雄哥', '财会咨询', '10.134.155.114', 'D13');
INSERT INTO `tp_sign` VALUES ('19', '62', '1480474551', 'F3233253', '向玉龙', '财会资讯', '127.0.0.1', 'Win7');
INSERT INTO `tp_sign` VALUES ('20', '64', '1480588568', 'f123', '123', '123', '10.130.2.251', '');
INSERT INTO `tp_sign` VALUES ('21', '68', '1481528336', 'F3233253', '向玉龙', '财会资讯', '10.130.2.95', 'win7');

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `admin_id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员账号id',
  `account` varchar(64) NOT NULL COMMENT '登陆账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `creat_time` int(10) unsigned DEFAULT NULL COMMENT '账号创建时间',
  `handler` varchar(64) DEFAULT NULL COMMENT '编辑者',
  `update_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('1', 'F3233253', '123456', null, null, null);
INSERT INTO `tp_user` VALUES ('2', 'admin', 'admin', null, null, null);
INSERT INTO `tp_user` VALUES ('3', '123', '123', null, null, null);
INSERT INTO `tp_user` VALUES ('4', 'F123', '123456', null, null, null);
INSERT INTO `tp_user` VALUES ('5', 'F123456', '123', '1479785044', null, null);
INSERT INTO `tp_user` VALUES ('6', 'F1234567', '123', '1479785090', null, null);
INSERT INTO `tp_user` VALUES ('7', 'F123456789', '123', '1479868483', null, null);
INSERT INTO `tp_user` VALUES ('8', 'F11', '123', '1479963326', null, null);
INSERT INTO `tp_user` VALUES ('9', 'hruser', '123456', '1479977182', null, null);
INSERT INTO `tp_user` VALUES ('10', 'F10', '123', '1479981696', null, null);
INSERT INTO `tp_user` VALUES ('11', 'F12', '123', '1479981725', null, null);
INSERT INTO `tp_user` VALUES ('12', 'xinjian', '12345', '1480326643', 'admin', '1480645107');
