/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : erp

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-09-24 19:45:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `e_resource`
-- ----------------------------
DROP TABLE IF EXISTS `e_resource`;
CREATE TABLE `e_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(20) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_resource
-- ----------------------------
INSERT INTO `e_resource` VALUES ('1', '权限管理', '用户管理', '');
INSERT INTO `e_resource` VALUES ('2', '权限管理', '角色管理', '');
INSERT INTO `e_resource` VALUES ('3', '报销管理', '报销审核', null);
INSERT INTO `e_resource` VALUES ('4', '权限管理', '权限管理', null);

-- ----------------------------
-- Table structure for `e_role`
-- ----------------------------
DROP TABLE IF EXISTS `e_role`;
CREATE TABLE `e_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(90) DEFAULT NULL,
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_role
-- ----------------------------
INSERT INTO `e_role` VALUES ('1', '系统管理员', '拥有所有功能权限', '0');
INSERT INTO `e_role` VALUES ('20', '权限管理员', '拥有用户管理、角色管理权限', '0');
INSERT INTO `e_role` VALUES ('21', '报销管理员', '拥有报销审核权限', '0');
INSERT INTO `e_role` VALUES ('22', '一般操作员', '无特殊权限', '0');

-- ----------------------------
-- Table structure for `e_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `e_role_res`;
CREATE TABLE `e_role_res` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` int(11) unsigned NOT NULL DEFAULT '0',
  `resid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_role_res
-- ----------------------------
INSERT INTO `e_role_res` VALUES ('47', '1', '1');
INSERT INTO `e_role_res` VALUES ('48', '1', '2');
INSERT INTO `e_role_res` VALUES ('49', '1', '4');
INSERT INTO `e_role_res` VALUES ('50', '1', '3');
INSERT INTO `e_role_res` VALUES ('51', '20', '1');
INSERT INTO `e_role_res` VALUES ('52', '20', '2');
INSERT INTO `e_role_res` VALUES ('53', '20', '4');
INSERT INTO `e_role_res` VALUES ('54', '21', '3');

-- ----------------------------
-- Table structure for `e_travelreimberse`
-- ----------------------------
DROP TABLE IF EXISTS `e_travelreimberse`;
CREATE TABLE `e_travelreimberse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastmodifytime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastmodifyusername` varchar(64) NOT NULL,
  `travelreason` varchar(1000) NOT NULL,
  `startdate` varchar(100) NOT NULL,
  `enddate` varchar(100) NOT NULL,
  `startplace` varchar(100) NOT NULL,
  `endplace` varchar(100) NOT NULL,
  `leavevehicle` varchar(100) NOT NULL,
  `leavevehiclecost` decimal(10,2) unsigned NOT NULL,
  `returnvehicle` varchar(100) NOT NULL,
  `returnvehiclecost` decimal(10,2) unsigned NOT NULL,
  `accommodationtype` varchar(100) NOT NULL,
  `accommodationcost` decimal(10,2) NOT NULL,
  `accommodationremark` varchar(1000) NOT NULL,
  `subsidytype` varchar(100) NOT NULL,
  `subsidyperday` decimal(10,2) NOT NULL,
  `subsidydays` int(10) unsigned NOT NULL,
  `subsidysum` decimal(10,2) NOT NULL,
  `othercontent` varchar(100) NOT NULL,
  `othercost` decimal(10,2) NOT NULL,
  `sum` decimal(10,2) NOT NULL,
  `state` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_travelreimberse
-- ----------------------------
INSERT INTO `e_travelreimberse` VALUES ('4', 'wangzhen', '王真', '2015-09-16 11:53:41', '2015-09-17 16:48:31', 'wangzhen', '测试2', '2015.09.11', '2015.09.25', '南京', '连云港', '火车', '1888.00', '部门公车', '0.00', '包含他人费用', '12313.00', '测试', '特殊地区', '100.00', '15', '1500.00', '测试2', '9.24', '15710.24', '已发放');
INSERT INTO `e_travelreimberse` VALUES ('6', 'wangjing', '王靖', '2015-09-17 08:49:42', '2015-09-20 19:39:35', 'wangzhen', '测试4', '2015.09.17', '2015.09.22', '泰州', '宿迁', '火车', '12.00', '部门公车', '0.00', '他人统一支付', '0.00', '123', '一般地区', '60.00', '6', '360.00', '测试444', '24.00', '396.00', '待审核');
INSERT INTO `e_travelreimberse` VALUES ('7', 'wangjing', '王靖', '2015-09-17 08:52:31', '2015-09-20 20:23:01', 'wangzhen', '测试555', '2015.09.17', '2015.09.18', '扬州', '徐州', '火车', '22.00', '汽车', '88.00', '仅含个人费用', '91.00', '', '一般地区', '60.00', '2', '120.00', '测试444', '57.00', '378.00', '待审核');
INSERT INTO `e_travelreimberse` VALUES ('10', 'wangzhen', '王真', '2015-09-18 17:22:43', '2015-09-20 20:22:41', 'wangzhen', '测试666', '2015.09.25', '2015.09.30', '南京', '宿迁', '部门公车', '0.00', '火车', '123.00', '包含他人费用', '89.00', '测试一下666', '特殊地区', '100.00', '6', '600.00', '测试一下666', '667.00', '1479.00', '待审核');
INSERT INTO `e_travelreimberse` VALUES ('11', 'wangzhen', '王真', '2015-09-18 18:02:05', '2015-09-20 22:53:02', 'wangzhen', '测试777', '2015.09.03', '2015.09.25', '苏州', '连云港', '火车', '1.00', '汽车', '2.00', '无住宿费用', '0.00', '', '一般地区', '60.00', '23', '1380.00', '测试777', '4.00', '1387.00', '已审核');
INSERT INTO `e_travelreimberse` VALUES ('12', 'wangzhen', '王真', '2015-09-18 21:35:01', '2015-09-18 21:35:01', 'wangzhen', '测试888', '2015.09.18', '2015.09.30', '南京', '宿迁', '火车', '123.00', '部门公车', '0.00', '包含他人费用', '89.00', '测试888', '一般地区', '60.00', '13', '780.00', '测试888', '90.00', '1082.00', '待审核');
INSERT INTO `e_travelreimberse` VALUES ('15', 'wangzhen', '王真', '2015-09-19 13:25:49', '2015-09-19 13:25:49', 'wangzhen', '测试101010', '2015.09.19', '2015.09.20', '镇江', '泰州', '火车', '555.00', '汽车', '777.00', '他人统一支付', '0.00', '测试101010', '一般地区', '60.00', '2', '120.00', '测试999', '8.00', '1460.00', '待审核');
INSERT INTO `e_travelreimberse` VALUES ('16', 'wangzhen', '王真', '2015-09-19 13:28:35', '2015-09-20 20:07:39', 'wangzhen', '测试101010', '2015.09.19', '2015.09.20', '镇江', '泰州', '火车', '555.00', '汽车', '777.00', '他人统一支付', '0.00', '测试101010', '一般地区', '60.00', '2', '120.00', '测试999', '12.00', '1464.00', '待审核');
INSERT INTO `e_travelreimberse` VALUES ('17', 'wangzhen', '王真', '2015-09-19 13:29:50', '2015-09-20 21:55:05', 'wangzhen', '测试111111', '2015.09.19', '2015.09.23', '泰州', '常熟市', '部门公车', '0.00', '火车', '3.00', '无住宿费用', '0.00', '', '一般地区', '60.00', '5', '300.00', '测试1111111', '2.00', '305.00', '已发放');
INSERT INTO `e_travelreimberse` VALUES ('19', 'wangzhen', '王真', '2015-09-19 13:32:04', '2015-09-20 21:57:39', 'wangzhen', '测试131313', '2015.09.19', '2015.09.20', '滨海县', '宿迁', '火车', '45.00', '部门公车', '0.00', '仅含个人费用', '3.00', '', '一般地区', '60.00', '2', '120.00', '测试131313', '17.00', '185.00', '待审核');

-- ----------------------------
-- Table structure for `e_user`
-- ----------------------------
DROP TABLE IF EXISTS `e_user`;
CREATE TABLE `e_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(16) NOT NULL,
  `state` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastlogintime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_user
-- ----------------------------
INSERT INTO `e_user` VALUES ('5', 'xiangyajie', '123', '0', '2015-08-24 09:47:47', '2015-09-09 22:41:32');
INSERT INTO `e_user` VALUES ('6', 'wangzhen', '123', '0', '2015-08-24 09:48:35', '2015-09-21 16:06:03');
INSERT INTO `e_user` VALUES ('7', 'huanghui', '123', '0', '2015-08-25 21:58:22', '2015-09-20 18:30:29');
INSERT INTO `e_user` VALUES ('47', 'yangkai', 'ABC123', '0', '2015-08-30 21:47:32', '2015-09-20 18:30:07');
INSERT INTO `e_user` VALUES ('50', 'shenzhiyi', '123', '0', '2015-09-01 16:22:02', '2015-09-15 14:51:58');
INSERT INTO `e_user` VALUES ('51', 'wushen', '123', '0', '2015-09-01 16:54:41', '2015-09-18 15:20:42');
INSERT INTO `e_user` VALUES ('52', 'shilili', '123', '0', '2015-09-02 11:26:13', '2015-09-02 16:53:25');
INSERT INTO `e_user` VALUES ('53', 'linenghe', '123', '0', '2015-09-02 16:29:41', '2015-09-20 18:30:17');
INSERT INTO `e_user` VALUES ('54', 'wangjing', '123', '0', '2015-09-02 22:55:30', '2015-09-20 20:05:08');
INSERT INTO `e_user` VALUES ('55', 'liujianxing', '123', '0', '2015-09-03 08:09:13', '2015-09-03 08:16:24');
INSERT INTO `e_user` VALUES ('56', 'liming', '123', '0', '2015-09-03 10:52:01', '2015-09-03 10:52:01');
INSERT INTO `e_user` VALUES ('57', 'xuli', '123', '0', '2015-09-04 10:18:37', '2015-09-04 10:18:37');
INSERT INTO `e_user` VALUES ('58', 'houyue', '123', '0', '2015-09-16 16:39:04', '2015-09-16 16:52:35');

-- ----------------------------
-- Table structure for `e_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `e_user_info`;
CREATE TABLE `e_user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '0',
  `organize` varchar(30) NOT NULL,
  `duty` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_user_info
-- ----------------------------
INSERT INTO `e_user_info` VALUES ('5', 'xiangyajie', '向雅洁', '1', '运营支撑中心', '需求管理科', '12312312333', 'xiangxj@njcatv.net');
INSERT INTO `e_user_info` VALUES ('6', 'wangzhen', '王真', '1', '运营支撑中心', '需求管理科', '12312312333', 'wangzhen@qq.com');
INSERT INTO `e_user_info` VALUES ('7', 'huanghui', '黄慧', '1', '运营支撑中心', '需求管理科', '12312312334', 'huhui@qq.cmo');
INSERT INTO `e_user_info` VALUES ('47', 'yangkai', '杨恺', '0', '运营支撑中心', '需求管理科', '13801599425', 'yangk@njcatv.net');
INSERT INTO `e_user_info` VALUES ('50', 'shenzhiyi', '申志毅', '0', '运营支撑中心', '需求管理科', '12312312333', 'shenzhiyi@qq.com');
INSERT INTO `e_user_info` VALUES ('51', 'wushen', '吴珅', '1', '运营支撑中心', '需求管理科', '12312312333', 'wushen@126.com');
INSERT INTO `e_user_info` VALUES ('52', 'shilili', '施立立', '0', '运营支撑中心', '账务结算科', '12312312333', 'shilili@126.com');
INSERT INTO `e_user_info` VALUES ('53', 'linenghe', '李能禾', '0', '运营支撑中心', '规划建设科', '12312312333', 'linenghe@126.com');
INSERT INTO `e_user_info` VALUES ('54', 'wangjing', '王靖', '1', '运营支撑中心', '规划建设科', '12312312333', 'wangjing@126.com');
INSERT INTO `e_user_info` VALUES ('55', 'liujianxing', '刘建兴', '0', '运营支撑中心', '规划建设科', '12312312333', 'liujianxing@qq.com');
INSERT INTO `e_user_info` VALUES ('56', 'liming', '李明', '0', '运营支撑中心', '业务支撑科', '12312312333', 'liming@126.com');
INSERT INTO `e_user_info` VALUES ('57', 'xuli', '徐丽', '1', '运营支撑中心', '业务支撑科', '12312312333', 'xuli@126.com');
INSERT INTO `e_user_info` VALUES ('58', 'houyue', '侯越', '0', '运营支撑中心', '业务支撑科', '12312312333', 'houyue@qq.com');

-- ----------------------------
-- Table structure for `e_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `e_user_role`;
CREATE TABLE `e_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `roleId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of e_user_role
-- ----------------------------
INSERT INTO `e_user_role` VALUES ('1', 'wangzhen', '1');
INSERT INTO `e_user_role` VALUES ('2', 'yangkai', '1');
INSERT INTO `e_user_role` VALUES ('3', 'huanghui', '21');
INSERT INTO `e_user_role` VALUES ('4', 'wushen', '1');
INSERT INTO `e_user_role` VALUES ('5', 'xiangyajie', '22');
INSERT INTO `e_user_role` VALUES ('6', 'shenzhiyi', '22');
INSERT INTO `e_user_role` VALUES ('7', 'shilili', '22');
INSERT INTO `e_user_role` VALUES ('8', 'linenghe', '22');
INSERT INTO `e_user_role` VALUES ('9', 'wangjing', '22');
INSERT INTO `e_user_role` VALUES ('10', 'liujianxing', '22');
INSERT INTO `e_user_role` VALUES ('11', 'liming', '22');
INSERT INTO `e_user_role` VALUES ('12', 'xuli', '22');
INSERT INTO `e_user_role` VALUES ('13', 'houyue', '22');
