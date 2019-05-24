/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.18 : Database - mydb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mydb`;

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `car_id` varchar(36) NOT NULL COMMENT '汽车id',
  `car_cd` varchar(20) NOT NULL COMMENT '汽车cd',
  `car_brand` varchar(255) DEFAULT NULL COMMENT '汽车品牌',
  `car_model` varchar(20) DEFAULT NULL COMMENT '汽车型号',
  `car_number` varchar(10) DEFAULT NULL COMMENT '汽车车牌',
  `car_color` varchar(20) DEFAULT NULL COMMENT '汽车颜色',
  `CREATE_USER` varchar(36) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime(6) DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` datetime(6) DEFAULT NULL COMMENT '最后更新时间',
  `LAST_UPDATE_USER` varchar(36) DEFAULT NULL COMMENT '更新人',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标记',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`car_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `car` */

insert  into `car`(`car_id`,`car_cd`,`car_brand`,`car_model`,`car_number`,`car_color`,`CREATE_USER`,`CREATE_DATE`,`LAST_UPDATE_DATE`,`LAST_UPDATE_USER`,`DEL_FLAG`,`REMARKS`) values 
('133052a0ab0e4c09b14da224aa473c94','CAR0000009','宝马','x666','陕A · XM666','#ffffff',NULL,'2019-05-15 23:20:15.950000','2019-05-15 23:20:15.950000',NULL,'0','第一个车'),
('168176bf98414bc0bb69c469eb4aa100','car000000','宝马','x666','陕A · XM666','#ffffff',NULL,'2019-05-15 23:01:22.187000','2019-05-15 23:01:22.187000',NULL,'0','第一个车'),
('f4682e9416724149bbf12bc482b19d3a','CAR0000007','宝马','x666','陕A · XM666','#ffffff',NULL,'2019-05-15 23:10:27.457000','2019-05-15 23:10:27.457000',NULL,'0','第一个车');

/*Table structure for table `sys_auto_generate_coding` */

DROP TABLE IF EXISTS `sys_auto_generate_coding`;

CREATE TABLE `sys_auto_generate_coding` (
  `auto_generate_coding_id` varchar(36) NOT NULL COMMENT '表id',
  `cd_english_name` varchar(30) DEFAULT NULL COMMENT '英文名',
  `cd_chinese_desc` varchar(30) DEFAULT NULL COMMENT '中文描述',
  `cd_prefix` varchar(10) DEFAULT NULL COMMENT '前缀',
  `cd_current_num` varchar(30) DEFAULT NULL COMMENT '当前数字',
  `cd_length` int(11) DEFAULT NULL COMMENT '长度',
  `cd_time_format` varchar(20) DEFAULT 'noNeed' COMMENT '时间格式,notTime代表没有时间格式',
  `cd_start_num` int(11) DEFAULT '0' COMMENT '从0还是1开始',
  `del_flag` varchar(2) DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(36) DEFAULT NULL COMMENT '修改人',
  `last_update_date` datetime(6) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`auto_generate_coding_id`) USING BTREE,
  UNIQUE KEY `uk_cd_english_name` (`cd_english_name`) USING BTREE COMMENT '英文名唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='自动编码对应表';

/*Data for the table `sys_auto_generate_coding` */

insert  into `sys_auto_generate_coding`(`auto_generate_coding_id`,`cd_english_name`,`cd_chinese_desc`,`cd_prefix`,`cd_current_num`,`cd_length`,`cd_time_format`,`cd_start_num`,`del_flag`,`remarks`,`create_user`,`create_date`,`last_update_user`,`last_update_date`) values 
('c19a1d2c749811e9b85500e04c83917e','CAR_CD','汽车编码','CAR','0000011',7,'noNeed',0,'0','汽车编码备注','admin','2019-05-12 17:31:44.000000','admin','2019-05-15 23:20:16.000000'),
('c19a1d2c796311e9b85500e04c83917e','DICT_CD','字典编码','DICT','000021',6,'noNeed',0,'0','字典编码备注','admin','2019-05-20 21:47:34.000000','admin','2019-05-22 22:33:28.000000'),
('c19a1d2c796356qew85500e04c83917e','USER_CD','用户编码','USER','000011',6,'noNeed',0,'0','人员编码','admin','2019-05-20 21:47:34.000000','admin','2019-05-23 06:42:31.638000');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `dict_id` varchar(36) NOT NULL COMMENT '字典id',
  `sys_dict_bean_cd` varchar(20) DEFAULT NULL COMMENT '字典cd',
  `dict_chinese_desc` varchar(255) DEFAULT NULL COMMENT '中文描述',
  `dict_english_name` varchar(20) DEFAULT NULL COMMENT '英文名',
  `dict_key` varchar(30) DEFAULT NULL COMMENT '键',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '值',
  `del_flag` varchar(2) DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(36) DEFAULT NULL COMMENT '修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`dict_id`,`sys_dict_bean_cd`,`dict_chinese_desc`,`dict_english_name`,`dict_key`,`dict_value`,`del_flag`,`remarks`,`create_user`,`create_date`,`last_update_user`,`last_update_date`) values 
('01c97684b12345d8b535933330c51e68','DICT000019','是否','YES_NO','1','是','0','',NULL,'2019-05-22 22:33:28',NULL,'2019-05-22 22:33:28'),
('0e312c1093bd42d5baabb6b7b41a4df0','DICT000020','是否','YES_NO','0','否','0','',NULL,'2019-05-22 22:33:28',NULL,'2019-05-22 22:33:28'),
('2b4e979955034085886ca284b9d55572','DICT000016','性别','USER_SEX','2','女','0','',NULL,'2019-05-21 07:23:29',NULL,'2019-05-21 07:23:29'),
('55f4435cbb4d4c519f1e9c187d7b78d2','DICT000012','性别','USER_SEX','1','男','0','',NULL,'2019-05-21 07:22:33',NULL,'2019-05-21 07:22:33');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` varchar(36) NOT NULL COMMENT '用户id',
  `user_cd` varchar(20) DEFAULT NULL COMMENT '用户cd',
  `login_name` varchar(30) DEFAULT NULL COMMENT '登录名',
  `login_password` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `secret_key` varchar(8) DEFAULT NULL COMMENT '加密秘钥',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `user_sex` varchar(2) DEFAULT NULL COMMENT '用户性别',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '用户电话',
  `head_portrait` longtext COMMENT '用户头像',
  `del_flag` varchar(2) DEFAULT NULL COMMENT '删除标记',
  `create_user` varchar(36) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_user` varchar(36) DEFAULT NULL COMMENT '修改人',
  `last_update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `un_login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`user_cd`,`login_name`,`login_password`,`secret_key`,`real_name`,`user_sex`,`user_phone`,`head_portrait`,`del_flag`,`create_user`,`create_date`,`last_update_user`,`last_update_date`,`remarks`) values 
('0cd20ea8a1ce47fda86266df8a988886','USER000010','renyong','c33367701511b4f6020ec61ded352059',NULL,'任勇','1','17691390880',NULL,'0',NULL,'2019-05-23 06:43:01',NULL,'2019-05-23 06:43:01',NULL),
('bdf5abe2794b11e996cf98eecb60554b','USER000001','admin','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfab260794b11e996cf98eecb60554b','USER000001','admin1','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfab53e794b11e996cf98eecb60554b','USER000001','admin2','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfab653794b11e996cf98eecb60554b','USER000001','admin3','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfab819794b11e996cf98eecb60554b','USER000001','admin4','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfab8d4794b11e996cf98eecb60554b','USER000001','admin5','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfab9c0794b11e996cf98eecb60554b','USER000001','admin6','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfaba23794b11e996cf98eecb60554b','USER000001','admin7','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfabb31794b11e996cf98eecb60554b','USER000001','admin8','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfabd37794b11e996cf98eecb60554b','USER000001','admin9','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfabe42794b11e996cf98eecb60554b','USER000001','admin10','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56',''),
('bdfac090794b11e996cf98eecb60554b','USER000001','admin11','21232f297a57a5a743894a0e4a801fc3','','管理员','1','123456','没图','0','admin','2019-05-18 17:02:56','admin','2019-05-18 17:02:56','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
