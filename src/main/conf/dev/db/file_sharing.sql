/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : file_sharing

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-04-18 09:16:59
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
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `myfile_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `myfile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfile
-- ----------------------------
INSERT INTO `myfile` VALUES ('1', '1', null, '#1', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('149', '25', null, '#25', '1', '0', 'adir', '/', '', null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('150', '18', null, '#18', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('151', '26', null, '#26', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('152', '27', null, '#27', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('153', '28', null, '#28', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('154', '26', '150', '处室文件1', '0', '0', 'adir', '/150/', '2018-01-31', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('155', '26', '150', '处室文件2', '0', '0', 'adir', '/150/', '2018-01-31', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('156', '26', '150', '处室文件3', '0', '0', 'adir', '/150/', '2018-01-31', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('157', '26', '150', '处室文件4', '0', '0', 'adir', '/150/', '2018-01-31', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('167', '26', '151', 'xinxichu', '1', '0', 'adir', '/151/', '2018-01-31', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('224', '29', null, '#29', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('226', '19', null, '#19', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('227', '20', null, '#20', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('228', '21', null, '#21', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('229', '30', null, '#30', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('230', '31', null, '#31', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('231', '32', null, '#32', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('232', '33', null, '#33', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('233', '34', null, '#34', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('234', '35', null, '#35', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('235', '22', null, '#22', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('236', '23', null, '#23', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('237', '24', null, '#24', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('238', '27', '152', '刘军文件夹\n', '1', '0', 'adir', '/152/', '2018-02-23', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('239', '27', '238', '111.jpg', '1', '0', 'jpg', '/152/', '2018-02-23', null, '0', '0', '0', 'd:/home/FileSharingCenter/1519368957796.jpg', null, null, '');
INSERT INTO `myfile` VALUES ('241', '27', '238', 'test1', '1', '0', 'adir', '/152/238/', '2018-02-23', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('242', '27', '152', '刘军文件夹2', '1', '0', 'adir', '/152/', '2018-02-23', null, '0', '0', '0', null, null, null, '');
INSERT INTO `myfile` VALUES ('244', '36', null, '#36', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('356', '27', '156', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519634692711.zip', null, null, '');
INSERT INTO `myfile` VALUES ('357', '26', '154', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/154/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519635080038.zip', null, null, '');
INSERT INTO `myfile` VALUES ('359', '37', null, '#37', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('360', '26', '150', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519635623549.zip', null, null, '');
INSERT INTO `myfile` VALUES ('361', '26', '150', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519635633228.zip', null, null, '');
INSERT INTO `myfile` VALUES ('362', '26', '150', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519635642233.zip', null, null, '');
INSERT INTO `myfile` VALUES ('363', '26', '150', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519635660968.zip', null, null, '');
INSERT INTO `myfile` VALUES ('364', '26', '150', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519635668622.zip', null, null, '');
INSERT INTO `myfile` VALUES ('367', '27', '156', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519636547566.zip', null, null, '');
INSERT INTO `myfile` VALUES ('368', '27', '156', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637403859.zip', null, null, '');
INSERT INTO `myfile` VALUES ('369', '27', '156', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637467116.zip', null, null, '');
INSERT INTO `myfile` VALUES ('370', '27', '156', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637471786.zip', null, null, '');
INSERT INTO `myfile` VALUES ('371', '27', '156', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637485108.zip', null, null, '');
INSERT INTO `myfile` VALUES ('372', '27', '156', 'apache-tomcat-7.0.82-windows-x86.zip', '0', '10304238', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637488845.zip', null, null, '');
INSERT INTO `myfile` VALUES ('373', '27', '156', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637496895.zip', null, null, '');
INSERT INTO `myfile` VALUES ('374', '27', '156', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637501650.zip', null, null, '');
INSERT INTO `myfile` VALUES ('375', '27', '156', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637505806.zip', null, null, '');
INSERT INTO `myfile` VALUES ('376', '27', '156', 'apache-tomcat-7.0.63.zip', '0', '16252370', 'zip', '/150/156/', '2018-02-26', null, '0', '0', '0', 'C:/filesharing/1519637509218.zip', null, null, '');
INSERT INTO `myfile` VALUES ('377', '36', '244', 'Shiro教程.pdf', '1', '4363706', 'pdf', '/244/', '2018-03-01', null, '0', '0', '0', 'd:/home/FileSharingCenter/1519889180937.pdf', null, null, '');
INSERT INTO `myfile` VALUES ('378', '36', '244', 'apache-tomcat-7.0.63-x64.zip', '1', '16252370', 'zip', '/244/', '2018-03-01', null, '0', '0', '0', 'd:/home/FileSharingCenter/1519889275153.zip', null, null, '');
INSERT INTO `myfile` VALUES ('379', '27', '242', '测试.docx', '1', '11568', 'docx', '/152/', '2018-03-06', null, '0', '0', '0', 'd:/home/FileSharingCenter/1520297540290.docx', null, null, '');
INSERT INTO `myfile` VALUES ('380', '38', null, '#38', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('381', '26', '150', '待办1.txt', '0', '51', 'txt', '/150/', '2018-03-06', null, '0', '0', '0', 'd:/home/FileSharingCenter/1520323799831.txt', null, null, '');
INSERT INTO `myfile` VALUES ('382', '27', '152', '测试.docx', '1', '11568', 'docx', '/152/', '2018-03-06', null, '0', '0', '0', 'd:/home/FileSharingCenter/1520324397177.docx', null, null, '');
INSERT INTO `myfile` VALUES ('383', '27', '152', '测试1411 \n.docx', '1', '0', 'docx', '/152/', '2018-03-06', null, '0', '0', '0', 'd:/home/FileSharingCenter/1520324423763.docx', null, null, '');
INSERT INTO `myfile` VALUES ('385', '27', '242', '《新区“两新”组织信息管理系统》-需求说明书.doc', '1', '644608', 'doc', '/152/', '2018-03-06', null, '0', '0', '0', 'd:/home/FileSharingCenter/1520328410243.doc', null, null, '');
INSERT INTO `myfile` VALUES ('386', '25', null, '#25', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('387', '39', null, '#39', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('388', '40', null, '#40', '1', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('389', '26', null, '#26', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);
INSERT INTO `myfile` VALUES ('390', '1', null, '#1', '0', '0', 'adir', '/', null, null, '0', '0', '0', null, null, null, null);

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
INSERT INTO `organization` VALUES ('1', '天津市委组织部', '天津市河西区', '1', 'fi-folder', null, '0', '2018-01-19 14:48:53');
INSERT INTO `organization` VALUES ('18', '信息管理处', '', '2', 'fi-folder', '1', '0', '2018-01-31 17:19:49');
INSERT INTO `organization` VALUES ('19', '办公室', '', '3', 'fi-folder', '1', '2', '2018-02-08 17:17:17');
INSERT INTO `organization` VALUES ('20', '干部监督处', '', '4', 'fi-folder', '1', '0', '2018-02-08 17:17:45');
INSERT INTO `organization` VALUES ('21', '综合干部处', '', '5', 'fi-folder', '1', '1', '2018-02-08 17:18:07');
INSERT INTO `organization` VALUES ('22', '组织一处', '', '6', 'fi-folder', '1', '0', '2018-02-08 17:59:59');
INSERT INTO `organization` VALUES ('23', '组织二处', '', '7', 'fi-folder', '1', '0', '2018-02-08 18:00:12');
INSERT INTO `organization` VALUES ('24', '组织三处', '', '8', 'fi-folder', '1', '0', '2018-02-08 18:00:29');
INSERT INTO `organization` VALUES ('25', ' 研究室', '', '11', 'fi-folder', '1', '11', '2018-03-13 16:08:18');
INSERT INTO `organization` VALUES ('26', '研究室一室', '', '12', 'fi-folder', '1', '12', '2018-03-14 09:57:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COMMENT='资源';

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='共享空间磁盘信息';

-- ----------------------------
-- Records of share_disk_info
-- ----------------------------
INSERT INTO `share_disk_info` VALUES ('1', '1', '300', null, null, '2018-01-23 12:07:19', '0');
INSERT INTO `share_disk_info` VALUES ('14', '26', '5120', '0', '6', '2018-01-31 17:20:37', '0');
INSERT INTO `share_disk_info` VALUES ('15', '27', '1024', '667744', '9', '2018-01-31 17:20:57', '0');
INSERT INTO `share_disk_info` VALUES ('16', '28', '1024', '0', '1', '2018-01-31 17:21:17', '0');
INSERT INTO `share_disk_info` VALUES ('17', '29', '300', null, null, '2018-02-08 16:40:31', '0');
INSERT INTO `share_disk_info` VALUES ('18', '30', '1024', null, null, '2018-02-08 17:23:30', '0');
INSERT INTO `share_disk_info` VALUES ('19', '31', '1024', null, null, '2018-02-08 17:24:08', '0');
INSERT INTO `share_disk_info` VALUES ('20', '32', '1024', null, null, '2018-02-08 17:25:46', '0');
INSERT INTO `share_disk_info` VALUES ('21', '33', '1024', null, null, '2018-02-08 17:26:49', '0');
INSERT INTO `share_disk_info` VALUES ('22', '34', '1024', null, null, '2018-02-08 17:56:05', '0');
INSERT INTO `share_disk_info` VALUES ('23', '35', '1024', null, null, '2018-02-08 17:57:25', '0');
INSERT INTO `share_disk_info` VALUES ('24', '36', '300', '20616076', '1', '2018-02-23 17:39:32', '0');
INSERT INTO `share_disk_info` VALUES ('25', 'O18', '200', '202148677', '1', '2018-02-26 11:39:42', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='共享给群组\r\n';

-- ----------------------------
-- Records of share_to_org
-- ----------------------------
INSERT INTO `share_to_org` VALUES ('27', '154', '18', '26', '0', '01', '2018-01-31 17:22:47', '信息处', '1');
INSERT INTO `share_to_org` VALUES ('28', '155', '18', '26', '0', '01', '2018-01-31 17:22:56', '信息处', '1');
INSERT INTO `share_to_org` VALUES ('29', '156', '18', '26', '0', '02', '2018-01-31 17:23:37', '信息处', '1');
INSERT INTO `share_to_org` VALUES ('30', '157', '18', '26', '0', '01', '2018-01-31 17:26:39', '信息处', '1');
INSERT INTO `share_to_org` VALUES ('31', '154', '1', '26', '0', '01', '2018-02-23 09:26:55', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('32', null, '23', '27', null, '01', '2018-02-23 17:02:39', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('33', '157', '22', '27', '0', '01', '2018-02-23 17:10:20', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('34', '156', '23', '27', '0', '02', '2018-02-23 17:12:44', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('35', '157', '23', '27', '0', '02', '2018-02-23 17:12:46', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('36', '156', '19', '27', '0', '01', '2018-02-23 17:14:16', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('37', '157', '23', '27', '0', '01', '2018-02-23 17:21:22', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('38', '157', '23', '27', '0', '01', '2018-02-23 17:22:27', '刘军', '0');
INSERT INTO `share_to_org` VALUES ('39', '157', '19', '26', '0', '01', '2018-02-23 17:34:16', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('40', '157', '19', '26', '0', '01', '2018-02-23 17:34:18', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('41', '154', '19', '26', '0', '01', '2018-02-23 17:35:12', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('42', '155', '19', '26', '0', '01', '2018-02-23 17:35:12', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('43', '156', '19', '26', '0', '01', '2018-02-23 17:35:12', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('44', '157', '19', '26', '0', '01', '2018-02-23 17:35:12', '信息处', '0');
INSERT INTO `share_to_org` VALUES ('45', '154', '1', '26', '0', '01', '2018-02-23 17:38:04', '信息处', '1');
INSERT INTO `share_to_org` VALUES ('46', '157', '18', '26', '0', '01', '2018-02-24 11:02:57', '信息处', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='共享给用户';

-- ----------------------------
-- Records of share_to_user
-- ----------------------------
INSERT INTO `share_to_user` VALUES ('9', '157', '27', '26', '0', '02', '2018-01-31 17:27:12', '信息处', '1');
INSERT INTO `share_to_user` VALUES ('10', '167', '27', '26', '1', '01', '2018-01-31 18:13:46', '信息处', '0');
INSERT INTO `share_to_user` VALUES ('11', null, '27', '27', null, '01', '2018-02-23 16:57:46', '刘军', '0');
INSERT INTO `share_to_user` VALUES ('12', null, '27', '27', null, '01', '2018-02-23 16:58:25', '刘军', '0');
INSERT INTO `share_to_user` VALUES ('13', null, '27', '27', null, '01', '2018-02-23 17:01:35', '刘军', '0');
INSERT INTO `share_to_user` VALUES ('14', '157', '28', '27', '0', '01', '2018-02-23 17:13:39', '刘军', '0');
INSERT INTO `share_to_user` VALUES ('15', '156', '30', '27', '0', '02', '2018-02-23 17:14:00', '刘军', '0');
INSERT INTO `share_to_user` VALUES ('16', '157', '30', '27', '0', '02', '2018-02-23 17:14:00', '刘军', '0');
INSERT INTO `share_to_user` VALUES ('17', '238', '36', '27', '1', '01', '2018-02-24 10:52:22', '刘军', '1');
INSERT INTO `share_to_user` VALUES ('18', '238', '36', '27', '1', '02', '2018-02-24 10:53:52', '刘军', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=1640 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('944', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:18:50');
INSERT INTO `sys_log` VALUES ('945', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-01-31 17:19:19');
INSERT INTO `sys_log` VALUES ('946', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=2&name=信息处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-01-31 17:19:49');
INSERT INTO `sys_log` VALUES ('947', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1517390349115&', '0:0:0:0:0:0:0:1', '2018-01-31 17:20:01');
INSERT INTO `sys_log` VALUES ('948', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=xinxichu&name=信息处&password=test&sex=0&age=&userType=1&organizationId=18&roleIds=2&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-01-31 17:20:37');
INSERT INTO `sys_log` VALUES ('949', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1517390349116&', '0:0:0:0:0:0:0:1', '2018-01-31 17:20:40');
INSERT INTO `sys_log` VALUES ('950', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=liujun&name=刘军&password=test&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-01-31 17:20:57');
INSERT INTO `sys_log` VALUES ('951', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1517390349117&', '0:0:0:0:0:0:0:1', '2018-01-31 17:21:01');
INSERT INTO `sys_log` VALUES ('952', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=langchu&name=郎处&password=test&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-01-31 17:21:17');
INSERT INTO `sys_log` VALUES ('953', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:21:31');
INSERT INTO `sys_log` VALUES ('954', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:27:54');
INSERT INTO `sys_log` VALUES ('955', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:30:40');
INSERT INTO `sys_log` VALUES ('956', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:31:58');
INSERT INTO `sys_log` VALUES ('957', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:36:50');
INSERT INTO `sys_log` VALUES ('958', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-31 17:37:52');
INSERT INTO `sys_log` VALUES ('959', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:38:38');
INSERT INTO `sys_log` VALUES ('960', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:40:02');
INSERT INTO `sys_log` VALUES ('961', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:44:29');
INSERT INTO `sys_log` VALUES ('962', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:45:51');
INSERT INTO `sys_log` VALUES ('963', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:51:14');
INSERT INTO `sys_log` VALUES ('964', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 17:57:09');
INSERT INTO `sys_log` VALUES ('965', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:00:07');
INSERT INTO `sys_log` VALUES ('966', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:00:32');
INSERT INTO `sys_log` VALUES ('967', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:00:59');
INSERT INTO `sys_log` VALUES ('968', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:06:47');
INSERT INTO `sys_log` VALUES ('969', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-31 18:10:01');
INSERT INTO `sys_log` VALUES ('970', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:10:20');
INSERT INTO `sys_log` VALUES ('971', 'langchu', 'langchu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-31 18:11:08');
INSERT INTO `sys_log` VALUES ('972', 'langchu', 'langchu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-31 18:12:27');
INSERT INTO `sys_log` VALUES ('973', 'langchu', 'langchu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-31 18:12:35');
INSERT INTO `sys_log` VALUES ('974', 'langchu', 'langchu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-01-31 18:13:01');
INSERT INTO `sys_log` VALUES ('975', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:13:11');
INSERT INTO `sys_log` VALUES ('976', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:13:51');
INSERT INTO `sys_log` VALUES ('977', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:21:58');
INSERT INTO `sys_log` VALUES ('978', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-01-31 18:23:00');
INSERT INTO `sys_log` VALUES ('979', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:32:41');
INSERT INTO `sys_log` VALUES ('980', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:32:45');
INSERT INTO `sys_log` VALUES ('981', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:32:48');
INSERT INTO `sys_log` VALUES ('982', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:32:51');
INSERT INTO `sys_log` VALUES ('983', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:32:54');
INSERT INTO `sys_log` VALUES ('984', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:33:00');
INSERT INTO `sys_log` VALUES ('985', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:33:05');
INSERT INTO `sys_log` VALUES ('986', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:33:10');
INSERT INTO `sys_log` VALUES ('987', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:33:33');
INSERT INTO `sys_log` VALUES ('988', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:33:43');
INSERT INTO `sys_log` VALUES ('989', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 08:35:24');
INSERT INTO `sys_log` VALUES ('990', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 08:52:47');
INSERT INTO `sys_log` VALUES ('991', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 08:53:17');
INSERT INTO `sys_log` VALUES ('992', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 08:59:06');
INSERT INTO `sys_log` VALUES ('993', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 08:59:25');
INSERT INTO `sys_log` VALUES ('994', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:05:39');
INSERT INTO `sys_log` VALUES ('995', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:06:57');
INSERT INTO `sys_log` VALUES ('996', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:12:37');
INSERT INTO `sys_log` VALUES ('997', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:12:40');
INSERT INTO `sys_log` VALUES ('998', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:13:26');
INSERT INTO `sys_log` VALUES ('999', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:14:04');
INSERT INTO `sys_log` VALUES ('1000', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:17:45');
INSERT INTO `sys_log` VALUES ('1001', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:28:32');
INSERT INTO `sys_log` VALUES ('1002', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:28:35');
INSERT INTO `sys_log` VALUES ('1003', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:28:38');
INSERT INTO `sys_log` VALUES ('1004', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:28:40');
INSERT INTO `sys_log` VALUES ('1005', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:28:42');
INSERT INTO `sys_log` VALUES ('1006', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-01 09:29:42');
INSERT INTO `sys_log` VALUES ('1007', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 09:32:10');
INSERT INTO `sys_log` VALUES ('1008', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 09:33:16');
INSERT INTO `sys_log` VALUES ('1009', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 09:34:42');
INSERT INTO `sys_log` VALUES ('1010', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 09:35:42');
INSERT INTO `sys_log` VALUES ('1011', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 09:36:05');
INSERT INTO `sys_log` VALUES ('1012', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 10:51:31');
INSERT INTO `sys_log` VALUES ('1013', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 10:52:19');
INSERT INTO `sys_log` VALUES ('1014', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 11:03:19');
INSERT INTO `sys_log` VALUES ('1015', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 11:03:33');
INSERT INTO `sys_log` VALUES ('1016', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 11:04:20');
INSERT INTO `sys_log` VALUES ('1017', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 13:32:44');
INSERT INTO `sys_log` VALUES ('1018', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-01 13:33:12');
INSERT INTO `sys_log` VALUES ('1019', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-05 08:49:27');
INSERT INTO `sys_log` VALUES ('1020', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-05 14:08:58');
INSERT INTO `sys_log` VALUES ('1021', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-05 14:15:49');
INSERT INTO `sys_log` VALUES ('1022', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-05 14:56:50');
INSERT INTO `sys_log` VALUES ('1023', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:35:52');
INSERT INTO `sys_log` VALUES ('1024', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:35:55');
INSERT INTO `sys_log` VALUES ('1025', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:35:57');
INSERT INTO `sys_log` VALUES ('1026', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:35:59');
INSERT INTO `sys_log` VALUES ('1027', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:01');
INSERT INTO `sys_log` VALUES ('1028', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:03');
INSERT INTO `sys_log` VALUES ('1029', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:05');
INSERT INTO `sys_log` VALUES ('1030', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:06');
INSERT INTO `sys_log` VALUES ('1031', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:09');
INSERT INTO `sys_log` VALUES ('1032', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:11');
INSERT INTO `sys_log` VALUES ('1033', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 08:36:13');
INSERT INTO `sys_log` VALUES ('1034', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 08:46:47');
INSERT INTO `sys_log` VALUES ('1035', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 08:57:57');
INSERT INTO `sys_log` VALUES ('1036', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 10:46:18');
INSERT INTO `sys_log` VALUES ('1037', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 10:48:22');
INSERT INTO `sys_log` VALUES ('1038', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:00:07');
INSERT INTO `sys_log` VALUES ('1039', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:01:18');
INSERT INTO `sys_log` VALUES ('1040', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:05:18');
INSERT INTO `sys_log` VALUES ('1041', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:07:59');
INSERT INTO `sys_log` VALUES ('1042', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:loginPost,[参数]:_csrf=b8558c9d-2c5c-4039-9401-bd0538cad8a3&username=admin&password=test&rememberMe=1&', '0:0:0:0:0:0:0:1', '2018-02-08 11:28:56');
INSERT INTO `sys_log` VALUES ('1043', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:loginPost,[参数]:_csrf=b8558c9d-2c5c-4039-9401-bd0538cad8a3&username=admin&password=test&rememberMe=1&', '0:0:0:0:0:0:0:1', '2018-02-08 11:31:39');
INSERT INTO `sys_log` VALUES ('1044', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:loginPost,[参数]:_csrf=b8558c9d-2c5c-4039-9401-bd0538cad8a3&username=admin&password=test&rememberMe=1&', '0:0:0:0:0:0:0:1', '2018-02-08 11:34:41');
INSERT INTO `sys_log` VALUES ('1045', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:null', '0:0:0:0:0:0:0:1', '2018-02-08 11:37:51');
INSERT INTO `sys_log` VALUES ('1046', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:38:04');
INSERT INTO `sys_log` VALUES ('1047', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:40:37');
INSERT INTO `sys_log` VALUES ('1048', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:40:57');
INSERT INTO `sys_log` VALUES ('1049', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 11:52:33');
INSERT INTO `sys_log` VALUES ('1050', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 13:31:34');
INSERT INTO `sys_log` VALUES ('1051', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 13:38:05');
INSERT INTO `sys_log` VALUES ('1052', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 13:38:36');
INSERT INTO `sys_log` VALUES ('1053', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 13:39:47');
INSERT INTO `sys_log` VALUES ('1054', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 14:00:08');
INSERT INTO `sys_log` VALUES ('1055', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 14:00:46');
INSERT INTO `sys_log` VALUES ('1056', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 14:01:03');
INSERT INTO `sys_log` VALUES ('1057', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 14:04:08');
INSERT INTO `sys_log` VALUES ('1058', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:09:31');
INSERT INTO `sys_log` VALUES ('1059', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:09:37');
INSERT INTO `sys_log` VALUES ('1060', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:09:39');
INSERT INTO `sys_log` VALUES ('1061', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:09:46');
INSERT INTO `sys_log` VALUES ('1062', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:09:49');
INSERT INTO `sys_log` VALUES ('1063', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:10');
INSERT INTO `sys_log` VALUES ('1064', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:12');
INSERT INTO `sys_log` VALUES ('1065', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:13');
INSERT INTO `sys_log` VALUES ('1066', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:15');
INSERT INTO `sys_log` VALUES ('1067', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:17');
INSERT INTO `sys_log` VALUES ('1068', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:21');
INSERT INTO `sys_log` VALUES ('1069', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:27');
INSERT INTO `sys_log` VALUES ('1070', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:12:29');
INSERT INTO `sys_log` VALUES ('1071', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:29:53');
INSERT INTO `sys_log` VALUES ('1072', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:30:40');
INSERT INTO `sys_log` VALUES ('1073', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:36:12');
INSERT INTO `sys_log` VALUES ('1074', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:43:35');
INSERT INTO `sys_log` VALUES ('1075', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:43:37');
INSERT INTO `sys_log` VALUES ('1076', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 15:43:39');
INSERT INTO `sys_log` VALUES ('1077', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:44:01');
INSERT INTO `sys_log` VALUES ('1078', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1518075850712&', '0:0:0:0:0:0:0:1', '2018-02-08 15:44:19');
INSERT INTO `sys_log` VALUES ('1079', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grant,[参数]:id=2&resourceIds=13,131,132,133,226&', '0:0:0:0:0:0:0:1', '2018-02-08 15:44:39');
INSERT INTO `sys_log` VALUES ('1080', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:44:42');
INSERT INTO `sys_log` VALUES ('1081', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2018-02-08 15:44:54');
INSERT INTO `sys_log` VALUES ('1082', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:45:12');
INSERT INTO `sys_log` VALUES ('1083', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:46:39');
INSERT INTO `sys_log` VALUES ('1084', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:55:01');
INSERT INTO `sys_log` VALUES ('1085', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=1&_=1518076577179&', '0:0:0:0:0:0:0:1', '2018-02-08 15:56:33');
INSERT INTO `sys_log` VALUES ('1086', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grant,[参数]:id=1&resourceIds=1,11,111,112,113,114,12,121,122,123,124,125,13,131,132,133,134,14,141,142,143,144,221,227,228,226&', '0:0:0:0:0:0:0:1', '2018-02-08 15:56:37');
INSERT INTO `sys_log` VALUES ('1087', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grantPage,[参数]:id=2&_=1518076577180&', '0:0:0:0:0:0:0:1', '2018-02-08 15:56:41');
INSERT INTO `sys_log` VALUES ('1088', 'admin', 'admin', '[类名]:com.tf.controller.RoleController,[方法]:grant,[参数]:id=2&resourceIds=13,131,132,133&', '0:0:0:0:0:0:0:1', '2018-02-08 15:56:47');
INSERT INTO `sys_log` VALUES ('1089', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:56:52');
INSERT INTO `sys_log` VALUES ('1090', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2018-02-08 15:57:00');
INSERT INTO `sys_log` VALUES ('1091', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editUserPwd,[参数]:oldPwd=test&pwd=test&rePwd=test&', '0:0:0:0:0:0:0:1', '2018-02-08 15:57:03');
INSERT INTO `sys_log` VALUES ('1092', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:57:15');
INSERT INTO `sys_log` VALUES ('1093', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 15:57:27');
INSERT INTO `sys_log` VALUES ('1094', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:04:15');
INSERT INTO `sys_log` VALUES ('1095', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:04:18');
INSERT INTO `sys_log` VALUES ('1096', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:04:47');
INSERT INTO `sys_log` VALUES ('1097', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:05:40');
INSERT INTO `sys_log` VALUES ('1098', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:17:10');
INSERT INTO `sys_log` VALUES ('1099', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:17:35');
INSERT INTO `sys_log` VALUES ('1100', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:17:54');
INSERT INTO `sys_log` VALUES ('1101', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:18:04');
INSERT INTO `sys_log` VALUES ('1102', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518079191546&', '0:0:0:0:0:0:0:1', '2018-02-08 16:40:01');
INSERT INTO `sys_log` VALUES ('1103', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=testuser&name=testusert&password=tsetuser&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 16:40:31');
INSERT INTO `sys_log` VALUES ('1104', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:40:54');
INSERT INTO `sys_log` VALUES ('1105', 'testuser', 'testuser', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:41:22');
INSERT INTO `sys_log` VALUES ('1106', 'testuser', 'testuser', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:42:22');
INSERT INTO `sys_log` VALUES ('1107', 'testuser', 'testuser', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:42:59');
INSERT INTO `sys_log` VALUES ('1108', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=29&_=1518079743646&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:01');
INSERT INTO `sys_log` VALUES ('1109', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=29&loginName=testuser&name=testusert&password=test&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:06');
INSERT INTO `sys_log` VALUES ('1110', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=29&_=1518079743647&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:27');
INSERT INTO `sys_log` VALUES ('1111', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=29&loginName=testuser&name=testusert&password=test&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:31');
INSERT INTO `sys_log` VALUES ('1112', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPwdPage,[参数]:', null, '2018-02-08 16:50:39');
INSERT INTO `sys_log` VALUES ('1113', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editUserPwd,[参数]:oldPwd=test&pwd=test&rePwd=test&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:43');
INSERT INTO `sys_log` VALUES ('1114', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1518079743649&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:54');
INSERT INTO `sys_log` VALUES ('1115', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=超级管理员&password=test&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 16:50:59');
INSERT INTO `sys_log` VALUES ('1116', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:51:37');
INSERT INTO `sys_log` VALUES ('1117', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 16:54:40');
INSERT INTO `sys_log` VALUES ('1118', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:07:16');
INSERT INTO `sys_log` VALUES ('1119', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:07:54');
INSERT INTO `sys_log` VALUES ('1120', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:08:55');
INSERT INTO `sys_log` VALUES ('1121', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:09:42');
INSERT INTO `sys_log` VALUES ('1122', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:11:07');
INSERT INTO `sys_log` VALUES ('1123', 'langchu', 'langchu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 17:11:22');
INSERT INTO `sys_log` VALUES ('1124', 'langchu', 'langchu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 17:11:25');
INSERT INTO `sys_log` VALUES ('1125', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:11:33');
INSERT INTO `sys_log` VALUES ('1126', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 17:11:51');
INSERT INTO `sys_log` VALUES ('1127', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 17:11:53');
INSERT INTO `sys_log` VALUES ('1128', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:13:28');
INSERT INTO `sys_log` VALUES ('1129', 'langchu', 'langchu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:13:44');
INSERT INTO `sys_log` VALUES ('1130', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-08 17:13:56');
INSERT INTO `sys_log` VALUES ('1131', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:14:08');
INSERT INTO `sys_log` VALUES ('1132', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:16:24');
INSERT INTO `sys_log` VALUES ('1133', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 17:16:45');
INSERT INTO `sys_log` VALUES ('1134', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1518081387174&', '0:0:0:0:0:0:0:1', '2018-02-08 17:16:56');
INSERT INTO `sys_log` VALUES ('1135', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=1&name=天津市委组织部&seq=0&icon=fi-folder&address=天津市河西区&pid=&', '0:0:0:0:0:0:0:1', '2018-02-08 17:17:00');
INSERT INTO `sys_log` VALUES ('1136', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 17:17:03');
INSERT INTO `sys_log` VALUES ('1137', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=3&name=办公室&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 17:17:17');
INSERT INTO `sys_log` VALUES ('1138', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 17:17:32');
INSERT INTO `sys_log` VALUES ('1139', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=4&name=干部监督处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 17:17:45');
INSERT INTO `sys_log` VALUES ('1140', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 17:17:54');
INSERT INTO `sys_log` VALUES ('1141', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=5&name=综合干部处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 17:18:07');
INSERT INTO `sys_log` VALUES ('1142', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:delete,[参数]:id=29&', '0:0:0:0:0:0:0:1', '2018-02-08 17:19:47');
INSERT INTO `sys_log` VALUES ('1143', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1518081387179&', '0:0:0:0:0:0:0:1', '2018-02-08 17:20:52');
INSERT INTO `sys_log` VALUES ('1144', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=管理员&password=&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 17:21:03');
INSERT INTO `sys_log` VALUES ('1145', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=26&_=1518081387180&', '0:0:0:0:0:0:0:1', '2018-02-08 17:21:23');
INSERT INTO `sys_log` VALUES ('1146', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=26&loginName=xinxichu&name=信息处&password=123456&sex=0&age=0&userType=1&organizationId=18&roleIds=2&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 17:21:29');
INSERT INTO `sys_log` VALUES ('1147', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1518081387181&', '0:0:0:0:0:0:0:1', '2018-02-08 17:21:32');
INSERT INTO `sys_log` VALUES ('1148', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=1&loginName=admin&name=管理员&password=123456&sex=0&age=25&userType=0&organizationId=1&roleIds=1&phone=18707173376&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 17:21:36');
INSERT INTO `sys_log` VALUES ('1149', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=27&_=1518081387182&', '0:0:0:0:0:0:0:1', '2018-02-08 17:22:21');
INSERT INTO `sys_log` VALUES ('1150', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=27&loginName=liujun&name=刘军&password=123456&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 17:22:27');
INSERT INTO `sys_log` VALUES ('1151', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=28&_=1518081387183&', '0:0:0:0:0:0:0:1', '2018-02-08 17:22:29');
INSERT INTO `sys_log` VALUES ('1152', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=28&loginName=langchu&name=郎处&password=123456&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 17:22:34');
INSERT INTO `sys_log` VALUES ('1153', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=28&_=1518081387184&', '0:0:0:0:0:0:0:1', '2018-02-08 17:22:42');
INSERT INTO `sys_log` VALUES ('1154', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=28&loginName=langliang&name=郎亮&password=123456&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=300&', '0:0:0:0:0:0:0:1', '2018-02-08 17:22:54');
INSERT INTO `sys_log` VALUES ('1155', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518081387185&', '0:0:0:0:0:0:0:1', '2018-02-08 17:23:00');
INSERT INTO `sys_log` VALUES ('1156', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=luojiaqi&name=罗加奇&password=lxgw123456&sex=1&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:23:30');
INSERT INTO `sys_log` VALUES ('1157', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518081387186&', '0:0:0:0:0:0:0:1', '2018-02-08 17:23:40');
INSERT INTO `sys_log` VALUES ('1158', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=diguanqiang&name=狄冠强&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:08');
INSERT INTO `sys_log` VALUES ('1159', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=26&_=1518081387187&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:14');
INSERT INTO `sys_log` VALUES ('1160', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=26&loginName=xinxichu&name=信息处&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=2&phone=&status=0&initStorageSize=5120&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:34');
INSERT INTO `sys_log` VALUES ('1161', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=27&_=1518081387188&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:36');
INSERT INTO `sys_log` VALUES ('1162', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=27&loginName=liujun&name=刘军&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:39');
INSERT INTO `sys_log` VALUES ('1163', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=28&_=1518081387189&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:43');
INSERT INTO `sys_log` VALUES ('1164', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=28&loginName=langliang&name=郎亮&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:46');
INSERT INTO `sys_log` VALUES ('1165', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518081387190&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:48');
INSERT INTO `sys_log` VALUES ('1166', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=30&loginName=luojiaqi&name=罗加奇&password=&sex=1&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:50');
INSERT INTO `sys_log` VALUES ('1167', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=31&_=1518081387191&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:53');
INSERT INTO `sys_log` VALUES ('1168', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=31&loginName=diguanqiang&name=狄冠强&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:24:54');
INSERT INTO `sys_log` VALUES ('1169', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518081387192&', '0:0:0:0:0:0:0:1', '2018-02-08 17:25:25');
INSERT INTO `sys_log` VALUES ('1170', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=zhangaiyu&name=张艾宇&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:25:46');
INSERT INTO `sys_log` VALUES ('1171', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518081387193&', '0:0:0:0:0:0:0:1', '2018-02-08 17:26:30');
INSERT INTO `sys_log` VALUES ('1172', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=zhengfei&name=郑飞&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:26:49');
INSERT INTO `sys_log` VALUES ('1173', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1518081387194&', '0:0:0:0:0:0:0:1', '2018-02-08 17:26:59');
INSERT INTO `sys_log` VALUES ('1174', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 17:27:09');
INSERT INTO `sys_log` VALUES ('1175', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:27:35');
INSERT INTO `sys_log` VALUES ('1176', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518082106724&', '0:0:0:0:0:0:0:1', '2018-02-08 17:28:33');
INSERT INTO `sys_log` VALUES ('1177', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=30&loginName=luojiaqi&name=罗加奇&password=123456&sex=1&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:28:37');
INSERT INTO `sys_log` VALUES ('1178', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:28:40');
INSERT INTO `sys_log` VALUES ('1179', 'diguanqiang', 'diguanqiang', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:29:57');
INSERT INTO `sys_log` VALUES ('1180', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518082204753&', '0:0:0:0:0:0:0:1', '2018-02-08 17:30:09');
INSERT INTO `sys_log` VALUES ('1181', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=30&loginName=luojiaqi&name=罗加奇&password=123456&sex=1&age=0&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&', '0:0:0:0:0:0:0:1', '2018-02-08 17:30:21');
INSERT INTO `sys_log` VALUES ('1182', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:30:26');
INSERT INTO `sys_log` VALUES ('1183', 'zhangaiyu', 'zhangaiyu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:31:08');
INSERT INTO `sys_log` VALUES ('1184', 'luojiaqi', 'luojiaqi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 17:35:38');
INSERT INTO `sys_log` VALUES ('1185', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518082547078&', '0:0:0:0:0:0:0:1', '2018-02-08 17:36:37');
INSERT INTO `sys_log` VALUES ('1186', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518082709347&', '0:0:0:0:0:0:0:1', '2018-02-08 17:38:33');
INSERT INTO `sys_log` VALUES ('1187', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1518082709348&', '0:0:0:0:0:0:0:1', '2018-02-08 17:38:47');
INSERT INTO `sys_log` VALUES ('1188', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518082776479&', '0:0:0:0:0:0:0:1', '2018-02-08 17:39:41');
INSERT INTO `sys_log` VALUES ('1189', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518082776480&', '0:0:0:0:0:0:0:1', '2018-02-08 17:40:26');
INSERT INTO `sys_log` VALUES ('1190', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518083094689&', '0:0:0:0:0:0:0:1', '2018-02-08 17:45:06');
INSERT INTO `sys_log` VALUES ('1191', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518083200771&', '0:0:0:0:0:0:0:1', '2018-02-08 17:46:49');
INSERT INTO `sys_log` VALUES ('1192', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518083275245&', '0:0:0:0:0:0:0:1', '2018-02-08 17:47:59');
INSERT INTO `sys_log` VALUES ('1193', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=30&_=1518083275246&', '0:0:0:0:0:0:0:1', '2018-02-08 17:48:12');
INSERT INTO `sys_log` VALUES ('1194', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=28&_=1518083275247&', '0:0:0:0:0:0:0:1', '2018-02-08 17:48:16');
INSERT INTO `sys_log` VALUES ('1195', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=26&_=1518083275248&', '0:0:0:0:0:0:0:1', '2018-02-08 17:48:18');
INSERT INTO `sys_log` VALUES ('1196', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518083404956&', '0:0:0:0:0:0:0:1', '2018-02-08 17:50:08');
INSERT INTO `sys_log` VALUES ('1197', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=lixiang&name=李翔&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&ip=10.12.18.150&', '0:0:0:0:0:0:0:1', '2018-02-08 17:50:39');
INSERT INTO `sys_log` VALUES ('1198', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=lixiang&name=李翔&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&ip=10.12.18.150&', '0:0:0:0:0:0:0:1', '2018-02-08 17:51:43');
INSERT INTO `sys_log` VALUES ('1199', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518083704419&', '0:0:0:0:0:0:0:1', '2018-02-08 17:55:17');
INSERT INTO `sys_log` VALUES ('1200', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=lixiang&name=李翔&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&ip=10.12.18.150&', '0:0:0:0:0:0:0:1', '2018-02-08 17:55:42');
INSERT INTO `sys_log` VALUES ('1201', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=34&_=1518083704420&', '0:0:0:0:0:0:0:1', '2018-02-08 17:56:09');
INSERT INTO `sys_log` VALUES ('1202', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:delete,[参数]:id=34&', '0:0:0:0:0:0:0:1', '2018-02-08 17:56:53');
INSERT INTO `sys_log` VALUES ('1203', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1518083704421&', '0:0:0:0:0:0:0:1', '2018-02-08 17:56:55');
INSERT INTO `sys_log` VALUES ('1204', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=lixiang&name=李翔&password=123456&sex=0&age=&userType=1&organizationId=18&roleIds=3&phone=&status=0&initStorageSize=1024&ip=10.12.18.150&', '0:0:0:0:0:0:0:1', '2018-02-08 17:57:25');
INSERT INTO `sys_log` VALUES ('1205', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=33&_=1518083704422&', '0:0:0:0:0:0:0:1', '2018-02-08 17:57:27');
INSERT INTO `sys_log` VALUES ('1206', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=33&loginName=zhengfei&name=郑飞&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=3&phone=13888888888&status=0&initStorageSize=1024&ip=10.12.18.185&', '0:0:0:0:0:0:0:1', '2018-02-08 17:57:43');
INSERT INTO `sys_log` VALUES ('1207', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 17:59:49');
INSERT INTO `sys_log` VALUES ('1208', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=6&name=组织一处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 17:59:59');
INSERT INTO `sys_log` VALUES ('1209', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 18:00:00');
INSERT INTO `sys_log` VALUES ('1210', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=7&name=组织二处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:00:12');
INSERT INTO `sys_log` VALUES ('1211', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-08 18:00:14');
INSERT INTO `sys_log` VALUES ('1212', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=8&name=组织三处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:00:29');
INSERT INTO `sys_log` VALUES ('1213', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1518083704427&', '0:0:0:0:0:0:0:1', '2018-02-08 18:00:52');
INSERT INTO `sys_log` VALUES ('1214', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=1&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:00');
INSERT INTO `sys_log` VALUES ('1215', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1518083704428&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:04');
INSERT INTO `sys_log` VALUES ('1216', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=19&code=3&name=办公室&seq=2&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:13');
INSERT INTO `sys_log` VALUES ('1217', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1518083704429&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:17');
INSERT INTO `sys_log` VALUES ('1218', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:23');
INSERT INTO `sys_log` VALUES ('1219', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1518083704430&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:29');
INSERT INTO `sys_log` VALUES ('1220', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=1&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:32');
INSERT INTO `sys_log` VALUES ('1221', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=20&_=1518083704431&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:34');
INSERT INTO `sys_log` VALUES ('1222', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=21&_=1518083704432&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:42');
INSERT INTO `sys_log` VALUES ('1223', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=21&code=5&name=综合干部处&seq=1&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:45');
INSERT INTO `sys_log` VALUES ('1224', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1518083704433&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:51');
INSERT INTO `sys_log` VALUES ('1225', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-08 18:01:54');
INSERT INTO `sys_log` VALUES ('1226', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 18:02:10');
INSERT INTO `sys_log` VALUES ('1227', 'lixiang', 'lixiang', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-08 18:02:53');
INSERT INTO `sys_log` VALUES ('1228', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1518084187229&', '0:0:0:0:0:0:0:1', '2018-02-08 18:03:17');
INSERT INTO `sys_log` VALUES ('1229', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519292157454&', '0:0:0:0:0:0:0:1', '2018-02-22 17:37:00');
INSERT INTO `sys_log` VALUES ('1230', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519292157455&', '0:0:0:0:0:0:0:1', '2018-02-22 17:37:19');
INSERT INTO `sys_log` VALUES ('1231', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 08:49:40');
INSERT INTO `sys_log` VALUES ('1232', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 08:50:26');
INSERT INTO `sys_log` VALUES ('1233', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 09:26:25');
INSERT INTO `sys_log` VALUES ('1234', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 09:27:01');
INSERT INTO `sys_log` VALUES ('1235', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 09:27:35');
INSERT INTO `sys_log` VALUES ('1236', 'langliang', 'langliang', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 13:49:12');
INSERT INTO `sys_log` VALUES ('1237', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 13:59:21');
INSERT INTO `sys_log` VALUES ('1238', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 16:21:24');
INSERT INTO `sys_log` VALUES ('1239', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-23 16:37:11');
INSERT INTO `sys_log` VALUES ('1240', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 16:41:21');
INSERT INTO `sys_log` VALUES ('1241', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 16:53:50');
INSERT INTO `sys_log` VALUES ('1242', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:25:59');
INSERT INTO `sys_log` VALUES ('1243', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:27:11');
INSERT INTO `sys_log` VALUES ('1244', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:29:30');
INSERT INTO `sys_log` VALUES ('1245', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:38:09');
INSERT INTO `sys_log` VALUES ('1246', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:38:29');
INSERT INTO `sys_log` VALUES ('1247', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519378732094&', '0:0:0:0:0:0:0:1', '2018-02-23 17:39:01');
INSERT INTO `sys_log` VALUES ('1248', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=bangongshi&name=办公室&password=123456&sex=0&age=&userType=1&organizationId=19&roleIds=3&phone=&status=0&initStorageSize=300&ip=111&', '0:0:0:0:0:0:0:1', '2018-02-23 17:39:32');
INSERT INTO `sys_log` VALUES ('1249', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:39:36');
INSERT INTO `sys_log` VALUES ('1250', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:40:52');
INSERT INTO `sys_log` VALUES ('1251', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:44:37');
INSERT INTO `sys_log` VALUES ('1252', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:44:48');
INSERT INTO `sys_log` VALUES ('1253', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:45:07');
INSERT INTO `sys_log` VALUES ('1254', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:49:32');
INSERT INTO `sys_log` VALUES ('1255', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:51:24');
INSERT INTO `sys_log` VALUES ('1256', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-23 17:52:02');
INSERT INTO `sys_log` VALUES ('1257', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 08:52:18');
INSERT INTO `sys_log` VALUES ('1258', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 08:53:42');
INSERT INTO `sys_log` VALUES ('1259', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 08:56:49');
INSERT INTO `sys_log` VALUES ('1260', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 08:57:34');
INSERT INTO `sys_log` VALUES ('1261', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:00:00');
INSERT INTO `sys_log` VALUES ('1262', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:21:45');
INSERT INTO `sys_log` VALUES ('1263', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:21:48');
INSERT INTO `sys_log` VALUES ('1264', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:22:30');
INSERT INTO `sys_log` VALUES ('1265', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:36:45');
INSERT INTO `sys_log` VALUES ('1266', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:40:22');
INSERT INTO `sys_log` VALUES ('1267', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:41:14');
INSERT INTO `sys_log` VALUES ('1268', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:41:45');
INSERT INTO `sys_log` VALUES ('1269', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:43:38');
INSERT INTO `sys_log` VALUES ('1270', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:44:25');
INSERT INTO `sys_log` VALUES ('1271', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:48:56');
INSERT INTO `sys_log` VALUES ('1272', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:50:14');
INSERT INTO `sys_log` VALUES ('1273', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:50:29');
INSERT INTO `sys_log` VALUES ('1274', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:56:15');
INSERT INTO `sys_log` VALUES ('1275', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:58:43');
INSERT INTO `sys_log` VALUES ('1276', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=36&_=1519437530387&', '0:0:0:0:0:0:0:1', '2018-02-24 09:58:56');
INSERT INTO `sys_log` VALUES ('1277', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=36&loginName=bangongshi&name=科员&password=&sex=0&age=0&userType=1&organizationId=19&roleIds=3&phone=&status=0&initStorageSize=300&ip=111&', '0:0:0:0:0:0:0:1', '2018-02-24 09:59:08');
INSERT INTO `sys_log` VALUES ('1278', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=35&_=1519437530388&', '0:0:0:0:0:0:0:1', '2018-02-24 09:59:11');
INSERT INTO `sys_log` VALUES ('1279', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=36&_=1519437530389&', '0:0:0:0:0:0:0:1', '2018-02-24 09:59:14');
INSERT INTO `sys_log` VALUES ('1280', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=36&_=1519437530390&', '0:0:0:0:0:0:0:1', '2018-02-24 09:59:20');
INSERT INTO `sys_log` VALUES ('1281', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 09:59:28');
INSERT INTO `sys_log` VALUES ('1282', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 10:19:20');
INSERT INTO `sys_log` VALUES ('1283', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 10:42:38');
INSERT INTO `sys_log` VALUES ('1284', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 10:54:07');
INSERT INTO `sys_log` VALUES ('1285', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 11:02:18');
INSERT INTO `sys_log` VALUES ('1286', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 11:14:39');
INSERT INTO `sys_log` VALUES ('1287', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 11:14:56');
INSERT INTO `sys_log` VALUES ('1288', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 13:41:50');
INSERT INTO `sys_log` VALUES ('1289', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 13:45:35');
INSERT INTO `sys_log` VALUES ('1290', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 13:48:08');
INSERT INTO `sys_log` VALUES ('1291', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 14:11:34');
INSERT INTO `sys_log` VALUES ('1292', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 14:14:33');
INSERT INTO `sys_log` VALUES ('1293', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 14:14:46');
INSERT INTO `sys_log` VALUES ('1294', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 14:32:47');
INSERT INTO `sys_log` VALUES ('1295', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 14:33:20');
INSERT INTO `sys_log` VALUES ('1296', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 17:17:00');
INSERT INTO `sys_log` VALUES ('1297', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 17:17:40');
INSERT INTO `sys_log` VALUES ('1298', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 17:36:54');
INSERT INTO `sys_log` VALUES ('1299', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 17:40:33');
INSERT INTO `sys_log` VALUES ('1300', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-24 17:45:47');
INSERT INTO `sys_log` VALUES ('1301', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 08:43:33');
INSERT INTO `sys_log` VALUES ('1302', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 08:52:55');
INSERT INTO `sys_log` VALUES ('1303', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 08:56:12');
INSERT INTO `sys_log` VALUES ('1304', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 08:57:00');
INSERT INTO `sys_log` VALUES ('1305', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 08:57:24');
INSERT INTO `sys_log` VALUES ('1306', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 08:57:40');
INSERT INTO `sys_log` VALUES ('1307', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 09:14:57');
INSERT INTO `sys_log` VALUES ('1308', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 09:39:10');
INSERT INTO `sys_log` VALUES ('1309', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 09:39:36');
INSERT INTO `sys_log` VALUES ('1310', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 09:39:54');
INSERT INTO `sys_log` VALUES ('1311', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:02:41');
INSERT INTO `sys_log` VALUES ('1312', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:02:54');
INSERT INTO `sys_log` VALUES ('1313', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:14');
INSERT INTO `sys_log` VALUES ('1314', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:16');
INSERT INTO `sys_log` VALUES ('1315', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:18');
INSERT INTO `sys_log` VALUES ('1316', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:34');
INSERT INTO `sys_log` VALUES ('1317', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:37');
INSERT INTO `sys_log` VALUES ('1318', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:39');
INSERT INTO `sys_log` VALUES ('1319', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:42');
INSERT INTO `sys_log` VALUES ('1320', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:44');
INSERT INTO `sys_log` VALUES ('1321', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:46');
INSERT INTO `sys_log` VALUES ('1322', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:49');
INSERT INTO `sys_log` VALUES ('1323', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 10:18:52');
INSERT INTO `sys_log` VALUES ('1324', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:36:30');
INSERT INTO `sys_log` VALUES ('1325', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519612598095&', '0:0:0:0:0:0:0:1', '2018-02-26 10:37:05');
INSERT INTO `sys_log` VALUES ('1326', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-26 10:37:57');
INSERT INTO `sys_log` VALUES ('1327', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519612598098&', '0:0:0:0:0:0:0:1', '2018-02-26 10:41:22');
INSERT INTO `sys_log` VALUES ('1328', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-26 10:45:59');
INSERT INTO `sys_log` VALUES ('1329', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:46:55');
INSERT INTO `sys_log` VALUES ('1330', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:49:05');
INSERT INTO `sys_log` VALUES ('1331', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:50:36');
INSERT INTO `sys_log` VALUES ('1332', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:null', '0:0:0:0:0:0:0:1', '2018-02-26 10:51:44');
INSERT INTO `sys_log` VALUES ('1333', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:52:00');
INSERT INTO `sys_log` VALUES ('1334', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-26 10:52:11');
INSERT INTO `sys_log` VALUES ('1335', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:53:26');
INSERT INTO `sys_log` VALUES ('1336', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 10:55:16');
INSERT INTO `sys_log` VALUES ('1337', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519613721158&', '0:0:0:0:0:0:0:1', '2018-02-26 10:55:34');
INSERT INTO `sys_log` VALUES ('1338', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 11:12:26');
INSERT INTO `sys_log` VALUES ('1339', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 11:12:32');
INSERT INTO `sys_log` VALUES ('1340', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:12:59');
INSERT INTO `sys_log` VALUES ('1341', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:13:04');
INSERT INTO `sys_log` VALUES ('1342', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:13:07');
INSERT INTO `sys_log` VALUES ('1343', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:13:11');
INSERT INTO `sys_log` VALUES ('1344', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-26 11:19:06');
INSERT INTO `sys_log` VALUES ('1345', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-26 11:20:09');
INSERT INTO `sys_log` VALUES ('1346', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1519616101043&', '0:0:0:0:0:0:0:1', '2018-02-26 11:35:12');
INSERT INTO `sys_log` VALUES ('1347', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 11:35:25');
INSERT INTO `sys_log` VALUES ('1348', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 11:35:43');
INSERT INTO `sys_log` VALUES ('1349', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1519616362755&', '0:0:0:0:0:0:0:1', '2018-02-26 11:39:31');
INSERT INTO `sys_log` VALUES ('1350', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1519616362756&', '0:0:0:0:0:0:0:1', '2018-02-26 11:39:34');
INSERT INTO `sys_log` VALUES ('1351', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 11:39:42');
INSERT INTO `sys_log` VALUES ('1352', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1519616362757&', '0:0:0:0:0:0:0:1', '2018-02-26 11:39:44');
INSERT INTO `sys_log` VALUES ('1353', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=18&code=2&name=信息管理处&seq=0&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 11:39:55');
INSERT INTO `sys_log` VALUES ('1354', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=20&_=1519616362758&', '0:0:0:0:0:0:0:1', '2018-02-26 11:39:57');
INSERT INTO `sys_log` VALUES ('1355', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1519616362759&', '0:0:0:0:0:0:0:1', '2018-02-26 11:40:08');
INSERT INTO `sys_log` VALUES ('1356', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=19&code=3&name=办公室&seq=2&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 11:40:12');
INSERT INTO `sys_log` VALUES ('1357', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:44:57');
INSERT INTO `sys_log` VALUES ('1358', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:45:00');
INSERT INTO `sys_log` VALUES ('1359', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:45:03');
INSERT INTO `sys_log` VALUES ('1360', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:45:05');
INSERT INTO `sys_log` VALUES ('1361', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:56:18');
INSERT INTO `sys_log` VALUES ('1362', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:56:20');
INSERT INTO `sys_log` VALUES ('1363', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 11:56:22');
INSERT INTO `sys_log` VALUES ('1364', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:02:26');
INSERT INTO `sys_log` VALUES ('1365', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:02:28');
INSERT INTO `sys_log` VALUES ('1366', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:02:30');
INSERT INTO `sys_log` VALUES ('1367', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:04:44');
INSERT INTO `sys_log` VALUES ('1368', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:06:25');
INSERT INTO `sys_log` VALUES ('1369', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:06:27');
INSERT INTO `sys_log` VALUES ('1370', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:06:29');
INSERT INTO `sys_log` VALUES ('1371', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 12:06:32');
INSERT INTO `sys_log` VALUES ('1372', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:13');
INSERT INTO `sys_log` VALUES ('1373', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:16');
INSERT INTO `sys_log` VALUES ('1374', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:18');
INSERT INTO `sys_log` VALUES ('1375', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:19');
INSERT INTO `sys_log` VALUES ('1376', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:22');
INSERT INTO `sys_log` VALUES ('1377', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:25');
INSERT INTO `sys_log` VALUES ('1378', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:28');
INSERT INTO `sys_log` VALUES ('1379', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:30');
INSERT INTO `sys_log` VALUES ('1380', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:32');
INSERT INTO `sys_log` VALUES ('1381', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:34');
INSERT INTO `sys_log` VALUES ('1382', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:37');
INSERT INTO `sys_log` VALUES ('1383', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:40');
INSERT INTO `sys_log` VALUES ('1384', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:42');
INSERT INTO `sys_log` VALUES ('1385', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:44');
INSERT INTO `sys_log` VALUES ('1386', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:46');
INSERT INTO `sys_log` VALUES ('1387', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:48');
INSERT INTO `sys_log` VALUES ('1388', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:52');
INSERT INTO `sys_log` VALUES ('1389', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:54');
INSERT INTO `sys_log` VALUES ('1390', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:09:59');
INSERT INTO `sys_log` VALUES ('1391', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 13:30:24');
INSERT INTO `sys_log` VALUES ('1392', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 13:31:01');
INSERT INTO `sys_log` VALUES ('1393', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 13:32:29');
INSERT INTO `sys_log` VALUES ('1394', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:32:26');
INSERT INTO `sys_log` VALUES ('1395', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:32:28');
INSERT INTO `sys_log` VALUES ('1396', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:32:32');
INSERT INTO `sys_log` VALUES ('1397', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:42:52');
INSERT INTO `sys_log` VALUES ('1398', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:42:54');
INSERT INTO `sys_log` VALUES ('1399', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:42:59');
INSERT INTO `sys_log` VALUES ('1400', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 13:43:36');
INSERT INTO `sys_log` VALUES ('1401', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:10:58');
INSERT INTO `sys_log` VALUES ('1402', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:11:04');
INSERT INTO `sys_log` VALUES ('1403', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:11:06');
INSERT INTO `sys_log` VALUES ('1404', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:11:08');
INSERT INTO `sys_log` VALUES ('1405', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:15:29');
INSERT INTO `sys_log` VALUES ('1406', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:15:31');
INSERT INTO `sys_log` VALUES ('1407', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:15:36');
INSERT INTO `sys_log` VALUES ('1408', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:15:38');
INSERT INTO `sys_log` VALUES ('1409', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:15:40');
INSERT INTO `sys_log` VALUES ('1410', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:15:43');
INSERT INTO `sys_log` VALUES ('1411', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:17:02');
INSERT INTO `sys_log` VALUES ('1412', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:17:04');
INSERT INTO `sys_log` VALUES ('1413', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:17:07');
INSERT INTO `sys_log` VALUES ('1414', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:17:44');
INSERT INTO `sys_log` VALUES ('1415', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:17:48');
INSERT INTO `sys_log` VALUES ('1416', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:17:49');
INSERT INTO `sys_log` VALUES ('1417', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:28:51');
INSERT INTO `sys_log` VALUES ('1418', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:28:57');
INSERT INTO `sys_log` VALUES ('1419', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:28:59');
INSERT INTO `sys_log` VALUES ('1420', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:19');
INSERT INTO `sys_log` VALUES ('1421', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:45');
INSERT INTO `sys_log` VALUES ('1422', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:47');
INSERT INTO `sys_log` VALUES ('1423', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:48');
INSERT INTO `sys_log` VALUES ('1424', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:51');
INSERT INTO `sys_log` VALUES ('1425', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:53');
INSERT INTO `sys_log` VALUES ('1426', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:56');
INSERT INTO `sys_log` VALUES ('1427', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:58');
INSERT INTO `sys_log` VALUES ('1428', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:33:01');
INSERT INTO `sys_log` VALUES ('1429', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:33:03');
INSERT INTO `sys_log` VALUES ('1430', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:32:49');
INSERT INTO `sys_log` VALUES ('1431', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:33:10');
INSERT INTO `sys_log` VALUES ('1432', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 14:34:40');
INSERT INTO `sys_log` VALUES ('1433', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:31:20');
INSERT INTO `sys_log` VALUES ('1434', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:31:35');
INSERT INTO `sys_log` VALUES ('1435', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:31:57');
INSERT INTO `sys_log` VALUES ('1436', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:32:42');
INSERT INTO `sys_log` VALUES ('1437', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:33:07');
INSERT INTO `sys_log` VALUES ('1438', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:34:02');
INSERT INTO `sys_log` VALUES ('1439', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:34:34');
INSERT INTO `sys_log` VALUES ('1440', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:35:40');
INSERT INTO `sys_log` VALUES ('1441', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:36:08');
INSERT INTO `sys_log` VALUES ('1442', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:36:34');
INSERT INTO `sys_log` VALUES ('1443', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:37:38');
INSERT INTO `sys_log` VALUES ('1444', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:37:55');
INSERT INTO `sys_log` VALUES ('1445', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:39:59');
INSERT INTO `sys_log` VALUES ('1446', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:40:25');
INSERT INTO `sys_log` VALUES ('1447', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:40:43');
INSERT INTO `sys_log` VALUES ('1448', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:41:56');
INSERT INTO `sys_log` VALUES ('1449', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:42:34');
INSERT INTO `sys_log` VALUES ('1450', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:42:40');
INSERT INTO `sys_log` VALUES ('1451', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 15:44:45');
INSERT INTO `sys_log` VALUES ('1452', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 16:43:09');
INSERT INTO `sys_log` VALUES ('1453', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 16:44:43');
INSERT INTO `sys_log` VALUES ('1454', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 16:44:57');
INSERT INTO `sys_log` VALUES ('1455', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:50:49');
INSERT INTO `sys_log` VALUES ('1456', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:51:26');
INSERT INTO `sys_log` VALUES ('1457', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:51:43');
INSERT INTO `sys_log` VALUES ('1458', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:52:13');
INSERT INTO `sys_log` VALUES ('1459', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-02-26 16:52:22');
INSERT INTO `sys_log` VALUES ('1460', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:52:37');
INSERT INTO `sys_log` VALUES ('1461', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=22&_=1519635161228&', '0:0:0:0:0:0:0:1', '2018-02-26 16:52:48');
INSERT INTO `sys_log` VALUES ('1462', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1519635161229&', '0:0:0:0:0:0:0:1', '2018-02-26 16:52:58');
INSERT INTO `sys_log` VALUES ('1463', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1519635161230&', '0:0:0:0:0:0:0:1', '2018-02-26 16:53:02');
INSERT INTO `sys_log` VALUES ('1464', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1519635161231&', '0:0:0:0:0:0:0:1', '2018-02-26 16:53:05');
INSERT INTO `sys_log` VALUES ('1465', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=20&_=1519635161232&', '0:0:0:0:0:0:0:1', '2018-02-26 16:53:09');
INSERT INTO `sys_log` VALUES ('1466', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=20&_=1519635161233&', '0:0:0:0:0:0:0:1', '2018-02-26 16:53:13');
INSERT INTO `sys_log` VALUES ('1467', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=20&code=4&name=干部监督处&seq=0&icon=fi-folder&initStorageSize=1024&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 16:53:23');
INSERT INTO `sys_log` VALUES ('1468', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-26 16:53:52');
INSERT INTO `sys_log` VALUES ('1469', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=20&_=1519635161235&', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:10');
INSERT INTO `sys_log` VALUES ('1470', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=22&_=1519635161236&', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:18');
INSERT INTO `sys_log` VALUES ('1471', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1519635161237&', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:26');
INSERT INTO `sys_log` VALUES ('1472', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=22&_=1519635161238&', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:29');
INSERT INTO `sys_log` VALUES ('1473', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519635280906&', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:48');
INSERT INTO `sys_log` VALUES ('1474', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=22&_=1519635280908&', '0:0:0:0:0:0:0:1', '2018-02-26 16:54:58');
INSERT INTO `sys_log` VALUES ('1475', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519635280909&', '0:0:0:0:0:0:0:1', '2018-02-26 16:55:03');
INSERT INTO `sys_log` VALUES ('1476', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=zuzhiyichu&name=组织1&password=123456&sex=0&age=&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=12&', '0:0:0:0:0:0:0:1', '2018-02-26 16:55:21');
INSERT INTO `sys_log` VALUES ('1477', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:55:26');
INSERT INTO `sys_log` VALUES ('1478', 'zuzhiyichu', 'zuzhiyichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:56:37');
INSERT INTO `sys_log` VALUES ('1479', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1519635403166&', '0:0:0:0:0:0:0:1', '2018-02-26 16:56:53');
INSERT INTO `sys_log` VALUES ('1480', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=22&_=1519635403168&', '0:0:0:0:0:0:0:1', '2018-02-26 16:56:58');
INSERT INTO `sys_log` VALUES ('1481', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=22&code=6&name=组织一处&seq=0&icon=fi-folder&initStorageSize=2048&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-02-26 16:57:03');
INSERT INTO `sys_log` VALUES ('1482', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:57:13');
INSERT INTO `sys_log` VALUES ('1483', 'zuzhiyichu', 'zuzhiyichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 16:59:24');
INSERT INTO `sys_log` VALUES ('1484', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 17:03:48');
INSERT INTO `sys_log` VALUES ('1485', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 17:13:38');
INSERT INTO `sys_log` VALUES ('1486', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-26 17:13:50');
INSERT INTO `sys_log` VALUES ('1487', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-02-27 11:03:17');
INSERT INTO `sys_log` VALUES ('1488', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-02-27 11:11:21');
INSERT INTO `sys_log` VALUES ('1489', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=24&_=1519700933995&', '0:0:0:0:0:0:0:1', '2018-02-27 11:11:27');
INSERT INTO `sys_log` VALUES ('1490', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1519700933997&', '0:0:0:0:0:0:0:1', '2018-02-27 11:26:26');
INSERT INTO `sys_log` VALUES ('1491', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=26&_=1519700933998&', '0:0:0:0:0:0:0:1', '2018-02-27 11:26:54');
INSERT INTO `sys_log` VALUES ('1492', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=27&_=1519700933999&', '0:0:0:0:0:0:0:1', '2018-02-27 11:29:14');
INSERT INTO `sys_log` VALUES ('1493', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=27&_=1519700934000&', '0:0:0:0:0:0:0:1', '2018-02-27 11:34:28');
INSERT INTO `sys_log` VALUES ('1494', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 11:20:52');
INSERT INTO `sys_log` VALUES ('1495', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 14:47:47');
INSERT INTO `sys_log` VALUES ('1496', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 14:48:01');
INSERT INTO `sys_log` VALUES ('1497', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 15:20:01');
INSERT INTO `sys_log` VALUES ('1498', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 15:28:00');
INSERT INTO `sys_log` VALUES ('1499', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:29:36');
INSERT INTO `sys_log` VALUES ('1500', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:29:38');
INSERT INTO `sys_log` VALUES ('1501', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:42:14');
INSERT INTO `sys_log` VALUES ('1502', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:42:48');
INSERT INTO `sys_log` VALUES ('1503', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:42:55');
INSERT INTO `sys_log` VALUES ('1504', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:42:57');
INSERT INTO `sys_log` VALUES ('1505', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '0:0:0:0:0:0:0:1', '2018-03-01 15:43:00');
INSERT INTO `sys_log` VALUES ('1506', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 15:43:27');
INSERT INTO `sys_log` VALUES ('1507', 'bangongshi', 'bangongshi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 15:47:57');
INSERT INTO `sys_log` VALUES ('1508', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 16:36:07');
INSERT INTO `sys_log` VALUES ('1509', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 16:57:26');
INSERT INTO `sys_log` VALUES ('1510', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-01 16:58:05');
INSERT INTO `sys_log` VALUES ('1511', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 08:45:38');
INSERT INTO `sys_log` VALUES ('1512', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 08:49:03');
INSERT INTO `sys_log` VALUES ('1513', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 09:34:27');
INSERT INTO `sys_log` VALUES ('1514', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=36&_=1520300073443&', '0:0:0:0:0:0:0:1', '2018-03-06 09:34:49');
INSERT INTO `sys_log` VALUES ('1515', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=36&loginName=bangongshi&name=科员&password=&sex=0&age=0&userType=1&organizationId=19&roleIds=3&phone=&status=0&initStorageSize=300&ip=111.121&', '0:0:0:0:0:0:0:1', '2018-03-06 09:34:56');
INSERT INTO `sys_log` VALUES ('1516', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520300116965&', '0:0:0:0:0:0:0:1', '2018-03-06 09:35:28');
INSERT INTO `sys_log` VALUES ('1517', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=10.21&', '0:0:0:0:0:0:0:1', '2018-03-06 09:35:32');
INSERT INTO `sys_log` VALUES ('1518', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520300385524&', '0:0:0:0:0:0:0:1', '2018-03-06 09:39:52');
INSERT INTO `sys_log` VALUES ('1519', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=1.0.1.1&', '0:0:0:0:0:0:0:1', '2018-03-06 09:39:57');
INSERT INTO `sys_log` VALUES ('1520', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520300385525&', '0:0:0:0:0:0:0:1', '2018-03-06 09:43:48');
INSERT INTO `sys_log` VALUES ('1521', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=2.2.2.2&', '0:0:0:0:0:0:0:1', '2018-03-06 09:43:54');
INSERT INTO `sys_log` VALUES ('1522', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520300385526&', '0:0:0:0:0:0:0:1', '2018-03-06 09:44:32');
INSERT INTO `sys_log` VALUES ('1523', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=2.2.2.3&', '0:0:0:0:0:0:0:1', '2018-03-06 09:44:38');
INSERT INTO `sys_log` VALUES ('1524', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=2.2.2.3&', '0:0:0:0:0:0:0:1', '2018-03-06 09:46:00');
INSERT INTO `sys_log` VALUES ('1525', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520300385527&', '0:0:0:0:0:0:0:1', '2018-03-06 09:47:20');
INSERT INTO `sys_log` VALUES ('1526', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=2.2.2.5&', '0:0:0:0:0:0:0:1', '2018-03-06 09:47:51');
INSERT INTO `sys_log` VALUES ('1527', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=2.2.2.5&', '0:0:0:0:0:0:0:1', '2018-03-06 09:51:52');
INSERT INTO `sys_log` VALUES ('1528', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1520300385529&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:00');
INSERT INTO `sys_log` VALUES ('1529', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=19&code=3&name=办公室&seq=2&icon=fi-folder&initStorageSize=5001&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:03');
INSERT INTO `sys_log` VALUES ('1530', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=24&_=1520300385530&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:09');
INSERT INTO `sys_log` VALUES ('1531', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=23&_=1520300385531&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:12');
INSERT INTO `sys_log` VALUES ('1532', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=21&_=1520300385532&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:15');
INSERT INTO `sys_log` VALUES ('1533', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1520300385533&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:17');
INSERT INTO `sys_log` VALUES ('1534', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=20&_=1520300385534&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:20');
INSERT INTO `sys_log` VALUES ('1535', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1520300385535&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:22');
INSERT INTO `sys_log` VALUES ('1536', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1520300385536&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:24');
INSERT INTO `sys_log` VALUES ('1537', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=18&_=1520300385537&', '0:0:0:0:0:0:0:1', '2018-03-06 09:52:27');
INSERT INTO `sys_log` VALUES ('1538', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520300385538&', '0:0:0:0:0:0:0:1', '2018-03-06 09:53:05');
INSERT INTO `sys_log` VALUES ('1539', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=37&loginName=zuzhiyichu&name=组织1&password=&sex=0&age=0&userType=1&organizationId=22&roleIds=3&phone=&status=0&initStorageSize=300&ip=2.2.2.6&', '0:0:0:0:0:0:0:1', '2018-03-06 09:53:09');
INSERT INTO `sys_log` VALUES ('1540', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 09:56:24');
INSERT INTO `sys_log` VALUES ('1541', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520301401165&', '0:0:0:0:0:0:0:1', '2018-03-06 09:56:46');
INSERT INTO `sys_log` VALUES ('1542', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 09:56:49');
INSERT INTO `sys_log` VALUES ('1543', 'zuzhiyichu', 'zuzhiyichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 09:57:14');
INSERT INTO `sys_log` VALUES ('1544', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=37&_=1520301439157&', '0:0:0:0:0:0:0:1', '2018-03-06 09:57:22');
INSERT INTO `sys_log` VALUES ('1545', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1520301439158&', '0:0:0:0:0:0:0:1', '2018-03-06 09:58:39');
INSERT INTO `sys_log` VALUES ('1546', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=zhangsan&name=张三&password=123456&sex=0&age=&userType=1&organizationId=19&roleIds=3&phone=&status=0&initStorageSize=300&ip=12.202.0.0&', '0:0:0:0:0:0:0:1', '2018-03-06 09:59:05');
INSERT INTO `sys_log` VALUES ('1547', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=38&_=1520301439159&', '0:0:0:0:0:0:0:1', '2018-03-06 09:59:10');
INSERT INTO `sys_log` VALUES ('1548', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=38&loginName=zhangsan&name=张三&password=&sex=0&age=0&userType=1&organizationId=19&roleIds=3&phone=&status=0&initStorageSize=300&ip=12.202.0.1&', '0:0:0:0:0:0:0:1', '2018-03-06 09:59:13');
INSERT INTO `sys_log` VALUES ('1549', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 09:59:27');
INSERT INTO `sys_log` VALUES ('1550', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 16:48:49');
INSERT INTO `sys_log` VALUES ('1551', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-06 17:26:12');
INSERT INTO `sys_log` VALUES ('1552', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:loginPost,[参数]:_csrf=7075e359-29d1-48b7-b9d9-3d3b1f23a9f9&username=liujun&password=123456&rememberMe=1&', '192.168.60.166', '2018-03-06 17:26:17');
INSERT INTO `sys_log` VALUES ('1553', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '192.168.60.166', '2018-03-06 17:28:06');
INSERT INTO `sys_log` VALUES ('1554', 'liujun', 'liujun', '[类名]:com.tf.controller.MyFileController,[方法]:delete,[参数]:pwd=&', '192.168.71.195', '2018-03-07 10:14:48');
INSERT INTO `sys_log` VALUES ('1555', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 15:41:30');
INSERT INTO `sys_log` VALUES ('1556', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1520926901618&', '0:0:0:0:0:0:0:1', '2018-03-13 15:41:52');
INSERT INTO `sys_log` VALUES ('1557', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=26&_=1520926901619&', '0:0:0:0:0:0:0:1', '2018-03-13 15:42:01');
INSERT INTO `sys_log` VALUES ('1558', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=26&loginName=xinxichu&name=信息处&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=2&phone=&status=0&initStorageSize=5120&ip=0:0:0:0:0:0:0:1&', '0:0:0:0:0:0:0:1', '2018-03-13 15:42:04');
INSERT INTO `sys_log` VALUES ('1559', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=26&_=1520926901620&', '0:0:0:0:0:0:0:1', '2018-03-13 15:42:07');
INSERT INTO `sys_log` VALUES ('1560', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=26&loginName=xinxichu&name=信息处&password=&sex=0&age=0&userType=1&organizationId=18&roleIds=2&phone=&status=0&initStorageSize=5120&ip=0:0:0:0:0:0:0:1&', '0:0:0:0:0:0:0:1', '2018-03-13 15:42:08');
INSERT INTO `sys_log` VALUES ('1561', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=1&_=1520926901621&', '0:0:0:0:0:0:0:1', '2018-03-13 15:42:10');
INSERT INTO `sys_log` VALUES ('1562', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 15:42:13');
INSERT INTO `sys_log` VALUES ('1563', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 15:42:20');
INSERT INTO `sys_log` VALUES ('1564', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 15:43:43');
INSERT INTO `sys_log` VALUES ('1565', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 15:47:57');
INSERT INTO `sys_log` VALUES ('1566', 'langliang', 'langliang', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 16:07:14');
INSERT INTO `sys_log` VALUES ('1567', 'luojiaqi', 'luojiaqi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 16:07:17');
INSERT INTO `sys_log` VALUES ('1568', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1520928711057&', '192.168.60.67', '2018-03-13 16:07:33');
INSERT INTO `sys_log` VALUES ('1569', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-03-13 16:07:36');
INSERT INTO `sys_log` VALUES ('1570', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=11&name= 研究室&seq=7&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '192.168.60.67', '2018-03-13 16:08:18');
INSERT INTO `sys_log` VALUES ('1571', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=25&_=1520928711059&', '192.168.60.67', '2018-03-13 16:08:22');
INSERT INTO `sys_log` VALUES ('1572', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=25&code=11&name= 研究室&seq=7&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '192.168.60.67', '2018-03-13 16:08:23');
INSERT INTO `sys_log` VALUES ('1573', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1520928711061&', '192.168.60.67', '2018-03-13 16:08:29');
INSERT INTO `sys_log` VALUES ('1574', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=shen&name=申&password=123456&sex=0&age=&userType=1&organizationId=25&roleIds=3&phone=&status=0&initStorageSize=300&ip=10.12&', '192.168.60.67', '2018-03-13 16:08:54');
INSERT INTO `sys_log` VALUES ('1575', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=25&_=1520928711062&', '192.168.60.67', '2018-03-13 16:09:00');
INSERT INTO `sys_log` VALUES ('1576', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=25&code=11&name= 研究室&seq=11&icon=fi-folder&initStorageSize=5000&address=&pid=1&', '192.168.60.67', '2018-03-13 16:09:08');
INSERT INTO `sys_log` VALUES ('1577', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=25&_=1520928711063&', '192.168.60.67', '2018-03-13 16:09:11');
INSERT INTO `sys_log` VALUES ('1578', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 16:09:16');
INSERT INTO `sys_log` VALUES ('1579', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 16:10:12');
INSERT INTO `sys_log` VALUES ('1580', 'langliang', 'langliang', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 16:51:14');
INSERT INTO `sys_log` VALUES ('1581', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=25&_=1520931075567&', '0:0:0:0:0:0:0:1', '2018-03-13 16:57:32');
INSERT INTO `sys_log` VALUES ('1582', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=21&_=1520931075568&', '0:0:0:0:0:0:0:1', '2018-03-13 16:57:40');
INSERT INTO `sys_log` VALUES ('1583', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1520931075569&', '0:0:0:0:0:0:0:1', '2018-03-13 16:57:45');
INSERT INTO `sys_log` VALUES ('1584', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=19&_=1520931075570&', '0:0:0:0:0:0:0:1', '2018-03-13 16:57:48');
INSERT INTO `sys_log` VALUES ('1585', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=25&_=1520931075571&', '0:0:0:0:0:0:0:1', '2018-03-13 17:02:40');
INSERT INTO `sys_log` VALUES ('1586', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=24&_=1520931075572&', '0:0:0:0:0:0:0:1', '2018-03-13 17:02:55');
INSERT INTO `sys_log` VALUES ('1587', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 17:04:52');
INSERT INTO `sys_log` VALUES ('1588', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 17:05:07');
INSERT INTO `sys_log` VALUES ('1589', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:addPage,[参数]:_=1520931910243&', '0:0:0:0:0:0:0:1', '2018-03-13 17:05:18');
INSERT INTO `sys_log` VALUES ('1590', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:add,[参数]:loginName=yanjiushi&name=研究室管理员&password=123456&sex=0&age=&userType=1&organizationId=25&roleIds=2&phone=&status=0&initStorageSize=300&ip=10&', '0:0:0:0:0:0:0:1', '2018-03-13 17:05:49');
INSERT INTO `sys_log` VALUES ('1591', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 17:05:56');
INSERT INTO `sys_log` VALUES ('1592', 'yanjiushi', 'yanjiushi', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 17:06:06');
INSERT INTO `sys_log` VALUES ('1593', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 17:34:13');
INSERT INTO `sys_log` VALUES ('1594', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-13 17:39:04');
INSERT INTO `sys_log` VALUES ('1595', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 08:50:13');
INSERT INTO `sys_log` VALUES ('1596', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=38&_=1520988618073&', '0:0:0:0:0:0:0:1', '2018-03-14 08:50:26');
INSERT INTO `sys_log` VALUES ('1597', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=38&loginName=zhangsan&name=张三&password=&sex=0&age=0&userType=1&organizationId=19&roleIds=3&phone=&status=0&initStorageSize=300&ip=12.202.0.2&', '0:0:0:0:0:0:0:1', '2018-03-14 08:50:32');
INSERT INTO `sys_log` VALUES ('1598', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1520989889778&', '0:0:0:0:0:0:0:1', '2018-03-14 09:11:36');
INSERT INTO `sys_log` VALUES ('1599', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=1&name=天津市委组织部&seq=0&icon=fi-folder&initStorageSize=2048&address=天津市河西区&pid=&', '0:0:0:0:0:0:0:1', '2018-03-14 09:13:04');
INSERT INTO `sys_log` VALUES ('1600', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 09:14:12');
INSERT INTO `sys_log` VALUES ('1601', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 09:32:31');
INSERT INTO `sys_log` VALUES ('1602', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 09:34:51');
INSERT INTO `sys_log` VALUES ('1603', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 09:35:08');
INSERT INTO `sys_log` VALUES ('1604', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 09:36:41');
INSERT INTO `sys_log` VALUES ('1605', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 09:56:41');
INSERT INTO `sys_log` VALUES ('1606', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:addPage,[参数]:', null, '2018-03-14 09:57:04');
INSERT INTO `sys_log` VALUES ('1607', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:add,[参数]:code=研究室一室&name=yanjiuyishi&seq=0&icon=fi-folder&initStorageSize=5024&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-03-14 09:57:47');
INSERT INTO `sys_log` VALUES ('1608', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=26&_=1520992618754&', '0:0:0:0:0:0:0:1', '2018-03-14 09:57:51');
INSERT INTO `sys_log` VALUES ('1609', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=26&code=12&name=研究室一室&seq=0&icon=fi-folder&initStorageSize=5024&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-03-14 09:58:08');
INSERT INTO `sys_log` VALUES ('1610', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=25&_=1520992618755&', '0:0:0:0:0:0:0:1', '2018-03-14 09:58:12');
INSERT INTO `sys_log` VALUES ('1611', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=26&_=1520992618756&', '0:0:0:0:0:0:0:1', '2018-03-14 09:58:16');
INSERT INTO `sys_log` VALUES ('1612', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=26&code=12&name=研究室一室&seq=0&icon=fi-folder&initStorageSize=5024&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-03-14 09:58:18');
INSERT INTO `sys_log` VALUES ('1613', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=26&_=1520992618757&', '0:0:0:0:0:0:0:1', '2018-03-14 09:58:21');
INSERT INTO `sys_log` VALUES ('1614', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=26&code=12&name=研究室一室&seq=12&icon=fi-folder&initStorageSize=5024&address=&pid=1&', '0:0:0:0:0:0:0:1', '2018-03-14 09:58:31');
INSERT INTO `sys_log` VALUES ('1615', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:00:00');
INSERT INTO `sys_log` VALUES ('1616', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:01:17');
INSERT INTO `sys_log` VALUES ('1617', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1520992883617&', '0:0:0:0:0:0:0:1', '2018-03-14 10:01:27');
INSERT INTO `sys_log` VALUES ('1618', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=1&name=天津市委组织部&seq=0&icon=fi-folder&initStorageSize=2048&address=天津市河西区&pid=&', '0:0:0:0:0:0:0:1', '2018-03-14 10:01:29');
INSERT INTO `sys_log` VALUES ('1619', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1520992883618&', '0:0:0:0:0:0:0:1', '2018-03-14 10:01:54');
INSERT INTO `sys_log` VALUES ('1620', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=1&name=天津市委组织部&seq=0&icon=fi-folder&initStorageSize=2048&address=天津市河西区&pid=&', '0:0:0:0:0:0:0:1', '2018-03-14 10:01:56');
INSERT INTO `sys_log` VALUES ('1621', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:editPage,[参数]:id=1&_=1520992883619&', '0:0:0:0:0:0:0:1', '2018-03-14 10:01:57');
INSERT INTO `sys_log` VALUES ('1622', 'admin', 'admin', '[类名]:com.tf.controller.OrganizationController,[方法]:edit,[参数]:id=1&code=1&name=天津市委组织部&seq=0&icon=fi-folder&initStorageSize=2048&address=天津市河西区&pid=&', '0:0:0:0:0:0:0:1', '2018-03-14 10:01:58');
INSERT INTO `sys_log` VALUES ('1623', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:02:12');
INSERT INTO `sys_log` VALUES ('1624', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=25&_=1520992957896&', '0:0:0:0:0:0:0:1', '2018-03-14 10:02:43');
INSERT INTO `sys_log` VALUES ('1625', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=38&_=1520992957897&', '0:0:0:0:0:0:0:1', '2018-03-14 10:02:50');
INSERT INTO `sys_log` VALUES ('1626', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:editPage,[参数]:id=40&_=1520992957898&', '0:0:0:0:0:0:0:1', '2018-03-14 10:02:57');
INSERT INTO `sys_log` VALUES ('1627', 'admin', 'admin', '[类名]:com.tf.controller.UserController,[方法]:edit,[参数]:id=40&loginName=yanjiushi&name=研究室管理员&password=&sex=0&age=0&userType=1&organizationId=25&roleIds=2&phone=&status=0&initStorageSize=300&ip=12.202.0.15&', '0:0:0:0:0:0:0:1', '2018-03-14 10:03:02');
INSERT INTO `sys_log` VALUES ('1628', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:03:14');
INSERT INTO `sys_log` VALUES ('1629', 'shen', 'shen', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:16:55');
INSERT INTO `sys_log` VALUES ('1630', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:18:09');
INSERT INTO `sys_log` VALUES ('1631', 'xinxichu', 'xinxichu', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:18:37');
INSERT INTO `sys_log` VALUES ('1632', 'langliang', 'langliang', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:20:33');
INSERT INTO `sys_log` VALUES ('1633', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:21:12');
INSERT INTO `sys_log` VALUES ('1634', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 10:37:39');
INSERT INTO `sys_log` VALUES ('1635', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:null', '0:0:0:0:0:0:0:1', '2018-03-14 10:57:15');
INSERT INTO `sys_log` VALUES ('1636', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:null', '0:0:0:0:0:0:0:1', '2018-03-14 10:57:23');
INSERT INTO `sys_log` VALUES ('1637', 'liujun', 'liujun', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:null', '0:0:0:0:0:0:0:1', '2018-03-14 11:03:28');
INSERT INTO `sys_log` VALUES ('1638', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:login,[参数]:null', '0:0:0:0:0:0:0:1', '2018-03-14 11:23:43');
INSERT INTO `sys_log` VALUES ('1639', 'admin', 'admin', '[类名]:com.tf.controller.LoginController,[方法]:logout,[参数]:', null, '2018-03-14 11:46:12');

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
INSERT INTO `user` VALUES ('25', 'shen', '申', 'c890e705554e1d02ef95a1da7028a356', '023cda5b-c018-45e9-b809-dd38e927ebeb', '0', '0', '', null, '', '1', '0', '25', '2018-03-13 16:08:54', '123456');
INSERT INTO `user` VALUES ('26', 'xinxichu', '信息处', '81da4fda24675429bcadde7df7a43be7', '51912d35-899b-49ef-9bb0-c241c8596968', '0', '0', '', null, '', '1', '0', '18', '2018-01-31 17:20:37', '123456');
INSERT INTO `user` VALUES ('27', 'liujun', '刘军', 'da1c92a3bab219f9facb7ad16f8bf74c', '7581c08d-9b14-4f12-bfcb-6bd8fb349c9f', '0', '0', '', null, '0:0:0:0:0:0:0:1', '1', '0', '18', '2018-01-31 17:20:57', '123456');
INSERT INTO `user` VALUES ('28', 'langliang', '郎亮', '4df65f1971ab8c5530e4131c5c54d250', '04b75cd3-b8c9-4230-a5b6-0f24992d04e3', '0', '0', '', null, '', '1', '0', '18', '2018-01-31 17:21:17', '123456');
INSERT INTO `user` VALUES ('30', 'luojiaqi', '罗加奇', 'de82aa761a453ce66fbe27b35677584e', '2cffe6a5-07a5-430c-be91-e3f5a607847d', '1', '0', '', null, '', '1', '0', '18', '2018-02-08 17:23:30', '123456');
INSERT INTO `user` VALUES ('31', 'diguanqiang', '狄冠强', '95da532120f34d2c0736d6281e4c1b31', 'c5723ba9-f068-440a-b4a8-8da62b01cb50', '0', '0', '', null, '10.12.18.46', '1', '0', '18', '2018-02-08 17:24:08', '123456');
INSERT INTO `user` VALUES ('32', 'zhangaiyu', '张艾宇', '67495ab374d18c24a621f442d72e52fd', 'b5ed390e-7d88-4706-9c00-1fc5a7f3986b', '0', '0', '', null, '10.12.18.74', '1', '0', '18', '2018-02-08 17:25:46', '123456');
INSERT INTO `user` VALUES ('33', 'zhengfei', '郑飞', '5621b72507da3315bfe93e2e606c42b6', 'c8a5b58d-f984-4da8-bb81-e19124fd1645', '0', '0', '13888888888', null, '10.12.18.185', '1', '0', '18', '2018-02-08 17:26:49', '123456');
INSERT INTO `user` VALUES ('35', 'lixiang', '李翔', 'fd9fd06fa6db05df15a5e0499da41cc7', 'fcb13906-d02a-4931-93a1-8ac05a3f0ec3', '0', '0', '', null, '10.12.18.150', '1', '0', '18', '2018-02-08 17:57:25', '123456');
INSERT INTO `user` VALUES ('36', 'bangongshi', '科员', '2fa9d67e0a9d45b5c823d991aae05c98', 'b96b8311-3dd2-48d1-8b25-d5e53bc28a71', '0', '0', '', null, '192.168.43.29', '1', '0', '19', '2018-02-23 17:39:32', '123456');
INSERT INTO `user` VALUES ('37', 'zuzhiyichu', '组织1', '96f2024805c3b339bf03dbec00ec7643', '0c783665-7126-4e73-bed0-893f17499a1e', '0', '0', '', null, '', '1', '0', '22', '2018-02-26 16:55:22', '123456');
INSERT INTO `user` VALUES ('38', 'zhangsan', '张三', '0f6bf7c2668cb29108480471ff572996', '4531c92b-dd7e-4fc4-bc0f-40b385696ec9', '0', '0', '', null, '12.202.0.2', '1', '0', '19', '2018-03-06 09:59:05', '123456');
INSERT INTO `user` VALUES ('40', 'yanjiushi', '研究室管理员', '4c09f613473e9d7df267d998320035be', 'd4e86445-656a-4faa-941e-3dc5efceca24', '0', '0', '', null, '12.202.0.15', '1', '0', '25', '2018-03-13 17:05:49', '123456');

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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('124', '1', '1');
INSERT INTO `user_role` VALUES ('152', '26', '2');
INSERT INTO `user_role` VALUES ('131', '27', '3');
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
