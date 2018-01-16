/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-01-16 18:57:06
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
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES ('1', '1', null, '#1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('2', '1', '1', '我的文档', '0', 'adir', '/1/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('3', '1', '1', '我的音乐', '0', 'adir', '/1/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('4', '1', '1', '我的相册', '0', 'adir', '/1/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('5', '1', '1', '我的图书', '0', 'adir', '/1/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('11', '1', '1', 'test1', '0', 'adir', '/1/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('12', '1', '1', 'test2', '0', 'adir', '/1/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('13', '1', '1', 'test3', '0', 'adir', '/1/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('14', '1', '11', 'test11', '0', 'adir', '/1/11/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('15', '1', '12', 'test22', '0', 'adir', '/1/12/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('16', '1', '12', 'test23', '0', 'adir', '/1/12/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('17', '1', '13', 'test33', '0', 'adir', '/1/13/', '2018-01-16', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('19', '1', '1', '新需求.txt', '298', 'txt', '/1/', '2018-01-16', null, '0', '0', '0', 'd:/home/temp_file/ 1516100005650.txt', null, null, '');
INSERT INTO `myfile` VALUES ('20', '1', '1', '架构图.rp', '255580', 'rp', '/1/', '2018-01-16', null, '0', '0', '0', 'd:/home/temp_file/ 1516100030142.rp', null, null, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1', ' 办公室', '', '01', 'fi-social-windows', null, '0', '2014-02-19 01:00:00');
INSERT INTO `organization` VALUES ('3', '信息处', '', '02', 'fi-social-github', null, '1', '2015-10-01 13:10:42');
INSERT INTO `organization` VALUES ('5', '综合计划处', '', '03', 'fi-social-apple', null, '2', '2015-12-06 12:15:30');
INSERT INTO `organization` VALUES ('6', '信息一处', '', '04', 'fi-social-snapchat', '3', '0', '2015-12-06 13:12:18');
INSERT INTO `organization` VALUES ('7', '信息二处', '', '05', 'fi-folder', '3', '0', '2018-01-15 15:48:05');
INSERT INTO `organization` VALUES ('8', '信息三处', '', '06', 'fi-folder', '3', '0', '2018-01-15 15:48:20');
INSERT INTO `organization` VALUES ('9', ' 法规处', '', '07', 'fi-folder', null, '0', '2018-01-15 15:49:08');
INSERT INTO `organization` VALUES ('10', '事业单位人事管理处', '', '08', 'fi-folder', null, '0', '2018-01-15 15:52:02');
INSERT INTO `organization` VALUES ('11', '机关事业单位工资福利处', '', '09', 'fi-folder', null, '0', '2018-01-15 15:52:49');
INSERT INTO `organization` VALUES ('12', '老干部处', '', '10', 'fi-folder', null, '0', '2018-01-15 15:53:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COMMENT='系统日志';

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '0', '0', '1', '2015-12-06 13:14:05');
INSERT INTO `user` VALUES ('13', 'snoopy', 'snoopy', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '3', '2015-10-01 13:12:07');
INSERT INTO `user` VALUES ('14', 'dreamlu', 'dreamlu', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '5', '2015-10-11 23:12:58');
INSERT INTO `user` VALUES ('15', 'test', 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', '25', '18707173376', '1', '0', '6', '2015-12-06 13:13:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('71', '1', '1');
INSERT INTO `user_role` VALUES ('72', '1', '2');
INSERT INTO `user_role` VALUES ('73', '1', '7');
INSERT INTO `user_role` VALUES ('74', '1', '8');
INSERT INTO `user_role` VALUES ('63', '13', '2');
INSERT INTO `user_role` VALUES ('64', '14', '7');
INSERT INTO `user_role` VALUES ('76', '15', '8');
