/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : mydb

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 12/05/2019 22:43:30
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
INSERT INTO `car` VALUES ('2fa1sd21fds5f15d61sf55', 'car000000', '宝马', 'x666', '陕A · XM666', '#ffffff', NULL, '2019-05-09 21:55:45.000000', '2019-05-09 21:55:45.000000', NULL, '0', '第一个车');

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
INSERT INTO `sys_auto_generate_coding` VALUES ('c19a1d2c749811e9b85500e04c83917e', 'CAR_CD', '汽车编码', 'CAR', '0000002', 7, 'notTime', 0, '0', '汽车编码备注', 'admin', '2019-05-12 17:31:44', 'admin', '2019-05-12 14:22:18');

SET FOREIGN_KEY_CHECKS = 1;
