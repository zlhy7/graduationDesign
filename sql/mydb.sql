/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 18/05/2019 17:06:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `car_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '汽车id',
  `car_cd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '汽车cd',
  `car_brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汽车品牌',
  `car_model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汽车型号',
  `car_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汽车车牌',
  `car_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汽车颜色',
  `CREATE_USER` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime(6) NULL DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` datetime(6) NULL DEFAULT NULL COMMENT '最后更新时间',
  `LAST_UPDATE_USER` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `DEL_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `REMARKS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`car_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('133052a0ab0e4c09b14da224aa473c94', 'CAR0000009', '宝马', 'x666', '陕A · XM666', '#ffffff', NULL, '2019-05-15 23:20:15.950000', '2019-05-15 23:20:15.950000', NULL, '0', '第一个车');
INSERT INTO `car` VALUES ('168176bf98414bc0bb69c469eb4aa100', 'car000000', '宝马', 'x666', '陕A · XM666', '#ffffff', NULL, '2019-05-15 23:01:22.187000', '2019-05-15 23:01:22.187000', NULL, '0', '第一个车');
INSERT INTO `car` VALUES ('f4682e9416724149bbf12bc482b19d3a', 'CAR0000007', '宝马', 'x666', '陕A · XM666', '#ffffff', NULL, '2019-05-15 23:10:27.457000', '2019-05-15 23:10:27.457000', NULL, '0', '第一个车');

-- ----------------------------
-- Table structure for sys_auto_generate_coding
-- ----------------------------
DROP TABLE IF EXISTS `sys_auto_generate_coding`;
CREATE TABLE `sys_auto_generate_coding`  (
  `auto_generate_coding_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表id',
  `cd_english_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `cd_chinese_desc` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文描述',
  `cd_prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀',
  `cd_current_num` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前数字',
  `cd_length` int(11) NULL DEFAULT NULL COMMENT '长度',
  `cd_time_format` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'noNeed' COMMENT '时间格式,notTime代表没有时间格式',
  `cd_start_num` int(11) NULL DEFAULT 0 COMMENT '从0还是1开始',
  `del_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`auto_generate_coding_id`) USING BTREE,
  UNIQUE INDEX `uk_cd_english_name`(`cd_english_name`) USING BTREE COMMENT '英文名唯一'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动编码对应表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auto_generate_coding
-- ----------------------------
INSERT INTO `sys_auto_generate_coding` VALUES ('c19a1d2c749811e9b85500e04c83917e', 'CAR_CD', '汽车编码', 'CAR', '0000011', 7, 'notTime', 0, '0', '汽车编码备注', 'admin', '2019-05-12 17:31:44', 'admin', '2019-05-15 23:20:16');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_cd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户cd',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `secret_key` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密秘钥',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `head_portrait` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户头像',
  `del_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `last_update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `un_login_name`(`login_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('bdf5abe2794b11e996cf98eecb60554b', 'USER000001', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfab260794b11e996cf98eecb60554b', 'USER000001', 'admin1', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfab53e794b11e996cf98eecb60554b', 'USER000001', 'admin2', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfab653794b11e996cf98eecb60554b', 'USER000001', 'admin3', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfab819794b11e996cf98eecb60554b', 'USER000001', 'admin4', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfab8d4794b11e996cf98eecb60554b', 'USER000001', 'admin5', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfab9c0794b11e996cf98eecb60554b', 'USER000001', 'admin6', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfaba23794b11e996cf98eecb60554b', 'USER000001', 'admin7', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfabb31794b11e996cf98eecb60554b', 'USER000001', 'admin8', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfabd37794b11e996cf98eecb60554b', 'USER000001', 'admin9', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfabe42794b11e996cf98eecb60554b', 'USER000001', 'admin10', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac090794b11e996cf98eecb60554b', 'USER000001', 'admin11', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac137794b11e996cf98eecb60554b', 'USER000001', 'admin12', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac19a794b11e996cf98eecb60554b', 'USER000001', 'admin13', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac1f3794b11e996cf98eecb60554b', 'USER000001', 'admin14', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac249794b11e996cf98eecb60554b', 'USER000001', 'admin15', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac297794b11e996cf98eecb60554b', 'USER000001', 'admin16', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac375794b11e996cf98eecb60554b', 'USER000001', 'admin17', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac4d4794b11e996cf98eecb60554b', 'USER000001', 'admin18', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac549794b11e996cf98eecb60554b', 'USER000001', 'admin19', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac61c794b11e996cf98eecb60554b', 'USER000001', 'admin20', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac6f3794b11e996cf98eecb60554b', 'USER000001', 'admin21', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac7d4794b11e996cf98eecb60554b', 'USER000001', 'admin22', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac8a8794b11e996cf98eecb60554b', 'USER000001', 'admin23', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfac97c794b11e996cf98eecb60554b', 'USER000001', 'admin24', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfaca56794b11e996cf98eecb60554b', 'USER000001', 'admin25', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacb37794b11e996cf98eecb60554b', 'USER000001', 'admin26', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacb94794b11e996cf98eecb60554b', 'USER000001', 'admin27', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacbec794b11e996cf98eecb60554b', 'USER000001', 'admin28', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfaccca794b11e996cf98eecb60554b', 'USER000001', 'admin29', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacda1794b11e996cf98eecb60554b', 'USER000001', 'admin30', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdface78794b11e996cf98eecb60554b', 'USER000001', 'admin31', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacf4f794b11e996cf98eecb60554b', 'USER000001', 'admin32', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacfa5794b11e996cf98eecb60554b', 'USER000001', 'admin33', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfacffd794b11e996cf98eecb60554b', 'USER000001', 'admin34', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');
INSERT INTO `sys_user` VALUES ('bdfad056794b11e996cf98eecb60554b', 'USER000001', 'admin35', '21232f297a57a5a743894a0e4a801fc3', '', '管理员', '1', '123456', '没图', '0', '', 'admin', '2019-05-18 17:02:56', 'admin', '2019-05-18 17:02:56');

SET FOREIGN_KEY_CHECKS = 1;
