/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : file_sharing

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-01-23 18:24:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `myfile`
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `size` mediumtext NOT NULL,
  `type` char(20) NOT NULL,
  `path` varchar(500) NOT NULL,
  `createdate` char(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `islock` int(1) DEFAULT '0',
  `isshare` int(1) DEFAULT '0',
  `sharedownload` int(11) DEFAULT '0',
  `location` varchar(220) DEFAULT NULL,
  `shareurl` varchar(100) DEFAULT NULL,
  `md5` char(32) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `myfile_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `myfile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES ('1', '1', null, '#1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('2', '1', '1', '我的文档', '0', 'adir', '/1/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('3', '1', '1', '我的音乐', '0', 'adir', '/1/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('28', '1', '3', '古典乐', '0', 'adir', '/1/3/', '2018-01-18', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('29', '1', '3', '民族乐', '0', 'adir', '/1/3/', '2018-01-18', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('31', '1', '1', 'SHE.mp3', '1956', 'mp3', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516248226813.mp3', null, null, '');
INSERT INTO `myfile` VALUES ('33', '1', '1', '新需求.txt', '0', 'txt', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516251232000.txt', null, null, '');
INSERT INTO `myfile` VALUES ('36', '1', '1', '文件共享系统.rar', '588673', 'rar', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516251310268.rar', null, null, '');
INSERT INTO `myfile` VALUES ('37', '1', '1', '通用测试点及方法.xlsx', '21727', 'xlsx', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516251321603.xlsx', null, null, '');
INSERT INTO `myfile` VALUES ('42', '1', '1', '测试文件.pptx', '31455', 'pptx', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516255177733.pptx', null, null, '');
INSERT INTO `myfile` VALUES ('43', '1', '1', '测试PDF.pdf', '8', 'pdf', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516255209506.pdf', null, null, '');
INSERT INTO `myfile` VALUES ('44', '1', '1', '丑八怪.mp4', '6', 'mp4', '/', '2018-01-18', null, '0', '0', '0', 'd:/home/temp_file/ 1516255350880.mp4', null, null, '');
INSERT INTO `myfile` VALUES ('52', '1', '1', '微信图片_20180109082537.jpg', '534492', 'jpg', '/1/', '2018-01-23', null, '0', '0', '0', 'd:/home/temp_file/ 1516697971198.jpg', null, null, '');
INSERT INTO `myfile` VALUES ('53', '1', '1', '微信图片_20180109082545.jpg', '471704', 'jpg', '/1/', '2018-01-23', null, '0', '0', '0', 'd:/home/temp_file/ 1516698040309.jpg', null, null, '');
INSERT INTO `myfile` VALUES ('54', '1', '1', '文件共享系统.rar', '588673', 'rar', '/1/', '2018-01-23', null, '0', '0', '0', 'd:/home/temp_file/ 1516698040526.rar', null, null, '');
INSERT INTO `myfile` VALUES ('55', '1', '1', '无标题.png', '208004', 'png', '/1/', '2018-01-23', null, '0', '0', '0', 'd:/home/temp_file/ 1516698040661.png', null, null, '');
INSERT INTO `myfile` VALUES ('56', '1', '1', '81ZG2+RbjEL._SX522_.jpg', '41826', 'jpg', '/1/', '2018-01-23', null, '0', '0', '0', 'd:/home/temp_file/ 1516698064288.jpg', null, null, '');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` bigint(19) NOT NULL COMMENT '通知id',
  `content` varchar(255) DEFAULT NULL COMMENT '通知内容',
  `type` varchar(2) DEFAULT NULL COMMENT '01-普通 02-公文',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间\r\n            ',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `notice_involve`
-- ----------------------------
DROP TABLE IF EXISTS `notice_involve`;
CREATE TABLE `notice_involve` (
  `id` bigint(19) NOT NULL COMMENT '主键',
  `notice_id` bigint(19) DEFAULT NULL COMMENT '通知id',
  `user_id` bigint(19) DEFAULT NULL COMMENT '涉及用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知涉及人员';

-- ----------------------------
-- Records of notice_involve
-- ----------------------------

-- ----------------------------
-- Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', ' 办公室', '', '01', 'fi-folder', '13', '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '信息处', '', '02', 'fi-folder', '13', '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '综合计划处', '', '03', 'fi-folder', '13', '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '信息一处', '', '04', 'fi-folder', '3', '0', '2015-12-06 13:12:18');
INSERT INTO `organization` VALUES ('7', '信息二处', '', '05', 'fi-folder', '3', '0', '2018-01-15 15:48:05');
INSERT INTO `organization` VALUES ('8', '信息三处', '', '06', 'fi-folder', '3', '0', '2018-01-15 15:48:20');
INSERT INTO `organization` VALUES ('9', ' 法规处', '', '07', 'fi-folder', '13', '0', '2018-01-15 15:49:08');
INSERT INTO `organization` VALUES ('10', '事业单位人事管理处', '', '08', 'fi-folder', '13', '0', '2018-01-15 15:52:02');
INSERT INTO `organization` VALUES ('11', '机关事业单位工资福利处', '', '09', 'fi-folder', '13', '0', '2018-01-15 15:52:49');
INSERT INTO `organization` VALUES ('12', '老干部处', '', '10', 'fi-folder', '13', '0', '2018-01-15 15:53:03');
INSERT INTO `organization` VALUES ('13', '天津市委组织部', '天津市河西区', '011', 'fi-folder', null, '0', '2018-01-19 14:48:53');

-- ----------------------------
-- Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` bigint(19) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `opened` tinyint(2) NOT NULL DEFAULT '1' COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '权限管理', '', null, '系统管理', 'fi-folder', null, '0', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('11', '资源管理', '/resource/manager', 'ajax', '资源管理', 'fi-database', '1', '1', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('12', '角色管理', '/role/manager', 'ajax', '角色管理', 'fi-torso-business', '1', '2', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('13', '用户管理', '/user/manager', 'ajax', '用户管理', 'fi-torsos-all', '1', '3', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('14', '部门管理', '/organization/manager', 'ajax', '部门管理', 'fi-results-demographics', '1', '4', '0', '1', '0', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('111', '列表', '/resource/treeGrid', 'ajax', '资源列表', 'fi-list', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('112', '添加', '/resource/add', 'ajax', '资源添加', 'fi-page-add', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('113', '编辑', '/resource/edit', 'ajax', '资源编辑', 'fi-page-edit', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('114', '删除', '/resource/delete', 'ajax', '资源删除', 'fi-page-delete', '11', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('121', '列表', '/role/dataGrid', 'ajax', '角色列表', 'fi-list', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('122', '添加', '/role/add', 'ajax', '角色添加', 'fi-page-add', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('123', '编辑', '/role/edit', 'ajax', '角色编辑', 'fi-page-edit', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('124', '删除', '/role/delete', 'ajax', '角色删除', 'fi-page-delete', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('125', '授权', '/role/grant', 'ajax', '角色授权', 'fi-check', '12', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('131', '列表', '/user/dataGrid', 'ajax', '用户列表', 'fi-list', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('132', '添加', '/user/add', 'ajax', '用户添加', 'fi-page-add', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('133', '编辑', '/user/edit', 'ajax', '用户编辑', 'fi-page-edit', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('134', '删除', '/user/delete', 'ajax', '用户删除', 'fi-page-delete', '13', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('141', '列表', '/organization/treeGrid', 'ajax', '用户列表', 'fi-list', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('142', '添加', '/organization/add', 'ajax', '部门添加', 'fi-page-add', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('143', '编辑', '/organization/edit', 'ajax', '部门编辑', 'fi-page-edit', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('144', '删除', '/organization/delete', 'ajax', '部门删除', 'fi-page-delete', '14', '0', '0', '1', '1', '2014-02-19 01:00:00');
INSERT INTO `resource` VALUES ('221', '日志监控', '', null, null, 'fi-folder', null, '3', '0', '0', '0', '2015-12-01 11:44:20');
INSERT INTO `resource` VALUES ('226', '修改密码', '/user/editPwdPage', 'ajax', null, 'fi-unlock', null, '4', '0', '1', '1', '2015-12-07 20:23:06');
INSERT INTO `resource` VALUES ('227', '登录日志', '/sysLog/manager', 'ajax', null, 'fi-info', '221', '0', '0', '1', '0', '2016-09-30 22:10:53');
INSERT INTO `resource` VALUES ('228', 'Druid监控', '/druid', 'iframe', null, 'fi-monitor', '221', '0', '0', '1', '0', '2016-09-30 22:12:50');
INSERT INTO `resource` VALUES ('229', '系统图标', '/icons.html', 'ajax', null, 'fi-photo', '221', '0', '0', '1', '0', '2016-12-24 15:53:47');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', 'de', '0', '技术部经理', '0');
INSERT INTO `role` VALUES ('7', 'pm', '0', '产品部经理', '0');
INSERT INTO `role` VALUES ('8', 'test', '0', '测试账户', '0');

-- ----------------------------
-- Table structure for `role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `resource_id` bigint(19) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`),
  KEY `idx_role_resource_ids` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('409', '1', '1');
INSERT INTO `role_resource` VALUES ('410', '1', '11');
INSERT INTO `role_resource` VALUES ('415', '1', '12');
INSERT INTO `role_resource` VALUES ('421', '1', '13');
INSERT INTO `role_resource` VALUES ('426', '1', '14');
INSERT INTO `role_resource` VALUES ('411', '1', '111');
INSERT INTO `role_resource` VALUES ('412', '1', '112');
INSERT INTO `role_resource` VALUES ('413', '1', '113');
INSERT INTO `role_resource` VALUES ('414', '1', '114');
INSERT INTO `role_resource` VALUES ('416', '1', '121');
INSERT INTO `role_resource` VALUES ('417', '1', '122');
INSERT INTO `role_resource` VALUES ('418', '1', '123');
INSERT INTO `role_resource` VALUES ('419', '1', '124');
INSERT INTO `role_resource` VALUES ('420', '1', '125');
INSERT INTO `role_resource` VALUES ('422', '1', '131');
INSERT INTO `role_resource` VALUES ('423', '1', '132');
INSERT INTO `role_resource` VALUES ('424', '1', '133');
INSERT INTO `role_resource` VALUES ('425', '1', '134');
INSERT INTO `role_resource` VALUES ('427', '1', '141');
INSERT INTO `role_resource` VALUES ('428', '1', '142');
INSERT INTO `role_resource` VALUES ('429', '1', '143');
INSERT INTO `role_resource` VALUES ('430', '1', '144');
INSERT INTO `role_resource` VALUES ('434', '1', '221');
INSERT INTO `role_resource` VALUES ('435', '1', '227');
INSERT INTO `role_resource` VALUES ('436', '1', '228');
INSERT INTO `role_resource` VALUES ('437', '2', '1');
INSERT INTO `role_resource` VALUES ('438', '2', '13');
INSERT INTO `role_resource` VALUES ('439', '2', '131');
INSERT INTO `role_resource` VALUES ('440', '2', '132');
INSERT INTO `role_resource` VALUES ('441', '2', '133');
INSERT INTO `role_resource` VALUES ('445', '2', '221');
INSERT INTO `role_resource` VALUES ('446', '2', '227');
INSERT INTO `role_resource` VALUES ('447', '2', '228');
INSERT INTO `role_resource` VALUES ('158', '3', '1');
INSERT INTO `role_resource` VALUES ('159', '3', '11');
INSERT INTO `role_resource` VALUES ('164', '3', '12');
INSERT INTO `role_resource` VALUES ('170', '3', '13');
INSERT INTO `role_resource` VALUES ('175', '3', '14');
INSERT INTO `role_resource` VALUES ('160', '3', '111');
INSERT INTO `role_resource` VALUES ('161', '3', '112');
INSERT INTO `role_resource` VALUES ('162', '3', '113');
INSERT INTO `role_resource` VALUES ('163', '3', '114');
INSERT INTO `role_resource` VALUES ('165', '3', '121');
INSERT INTO `role_resource` VALUES ('166', '3', '122');
INSERT INTO `role_resource` VALUES ('167', '3', '123');
INSERT INTO `role_resource` VALUES ('168', '3', '124');
INSERT INTO `role_resource` VALUES ('169', '3', '125');
INSERT INTO `role_resource` VALUES ('171', '3', '131');
INSERT INTO `role_resource` VALUES ('172', '3', '132');
INSERT INTO `role_resource` VALUES ('173', '3', '133');
INSERT INTO `role_resource` VALUES ('174', '3', '134');
INSERT INTO `role_resource` VALUES ('176', '3', '141');
INSERT INTO `role_resource` VALUES ('177', '3', '142');
INSERT INTO `role_resource` VALUES ('178', '3', '143');
INSERT INTO `role_resource` VALUES ('179', '3', '144');
INSERT INTO `role_resource` VALUES ('359', '7', '1');
INSERT INTO `role_resource` VALUES ('360', '7', '14');
INSERT INTO `role_resource` VALUES ('361', '7', '141');
INSERT INTO `role_resource` VALUES ('362', '7', '142');
INSERT INTO `role_resource` VALUES ('363', '7', '143');
INSERT INTO `role_resource` VALUES ('367', '7', '221');
INSERT INTO `role_resource` VALUES ('368', '7', '226');
INSERT INTO `role_resource` VALUES ('448', '8', '1');
INSERT INTO `role_resource` VALUES ('449', '8', '11');
INSERT INTO `role_resource` VALUES ('451', '8', '12');
INSERT INTO `role_resource` VALUES ('453', '8', '13');
INSERT INTO `role_resource` VALUES ('455', '8', '14');
INSERT INTO `role_resource` VALUES ('450', '8', '111');
INSERT INTO `role_resource` VALUES ('452', '8', '121');
INSERT INTO `role_resource` VALUES ('454', '8', '131');
INSERT INTO `role_resource` VALUES ('456', '8', '141');
INSERT INTO `role_resource` VALUES ('460', '8', '221');
INSERT INTO `role_resource` VALUES ('461', '8', '227');
INSERT INTO `role_resource` VALUES ('462', '8', '228');
INSERT INTO `role_resource` VALUES ('478', '8', '229');

-- ----------------------------
-- Table structure for `share_disk_info`
-- ----------------------------
DROP TABLE IF EXISTS `share_disk_info`;
CREATE TABLE `share_disk_info` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(19) DEFAULT NULL COMMENT '用户id',
  `totalsize` bigint(19) DEFAULT NULL COMMENT '总磁盘空间',
  `usedsize` bigint(19) DEFAULT NULL COMMENT '已用空间',
  `filenumber` bigint(19) DEFAULT NULL COMMENT '文件数',
  `crete_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `Index_userid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='共享空间磁盘信息';

-- ----------------------------
-- Records of share_disk_info
-- ----------------------------
INSERT INTO `share_disk_info` VALUES ('1', '17', '200', null, null, '2018-01-23 12:07:19', '0');
INSERT INTO `share_disk_info` VALUES ('2', '13', '200', null, null, '2018-01-23 14:40:10', '0');
INSERT INTO `share_disk_info` VALUES ('3', '14', '200', null, null, '2018-01-23 14:40:25', '0');
INSERT INTO `share_disk_info` VALUES ('4', '15', '200', null, null, '2018-01-23 14:40:46', '0');
INSERT INTO `share_disk_info` VALUES ('5', '1', '200', null, null, '2018-01-23 14:41:36', '0');

-- ----------------------------
-- Table structure for `share_to_org`
-- ----------------------------
DROP TABLE IF EXISTS `share_to_org`;
CREATE TABLE `share_to_org` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(19) DEFAULT NULL,
  `org_id` bigint(19) DEFAULT NULL,
  `share_user` bigint(19) DEFAULT NULL,
  `attribute` varchar(2) DEFAULT NULL COMMENT '01-只读 02-读写',
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_orgid` (`org_id`),
  KEY `Index_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='共享给群组\r\n';

-- ----------------------------
-- Records of share_to_org
-- ----------------------------
INSERT INTO `share_to_org` VALUES ('1', '2', '1', '1', '0', '2018-01-22 17:04:10', 'admin', '1');
INSERT INTO `share_to_org` VALUES ('2', '2', '12', '1', '0', '2018-01-22 17:07:30', 'admin', '1');
INSERT INTO `share_to_org` VALUES ('3', '2', '12', '1', '0', '2018-01-22 17:07:58', 'admin', '0');
INSERT INTO `share_to_org` VALUES ('4', '2', '11', '1', '0', '2018-01-22 17:08:05', 'admin', '0');
INSERT INTO `share_to_org` VALUES ('5', '2', '12', '1', '0', '2018-01-22 17:08:52', 'admin', '1');
INSERT INTO `share_to_org` VALUES ('6', '2', '10', '1', '0', '2018-01-22 17:17:24', 'admin', '1');
INSERT INTO `share_to_org` VALUES ('7', '2', '11', '1', '0', '2018-01-23 13:44:07', 'admin', '1');
INSERT INTO `share_to_org` VALUES ('8', '2', '1', '1', '0', '2018-01-23 16:37:11', 'admin', '0');
INSERT INTO `share_to_org` VALUES ('9', '2', '11', '1', '0', '2018-01-23 16:37:53', 'admin', '1');
INSERT INTO `share_to_org` VALUES ('10', '2', '9', '1', '0', '2018-01-23 16:58:37', '超级管理员', '1');

-- ----------------------------
-- Table structure for `share_to_user`
-- ----------------------------
DROP TABLE IF EXISTS `share_to_user`;
CREATE TABLE `share_to_user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(19) DEFAULT NULL,
  `user_id` bigint(19) DEFAULT NULL,
  `share_user` bigint(19) DEFAULT NULL,
  `attribute` varchar(2) DEFAULT NULL COMMENT '01-只读 02-读写',
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_userid` (`user_id`),
  KEY `Index_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='共享给用户';

-- ----------------------------
-- Records of share_to_user
-- ----------------------------
INSERT INTO `share_to_user` VALUES ('1', '2', '13', '1', '0', '2018-01-23 16:38:56', 'admin', '1');
INSERT INTO `share_to_user` VALUES ('2', '2', '14', '1', '0', '2018-01-23 16:56:45', '超级管理员', '1');
INSERT INTO `share_to_user` VALUES ('3', '2', '14', '1', '0', '2018-01-23 18:23:17', '超级管理员', '1');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `opt_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '客户端ip',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('391', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1515479712885&', '0:0:0:0:0:0:0:1', '2018-01-09 14:38:04');
INSERT INTO `sys_log` VALUES ('392', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1515479954348&', '0:0:0:0:0:0:0:1', '2018-01-09 14:39:14');
INSERT INTO `sys_log` VALUES ('393', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 14:43:13');
INSERT INTO `sys_log` VALUES ('394', 'test', 'test', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 14:44:37');
INSERT INTO `sys_log` VALUES ('395', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1515480288154&', '0:0:0:0:0:0:0:1', '2018-01-09 14:44:53');
INSERT INTO `sys_log` VALUES ('396', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.RoleController,[方法]:editPage,[参数]:id=7&_=1515480288155&', '0:0:0:0:0:0:0:1', '2018-01-09 14:45:39');
INSERT INTO `sys_log` VALUES ('397', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-09 14:45:51');
INSERT INTO `sys_log` VALUES ('398', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-09 14:45:55');
INSERT INTO `sys_log` VALUES ('399', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 14:46:30');
INSERT INTO `sys_log` VALUES ('400', 'snoopy', 'snoopy', '[类名]:com.wangzhixuan.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 14:47:38');
INSERT INTO `sys_log` VALUES ('401', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-09 15:01:18');
INSERT INTO `sys_log` VALUES ('402', 'admin', 'admin', '[类名]:com.wangzhixuan.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-09 15:24:21');
INSERT INTO `sys_log` VALUES ('403', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 16:36:02');
INSERT INTO `sys_log` VALUES ('404', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 16:49:49');
INSERT INTO `sys_log` VALUES ('405', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 16:53:55');
INSERT INTO `sys_log` VALUES ('406', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-09 16:58:47');
INSERT INTO `sys_log` VALUES ('407', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515488363949&', '0:0:0:0:0:0:0:1', '2018-01-09 17:07:25');
INSERT INTO `sys_log` VALUES ('408', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:24:35');
INSERT INTO `sys_log` VALUES ('409', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:24:39');
INSERT INTO `sys_log` VALUES ('410', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:24:54');
INSERT INTO `sys_log` VALUES ('411', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:25:01');
INSERT INTO `sys_log` VALUES ('412', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:25:14');
INSERT INTO `sys_log` VALUES ('413', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:28:59');
INSERT INTO `sys_log` VALUES ('414', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:30:20');
INSERT INTO `sys_log` VALUES ('415', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-11 13:36:28');
INSERT INTO `sys_log` VALUES ('416', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1515742192397&', '0:0:0:0:0:0:0:1', '2018-01-12 15:40:22');
INSERT INTO `sys_log` VALUES ('417', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:editPage,[参数]:id=111&_=1515742192398&', '0:0:0:0:0:0:0:1', '2018-01-12 15:41:21');
INSERT INTO `sys_log` VALUES ('418', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1515742192400&', '0:0:0:0:0:0:0:1', '2018-01-12 15:44:06');
INSERT INTO `sys_log` VALUES ('419', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:editPage,[参数]:id=7&_=1515742192401&', '0:0:0:0:0:0:0:1', '2018-01-12 15:44:58');
INSERT INTO `sys_log` VALUES ('420', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2018-01-12 15:45:20');
INSERT INTO `sys_log` VALUES ('421', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1515742192403&', '0:0:0:0:0:0:0:1', '2018-01-12 15:45:53');
INSERT INTO `sys_log` VALUES ('422', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1515742192404&', '0:0:0:0:0:0:0:1', '2018-01-12 15:52:23');
INSERT INTO `sys_log` VALUES ('423', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515742192405&', '0:0:0:0:0:0:0:1', '2018-01-12 15:52:32');
INSERT INTO `sys_log` VALUES ('424', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515742192406&', '0:0:0:0:0:0:0:1', '2018-01-12 15:56:20');
INSERT INTO `sys_log` VALUES ('425', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1515742192407&', '0:0:0:0:0:0:0:1', '2018-01-12 15:59:31');
INSERT INTO `sys_log` VALUES ('426', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:19:29');
INSERT INTO `sys_log` VALUES ('427', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:20:39');
INSERT INTO `sys_log` VALUES ('428', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:22:36');
INSERT INTO `sys_log` VALUES ('429', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:32:34');
INSERT INTO `sys_log` VALUES ('430', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:36:26');
INSERT INTO `sys_log` VALUES ('431', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:37:21');
INSERT INTO `sys_log` VALUES ('432', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 09:38:24');
INSERT INTO `sys_log` VALUES ('433', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 11:46:59');
INSERT INTO `sys_log` VALUES ('434', 'admin', 'admin', '[类名]:com.tf.controller.CommonsController,[方法]:ueditor,[参数]:action=config&noCache=1515998501997&', '0:0:0:0:0:0:0:1', '2018-01-15 14:41:46');
INSERT INTO `sys_log` VALUES ('435', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515998482357&', '0:0:0:0:0:0:0:1', '2018-01-15 14:42:16');
INSERT INTO `sys_log` VALUES ('436', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1515998482358&', '0:0:0:0:0:0:0:1', '2018-01-15 14:42:45');
INSERT INTO `sys_log` VALUES ('437', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1515998482360&', '0:0:0:0:0:0:0:1', '2018-01-15 14:43:01');
INSERT INTO `sys_log` VALUES ('438', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1515998482361&', '0:0:0:0:0:0:0:1', '2018-01-15 14:43:10');
INSERT INTO `sys_log` VALUES ('439', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1515998482362&', '0:0:0:0:0:0:0:1', '2018-01-15 14:44:04');
INSERT INTO `sys_log` VALUES ('440', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-15 14:44:11');
INSERT INTO `sys_log` VALUES ('441', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516002242962&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:18');
INSERT INTO `sys_log` VALUES ('442', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:23');
INSERT INTO `sys_log` VALUES ('443', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516002242963&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:25');
INSERT INTO `sys_log` VALUES ('444', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:37');
INSERT INTO `sys_log` VALUES ('445', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516002242964&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:39');
INSERT INTO `sys_log` VALUES ('446', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:44');
INSERT INTO `sys_log` VALUES ('447', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516002242965&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:46');
INSERT INTO `sys_log` VALUES ('448', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=&sex=0&age=25&userType=1&organizationId=5&roleIds=8&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:50');
INSERT INTO `sys_log` VALUES ('449', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516002242966&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:51');
INSERT INTO `sys_log` VALUES ('450', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2018-01-15 15:44:55');
INSERT INTO `sys_log` VALUES ('451', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:delete,[参数]:id=230&', '0:0:0:0:0:0:0:1', '2018-01-15 15:46:12');
INSERT INTO `sys_log` VALUES ('452', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:delete,[参数]:id=231&', '0:0:0:0:0:0:0:1', '2018-01-15 15:46:18');
INSERT INTO `sys_log` VALUES ('453', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:delete,[参数]:id=222&', '0:0:0:0:0:0:0:1', '2018-01-15 15:46:23');
INSERT INTO `sys_log` VALUES ('454', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:delete,[参数]:id=223&', '0:0:0:0:0:0:0:1', '2018-01-15 15:46:29');
INSERT INTO `sys_log` VALUES ('455', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:delete,[参数]:id=224&', '0:0:0:0:0:0:0:1', '2018-01-15 15:46:34');
INSERT INTO `sys_log` VALUES ('456', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=3&_=1516002353069&', '0:0:0:0:0:0:0:1', '2018-01-15 15:46:57');
INSERT INTO `sys_log` VALUES ('457', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=3&code=02&name=信息处&seq=1&icon=fi-social-github&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:47:10');
INSERT INTO `sys_log` VALUES ('458', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1516002353070&', '0:0:0:0:0:0:0:1', '2018-01-15 15:47:14');
INSERT INTO `sys_log` VALUES ('459', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=6&_=1516002353071&', '0:0:0:0:0:0:0:1', '2018-01-15 15:47:34');
INSERT INTO `sys_log` VALUES ('460', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=6&code=04&name=信息一处&seq=0&icon=fi-social-snapchat&address=&pid=3&', '0:0:0:0:0:0:0:1', '2018-01-15 15:47:39');
INSERT INTO `sys_log` VALUES ('461', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:47:42');
INSERT INTO `sys_log` VALUES ('462', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=05&name=信息二处&seq=0&icon=fi-folder&address=&pid=3&', '0:0:0:0:0:0:0:1', '2018-01-15 15:48:05');
INSERT INTO `sys_log` VALUES ('463', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:48:08');
INSERT INTO `sys_log` VALUES ('464', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=06&name=信息三处&seq=0&icon=fi-folder&address=&pid=3&', '0:0:0:0:0:0:0:1', '2018-01-15 15:48:20');
INSERT INTO `sys_log` VALUES ('465', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:48:22');
INSERT INTO `sys_log` VALUES ('466', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:48:59');
INSERT INTO `sys_log` VALUES ('467', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=07&name=领导办&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:49:08');
INSERT INTO `sys_log` VALUES ('468', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1516002353076&', '0:0:0:0:0:0:0:1', '2018-01-15 15:49:15');
INSERT INTO `sys_log` VALUES ('469', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=纪检处&seq=2&icon=fi-social-apple&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:49:30');
INSERT INTO `sys_log` VALUES ('470', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1516002353081&', '0:0:0:0:0:0:0:1', '2018-01-15 15:51:00');
INSERT INTO `sys_log` VALUES ('471', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=01&name= 办公室&seq=0&icon=fi-social-windows&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:51:21');
INSERT INTO `sys_log` VALUES ('472', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=9&_=1516002353082&', '0:0:0:0:0:0:0:1', '2018-01-15 15:51:23');
INSERT INTO `sys_log` VALUES ('473', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=9&code=07&name= 法规处&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:51:28');
INSERT INTO `sys_log` VALUES ('474', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1516002353083&', '0:0:0:0:0:0:0:1', '2018-01-15 15:51:37');
INSERT INTO `sys_log` VALUES ('475', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=综合计划处&seq=2&icon=fi-social-apple&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:51:39');
INSERT INTO `sys_log` VALUES ('476', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:51:41');
INSERT INTO `sys_log` VALUES ('477', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=06&name=事业单位人事管理处&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:52:02');
INSERT INTO `sys_log` VALUES ('478', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=10&_=1516002353085&', '0:0:0:0:0:0:0:1', '2018-01-15 15:52:06');
INSERT INTO `sys_log` VALUES ('479', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=10&code=08&name=事业单位人事管理处&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:52:12');
INSERT INTO `sys_log` VALUES ('480', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-15 15:52:36');
INSERT INTO `sys_log` VALUES ('481', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:52:40');
INSERT INTO `sys_log` VALUES ('482', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=09&name=机关事业单位工资福利处&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:52:49');
INSERT INTO `sys_log` VALUES ('483', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-15 15:52:57');
INSERT INTO `sys_log` VALUES ('484', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=10&name=老干部处&seq=0&icon=fi-folder&address=&pid=&', '0:0:0:0:0:0:0:1', '2018-01-15 15:53:03');
INSERT INTO `sys_log` VALUES ('485', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-16 16:46:57');
INSERT INTO `sys_log` VALUES ('486', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-16 16:48:30');
INSERT INTO `sys_log` VALUES ('487', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-16 17:01:23');
INSERT INTO `sys_log` VALUES ('488', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-16 17:01:58');
INSERT INTO `sys_log` VALUES ('489', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-16 17:13:36');
INSERT INTO `sys_log` VALUES ('490', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-16 17:23:51');
INSERT INTO `sys_log` VALUES ('491', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:24:14');
INSERT INTO `sys_log` VALUES ('492', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:24:40');
INSERT INTO `sys_log` VALUES ('493', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:25:35');
INSERT INTO `sys_log` VALUES ('494', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:57:33');
INSERT INTO `sys_log` VALUES ('495', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:58:21');
INSERT INTO `sys_log` VALUES ('496', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:58:23');
INSERT INTO `sys_log` VALUES ('497', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:58:28');
INSERT INTO `sys_log` VALUES ('498', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 11:58:32');
INSERT INTO `sys_log` VALUES ('499', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 12:01:52');
INSERT INTO `sys_log` VALUES ('500', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 12:52:38');
INSERT INTO `sys_log` VALUES ('501', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 13:04:31');
INSERT INTO `sys_log` VALUES ('502', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 13:04:34');
INSERT INTO `sys_log` VALUES ('503', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 13:04:38');
INSERT INTO `sys_log` VALUES ('504', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 13:04:45');
INSERT INTO `sys_log` VALUES ('505', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 13:04:48');
INSERT INTO `sys_log` VALUES ('506', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 13:04:51');
INSERT INTO `sys_log` VALUES ('507', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 15:04:29');
INSERT INTO `sys_log` VALUES ('508', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-18 17:08:31');
INSERT INTO `sys_log` VALUES ('509', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-18 17:09:19');
INSERT INTO `sys_log` VALUES ('510', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-18 18:09:59');
INSERT INTO `sys_log` VALUES ('511', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-18 18:10:14');
INSERT INTO `sys_log` VALUES ('512', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-19 11:08:08');
INSERT INTO `sys_log` VALUES ('513', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-19 11:35:53');
INSERT INTO `sys_log` VALUES ('514', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:', null, '2018-01-19 11:36:11');
INSERT INTO `sys_log` VALUES ('515', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-19 11:36:14');
INSERT INTO `sys_log` VALUES ('516', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-19 12:19:17');
INSERT INTO `sys_log` VALUES ('517', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-19 13:46:24');
INSERT INTO `sys_log` VALUES ('518', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-19 13:46:37');
INSERT INTO `sys_log` VALUES ('519', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408018&', '0:0:0:0:0:0:0:1', '2018-01-19 13:46:42');
INSERT INTO `sys_log` VALUES ('520', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408019&', '0:0:0:0:0:0:0:1', '2018-01-19 13:47:54');
INSERT INTO `sys_log` VALUES ('521', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408020&', '0:0:0:0:0:0:0:1', '2018-01-19 13:53:00');
INSERT INTO `sys_log` VALUES ('522', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408021&', '0:0:0:0:0:0:0:1', '2018-01-19 13:53:11');
INSERT INTO `sys_log` VALUES ('523', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408022&', '0:0:0:0:0:0:0:1', '2018-01-19 13:54:58');
INSERT INTO `sys_log` VALUES ('524', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408023&', '0:0:0:0:0:0:0:1', '2018-01-19 14:01:56');
INSERT INTO `sys_log` VALUES ('525', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408024&', '0:0:0:0:0:0:0:1', '2018-01-19 14:02:05');
INSERT INTO `sys_log` VALUES ('526', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:addPage,[参数]:', null, '2018-01-19 14:36:28');
INSERT INTO `sys_log` VALUES ('527', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:addPage,[参数]:', null, '2018-01-19 14:37:13');
INSERT INTO `sys_log` VALUES ('528', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408027&', '0:0:0:0:0:0:0:1', '2018-01-19 14:41:05');
INSERT INTO `sys_log` VALUES ('529', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516340408028&', '0:0:0:0:0:0:0:1', '2018-01-19 14:41:15');
INSERT INTO `sys_log` VALUES ('530', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516344232611&', '0:0:0:0:0:0:0:1', '2018-01-19 14:43:54');
INSERT INTO `sys_log` VALUES ('531', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-19 14:47:58');
INSERT INTO `sys_log` VALUES ('532', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=011&name=天津市委组织部&seq=0&icon=fi-folder&address=天津市河西区&pid=&', '0:0:0:0:0:0:0:1', '2018-01-19 14:48:53');
INSERT INTO `sys_log` VALUES ('533', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1516340408030&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:00');
INSERT INTO `sys_log` VALUES ('534', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=01&name= 办公室&seq=0&icon=fi-social-windows&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:07');
INSERT INTO `sys_log` VALUES ('535', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=12&_=1516340408031&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:11');
INSERT INTO `sys_log` VALUES ('536', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=12&code=10&name=老干部处&seq=0&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:19');
INSERT INTO `sys_log` VALUES ('537', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=9&_=1516340408032&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:25');
INSERT INTO `sys_log` VALUES ('538', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=9&code=07&name= 法规处&seq=0&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:31');
INSERT INTO `sys_log` VALUES ('539', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=10&_=1516340408033&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:33');
INSERT INTO `sys_log` VALUES ('540', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=10&code=08&name=事业单位人事管理处&seq=0&icon=fi-folder&address=&pid=10&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:37');
INSERT INTO `sys_log` VALUES ('541', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=10&_=1516340408034&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:40');
INSERT INTO `sys_log` VALUES ('542', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=10&code=08&name=事业单位人事管理处&seq=0&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:44');
INSERT INTO `sys_log` VALUES ('543', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=11&_=1516340408035&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:47');
INSERT INTO `sys_log` VALUES ('544', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=11&code=09&name=机关事业单位工资福利处&seq=0&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:49');
INSERT INTO `sys_log` VALUES ('545', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=3&_=1516340408036&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:53');
INSERT INTO `sys_log` VALUES ('546', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=3&code=02&name=信息处&seq=1&icon=fi-social-github&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:49:56');
INSERT INTO `sys_log` VALUES ('547', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1516340408037&', '0:0:0:0:0:0:0:1', '2018-01-19 14:50:00');
INSERT INTO `sys_log` VALUES ('548', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=综合计划处&seq=2&icon=fi-social-apple&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:50:04');
INSERT INTO `sys_log` VALUES ('549', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1516340408040&', '0:0:0:0:0:0:0:1', '2018-01-19 14:55:45');
INSERT INTO `sys_log` VALUES ('550', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=01&name= 办公室&seq=0&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:55:50');
INSERT INTO `sys_log` VALUES ('551', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=3&_=1516340408041&', '0:0:0:0:0:0:0:1', '2018-01-19 14:55:53');
INSERT INTO `sys_log` VALUES ('552', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=3&code=02&name=信息处&seq=1&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:55:57');
INSERT INTO `sys_log` VALUES ('553', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=6&_=1516340408042&', '0:0:0:0:0:0:0:1', '2018-01-19 14:56:00');
INSERT INTO `sys_log` VALUES ('554', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=6&code=04&name=信息一处&seq=0&icon=fi-folder&address=&pid=3&', '0:0:0:0:0:0:0:1', '2018-01-19 14:56:02');
INSERT INTO `sys_log` VALUES ('555', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=5&_=1516340408043&', '0:0:0:0:0:0:0:1', '2018-01-19 14:56:04');
INSERT INTO `sys_log` VALUES ('556', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=5&code=03&name=综合计划处&seq=2&icon=fi-folder&address=&pid=13&', '0:0:0:0:0:0:0:1', '2018-01-19 14:56:06');
INSERT INTO `sys_log` VALUES ('557', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516346000310&', '0:0:0:0:0:0:0:1', '2018-01-19 15:13:23');
INSERT INTO `sys_log` VALUES ('558', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516346965423&', '0:0:0:0:0:0:0:1', '2018-01-19 15:30:29');
INSERT INTO `sys_log` VALUES ('559', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1516347432193&', '0:0:0:0:0:0:0:1', '2018-01-19 15:37:14');
INSERT INTO `sys_log` VALUES ('560', 'admin', 'admin', '[类名]:com.tf.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-19 16:00:51');
INSERT INTO `sys_log` VALUES ('561', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-19 16:01:22');
INSERT INTO `sys_log` VALUES ('562', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-19 16:01:27');
INSERT INTO `sys_log` VALUES ('563', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=13&_=1516353370273&', '0:0:0:0:0:0:0:1', '2018-01-19 17:16:23');
INSERT INTO `sys_log` VALUES ('564', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1516353370274&', '0:0:0:0:0:0:0:1', '2018-01-19 17:16:27');
INSERT INTO `sys_log` VALUES ('565', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-22 12:17:40');
INSERT INTO `sys_log` VALUES ('566', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-22 13:40:06');
INSERT INTO `sys_log` VALUES ('567', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-22 15:05:06');
INSERT INTO `sys_log` VALUES ('568', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-22 15:07:18');
INSERT INTO `sys_log` VALUES ('569', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-22 15:39:00');
INSERT INTO `sys_log` VALUES ('570', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1516610934468&', '0:0:0:0:0:0:0:1', '2018-01-22 16:50:06');
INSERT INTO `sys_log` VALUES ('571', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=7&_=1516610934469&', '0:0:0:0:0:0:0:1', '2018-01-22 16:50:13');
INSERT INTO `sys_log` VALUES ('572', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-22 16:50:34');
INSERT INTO `sys_log` VALUES ('573', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-22 17:42:14');
INSERT INTO `sys_log` VALUES ('574', 'test', 'test', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-22 17:43:14');
INSERT INTO `sys_log` VALUES ('575', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-22 17:47:40');
INSERT INTO `sys_log` VALUES ('576', 'test', 'test', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 09:56:44');
INSERT INTO `sys_log` VALUES ('577', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 10:00:31');
INSERT INTO `sys_log` VALUES ('578', 'test', 'test', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 10:05:28');
INSERT INTO `sys_log` VALUES ('579', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516673148840&', '0:0:0:0:0:0:0:1', '2018-01-23 10:15:15');
INSERT INTO `sys_log` VALUES ('580', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516673148841&', '0:0:0:0:0:0:0:1', '2018-01-23 10:21:48');
INSERT INTO `sys_log` VALUES ('581', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516673148842&', '0:0:0:0:0:0:0:1', '2018-01-23 10:22:06');
INSERT INTO `sys_log` VALUES ('582', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516673148843&', '0:0:0:0:0:0:0:1', '2018-01-23 10:22:11');
INSERT INTO `sys_log` VALUES ('583', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516673148844&', '0:0:0:0:0:0:0:1', '2018-01-23 10:22:23');
INSERT INTO `sys_log` VALUES ('584', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516673148845&', '0:0:0:0:0:0:0:1', '2018-01-23 10:22:28');
INSERT INTO `sys_log` VALUES ('585', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516673148846&', '0:0:0:0:0:0:0:1', '2018-01-23 10:22:34');
INSERT INTO `sys_log` VALUES ('586', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=14&loginName=dreamlu&name=dreamlu&password=&sex=0&age=25&userType=1&organizationId=5&roleIds=[7]&phone=18707173376&status=0&', '0:0:0:0:0:0:0:1', '2018-01-23 10:22:51');
INSERT INTO `sys_log` VALUES ('587', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516673148847&', '0:0:0:0:0:0:0:1', '2018-01-23 10:23:19');
INSERT INTO `sys_log` VALUES ('588', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516673148848&', '0:0:0:0:0:0:0:1', '2018-01-23 10:23:22');
INSERT INTO `sys_log` VALUES ('589', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:editPage,[参数]:id=7&_=1516674832340&', '0:0:0:0:0:0:0:1', '2018-01-23 10:34:20');
INSERT INTO `sys_log` VALUES ('590', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=10&_=1516674832343&', '0:0:0:0:0:0:0:1', '2018-01-23 10:34:35');
INSERT INTO `sys_log` VALUES ('591', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=10&_=1516674832344&', '0:0:0:0:0:0:0:1', '2018-01-23 10:34:41');
INSERT INTO `sys_log` VALUES ('592', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516674832345&', '0:0:0:0:0:0:0:1', '2018-01-23 10:34:53');
INSERT INTO `sys_log` VALUES ('593', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-23 10:35:06');
INSERT INTO `sys_log` VALUES ('594', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516674960312&', '0:0:0:0:0:0:0:1', '2018-01-23 10:36:04');
INSERT INTO `sys_log` VALUES ('595', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516674960313&', '0:0:0:0:0:0:0:1', '2018-01-23 10:36:07');
INSERT INTO `sys_log` VALUES ('596', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516675037674&', '0:0:0:0:0:0:0:1', '2018-01-23 10:38:41');
INSERT INTO `sys_log` VALUES ('597', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516675148558&', '0:0:0:0:0:0:0:1', '2018-01-23 10:39:10');
INSERT INTO `sys_log` VALUES ('598', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516675148559&', '0:0:0:0:0:0:0:1', '2018-01-23 10:39:34');
INSERT INTO `sys_log` VALUES ('599', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516675261050&', '0:0:0:0:0:0:0:1', '2018-01-23 10:41:05');
INSERT INTO `sys_log` VALUES ('600', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516675261051&', '0:0:0:0:0:0:0:1', '2018-01-23 10:42:43');
INSERT INTO `sys_log` VALUES ('601', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516675261052&', '0:0:0:0:0:0:0:1', '2018-01-23 10:45:57');
INSERT INTO `sys_log` VALUES ('602', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-23 10:49:22');
INSERT INTO `sys_log` VALUES ('603', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-23 10:50:13');
INSERT INTO `sys_log` VALUES ('604', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516677680772&', '0:0:0:0:0:0:0:1', '2018-01-23 11:21:32');
INSERT INTO `sys_log` VALUES ('605', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516677680773&', '0:0:0:0:0:0:0:1', '2018-01-23 11:21:34');
INSERT INTO `sys_log` VALUES ('606', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516680353656&', '0:0:0:0:0:0:0:1', '2018-01-23 12:06:01');
INSERT INTO `sys_log` VALUES ('607', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=liujun&name=刘军&password=lxgw123456&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-01-23 12:06:49');
INSERT INTO `sys_log` VALUES ('608', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=liujun&name=刘军&password=lxgw123456&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-01-23 12:07:19');
INSERT INTO `sys_log` VALUES ('609', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 12:07:44');
INSERT INTO `sys_log` VALUES ('610', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516680549292&', '0:0:0:0:0:0:0:1', '2018-01-23 12:09:12');
INSERT INTO `sys_log` VALUES ('611', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 12:09:36');
INSERT INTO `sys_log` VALUES ('612', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516680599919&', '0:0:0:0:0:0:0:1', '2018-01-23 13:31:19');
INSERT INTO `sys_log` VALUES ('613', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516680599920&', '0:0:0:0:0:0:0:1', '2018-01-23 13:31:27');
INSERT INTO `sys_log` VALUES ('614', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516680599921&', '0:0:0:0:0:0:0:1', '2018-01-23 13:31:32');
INSERT INTO `sys_log` VALUES ('615', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516687710862&', '0:0:0:0:0:0:0:1', '2018-01-23 14:08:38');
INSERT INTO `sys_log` VALUES ('616', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516687710863&', '0:0:0:0:0:0:0:1', '2018-01-23 14:08:51');
INSERT INTO `sys_log` VALUES ('617', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516687710864&', '0:0:0:0:0:0:0:1', '2018-01-23 14:08:57');
INSERT INTO `sys_log` VALUES ('618', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516687710865&', '0:0:0:0:0:0:0:1', '2018-01-23 14:09:23');
INSERT INTO `sys_log` VALUES ('619', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516687710866&', '0:0:0:0:0:0:0:1', '2018-01-23 14:09:41');
INSERT INTO `sys_log` VALUES ('620', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516687710867&', '0:0:0:0:0:0:0:1', '2018-01-23 14:09:46');
INSERT INTO `sys_log` VALUES ('621', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516687710868&', '0:0:0:0:0:0:0:1', '2018-01-23 14:09:51');
INSERT INTO `sys_log` VALUES ('622', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516687710869&', '0:0:0:0:0:0:0:1', '2018-01-23 14:09:56');
INSERT INTO `sys_log` VALUES ('623', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516687710870&', '0:0:0:0:0:0:0:1', '2018-01-23 14:10:21');
INSERT INTO `sys_log` VALUES ('624', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516687710871&', '0:0:0:0:0:0:0:1', '2018-01-23 14:10:30');
INSERT INTO `sys_log` VALUES ('625', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516688096130&', '0:0:0:0:0:0:0:1', '2018-01-23 14:15:06');
INSERT INTO `sys_log` VALUES ('626', 'liujun', 'liujun', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-23 14:15:33');
INSERT INTO `sys_log` VALUES ('627', 'liujun', 'liujun', '[类名]:com.tf.controller.ResourceController,[方法]:addPage,[参数]:', null, '2018-01-23 14:15:44');
INSERT INTO `sys_log` VALUES ('628', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516688096134&', '0:0:0:0:0:0:0:1', '2018-01-23 14:16:09');
INSERT INTO `sys_log` VALUES ('629', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516688208540&', '0:0:0:0:0:0:0:1', '2018-01-23 14:16:57');
INSERT INTO `sys_log` VALUES ('630', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516688208541&', '0:0:0:0:0:0:0:1', '2018-01-23 14:17:01');
INSERT INTO `sys_log` VALUES ('631', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516688208542&', '0:0:0:0:0:0:0:1', '2018-01-23 14:18:02');
INSERT INTO `sys_log` VALUES ('632', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516688737405&', '0:0:0:0:0:0:0:1', '2018-01-23 14:25:40');
INSERT INTO `sys_log` VALUES ('633', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516688836342&', '0:0:0:0:0:0:0:1', '2018-01-23 14:27:43');
INSERT INTO `sys_log` VALUES ('634', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516688836343&', '0:0:0:0:0:0:0:1', '2018-01-23 14:28:31');
INSERT INTO `sys_log` VALUES ('635', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=100&', '0:0:0:0:0:0:0:1', '2018-01-23 14:28:36');
INSERT INTO `sys_log` VALUES ('636', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516688836344&', '0:0:0:0:0:0:0:1', '2018-01-23 14:29:24');
INSERT INTO `sys_log` VALUES ('637', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516688836345&', '0:0:0:0:0:0:0:1', '2018-01-23 14:29:47');
INSERT INTO `sys_log` VALUES ('638', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516688836346&', '0:0:0:0:0:0:0:1', '2018-01-23 14:30:26');
INSERT INTO `sys_log` VALUES ('639', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=17&loginName=liujun&name=刘军&password=&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=305&', '0:0:0:0:0:0:0:1', '2018-01-23 14:30:30');
INSERT INTO `sys_log` VALUES ('640', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516688836347&', '0:0:0:0:0:0:0:1', '2018-01-23 14:30:34');
INSERT INTO `sys_log` VALUES ('641', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516689283902&', '0:0:0:0:0:0:0:1', '2018-01-23 14:35:02');
INSERT INTO `sys_log` VALUES ('642', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=17&loginName=liujun&name=刘军&password=&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=305&', '0:0:0:0:0:0:0:1', '2018-01-23 14:35:08');
INSERT INTO `sys_log` VALUES ('643', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516689283903&', '0:0:0:0:0:0:0:1', '2018-01-23 14:35:11');
INSERT INTO `sys_log` VALUES ('644', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516689471958&', '0:0:0:0:0:0:0:1', '2018-01-23 14:38:01');
INSERT INTO `sys_log` VALUES ('645', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516689471959&', '0:0:0:0:0:0:0:1', '2018-01-23 14:38:04');
INSERT INTO `sys_log` VALUES ('646', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=17&loginName=liujun&name=刘军&password=&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=303&', '0:0:0:0:0:0:0:1', '2018-01-23 14:38:09');
INSERT INTO `sys_log` VALUES ('647', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516689471960&', '0:0:0:0:0:0:0:1', '2018-01-23 14:38:19');
INSERT INTO `sys_log` VALUES ('648', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516689471961&', '0:0:0:0:0:0:0:1', '2018-01-23 14:38:24');
INSERT INTO `sys_log` VALUES ('649', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=admin&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=111&', '0:0:0:0:0:0:0:1', '2018-01-23 14:38:27');
INSERT INTO `sys_log` VALUES ('650', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516689471962&', '0:0:0:0:0:0:0:1', '2018-01-23 14:40:55');
INSERT INTO `sys_log` VALUES ('651', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516689471963&', '0:0:0:0:0:0:0:1', '2018-01-23 14:40:58');
INSERT INTO `sys_log` VALUES ('652', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516689471964&', '0:0:0:0:0:0:0:1', '2018-01-23 14:41:04');
INSERT INTO `sys_log` VALUES ('653', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516689471965&', '0:0:0:0:0:0:0:1', '2018-01-23 14:41:08');
INSERT INTO `sys_log` VALUES ('654', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=超级管理员&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=&', '0:0:0:0:0:0:0:1', '2018-01-23 14:41:15');
INSERT INTO `sys_log` VALUES ('655', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516689471966&', '0:0:0:0:0:0:0:1', '2018-01-23 14:41:46');
INSERT INTO `sys_log` VALUES ('656', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=超级管理员&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:41:53');
INSERT INTO `sys_log` VALUES ('657', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516689471967&', '0:0:0:0:0:0:0:1', '2018-01-23 14:41:55');
INSERT INTO `sys_log` VALUES ('658', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516689471968&', '0:0:0:0:0:0:0:1', '2018-01-23 14:44:02');
INSERT INTO `sys_log` VALUES ('659', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516689471969&', '0:0:0:0:0:0:0:1', '2018-01-23 14:44:14');
INSERT INTO `sys_log` VALUES ('660', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516689881131&', '0:0:0:0:0:0:0:1', '2018-01-23 14:44:44');
INSERT INTO `sys_log` VALUES ('661', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516689881132&', '0:0:0:0:0:0:0:1', '2018-01-23 14:45:13');
INSERT INTO `sys_log` VALUES ('662', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516689881133&', '0:0:0:0:0:0:0:1', '2018-01-23 14:45:28');
INSERT INTO `sys_log` VALUES ('663', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=13&_=1516689957685&', '0:0:0:0:0:0:0:1', '2018-01-23 14:46:00');
INSERT INTO `sys_log` VALUES ('664', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516689957686&', '0:0:0:0:0:0:0:1', '2018-01-23 14:47:50');
INSERT INTO `sys_log` VALUES ('665', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516690204413&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:07');
INSERT INTO `sys_log` VALUES ('666', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=超级管理员&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:10');
INSERT INTO `sys_log` VALUES ('667', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516690204414&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:12');
INSERT INTO `sys_log` VALUES ('668', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:14');
INSERT INTO `sys_log` VALUES ('669', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516690204415&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:17');
INSERT INTO `sys_log` VALUES ('670', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=17&loginName=liujun&name=刘军&password=&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=303&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:19');
INSERT INTO `sys_log` VALUES ('671', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516690204416&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:23');
INSERT INTO `sys_log` VALUES ('672', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:24');
INSERT INTO `sys_log` VALUES ('673', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516690204417&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:26');
INSERT INTO `sys_log` VALUES ('674', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=14&loginName=dreamlu&name=dreamlu&password=&sex=0&age=25&userType=1&organizationId=5&roleIds=7&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:29');
INSERT INTO `sys_log` VALUES ('675', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=14&_=1516690204418&', '0:0:0:0:0:0:0:1', '2018-01-23 14:50:32');
INSERT INTO `sys_log` VALUES ('676', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516690204419&', '0:0:0:0:0:0:0:1', '2018-01-23 14:51:16');
INSERT INTO `sys_log` VALUES ('677', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516690204420&', '0:0:0:0:0:0:0:1', '2018-01-23 14:51:22');
INSERT INTO `sys_log` VALUES ('678', 'liujun', 'liujun', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=1&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:51:25');
INSERT INTO `sys_log` VALUES ('679', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 14:51:27');
INSERT INTO `sys_log` VALUES ('680', 'test', 'test', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 14:52:00');
INSERT INTO `sys_log` VALUES ('681', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=15&_=1516690333781&', '0:0:0:0:0:0:0:1', '2018-01-23 14:52:15');
INSERT INTO `sys_log` VALUES ('682', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=15&loginName=test&name=test&password=test&sex=0&age=25&userType=1&organizationId=6&roleIds=8&phone=18707173376&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:52:18');
INSERT INTO `sys_log` VALUES ('683', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=17&_=1516690333782&', '0:0:0:0:0:0:0:1', '2018-01-23 14:52:34');
INSERT INTO `sys_log` VALUES ('684', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=17&loginName=liujun&name=刘军&password=&sex=0&age=30&userType=1&organizationId=3&roleIds=1&phone=13888888888&status=0&initStorageSize=200&', '0:0:0:0:0:0:0:1', '2018-01-23 14:52:41');
INSERT INTO `sys_log` VALUES ('685', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516690333783&', '0:0:0:0:0:0:0:1', '2018-01-23 15:04:13');
INSERT INTO `sys_log` VALUES ('686', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 16:44:33');
INSERT INTO `sys_log` VALUES ('687', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 16:48:15');
INSERT INTO `sys_log` VALUES ('688', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 16:48:18');
INSERT INTO `sys_log` VALUES ('689', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 16:48:20');
INSERT INTO `sys_log` VALUES ('690', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 16:48:23');
INSERT INTO `sys_log` VALUES ('691', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 16:49:52');
INSERT INTO `sys_log` VALUES ('692', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516700666248&', '0:0:0:0:0:0:0:1', '2018-01-23 17:44:31');
INSERT INTO `sys_log` VALUES ('693', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:', null, '2018-01-23 17:44:40');
INSERT INTO `sys_log` VALUES ('694', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1516701602183&', '0:0:0:0:0:0:0:1', '2018-01-23 18:00:13');
INSERT INTO `sys_log` VALUES ('695', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1516701602184&', '0:0:0:0:0:0:0:1', '2018-01-23 18:00:19');
INSERT INTO `sys_log` VALUES ('696', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-23 18:02:47');
INSERT INTO `sys_log` VALUES ('697', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 18:19:17');
INSERT INTO `sys_log` VALUES ('698', 'admin', 'admin', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-23 18:19:23');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `login_name` varchar(64) NOT NULL COMMENT '登陆名',
  `name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `salt` varchar(36) DEFAULT NULL COMMENT '密码加密盐',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDx_user_login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '超级管理员', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '0', '0', '1', '2015-12-06 13:14:05');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '6', '2015-12-06 13:13:03');
INSERT INTO `user` VALUES ('17', 'liujun', '刘军', '79ea7bbebf5e9a5d67ac9b6b660fd691', 'e3543168-b5e1-40d7-a3c9-9ab777cdf756', '0', '30', '13888888888', '1', '0', '3', '2018-01-23 12:07:19');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `idx_user_role_ids` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('94', '1', '1');
INSERT INTO `user_role` VALUES ('95', '1', '2');
INSERT INTO `user_role` VALUES ('96', '1', '7');
INSERT INTO `user_role` VALUES ('97', '1', '8');
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('101', '14', '7');
INSERT INTO `user_role` VALUES ('103', '15', '8');
INSERT INTO `user_role` VALUES ('104', '17', '1');
