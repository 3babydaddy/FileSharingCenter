/*
Navicat MySQL Data Transfer

Source Server         : 192.168.44.114
Source Server Version : 50528
Source Host           : 192.168.44.114:3306
Source Database       : file_sharing

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-05-17 10:10:10
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
  `filecreatetype` varchar(10) DEFAULT NULL COMMENT '文件创建类型: 0 处室创建  1 个人创建',
  `size` mediumtext NOT NULL,
  `type` char(20) NOT NULL COMMENT '文件类型',
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
  `del_flag` varchar(1) DEFAULT '0' COMMENT '删除标志',
  `del_date` char(30) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `myfile_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `myfile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfile
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of organization
-- ----------------------------


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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COMMENT='资源';

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
INSERT INTO `resource` VALUES ('230', '回收站', '/myFile/delFileList', 'ajax', null, 'fi-trash', '221', '0', '0', '1', '0', '2018-05-10 08:54:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '0', '超级管理员', '0');
INSERT INTO `role` VALUES ('2', 'org_admin', '0', '处室管理员', '0');
INSERT INTO `role` VALUES ('3', 'user', '0', '普通用户', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('442', '1', '1');
INSERT INTO `role_resource` VALUES ('443', '1', '11');
INSERT INTO `role_resource` VALUES ('448', '1', '12');
INSERT INTO `role_resource` VALUES ('454', '1', '13');
INSERT INTO `role_resource` VALUES ('459', '1', '14');
INSERT INTO `role_resource` VALUES ('444', '1', '111');
INSERT INTO `role_resource` VALUES ('445', '1', '112');
INSERT INTO `role_resource` VALUES ('446', '1', '113');
INSERT INTO `role_resource` VALUES ('447', '1', '114');
INSERT INTO `role_resource` VALUES ('449', '1', '121');
INSERT INTO `role_resource` VALUES ('450', '1', '122');
INSERT INTO `role_resource` VALUES ('451', '1', '123');
INSERT INTO `role_resource` VALUES ('452', '1', '124');
INSERT INTO `role_resource` VALUES ('453', '1', '125');
INSERT INTO `role_resource` VALUES ('455', '1', '131');
INSERT INTO `role_resource` VALUES ('456', '1', '132');
INSERT INTO `role_resource` VALUES ('457', '1', '133');
INSERT INTO `role_resource` VALUES ('458', '1', '134');
INSERT INTO `role_resource` VALUES ('460', '1', '141');
INSERT INTO `role_resource` VALUES ('461', '1', '142');
INSERT INTO `role_resource` VALUES ('462', '1', '143');
INSERT INTO `role_resource` VALUES ('463', '1', '144');
INSERT INTO `role_resource` VALUES ('464', '1', '221');
INSERT INTO `role_resource` VALUES ('467', '1', '226');
INSERT INTO `role_resource` VALUES ('465', '1', '227');
INSERT INTO `role_resource` VALUES ('466', '1', '228');
INSERT INTO `role_resource` VALUES ('468', '2', '13');
INSERT INTO `role_resource` VALUES ('469', '2', '131');
INSERT INTO `role_resource` VALUES ('470', '2', '132');
INSERT INTO `role_resource` VALUES ('471', '2', '133');

-- ----------------------------
-- Table structure for `share_disk_info`
-- ----------------------------
DROP TABLE IF EXISTS `share_disk_info`;
CREATE TABLE `share_disk_info` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(10) DEFAULT NULL COMMENT '用户id',
  `totalsize` bigint(19) DEFAULT NULL COMMENT '总磁盘空间',
  `usedsize` bigint(19) DEFAULT NULL COMMENT '已用空间',
  `filenumber` bigint(19) DEFAULT NULL COMMENT '文件数',
  `crete_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `Index_userid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='共享空间磁盘信息';

-- ----------------------------
-- Records of share_disk_info
-- ----------------------------
INSERT INTO `share_disk_info` VALUES ('1', '1', '300', '0', '1', '2018-01-23 12:07:19', '0');
INSERT INTO `share_disk_info` VALUES ('14', '26', '5120', '0', '6', '2018-01-31 17:20:37', '0');
INSERT INTO `share_disk_info` VALUES ('15', '27', '1024', '3146679', '16', '2018-01-31 17:20:57', '0');
INSERT INTO `share_disk_info` VALUES ('16', '28', '1024', '0', '1', '2018-01-31 17:21:17', '0');
INSERT INTO `share_disk_info` VALUES ('17', '29', '300', null, null, '2018-02-08 16:40:31', '0');
INSERT INTO `share_disk_info` VALUES ('18', '30', '1024', null, null, '2018-02-08 17:23:30', '0');
INSERT INTO `share_disk_info` VALUES ('19', '31', '1024', null, null, '2018-02-08 17:24:08', '0');
INSERT INTO `share_disk_info` VALUES ('20', '32', '1024', null, null, '2018-02-08 17:25:46', '0');
INSERT INTO `share_disk_info` VALUES ('21', '33', '1024', null, null, '2018-02-08 17:26:49', '0');
INSERT INTO `share_disk_info` VALUES ('22', '34', '1024', null, null, '2018-02-08 17:56:05', '0');
INSERT INTO `share_disk_info` VALUES ('23', '35', '1024', null, null, '2018-02-08 17:57:25', '0');
INSERT INTO `share_disk_info` VALUES ('24', '36', '300', '20616076', '1', '2018-02-23 17:39:32', '0');
INSERT INTO `share_disk_info` VALUES ('25', 'O18', '200', '102711584', '17', '2018-02-26 11:39:42', '0');
INSERT INTO `share_disk_info` VALUES ('26', 'O19', '5001', null, null, '2018-02-26 11:40:12', '0');
INSERT INTO `share_disk_info` VALUES ('27', 'O20', '1024', null, null, '2018-02-26 16:53:23', '0');
INSERT INTO `share_disk_info` VALUES ('28', '37', '300', null, null, '2018-02-26 16:55:22', '0');
INSERT INTO `share_disk_info` VALUES ('29', 'O22', '2048', null, null, '2018-02-26 16:57:03', '0');
INSERT INTO `share_disk_info` VALUES ('30', '38', '300', null, null, '2018-03-06 09:59:05', '0');
INSERT INTO `share_disk_info` VALUES ('31', 'O25', '5000', null, null, '2018-03-13 16:08:18', '0');
INSERT INTO `share_disk_info` VALUES ('32', '39', '300', null, null, '2018-03-13 16:08:54', '0');
INSERT INTO `share_disk_info` VALUES ('33', '40', '300', null, null, '2018-03-13 17:05:49', '0');
INSERT INTO `share_disk_info` VALUES ('34', 'O1', '2048', null, null, '2018-03-14 09:13:04', '0');
INSERT INTO `share_disk_info` VALUES ('35', 'O26', '5024', null, null, '2018-03-14 09:57:47', '0');
INSERT INTO `share_disk_info` VALUES ('36', '41', '300', null, null, '2018-05-07 14:50:58', '0');

-- ----------------------------
-- Table structure for `share_to_org`
-- ----------------------------
DROP TABLE IF EXISTS `share_to_org`;
CREATE TABLE `share_to_org` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(19) DEFAULT NULL,
  `org_id` bigint(19) DEFAULT NULL,
  `share_user` bigint(19) DEFAULT NULL,
  `share_type` varchar(10) DEFAULT NULL COMMENT '文件共享类型: 0 处室共享 ，1 个人共享',
  `attribute` varchar(2) DEFAULT NULL COMMENT '01-只读 02-读写',
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_orgid` (`org_id`),
  KEY `Index_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='共享给群组\r\n';

-- ----------------------------
-- Records of share_to_org
-- ----------------------------


-- ----------------------------
-- Table structure for `share_to_user`
-- ----------------------------
DROP TABLE IF EXISTS `share_to_user`;
CREATE TABLE `share_to_user` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(19) DEFAULT NULL,
  `user_id` bigint(19) DEFAULT NULL,
  `share_user` bigint(19) DEFAULT NULL,
  `share_type` varchar(10) DEFAULT NULL COMMENT '文件共享类型: 0 处室共享 ，1 个人共享',
  `attribute` varchar(2) DEFAULT NULL COMMENT '01-只读 02-读写',
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_userid` (`user_id`),
  KEY `Index_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='共享给用户';

-- ----------------------------
-- Records of share_to_user
-- ----------------------------


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
) ENGINE=InnoDB AUTO_INCREMENT=1971 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

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
  `mac` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT '用户登录的ip',
  `user_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户类别',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `organization_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属机构',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `real_pass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDx_user_login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '管理员', '47ec2dd791e31e2ef2076caf64ed9b3d', 'test', '0', '25', '18707173376', null, '', '0', '0', '1', '2015-12-06 13:14:05', '123456');

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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('124', '1', '1');
INSERT INTO `user_role` VALUES ('152', '26', '2');
INSERT INTO `user_role` VALUES ('158', '27', '3');
INSERT INTO `user_role` VALUES ('132', '28', '3');
INSERT INTO `user_role` VALUES ('138', '30', '3');
INSERT INTO `user_role` VALUES ('134', '31', '3');
INSERT INTO `user_role` VALUES ('135', '32', '3');
INSERT INTO `user_role` VALUES ('141', '33', '3');
INSERT INTO `user_role` VALUES ('140', '35', '3');
INSERT INTO `user_role` VALUES ('143', '36', '3');
INSERT INTO `user_role` VALUES ('148', '37', '3');
INSERT INTO `user_role` VALUES ('155', '38', '3');
INSERT INTO `user_role` VALUES ('153', '39', '3');
INSERT INTO `user_role` VALUES ('156', '40', '2');
