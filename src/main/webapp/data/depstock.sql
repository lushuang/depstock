/*
MySQL Backup
Database: depstock
Backup Time: 2017-11-16 19:17:44
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `depstock`.`cp_goods`;
DROP TABLE IF EXISTS `depstock`.`cp_spbrand`;
DROP TABLE IF EXISTS `depstock`.`cp_sptype`;
DROP TABLE IF EXISTS `depstock`.`cp_spunit`;
DROP TABLE IF EXISTS `depstock`.`db_fhdb`;
DROP TABLE IF EXISTS `depstock`.`db_timingbackup`;
DROP TABLE IF EXISTS `depstock`.`erp_customer`;
DROP TABLE IF EXISTS `depstock`.`erp_customerimg`;
DROP TABLE IF EXISTS `depstock`.`erp_intoku`;
DROP TABLE IF EXISTS `depstock`.`erp_level`;
DROP TABLE IF EXISTS `depstock`.`erp_outku`;
DROP TABLE IF EXISTS `depstock`.`erp_remarks`;
DROP TABLE IF EXISTS `depstock`.`sys_dictionaries`;
DROP TABLE IF EXISTS `depstock`.`sys_fhbutton`;
DROP TABLE IF EXISTS `depstock`.`sys_fhlog`;
DROP TABLE IF EXISTS `depstock`.`sys_fhsms`;
DROP TABLE IF EXISTS `depstock`.`sys_loginimg`;
DROP TABLE IF EXISTS `depstock`.`sys_menu`;
DROP TABLE IF EXISTS `depstock`.`sys_role`;
DROP TABLE IF EXISTS `depstock`.`sys_role_fhbutton`;
DROP TABLE IF EXISTS `depstock`.`sys_user`;
DROP TABLE IF EXISTS `depstock`.`sys_userphoto`;
DROP TABLE IF EXISTS `depstock`.`tb_pictures`;
CREATE TABLE `cp_goods` (
  `GOODS_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `BIANMA` varchar(30) DEFAULT NULL COMMENT '商品编码',
  `SPTYPE_ID` varchar(100) DEFAULT NULL COMMENT '商品类别',
  `GOODS_COLOR` varchar(30) DEFAULT NULL COMMENT '商品颜色',
  `GOODS_SIZE` varchar(30) DEFAULT NULL COMMENT '商品尺寸',
  `SPBRAND_ID` varchar(100) DEFAULT NULL COMMENT '品牌',
  `SPUNIT_ID` varchar(100) DEFAULT NULL COMMENT '计量单位',
  `DESCRIPTION` varchar(5000) DEFAULT NULL COMMENT '商品描述',
  `SHORTDESC` varchar(500) DEFAULT NULL COMMENT '简述',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `ZCOUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `cp_spbrand` (
  `SPBRAND_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '品牌管理',
  `BZ` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`SPBRAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `cp_sptype` (
  `SPTYPE_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '商品类别',
  `BZ` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`SPTYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `cp_spunit` (
  `SPUNIT_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '计量单位',
  `BZ` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`SPUNIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `db_fhdb` (
  `FHDB_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `db_timingbackup` (
  `TIMINGBACKUP_ID` varchar(100) NOT NULL,
  `JOBNAME` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `erp_customer` (
  `CUSTOMER_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '姓名',
  `AGE` varchar(10) DEFAULT NULL COMMENT '年龄',
  `PHONE` varchar(100) NOT NULL COMMENT '手机',
  `ADDRESS` varchar(1000) DEFAULT NULL COMMENT '地址',
  `QQ` int(20) NOT NULL COMMENT 'QQ',
  `WEIXIN` varchar(100) DEFAULT NULL COMMENT '微信',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '建档时间',
  `MONEY` int(11) NOT NULL COMMENT '消费金额',
  `LEVEL` varchar(100) DEFAULT NULL COMMENT '级别',
  `REMARKS1` varchar(1000) DEFAULT NULL COMMENT '备注1',
  `REMARKS2` varchar(1000) DEFAULT NULL COMMENT '备注2',
  `USERNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `erp_customerimg` (
  `CUSTOMERIMG_ID` varchar(100) NOT NULL,
  `CDESCRIPTION` varchar(3000) DEFAULT NULL COMMENT '描述',
  `CTIME` varchar(32) DEFAULT NULL COMMENT '记录日期',
  `CUSTOMER_ID` varchar(100) DEFAULT NULL COMMENT '商户ID',
  PRIMARY KEY (`CUSTOMERIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `erp_intoku` (
  `INTOKU_ID` varchar(100) NOT NULL,
  `GOODS_ID` varchar(100) DEFAULT NULL COMMENT '商品ID',
  `INCOUNT` int(11) NOT NULL COMMENT '数量',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ZPRICE` double(11,2) DEFAULT NULL COMMENT '总价',
  `INTIME` varchar(32) DEFAULT NULL COMMENT '入库时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `GOODS_NAME` varchar(100) DEFAULT NULL,
  `INTOKU_NO` varchar(100) DEFAULT NULL COMMENT '入库单号',
  PRIMARY KEY (`INTOKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `erp_level` (
  `LEVEL_ID` varchar(100) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL COMMENT '级别',
  `USERNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LEVEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `erp_outku` (
  `OUTKU_ID` varchar(100) NOT NULL,
  `GOODS_ID` varchar(100) DEFAULT NULL COMMENT '商品ID',
  `INCOUNT` int(11) NOT NULL COMMENT '数量',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ZPRICE` double(11,2) DEFAULT NULL COMMENT '总价',
  `OUTTIME` varchar(32) DEFAULT NULL COMMENT '出库时间',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `BZ` text,
  PRIMARY KEY (`OUTKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `erp_remarks` (
  `REMARKS_ID` varchar(100) NOT NULL,
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REMARKS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_dictionaries` (
  `DICTIONARIES_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_fhlog` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_fhsms` (
  `FHSMS_ID` varchar(100) NOT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL COMMENT '内容',
  `TYPE` varchar(5) DEFAULT NULL COMMENT '类型',
  `TO_USERNAME` varchar(255) DEFAULT NULL COMMENT '收信人',
  `FROM_USERNAME` varchar(255) DEFAULT NULL COMMENT '发信人',
  `SEND_TIME` varchar(100) DEFAULT NULL COMMENT '发信时间',
  `STATUS` varchar(5) DEFAULT NULL COMMENT '状态',
  `SANME_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FHSMS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_loginimg` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sys_userphoto` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `depstock`.`cp_goods` WRITE;
DELETE FROM `depstock`.`cp_goods`;
INSERT INTO `depstock`.`cp_goods` (`GOODS_ID`,`TITLE`,`BIANMA`,`SPTYPE_ID`,`GOODS_COLOR`,`GOODS_SIZE`,`SPBRAND_ID`,`SPUNIT_ID`,`DESCRIPTION`,`SHORTDESC`,`USERNAME`,`ZCOUNT`) VALUES ('60697e8950a54e31935241b756ac8a8f', 'DEPARTURE BP068', 'DEPARTURE BP068', 'c431b3a51fc3405482c71a385a86f68e', '灰色', '10', '6b6fe86938a74be2bf80e5a485d80f57', '906f6fa1e78c4b4993fd44a73d073d26', '<p><img src=\"https://img.alicdn.com/imgextra/i4/2544717968/TB2ix9onmXlpuFjy0FeXXcJbFXa_!!2544717968.jpg_430x430q90.jpg\" alt=\"departure休闲双肩包 经典款旅行包 防泼水面料背包 多重收纳背包\"/></p>', 'departure休闲双肩包 经典款旅行包 防泼水面料背包 多重收纳背包', 'admin', 420),('9171d0adac154a85ac59aa4347f1e250', 'DEPARTURE HD502', 'DEPARTURE HD502', 'd1435cc73f2249ffb9e55680b72519da', '蓝色', '25', '6b6fe86938a74be2bf80e5a485d80f57', '906f6fa1e78c4b4993fd44a73d073d26', '<p><img src=\"https://img.alicdn.com/bao/uploaded/i4/2544717968/TB2doMRoXXXXXcrXpXXXXXXXXXX_!!2544717968.jpg_430x430q90.jpg\" alt=\"departure拉杆箱纯PC万向轮行李箱商务箱子密码箱旅行箱 硬箱男女\"/></p>', 'departure拉杆箱纯PC万向轮行李箱商务箱子密码箱旅行箱 硬箱男女', 'admin', 1749),('b8901a2b3a664bb9a81a36efbe7707e6', 'DEPARTURE HD801', 'DEPARTURE HD801', 'd1435cc73f2249ffb9e55680b72519da', '蓝色', '20', '6b6fe86938a74be2bf80e5a485d80f57', '906f6fa1e78c4b4993fd44a73d073d26', '<p><img src=\"https://img.alicdn.com/imgextra/i1/2544717968/TB2l53jpOpnpuFjSZFkXXc4ZpXa_!!2544717968.jpg_430x430q90.jpg\" alt=\"departure拉杆箱万向轮行李箱旅行箱 商务登机箱密码箱子20寸24寸\"/></p>', 'departure拉杆箱万向轮行李箱旅行箱 商务登机箱密码箱子20寸24寸', 'admin', 500);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`cp_spbrand` WRITE;
DELETE FROM `depstock`.`cp_spbrand`;
INSERT INTO `depstock`.`cp_spbrand` (`SPBRAND_ID`,`NAME`,`BZ`,`USERNAME`) VALUES ('6b6fe86938a74be2bf80e5a485d80f57', 'DEPARTURE', '旅行趣箱包', 'admin');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`cp_sptype` WRITE;
DELETE FROM `depstock`.`cp_sptype`;
INSERT INTO `depstock`.`cp_sptype` (`SPTYPE_ID`,`NAME`,`BZ`,`USERNAME`) VALUES ('c431b3a51fc3405482c71a385a86f68e', '电脑包', '', 'admin'),('d1435cc73f2249ffb9e55680b72519da', '拉杆箱', '', 'admin');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`cp_spunit` WRITE;
DELETE FROM `depstock`.`cp_spunit`;
INSERT INTO `depstock`.`cp_spunit` (`SPUNIT_ID`,`NAME`,`BZ`,`USERNAME`) VALUES ('906f6fa1e78c4b4993fd44a73d073d26', '个', '', 'admin');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`db_fhdb` WRITE;
DELETE FROM `depstock`.`db_fhdb`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`db_timingbackup` WRITE;
DELETE FROM `depstock`.`db_timingbackup`;
INSERT INTO `depstock`.`db_timingbackup` (`TIMINGBACKUP_ID`,`JOBNAME`,`CREATE_TIME`,`TABLENAME`,`STATUS`,`FHTIME`,`TIMEEXPLAIN`,`BZ`) VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', 2, '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务'),('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', 2, '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`erp_customer` WRITE;
DELETE FROM `depstock`.`erp_customer`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`erp_customerimg` WRITE;
DELETE FROM `depstock`.`erp_customerimg`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`erp_intoku` WRITE;
DELETE FROM `depstock`.`erp_intoku`;
INSERT INTO `depstock`.`erp_intoku` (`INTOKU_ID`,`GOODS_ID`,`INCOUNT`,`PRICE`,`ZPRICE`,`INTIME`,`BZ`,`USERNAME`,`GOODS_NAME`,`INTOKU_NO`) VALUES ('0b2c0c148982470ba30cb2d1ed2999ef', '9171d0adac154a85ac59aa4347f1e250', 1749, 500.00, 874500.00, '2017-05-05 20:37:15', 'departure拉杆箱纯PC万向轮行李箱商务箱子密码箱旅行箱 硬箱男女', 'admin', 'DEPARTURE HD502', NULL),('3bb4aa6d3889496491a5558d11683bf8', '60697e8950a54e31935241b756ac8a8f', 1, 100.00, 100.00, '2017-09-18 08:20:35', '1225600', 'admin', 'DEPARTURE BP068', '1505694035670'),('3d3b4ae4240e4e909e8c60a0b98f8660', '60697e8950a54e31935241b756ac8a8f', 500, 299.00, 149500.00, '2017-05-05 20:36:33', 'departure休闲双肩包 经典款旅行包 防泼水面料背包 多重收纳背包', 'admin', 'DEPARTURE BP068', NULL),('d520ff9fd4884ce7a34e09ec7f4d1b27', 'b8901a2b3a664bb9a81a36efbe7707e6', 500, 399.00, 199500.00, '2017-05-05 20:37:45', 'departure拉杆箱万向轮行李箱旅行箱 商务登机箱密码箱子20寸24寸', 'admin', 'DEPARTURE HD801', NULL),('ebad3bee5d34497eb39824bbad0b5755', '60697e8950a54e31935241b756ac8a8f', 20, 100.00, 2000.00, '2017-09-17 22:45:36', 'ceshi', 'admin', 'DEPARTURE BP068', '1505694035671');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`erp_level` WRITE;
DELETE FROM `depstock`.`erp_level`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`erp_outku` WRITE;
DELETE FROM `depstock`.`erp_outku`;
INSERT INTO `depstock`.`erp_outku` (`OUTKU_ID`,`GOODS_ID`,`INCOUNT`,`PRICE`,`ZPRICE`,`OUTTIME`,`GOODS_NAME`,`USERNAME`,`BZ`) VALUES ('54aa470f81ea4efeba94a46c9a683817', '60697e8950a54e31935241b756ac8a8f', 1, 499.00, 499.00, '2017-07-27 15:51:11', 'DEPARTURE BP068', 'admin', '1'),('5d82c5c99d0c412f8335d89bcffc6b4a', '60697e8950a54e31935241b756ac8a8f', 100, 499.00, 49900.00, '2017-05-05 20:39:56', 'DEPARTURE BP068', 'admin', 'departure休闲双肩包 经典款旅行包 防泼水面料背包 多重收纳背包');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`erp_remarks` WRITE;
DELETE FROM `depstock`.`erp_remarks`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_dictionaries` WRITE;
DELETE FROM `depstock`.`sys_dictionaries`;
INSERT INTO `depstock`.`sys_dictionaries` (`DICTIONARIES_ID`,`NAME`,`NAME_EN`,`BIANMA`,`ORDER_BY`,`PARENT_ID`,`BZ`,`TBSNAME`) VALUES ('0193ffbfae1e49e0b7810546cada316a', '济南', 'JiNan', '0030301', 1, '10f46a521ea0471f8d71ee75ac3b5f3a', '济南', ''),('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', 1, 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', ''),('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'ShanDong', '00303', 3, 'be4a8c5182c744d28282a5345783a77f', '山东省', ''),('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', 1, 'be4a8c5182c744d28282a5345783a77f', '北京', ''),('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', 1, '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', ''),('66f1ff79b13947da98525aff7380ef50', '高新区', 'gaoxinqu', '003030101', 1, '0193ffbfae1e49e0b7810546cada316a', '高新区', ''),('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', 1, '0', '分类', ''),('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', 3, '0', '地区', ''),('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', 2, 'be4a8c5182c744d28282a5345783a77f', '上海', ''),('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', 2, '0', '课程', '');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_fhbutton` WRITE;
DELETE FROM `depstock`.`sys_fhbutton`;
INSERT INTO `depstock`.`sys_fhbutton` (`FHBUTTON_ID`,`NAME`,`QX_NAME`,`BZ`) VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL'),('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件'),('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户'),('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信'),('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_fhlog` WRITE;
DELETE FROM `depstock`.`sys_fhlog`;
INSERT INTO `depstock`.`sys_fhlog` (`FHLOG_ID`,`USERNAME`,`CZTIME`,`CONTENT`) VALUES ('000fd410d5db4139a102b1468e55b4ca', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('00b12d4b3f574be68d2f4eea458d77fc', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('016cc7884ea74d48af9ea0f06c75bf23', 'lisi', '2017-05-07 20:02:04', '登录系统'),('02374f71ae99447ca47ac6fcbe0c4a98', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('025b63c77a004e3e997cc8ba219af700', 'admin', '2017-06-03 00:06:16', '登录系统'),('050a0468d6ca434ca1b20d95c975f39a', 'admin', '2017-07-24 15:47:54', '登录系统'),('05cd834d7609467691f5b83bc5fee613', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('0658e4126adf4998ab3d71b0436f4d27', 'admin', '2017-05-05 20:57:55', '删除系统用户：{USER_ID=7f2d91ca7ed448f8bd0546dd5f12b184, tm=1493989075474}'),('06b4c63f4e554bf6ae8bb2808d73a209', 'lisi', '2017-05-05 20:43:19', '登录系统密码或用户名错误'),('06e9ad3befdd425a90a01909f00eae74', 'admin', '2017-08-04 16:42:55', '新增按钮权限pd{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=7f189298a06f44feb04d14ca09619d70, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1501836279408}'),('06ea74d827404abdbbd48f298161ec3e', 'admin', '2017-05-05 21:03:31', '修改add_qx权限，角色ID为:288278570647499587af059d75002f67'),('0729e162ce4e4dc68fead61233d3dde7', 'admin', '2017-07-26 11:12:23', '登录系统'),('0750876eb89b42aca646a1ad29af8aaf', 'admin', '2017-07-27 16:15:21', '退出'),('08107b25f79b416d8aaa77de0510d70b', 'admin', '2017-09-18 08:19:36', '登录系统'),('084f24dbcc50497399c655c7afac57a1', 'admin', '2017-05-05 23:21:44', '登录系统'),('08863bddd6b942afb776387af0b2f00e', 'admin', '2017-09-18 08:11:03', '修改菜单客户管理'),('08cef5448b9d447fbbc0e037f8c97dba', 'admin', '2017-05-07 19:35:34', '登录系统'),('092a57210de94074acfa3134b4a7c331', 'admin', '2017-05-05 20:02:48', '登录系统'),('0a3502a8917d417997bbee0b90d952ff', 'zhangsan', '2017-05-05 20:40:35', '登录系统密码或用户名错误'),('0b48b3626b3f427c9ab9976a166549e1', 'admin', '2017-05-05 20:12:39', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=71afa4982e8d459faeb8fee76357b1ba, ROLE_ID=e6543004da8044879d848bd56d1b4775, guid=1493986359228}'),('0b627a76fc1043b28ab29863639554f8', 'admin', '2017-05-05 20:15:19', '新增系统用户：lushuang'),('0b68829d318248bf94ad5c3e8073c322', 'admin', '2017-05-05 21:03:21', '修改edit_qx权限，角色ID为:288278570647499587af059d75002f67'),('0da1c87b1056478aa629a7707a2bca2e', 'admin', '2017-05-05 21:19:11', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=f72dafea21c94483aae291db055d3588, ROLE_ID=b0305d75ce1c43268f1d938b5873afe9, guid=1493990351593}'),('0e171c4c9ada4355afec5243170d99e2', 'admin', '2017-05-05 20:11:49', '修改角色菜单权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('0e4c864632e14069a4969fd2cccbc505', 'admin', '2017-05-05 20:04:04', '修改系统用户：admin'),('0f59e28efbb04ef496c5b94aed076ca3', 'admin', '2017-08-20 10:38:30', '退出'),('0fa3d7ddcac64374808c32ac0ebb7ff9', 'admin', '2017-07-19 20:28:30', '登录系统'),('100ed5b34de24cf18cb9dbef4a192e88', 'admin', '2017-05-05 20:05:11', '删除角色ID为:d38ece06b52b4241957140e47f1d4c44'),('10bae15954ee4aec8626837091dad923', 'zhangsan', '2017-05-05 20:44:43', '登录系统密码或用户名错误'),('1138a67b0b504c7e82e4f44745f24bfe', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('114af57aef594cb49294ccd6ec193ed3', 'admin', '2017-05-05 21:02:41', '修改cha_qx权限，角色ID为:ecce094d0b86426f9b87d95929ce9115'),('11d73f9954a4445e8a242220919c9240', 'admin', '2017-05-05 20:18:39', '修改角色菜单权限，角色ID为:51dec32cd35e4ad5801bf8ccdcd36614'),('11d7be77d7364ae98b4dc5e1a2d61536', 'zhangsan', '2017-05-05 21:17:42', '退出'),('11fd7d44b854434a9c36b354b95f821f', 'admin', '2017-05-05 21:18:36', '登录系统'),('1241d49c3654439ea56a12360fe12849', 'lisi', '2017-07-19 21:15:57', '退出'),('12b02d003c444add9ad7a670a7785908', 'admin', '2017-09-03 13:39:35', '登录系统'),('1379ae3c408245ea8fbca3efef659616', 'admin', '2017-05-05 20:56:43', '登录系统密码或用户名错误'),('13c138b3b59047c49342f7f0769c445e', 'lisi', '2017-05-07 20:02:47', '退出'),('144ff1091db147c8a53c607265eeefd2', 'admin', '2017-07-17 00:24:55', '登录系统'),('146c0ff5f2024b5598bbf7d30ce503ba', 'admin', '2017-08-20 10:38:03', '登录系统'),('14ddd307021c4944a864aadad4654bc1', 'admin', '2017-05-05 20:17:00', '导出用户信息到EXCEL'),('14fdbf97e12b4de69847d9d7860dc333', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('1514defb63b141a892537c6184e25c1f', 'lushuang', '2017-05-05 20:42:20', '退出'),('1627e0b56f60484cbc1c5ca2442aed17', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('16fccb0cd50746c29da4852f8790e650', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('1700d418cafc4022bed3902221bb750d', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('178e9f2ff4084ceea9294e8a34b8a3c9', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('17cdcc3ad1af4dd59363affaa8c22948', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('182f7bf4be6e4ab4893c97fcecb002d8', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('187c13b1a9bd4549a9da25b304ee1731', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('19fdd9e3fc1d440890d21f7562733534', 'admin', '2017-05-05 20:56:40', '登录系统密码或用户名错误'),('1ac8f06b12a346cfb03a10252957368d', 'admin', '2017-05-07 20:02:27', '修改角色菜单权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('1b74a8e8f2964179964acbc557bb3b42', 'admin', '2017-05-05 20:09:56', '修改角色菜单权限，角色ID为:6f81614977f64e079461796ed54a8e0e'),('1bf46c4197584bfeb2552c3df9ace1a8', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('1ceb65d9bbe449e7a90e7e538415f01c', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('1d17602e0cc94fd5a564829bacb05625', 'admin', '2017-05-05 20:12:12', '新增按钮权限pd{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=96584ea2a2d948a6a96a026071dff12f, ROLE_ID=afc305be4af44267b0f27e41413dfb7d, guid=1493986331936}'),('1e0933c5e4a34d07961b4b9ecda2c116', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('1e760ceb88aa4af8947fed47cb1e8f57', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('1f2a08e3ff65495ea395f87f6ce43436', 'admin', '2017-09-17 22:44:58', '登录系统'),('1f5ed691c08a480cbe0babec80533cd4', 'admin', '2017-05-05 21:01:47', '登录系统密码或用户名错误'),('1faf61cd1353433d914398f5f5e5322c', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('1fb3f4d44f404d4da689a32c1e370534', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('2201c9ceb7c64e76927f773bc753dbf0', 'zhangsan', '2017-05-07 20:00:12', '退出'),('2240ff6c09e444b182e01a4105059ae4', 'admin', '2017-05-05 21:01:06', '退出'),('2272a149c8984281a45bdf872518985e', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('22a4cc5ac72c4f6da56870cf9e0a04fc', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('23a3a1b159764be49fe8e36edd1a1a11', 'admin', '2017-08-21 17:11:21', '登录系统'),('23cafa5310ba467d919f7c63331f5499', 'admin', '2017-08-15 22:28:34', '登录系统'),('24dbb599dc1d42f0a690e4dcb5ad3630', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('261677c09b004cb9806fda80752affca', 'zhangsan', '2017-05-05 20:43:00', '登录系统密码或用户名错误'),('264f84155de74e1899241946eba8bdcd', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('26af169e8a3d48eba739e57c757bfee1', 'admin', '2017-07-26 10:20:07', '登录系统'),('26c82bab5fc64e8090d01763e17baeed', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('276e6a24280c4fd89dec04e4bb093925', 'admin', '2017-05-05 20:11:09', '修改角色菜单权限，角色ID为:765e3b9c335847489b64f0ba22eb08ab'),('27d9f97cd2824a578a5ed60042950c60', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('29a7066d23a943a5b18d75f3944daf06', 'admin', '2017-09-17 21:23:18', '登录系统'),('29e6554e112d4f38878d75b2e4b9f5a5', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('29f188db068547b2b70ce33981c9a335', 'admin', '2017-05-05 21:02:24', '修改add_qx权限，角色ID为:ecce094d0b86426f9b87d95929ce9115'),('2a22c0e932c0433e8452ce69e96fc4ff', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('2a3e74004ab04b069c360d8cfff840f2', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('2a487b1c930c446590812b3ddd1b2ad5', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('2b0d75c594f54d4c856b34613ae1614f', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('2bc1fd5b4ef047c28a267b0ce1b5901b', 'admin', '2017-05-05 20:17:33', '新增角色:仓库管理员'),('2c677b9441db48aea9bce98af155fefc', 'admin', '2017-09-18 08:12:29', '修改菜单数据库管理'),('2d7c8cacf5be4a28966344a3d714996f', 'admin', '2017-08-20 10:38:58', '登录系统'),('2d7ed4797291480f83db2df88658d174', 'admin', '2017-08-21 17:12:24', '退出'),('2db50e15bf2c49a5af605a4d133ae2c8', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('2f3eb2e8f38447e584748d9d0db66f8b', 'admin', '2017-08-12 17:13:28', '退出'),('2fb7696a42854e72b5299b38953742a2', 'zhangsan', '2017-05-07 19:58:46', '登录系统'),('33585eda83414789befc897395e9611d', 'admin', '2017-07-19 21:15:44', '修改del_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('336b6fb215cb4fce81f1c9b98b6d5a92', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('34807bc74df24b20972e41da5b4131c4', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('35816a86c1844f309295835eb3e13220', 'lisi', '2017-07-19 20:45:11', '登录系统'),('3763d97d95054c609b4201e62e523dec', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('380d8bdcaa164099925eefbede2a22f8', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('382be5ada99245fbb128e3bfe8620802', 'admin', '2017-05-05 20:59:06', '退出'),('3833dba3ec48430e9fdb3ac455347399', 'admin', '2017-08-01 14:33:22', '登录系统'),('3a58d702f91b49ebaec9ef580b2bef62', 'admin', '2017-07-27 16:02:44', '登录系统'),('3ac031addf884b75962a7cbb9bc3569b', 'admin', '2017-05-05 20:12:21', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=383a1085d3ef4b449e8f72db9458d92b, ROLE_ID=765e3b9c335847489b64f0ba22eb08ab, guid=1493986341349}'),('3b32a433e2b0430ab06d7ea02b49a048', 'admin', '2017-05-05 22:20:48', '登录系统'),('3b3c076545124361b35e66b571717944', 'admin', '2017-05-05 20:08:06', '新增角色:天猫1号仓库管理员'),('3b3ec589fd8c4092863519039d4b8e8d', 'admin', '2017-09-03 17:22:06', '登录系统'),('3b5ed20fc6d14936bdafee5fc88586b6', 'admin', '2017-05-05 20:12:21', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=66a73659c42c4ca8a0dcca4e9d6a338e, ROLE_ID=85f233dc9c09489ca36ffa4c26590179, guid=1493986341866}'),('3c5e189487ae450db31772810c98549b', 'admin', '2017-05-05 20:10:08', '修改角色菜单权限，角色ID为:a1cd9fef532c41088b3a3c7658dcf542'),('3d18be8734764991a9e699d254ebc7cc', 'zhangsan', '2017-05-05 20:42:38', '登录系统密码或用户名错误'),('3d60c8b0a7df403cbca9635f7c3ce2b8', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('3d73e48f60f44bb8bacecd2d81f2a9ca', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('3e103e4c20544f8fa09443318f288fcd', 'admin', '2017-07-19 20:36:53', '登录系统'),('3fc6ad227ce9496bb27ba764da34c82b', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('4221bb747b954fe4aae6391ae6c43baf', 'admin', '2017-07-19 13:53:51', '登录系统'),('424c23b2e64a482aa4ebadbab90698bb', 'admin', '2017-07-17 00:52:26', '登录系统'),('42b25cb49542431b86d65f73cec99c81', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('4350817c9b7f4e6db65b47d582e85469', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('43b79085e5f74803ae528e4c4127046e', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('4435c7976a5e4355890361477cd0413b', 'admin', '2017-05-07 19:56:41', '删除角色ID为:288278570647499587af059d75002f67'),('450184a0bc3443fc93f257d4be1f58fa', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('4572bf6ddde3421d8b45c7a30f277bbe', 'admin', '2017-05-05 20:20:49', '新增系统用户：李四'),('46464354cc5e48889b2e4404e26fc483', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('464ee557a6a44841b959aca61e07421c', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('467292a26f8545b4a0f3da388bde8de2', 'admin', '2017-05-07 19:59:51', '修改add_qx权限，角色ID为:85f233dc9c09489ca36ffa4c26590179'),('46a5717d9c01452fbba112cdb5af1fd5', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('4701bae7bb474c9786c4322cea6cb75b', 'admin', '2017-05-05 20:12:26', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=8725e6bf94a7474c9b46782acba8c19c, ROLE_ID=765e3b9c335847489b64f0ba22eb08ab, guid=1493986346164}'),('47ce0f3645b64c3182cb86edf56987ca', 'lisi', '2017-07-19 21:14:23', '登录系统'),('48d72de203784de4aaa370563d1d6f5a', 'admin', '2017-05-05 20:10:48', '修改角色菜单权限，角色ID为:afc305be4af44267b0f27e41413dfb7d'),('4aa5fd10f5d049f386631292b35ef26f', 'admin', '2017-05-05 20:18:56', '修改角色菜单权限，角色ID为:2'),('4b19ba6a7e1b4b2d92b5f0dd60ac0e39', 'lushuang', '2017-07-19 20:31:52', '登录系统'),('4b3e75c9d3c0424fa888149f3e7ccb12', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('4bd6555a5ca244c6ab42099243804727', 'admin', '2017-05-05 20:12:22', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=dc0b763133bd4f0eba1dbcfe64e483c0, ROLE_ID=a1cd9fef532c41088b3a3c7658dcf542, guid=1493986342467}'),('4bdcfbf85b254cb1806ee98824addff8', 'admin', '2017-05-05 20:11:58', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=7f4a031f3a7443a8b773afa9d7a41e6e, ROLE_ID=0dc21f6f55db4b8baf0c46aed7836b6c, guid=1493986318425}'),('4d39d9404ca64f5086e7f4e982a10484', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('4df45d64a5894492b4f05d29facd3df1', 'admin', '2017-05-05 21:02:53', '修改add_qx权限，角色ID为:b0305d75ce1c43268f1d938b5873afe9'),('4e475af03cb14fa5ab53664a4b2493d7', 'admin', '2017-07-27 16:00:39', '登录系统'),('4f047b7622364b7aa1c3fadbb1ea5c06', 'zhangsan', '2017-05-05 20:40:50', '登录系统密码或用户名错误'),('500f61ee16c14be5bd1c22def0aeed47', 'admin', '2017-05-05 21:02:30', '修改del_qx权限，角色ID为:ecce094d0b86426f9b87d95929ce9115'),('50359dffa37642d98af9de028c671b6e', 'admin', '2017-05-05 20:20:04', '新增系统用户：张三'),('5152271987994f0eae92eac5270a6680', 'admin', '2017-07-19 20:47:05', '修改add_qx权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('51869c22e83149559a98fdf83fea5b86', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('520dfac27acb4429adde26d9e493f318', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('52da3e596384477fbe8c33a458f96e6c', 'admin', '2017-05-07 20:02:37', '修改del_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('530e1656be914b9982b4765845e06f90', 'admin', '2017-07-26 11:24:30', '登录系统'),('539d7c826b6b43569a4d95848f9cc8e6', 'admin', '2017-07-19 20:47:25', '修改cha_qx权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('5465b1f7b2784144b0221206ff9157f8', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('54f011b008cc4b8e994d71f21f6d74d2', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('554bfeb147ae47ea95e001dd5ab365cf', 'admin', '2017-05-05 20:10:00', '修改角色菜单权限，角色ID为:765e3b9c335847489b64f0ba22eb08ab'),('5551c21cf470430e89700d097242ddd2', 'admin', '2017-05-05 21:03:25', '修改cha_qx权限，角色ID为:288278570647499587af059d75002f67'),('55538e322952481890a77f32dd322545', 'admin', '2017-08-04 16:37:10', '登录系统'),('560878286c6c44abaab25ea5c2a98173', 'admin', '2017-07-26 11:32:44', '退出'),('58256f78828a4f79a21a79f69b1430c1', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('58850d431c3542faa19ba40db2e2a880', 'lisi', '2017-07-19 20:47:32', '退出'),('595f4f2cc2f74aa6922f3f99728fa5ba', 'admin', '2017-05-05 21:03:05', '修改cha_qx权限，角色ID为:b0305d75ce1c43268f1d938b5873afe9'),('597b8a18af3c42f28717635c12f047bd', 'admin', '2017-05-05 20:07:27', '修改edit_qx权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('5a935097de2747a19f6a1f0b5949bbde', 'zhangsan', '2017-05-05 20:59:17', '登录系统'),('5b164dca7230496fb35767ae898119f0', 'admin', '2017-05-05 20:12:23', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=3602af3aada543b9b0a7be7e354f29d8, ROLE_ID=d9251756431e4be490a26827dfe94e3d, guid=1493986343234}'),('5b2541b364f6411e9605946c5c842a1a', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('5b353a0aef1b44ce9838da70326b7ee1', 'admin', '2017-05-05 20:59:31', '登录系统密码或用户名错误'),('5b4f9adc98a84cb586d4042740d7b14d', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('5c61afd6c51f415e95906b1658cde82a', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('5cd45614a78d44a48a65ac722e350a15', 'admin', '2017-05-05 20:10:04', '修改角色菜单权限，角色ID为:85f233dc9c09489ca36ffa4c26590179'),('5ce3d5954436487d8dc19d095e2ef9d6', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('5cf45f44c9784a07af8190ab2681fb1a', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('5d15c14b975448fd8af72610ab56f620', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('5d89e3218b334f32a331d094c5755621', 'admin', '2017-07-27 17:07:44', '登录系统'),('5e294833306d4234aef604c51266b63f', 'admin', '2017-05-05 20:12:27', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=0c2363aebe21433dac2aa8708b1d8b60, ROLE_ID=a1cd9fef532c41088b3a3c7658dcf542, guid=1493986347141}'),('5eac4a4507fb4a288a98ee04c0cebfeb', 'zhangsan', '2017-05-05 20:52:54', '登录系统密码或用户名错误'),('5f3ba0dd978b4612816a11de2f1b0d3b', 'admin', '2017-05-05 20:05:21', '修改角色:仓库管理'),('60368a35edb942508f11483e82c4aa9f', 'admin', '2017-05-05 21:19:10', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=16adb7b2a8934065b14a7bbef83f8ff8, ROLE_ID=288278570647499587af059d75002f67, guid=1493990350576}'),('603f6a2f6e4d4cd1963fbb900d16f1e2', 'zhangsan', '2017-05-05 20:59:23', '退出'),('62e9f066e592443e9f80595ed19a10d9', 'admin', '2017-05-05 20:12:20', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=4f3c555986054a8e8b753d7d448855d5, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1493986340931}'),('6303f7c23d744dd2b3990f27ea6c8b66', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('6331d09aac67479a8084c32427f62064', 'admin', '2017-07-26 10:17:52', '登录系统'),('64a2917fcc3445c5a47c3f0c76d6c169', 'zhangsan', '2017-05-07 20:01:54', '退出'),('64f06fd5c67f4446becd245f3af8dda9', 'admin', '2017-05-07 19:59:32', '修改add_qx权限，角色ID为:6f81614977f64e079461796ed54a8e0e'),('650a5c561afe4ae49eac87edd4e9299c', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('65828b0f88014faab6b7522c4a2fa920', 'admin', '2017-05-05 21:03:10', '修改del_qx权限，角色ID为:288278570647499587af059d75002f67'),('66b24e3756f84d458d7b0b8c9bc86073', 'admin', '2017-05-07 20:02:42', '修改角色菜单权限，角色ID为:73b7157ace8b4aa7a114971ca5308cce'),('66e20f0747864fab8fc5396673aeab2e', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('67db997a5c3e41fa9e320c6e1a20c5b1', 'admin', '2017-05-05 20:57:57', '删除系统用户：{USER_ID=7f2eb948e7ac4b4c98f5f13a3ee6641b, tm=1493989077895}'),('6811982b542b4bb89911e946d44c94d1', 'admin', '2017-07-18 12:54:27', '登录系统'),('683890cfe37e45fdac1023eb666896f3', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('692435311d2843209b78f479df56aff5', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('694ff602444545bd932319e91f329ed2', 'zhansan', '2017-05-05 20:42:32', '登录系统密码或用户名错误'),('6a80a44b3efa4409858f8bb73e357d99', 'admin', '2017-05-07 19:59:57', '修改add_qx权限，角色ID为:a1cd9fef532c41088b3a3c7658dcf542'),('6ab7da432d3344509f00a4480d37d84c', 'admin', '2017-05-05 20:12:29', '新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=b71a75beae5b4009ab49ffe6c5d3084a, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1493986349296}'),('6c2e918eba8f438fb4bfe3307f964156', 'admin', '2017-05-05 20:10:56', '修改角色菜单权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('6c7379d5e90b4ef1a0733d8d0eeec536', 'admin', '2017-05-05 21:00:44', '修改角色菜单权限，角色ID为:288278570647499587af059d75002f67'),('6cc6fd4b827f4292a067960e9c4e5b77', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('6d340bb5934e4796aacecf5d3e0e2b44', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('6d4a24ad51e341d4866469ef8d4a9a27', 'admin', '2017-09-17 18:32:24', '登录系统'),('6e76d1a03dba486485f46b2cd131f2af', 'admin', '2017-05-05 20:12:27', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=c3a0af874eb94ac896ee9d79c7502ba6, ROLE_ID=d9251756431e4be490a26827dfe94e3d, guid=1493986347605}'),('6f296fd9a4644879946f647a59ae53b4', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('7022eca306e74e3d997ba1d1eb690706', 'lisi', '2017-07-19 21:16:10', '登录系统'),('705475b329ec415bb58735d4133348dd', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('70a57facd5194c8a93ec5b2877b942fe', 'admin', '2017-09-17 20:24:02', '登录系统'),('70a5c20b60aa4f31b249c0366bb14a38', 'admin', '2017-05-05 20:09:08', '新增角色:京东仓库管理员'),('70f4d8ea365e42c6b6867cac58e5af79', 'zhangsan', '2017-05-07 20:00:18', '登录系统'),('7105eae5e44c409283439f1f9a10b10c', 'admin', '2017-07-26 11:35:19', '登录系统'),('724d131334bb46eda4028b4b7942e5a8', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('72cea20911b344e79262c490f54ceff6', 'admin', '2017-05-05 20:09:30', '新增角色:台北仓库管理员'),('7392c92bf54f49acae2d3dd1e06ce16b', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('740cbf9d1d7c4349aaa75374abe19122', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('743dc20240c24409b9064d93b61d225b', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('7469b16d614d4c929e586d4ca12b4a64', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('74a3a080fc25479f8a44f32e548ff9b7', 'admin', '2017-07-27 15:47:16', '登录系统'),('74cc47d9d54a44769043d7721de3ecba', 'admin', '2017-05-05 20:11:16', '修改角色菜单权限，角色ID为:765e3b9c335847489b64f0ba22eb08ab'),('74fe3de05ef64c14ad63363d74d88dc0', 'admin', '2017-08-04 16:42:51', '删除按钮权限{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1501836274934}'),('7538ac55978c4b5faded7a0c727e547b', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('76115662e7e741d68ed32ff77dbf488f', 'admin', '2017-05-05 20:11:59', '新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=d7f1ece38d604730aec1433cfc2d5115, ROLE_ID=0dc21f6f55db4b8baf0c46aed7836b6c, guid=1493986319310}'),('76181360427140558deeb8a393fcb8fc', 'admin', '2017-05-05 20:11:05', '修改角色菜单权限，角色ID为:85f233dc9c09489ca36ffa4c26590179'),('761ef61eea6c4dfc8275d335721306d3', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('7679523d01954bc3a85b6cc5ddd4a168', 'admin', '2017-09-18 08:13:09', '登录系统'),('7b5bcbe405964ac395ae6aa32aca34ff', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('7bf1968c23ec4de0a3baf009a805f9aa', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('7c05d2aa9c344af5994527fa4a14caa1', 'admin', '2017-08-04 16:40:20', '新增菜单null'),('7c749ddfa5894e97956883bd5d914f3c', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('7cdc5f4d39a2426f8b4afb83e9866d19', 'admin', '2017-05-05 20:12:25', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=8945e78315be4e2e856dd272742a7e5a, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1493986345797}'),('7ed4e376a1ec4b53bb2dd85c01d5db79', 'admin', '2017-05-05 20:11:13', '修改角色菜单权限，角色ID为:6f81614977f64e079461796ed54a8e0e'),('7f37753d091040d9bbbbfcc869d473ac', 'admin', '2017-08-04 16:42:49', '新增按钮权限pd{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=236053b5bb8e490aa0a3d8dbc2a813d7, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1501836273083}'),('8067dad87d75439c9434d055161e779c', 'admin', '2017-05-07 20:01:23', '新增系统用户：lisi'),('807b24e240954a2a9e73da334d644b89', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('811923ffe9064267a18449523104455f', 'admin', '2017-08-04 16:40:20', '新增菜单null'),('81630021ae9b489886252e936c1d090d', 'admin', '2017-05-07 19:21:13', '登录系统'),('8243fe4b85f0465ca6b3cf09c5d74d1b', 'admin', '2017-07-19 20:47:19', '修改edit_qx权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('8305c41d79894d64bb6da8c5f4805483', 'admin', '2017-05-05 20:40:24', '退出'),('83174a8acdb94cb7bb5dc4de52eb2f8e', 'zhangsan', '2017-05-05 21:04:18', '登录系统'),('8335cf9413fd436e9ac58b928fec3226', 'admin', '2017-05-05 20:02:41', '退出'),('83e62d5848734ac28c0fc133912a7c3f', 'admin', '2017-09-17 20:50:09', '登录系统'),('84e5917a35354b48b954c7167d79b525', 'admin', '2017-05-05 21:03:15', '修改del_qx权限，角色ID为:288278570647499587af059d75002f67'),('84f43b65e20d449fa9f34e3e24eded79', 'admin', '2017-09-18 08:11:35', '修改菜单客户管理'),('84f77a98269345ceb22fecf1637e1102', 'admin', '2017-07-27 16:03:58', '退出'),('856b87eb1a6a4ec2b9fe3bff7936416b', 'admin', '2017-05-05 20:05:54', '新增角色:财务管理'),('85b912040515479289e7e17caf49fe56', 'admin', '2017-05-07 20:02:33', '修改add_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('867ced81034b450fa48a72d8e2b17a6a', 'admin', '2017-08-20 10:38:13', '退出'),('87564a8f205d43d18d35018501c5c878', 'admin', '2017-05-05 20:56:56', '登录系统'),('88b706adfcca4e438c65c9ac34f87cb1', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('88db184142ac411cbe4060e360ba44ba', 'admin', '2017-07-27 16:38:54', '退出'),('88de718eca68472eba9c9661c83dd219', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('897e50598b194c3ea73765229624d2cf', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('89bd7bf0ecef4ee7bb28dd91332e0d70', 'admin', '2017-05-05 20:10:11', '修改角色菜单权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('8b0b8c29e1a545f5bf8a885dcd816d3f', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('8c066822fcb747e3b4c48fb4aa117041', 'admin', '2017-08-04 17:43:38', '登录系统'),('8c0a20dad63c4387a34122b6b56cd99e', 'admin', '2017-07-19 13:00:35', '登录系统'),('8c634d5ec98f484d8070053e42b358b7', 'admin', '2017-09-17 19:04:19', '登录系统'),('8c67b7d106264bf5a606b2a7d1a7999a', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('8cff24068e214101ae70e3e623e99eb8', 'admin', '2017-07-27 16:16:38', '登录系统'),('8d7dab57f34f43599338760a7208a3ef', 'admin', '2017-05-21 19:05:59', '登录系统'),('8e61f501366b49a79d4918b97ecce176', 'admin', '2017-05-07 19:52:47', '登录系统'),('8ec3feb85e634691aec126031cf37d58', 'admin', '2017-05-07 19:45:13', '登录系统'),('8f27e7aa3edd47aabe0a41d4a90afd9d', 'admin', '2017-05-05 20:18:02', '新增角色:财务管理员'),('8feb4974237d4e05954c8c1158e4144d', 'admin', '2017-09-18 08:13:01', '退出'),('91806ba41da1437e979620d7a9a187cd', 'admin', '2017-05-07 19:56:47', '删除角色ID为:ecce094d0b86426f9b87d95929ce9115'),('928d0ef0914646b680ecdf96905f60af', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('9372ad4e8e284b458fa1004d9cead277', 'admin', '2017-05-05 21:02:35', '修改edit_qx权限，角色ID为:ecce094d0b86426f9b87d95929ce9115'),('9423b0fb12114858a585e3c5499ecc30', 'admin', '2017-07-27 16:19:12', '登录系统'),('94d27fe8eb3641f4b02c042ee414351b', 'admin', '2017-09-16 20:33:15', '登录系统'),('94e260b9f7e04fb5902cc223bd8ff8d5', 'admin', '2017-05-05 21:03:01', '修改edit_qx权限，角色ID为:b0305d75ce1c43268f1d938b5873afe9'),('95d1f35ad83343699011e68879c3662b', 'admin', '2017-07-26 10:18:51', '登录系统'),('965fd788e98244148a016a5f02fbcfa6', 'admin', '2017-08-04 16:40:19', '新增菜单贺盛'),('96e0e9c958a64d04984c4d84e0cef59f', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('9718c04519184f05a572cbd1118b4fc7', 'admin', '2017-05-05 20:58:00', '删除系统用户：{USER_ID=7f40708e20bb4a61a807d647e31da81b, tm=1493989079932}'),('976a96ca74574e93b37f8673b8baae79', 'admin', '2017-05-05 22:20:22', '退出'),('982649c9209c4d858869eb9ead38d64e', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('98c3fe4f4f044e9fb2e2703633e419e5', 'admin', '2017-05-05 20:07:32', '修改cha_qx权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('9942b021351d4af6b36e4bd30b1898c6', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('9a3192b2604849f699fd37e1a6e4ceed', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('9a7e4f60a4404aefbdb4e95f0d2c83a2', 'admin', '2017-09-18 08:12:47', '修改菜单系统工具'),('9a9d032a80054482bd2ef752db5a76f7', 'lushuang', '2017-05-05 20:43:25', '登录系统'),('9bb2c6d002a7449eba3b2dc66709c47d', 'admin', '2017-05-05 20:05:43', '新增角色:商品管理'),('9c6f854edc9b4ccc9d0b46e15b620123', 'admin', '2017-08-01 14:16:40', '登录系统'),('9d878afed5974051863cb279f0d51b18', 'admin', '2017-07-26 10:35:05', '登录系统'),('a0838bcc84ce4171b9fea7a8e13c428e', 'admin', '2017-09-17 20:36:37', '登录系统'),('a09d7b83581a49b8a66724b8cc503414', 'lushuang', '2017-05-05 23:23:00', '登录系统'),('a0c2dce8b8864be7af8bfeb2a46b052c', 'zhangsan', '2017-07-19 20:47:39', '登录系统'),('a113ccec500041f9be3d25196bc55308', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('a12a8de0ac564bc48520dda68f1a7b4a', 'admin', '2017-05-05 21:00:34', '修改角色菜单权限，角色ID为:b0305d75ce1c43268f1d938b5873afe9'),('a18f4dc3309e4ef9a08e9012270cc8bc', 'admin', '2017-05-05 20:17:53', '新增角色:采购管理员'),('a271f42ddd6a4224a53df59b9f95eed3', 'admin', '2017-07-17 22:24:01', '登录系统'),('a2b22eee11bf4dd5899e3e6ac13e5690', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('a37ed3369d7f4ec3b0dc4e09db947e61', 'admin', '2017-05-05 20:10:29', '新增角色:财务管理员'),('a3ca63642033467a94d23f79fdf8caee', 'admin', '2017-05-05 20:12:31', '删除按钮权限{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, ROLE_ID=765e3b9c335847489b64f0ba22eb08ab, guid=1493986351133}'),('a3dd24c8096c40268afaaae116fa1175', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('a433c8f4a61d4109ba42448cb2ad9e27', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('a4776c93d1704de0bb9c1f6bd56f3f7b', 'zhangsan', '2017-05-05 21:01:38', '退出'),('a60f32e95ea845dfb9058c2028eacda0', 'admin', '2017-08-12 17:12:36', '登录系统'),('a79b82e5d605460a9975428cfad46056', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('a827020767c24dd781d3dda0c81f0939', 'admin', '2017-05-05 20:06:23', '新增角色:系统管理员'),('aa950ed67d3b4a9eab77cdf2c4557617', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('ab26f96ca68840fd8b45627ac014373a', 'admin', '2017-05-05 23:22:07', '登录系统'),('ac10c43c64cf441eac447080046c70e4', 'admin', '2017-07-19 20:47:13', '修改del_qx权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('acfc0b51d728409c819737baefe57495', 'zhangsan', '2017-05-05 21:01:23', '登录系统'),('acfdae06bae149d6b3d0d20ef16c820a', 'admin', '2017-09-17 18:31:40', '登录系统'),('ad787e34195f4606a7780fa2467182fc', 'admin', '2017-05-05 20:18:47', '修改角色菜单权限，角色ID为:73b7157ace8b4aa7a114971ca5308cce'),('ad9f7d8a02f64369b2655fde4419f2bb', 'lushuang', '2017-05-07 19:58:17', '登录系统'),('ae37fe0adc00486bad0a1af9cc82ee7c', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('ae929359030f4a3d9cd326c21d157e8c', 'admin', '2017-07-27 21:46:13', '登录系统'),('af304cf2d59f4f2c9353f5e2b0381cc4', 'admin', '2017-11-16 19:07:22', '登录系统'),('b13026e8e88b4f63a5f4c008e6ef2ea9', 'admin', '2017-07-26 11:44:35', '退出'),('b1d953fda9be4b2f91d312a3fea37cd7', 'admin', '2017-07-27 17:23:59', '登录系统'),('b223017cf373420aac14d1828f2a5ea1', 'admin', '2017-07-17 22:29:13', '登录系统'),('b24847756fcf4bf5a9a91682c28e773d', 'lushuang', '2017-05-07 19:58:35', '退出'),('b25274d0f21847298b5d0d59d92170bf', 'zhangsan', '2017-05-05 20:49:22', '登录系统密码或用户名错误'),('b27872b3283f40b5a3b85ff52c2e2935', 'admin', '2017-07-17 10:35:43', '登录系统'),('b30723e614f443378958d28fb0ed9640', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('b38b1db43cb74bdc9da75846b9819690', 'admin', '2017-09-17 18:56:03', '登录系统'),('b3ee64b17e224fef839395a8bc031d5c', 'admin', '2017-08-19 21:40:21', '登录系统'),('b4a681b9712a4b3795f01376048944fa', 'admin', '2017-09-17 19:08:55', '登录系统'),('b5a8bf9bd460481eb71426f06f61c2de', 'admin', '2017-07-19 20:46:18', '修改add_qx权限，角色ID为:6f81614977f64e079461796ed54a8e0e'),('b6b6d181417a49e195a07706df898e45', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('b6cac7209511416f89eb041d5abb34df', 'admin', '2017-05-05 20:07:11', '修改add_qx权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('b7017174ba1d43b4a3cbc9136703dced', 'admin', '2017-08-20 10:38:28', '登录系统'),('b79053721e6f44698c9b5118fb86e827', 'admin', '2017-05-07 19:59:44', '修改add_qx权限，角色ID为:765e3b9c335847489b64f0ba22eb08ab'),('b815b434441445f7ac1fe76de1b1cea3', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('b97c0c3fdf5d4753852648efc02d90d7', 'admin', '2017-07-19 13:52:57', '退出'),('b9ffb5c3de64488b9ed063f0e3f52ce0', 'admin', '2017-05-05 21:19:11', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=baadc720759b4ac0a4fe525fcbe1a0e9, ROLE_ID=288278570647499587af059d75002f67, guid=1493990351121}'),('bb36fb376597499abd63b06b75130ac9', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('bbb7b251ed1f40a4a3415acf0e8fec77', 'admin', '2017-05-05 20:04:41', '新增角色:仓库管理'),('bc912721f2944d84a050f88a6c944b3a', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('bcd266a00a5d4eca84b3f1d3bff2f9a0', 'admin', '2017-05-05 20:11:41', '新增角色:商品管理员'),('bcda9de775c145ab93be2235b21ae5d4', 'admin', '2017-05-05 20:07:21', '修改del_qx权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('bd9776ff2b0b44f482be4f7edb7c446f', 'admin', '2017-05-05 20:11:59', '新增按钮权限pd{BUTTON_ID=da7fd386de0b49ce809984f5919022b8, RB_ID=fe2f3c916578401e8a2c11eae94581fb, ROLE_ID=0dc21f6f55db4b8baf0c46aed7836b6c, guid=1493986319940}'),('bf09ba3741ed4576830cef3a9344631d', 'admin', '2017-07-27 16:09:25', '登录系统'),('bf4b4fb8118749c3b8e7fcfb9043d5dd', 'lushuang', '2017-05-05 20:44:28', '退出'),('bf7c6f937dd842bfa2ca387d6ae93437', 'admin', '2017-05-07 19:36:38', '修改系统用户：zhangsan'),('bfa87c3a5ba04773b6d277375dffcd71', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('bfe257e1b0934e48bfc1bace6a48d305', 'admin', '2017-05-05 21:17:57', '登录系统'),('c144fec187874fabb10c10afe7679a9b', 'admin', '2017-08-04 00:09:25', '登录系统'),('c14690a1ea9c46edbedfbbb2ea14a703', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('c17125d245a44516bb2b9cec19ba3975', 'admin', '2017-09-18 08:11:50', '登录系统'),('c1967a66475a4263a240213842d51433', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('c1f449d6929d452fbc28ebe64bf04c96', 'admin', '2017-05-05 21:19:09', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=66bb79d3d780415a9b0bb25233f54245, ROLE_ID=ecce094d0b86426f9b87d95929ce9115, guid=1493990349767}'),('c2257f56b70b496f95f781053789ca10', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('c243875533d34b10a1a407999ecaefc5', 'admin', '2017-09-18 08:11:03', '修改菜单null'),('c27a19bb772b4a8384be523554635394', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('c32fe92b6fbd4461810249216a18b65b', 'admin', '2017-07-19 20:44:58', '退出'),('c39c082167c149cea635f84843e17ae1', 'admin', '2017-07-27 16:11:16', '登录系统'),('c428e9e9c8254cecb920f8ab771ff442', 'admin', '2017-05-05 20:08:25', '新增角色:天猫2号仓库管理员'),('c55a876fee514bd8b96576e68c1f8459', 'admin', '2017-07-27 16:02:38', '登录系统'),('c61e76bfa8464a8e83f621c8cebeb48f', 'admin', '2017-05-05 21:18:28', '退出'),('c621844285a04844bb93a6044b2bded1', 'admin', '2017-07-26 11:36:59', '退出'),('c6d00f27ba074f10a0d6d4a1ec1fad94', 'admin', '2017-05-05 20:12:38', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=5b8574119fb8402b887f2f539f4bb43b, ROLE_ID=e6543004da8044879d848bd56d1b4775, guid=1493986358146}'),('c7332032e6e145028a2505805b75a44a', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('c7baba93c1624bd398a042003c30ec57', 'admin', '2017-05-21 17:36:32', '登录系统'),('c889c3f85963433d83dc99c576ab7342', 'lushuang', '2017-05-05 20:40:56', '登录系统'),('c9130237e82e420a9548a72301cc8582', 'admin', '2017-05-05 20:12:31', '删除按钮权限{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, ROLE_ID=6f81614977f64e079461796ed54a8e0e, guid=1493986351476}'),('c95895ab6e964362af3bcb03f86e7e3f', 'admin', '2017-08-12 09:00:39', '登录系统'),('ca59e1117d6b4d46b73262c8b9baa486', 'admin', '2017-05-05 20:04:25', '修改角色菜单权限，角色ID为:1'),('ce4a11a6127e41c483aad327a85ecc54', 'admin', '2017-07-17 00:54:19', '登录系统'),('cfedd6b808fb4965b17ad3c82ebe5a03', 'admin', '2017-05-05 21:00:20', '修改角色菜单权限，角色ID为:ecce094d0b86426f9b87d95929ce9115'),('d210839b8838465d84daed9aff556a8a', 'admin', '2017-07-27 16:34:35', '登录系统'),('d2e0a9f3b05d4b45b26a806f684c0d38', 'admin', '2017-05-05 20:12:29', '新增按钮权限pd{BUTTON_ID=cc51b694d5344d28a9aa13c84b7166cd, RB_ID=934ddce843914c1b8ebcfbb3f0b1b66b, ROLE_ID=765e3b9c335847489b64f0ba22eb08ab, guid=1493986349894}'),('d39f68e4f7d54675911b005e4f1f6456', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('d4464037c7f249028113ac1711dcc913', 'admin', '2017-05-05 20:58:42', '新增系统用户：zhangsan'),('d46323e2468048c783433aa46db58434', 'lushuang', '2017-05-05 20:44:22', '修改系统用户：zhangsan'),('d4747087c28e41f9bbe64f66fad5a381', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('d4a43865875b43a4bca9c4bfcfbafb94', 'admin', '2017-07-27 16:06:29', '登录系统'),('d63860ed13ef4eb5a220b520bbf25950', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('d65a045c8e524c55ac08fe5842eed751', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('d66ffc25ce334e3abeb19c6edc804df4', 'admin', '2017-08-30 14:55:26', '登录系统'),('d7bfa53543534c629ed8d65467c3753b', 'admin', '2017-05-05 21:02:57', '修改del_qx权限，角色ID为:b0305d75ce1c43268f1d938b5873afe9'),('d7dc03fca6d54c57ab824110d3789cc7', 'lushuang', '2017-07-19 21:14:04', '退出'),('d7ebea697b3d469fbcbb312f97fcb0f0', 'admin', '2017-05-07 19:30:35', '登录系统'),('d8ce72ab368b44faba9a84fda645adb0', 'admin', '2017-07-27 17:30:01', '登录系统'),('d98588a831bc482eb30234079e370744', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('daa878d8e34d4742bcc25f76f60b2ee2', 'admin', '2017-07-27 16:07:25', '登录系统'),('daaf5508325442b79c096a1f4a55cb76', 'admin', '2017-08-04 16:40:27', '修改菜单null'),('dac9b20cf4c5461f8142491a092f4bff', 'admin', '2017-05-05 21:01:55', '登录系统'),('dacaa92ad2d04c9db869cce7b941bd1b', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('dc2a048eaaee4632b5ef45f3bb875b57', 'admin', '2017-05-05 20:04:57', '删除角色ID为:1b67fc82ce89457a8347ae53e43a347e'),('dc5301bfca164e66a70035d9e5fa0f8d', 'admin', '2017-08-04 16:40:28', '修改菜单null'),('dc544dad850d4416a41efbe938329e09', 'admin', '2017-08-04 15:46:49', '登录系统'),('dd4ec31a14a44bd1b2ce19d99b176cdb', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('dd80351070ce4f089445cd1b66d9673a', 'admin', '2017-08-04 16:40:27', '修改菜单客户管理'),('de0b2486247a48d8a404aac50a453c3b', 'admin', '2017-07-19 21:15:40', '修改add_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('de43f74d647944b595380c3834ad6e43', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('de644ed6230f46179c0fdd45d747106c', 'admin', '2017-07-19 21:15:48', '修改edit_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('defc0d90bc394ae9a64749b6e1bff14e', 'admin', '2017-05-05 20:11:57', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=d5b918c4cb1c4eeabee48f5ced64052e, ROLE_ID=0dc21f6f55db4b8baf0c46aed7836b6c, guid=1493986317864}'),('df2b4ec16619410f88d1f39e80ab31db', 'admin', '2017-05-07 19:56:44', '删除角色ID为:b0305d75ce1c43268f1d938b5873afe9'),('dfe01451286b4d088d5893dc1933d98d', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('e074c9e862904fb58885bf584b35dedf', 'admin', '2017-05-07 20:00:02', '修改add_qx权限，角色ID为:d9251756431e4be490a26827dfe94e3d'),('e0803f5c2c044058b93783c34b46ff8a', 'admin', '2017-05-05 20:12:26', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=cc7cc96556c54abc872845725ec2c854, ROLE_ID=85f233dc9c09489ca36ffa4c26590179, guid=1493986346745}'),('e0a89b167d884e92b2b6ebf87f18e6fd', 'admin', '2017-05-05 20:11:56', '新增按钮权限pd{BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=f604d68094b642f29ebdef2b8d816a1f, ROLE_ID=0dc21f6f55db4b8baf0c46aed7836b6c, guid=1493986316907}'),('e0ae3ecec6314f70a4d21adecc87c2ba', 'admin', '2017-08-26 10:34:22', '登录系统'),('e0c7eca61d30499c8a2135642db173f5', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('e27a304781e641938813f1aa8658a62c', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('e29e6b7f182448878c7d3824cf0e1999', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('e2d2d2710c7444078153bf6d60ef1e31', 'lisi', '2017-05-07 20:02:54', '登录系统'),('e2dde6846ecc4445947015b8ae7ddd4e', 'admin', '2017-08-04 17:23:49', '登录系统'),('e3352777326f4eafa142e64a7a819856', 'admin', '2017-05-05 20:59:38', '登录系统'),('e33e53cfd676465ca12e6588b98c39bc', 'admin', '2017-09-18 08:11:04', '修改菜单null'),('e38f631841b9485c8b49b115cf589d89', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('e44f26f664d1418d8436a594e12032e4', 'admin', '2017-05-05 21:19:10', '新增按钮权限pd{BUTTON_ID=4efa162fce8340f0bd2dcd3b11d327ec, RB_ID=17181d1472d64c7284286c5689c788a2, ROLE_ID=b0305d75ce1c43268f1d938b5873afe9, guid=1493990350176}'),('e6b5937d63a34d809e0d842c43158edd', 'admin', '2017-09-18 08:11:35', '修改菜单null'),('e77ad10422134501afda537a9f8d3f5e', 'admin', '2017-05-05 20:21:26', '新增系统用户：王五'),('e78ce536f0124ef0954e69e7d0dd1cd8', 'admin', '2017-09-18 08:11:39', '退出'),('e7f6ead253c445d995474e6bd5ab1cc9', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('e83572dbe6954f9ebc275224a643da25', 'admin', '2017-05-21 19:06:59', '登录系统'),('e87e4e5bf39d4132b7b6fa2a6cae0abb', 'admin', '2017-05-05 21:19:09', '新增按钮权限pd{BUTTON_ID=46992ea280ba4b72b29dedb0d4bc0106, RB_ID=eabb158198484f368d8cddec9da09809, ROLE_ID=ecce094d0b86426f9b87d95929ce9115, guid=1493990349073}'),('ea7acba28a1447c0bf5dcbce80e9bae5', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('eb946719ecb6452cb488bc1608068db3', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('ec028e29ba9841daa9ea24e2e2033f2f', 'admin', '2017-09-18 08:12:29', '修改菜单null'),('ec5922fe64b84cad8c60a864524b2440', 'admin', '2017-05-05 21:03:40', '修改add_qx权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('ec67bbcb23f34dff97384ca12ee9b066', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('eca97f3dd8a54debbc8f151d06aefc9e', 'admin', '2017-07-27 16:06:30', '登录系统'),('eea766b96e7443ecadfa4146883dd021', 'admin', '2017-09-18 08:12:48', '修改菜单null'),('ef33960119754f8ea403f35c5bc5f86d', 'admin', '2017-05-05 20:07:35', '修改角色菜单权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('ef4fddd1dabc412fae7d9b4950a307a5', 'admin', '2017-08-19 21:44:31', '登录系统'),('ef86498a2ddd4131993e54d4a9cb3a63', 'admin', '2017-05-05 20:06:31', '修改角色菜单权限，角色ID为:0dc21f6f55db4b8baf0c46aed7836b6c'),('ef8fcc77b9aa4d5391bcb52137d67830', 'admin', '2017-05-05 20:11:01', '修改角色菜单权限，角色ID为:a1cd9fef532c41088b3a3c7658dcf542'),('f05f382796734ac79fddab2ad304c55c', 'admin', '2017-05-05 20:04:59', '删除角色ID为:8b70a7e67f2841e7aaba8a4d92e5ff6f'),('f2d0bdd89c0047008ce95c9ecdddc07b', 'admin', '2017-08-04 16:40:19', '新增菜单null'),('f32371b615c0422a903bf432e573f7bc', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('f38310c34ce741d4aa7b0d67e5a0b3d7', 'admin', '2017-09-18 08:11:36', '修改菜单null'),('f40107b6a1b84de087502b18060c010c', 'admin', '2017-08-04 15:56:00', '退出'),('f467dc504d9e4427b293d6c6ff193ff7', 'admin', '2017-09-18 08:12:13', '修改菜单null'),('f586a0165e3b4a5c97f45b969d46fca0', 'admin', '2017-07-26 11:42:43', '登录系统'),('f5b77460e60e46879b0c7739fa61d729', 'admin', '2017-05-05 20:04:54', '删除角色ID为:115b386ff04f4352b060dffcd2b5d1da'),('f5ce60b401244eacb857fb02c2ef1de6', 'admin', '2017-09-18 08:12:47', '修改菜单null'),('f605a768a32047bf8df03c274c5d2fa5', 'admin', '2017-05-05 21:04:04', '退出'),('f757042c90df43dbada53320421b2d97', 'admin', '2017-08-04 17:23:59', '退出'),('f84310d1c9724417933e1af34e89a56a', 'admin', '2017-07-27 16:31:44', '登录系统'),('f924eeb5947b49e9b534ed13ab4e4a75', 'admin', '2017-05-05 20:08:57', '新增角色:唯品会仓库管理员'),('fac1a25c5fed4a24a1085fc043174022', 'admin', '2017-09-03 22:46:11', '登录系统'),('fb73c163b91e4dc4a1322033f4864898', 'admin', '2017-07-19 21:15:51', '修改cha_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('fdc354fde2df46fd967985531a997e55', 'admin', '2017-05-07 20:01:43', '修改add_qx权限，角色ID为:e6543004da8044879d848bd56d1b4775'),('fdcfaf45dd094899baf9548dd0d20128', 'admin', '2017-09-18 08:12:13', '修改菜单信息管理'),('fe5bcc0ef8df479abd1691f5f972c91e', 'admin', '2017-09-18 08:12:30', '修改菜单null'),('ffb473568e8144e282bc6e5dcf32f3ea', 'admin', '2017-09-18 08:12:14', '修改菜单null'),('ffc179c8256d486f8c0a3ee46a42b007', 'admin', '2017-09-18 08:12:29', '修改菜单null');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_fhsms` WRITE;
DELETE FROM `depstock`.`sys_fhsms`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_loginimg` WRITE;
DELETE FROM `depstock`.`sys_loginimg`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_menu` WRITE;
DELETE FROM `depstock`.`sys_menu`;
INSERT INTO `depstock`.`sys_menu` (`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`MENU_STATE`) VALUES (1, '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', 1),(2, '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', 1),(3, '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', 1),(6, '信息管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', 0),(7, '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', 1),(8, '性能监控', 'druid/index.html', '9', '9', 'menu-icon fa fa-tachometer red', '1', 1),(9, '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', 0),(20, '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', 1),(36, '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', 1),(37, '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', 1),(38, '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', 1),(39, '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', 1),(40, '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', 1),(41, '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', 1),(43, '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', 1),(50, '站内信', 'fhsms/list.do', '6', '3', 'menu-icon fa fa-envelope green', '1', 1),(51, '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', 1),(52, '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', 1),(54, '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', 0),(55, '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', 1),(56, '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', 1),(57, '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', 1),(58, 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', 1),(69, '客户管理', '#', '0', '11', 'menu-icon fa fa-users green', '2', 0),(70, '客户资料', 'customer/list.do', '69', '1', 'menu-icon fa fa-users blue', '1', 1),(71, '客户备注', 'remarks/list.do', '69', '2', 'menu-icon fa fa-bookmark green', '1', 1),(72, '客户级别', 'level/list.do', '69', '3', 'menu-icon fa fa-filter orange', '1', 1),(73, '商品管理', '#', '0', '12', 'menu-icon fa fa-inbox blue', '2', 1),(74, '商品列表', 'goods/list.do', '73', '1', 'menu-icon fa fa-gift green', '1', 1),(75, '商品类别', 'sptype/list.do', '73', '2', 'menu-icon fa fa-book blue', '1', 1),(76, '品牌管理', 'spbrand/list.do', '73', '3', 'menu-icon fa fa-globe purple', '1', 1),(77, '计量单位', 'spunit/list.do', '73', '4', 'menu-icon fa fa-circle-o pink', '1', 1),(78, '库存管理', '#', '0', '13', 'menu-icon fa fa-flag black', '2', 1),(79, '商品库存', 'kucun/list.do', '78', '1', 'menu-icon fa fa-home green', '1', 1),(80, '商品入库', 'intoku/list.do', '78', '2', 'menu-icon fa fa-cloud-download orange', '1', 1),(81, '商品出库', 'outku/list.do', '78', '3', 'menu-icon fa fa-cloud-upload purple', '1', 1),(82, '库存盘点', 'kucun/kucunchar.do', '78', '4', 'menu-icon fa fa-bar-chart-o blue', '1', 1),(83, '销售报表', 'outku/salesReport.do', '78', '5', 'menu-icon fa fa-book red', '1', 1),(84, '所有客户', 'allcustomer/list.do', '69', '1', 'menu-icon fa fa-users blue', '1', 1),(85, '贺盛', '#', '70', '0', 'menu-icon fa fa-leaf black', '1', 1),(86, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(87, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(88, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(89, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(90, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(91, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(92, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(93, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(94, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(95, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(96, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(97, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(98, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(99, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(100, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(101, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(102, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(103, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(104, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL),(105, NULL, NULL, NULL, NULL, 'menu-icon fa fa-leaf black', NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_role` WRITE;
DELETE FROM `depstock`.`sys_role`;
INSERT INTO `depstock`.`sys_role` (`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`) VALUES ('0dc21f6f55db4b8baf0c46aed7836b6c', '系统管理员', '38685036498198553447891918', '1', '566340778562945998', '566340778562945998', '566340778562945998', '566340778562945998'),('1', '系统管理组', '38685036498198553447891918', '0', '1', '1', '1', '1'),('2', '仓库管理', '9369175102013376103972864', '0', '0', '0', '0', '1'),('51dec32cd35e4ad5801bf8ccdcd36614', '财务管理', '9973638011820690691325952', '0', '0', '0', '0', '0'),('6f81614977f64e079461796ed54a8e0e', '唯品会仓库管理员', '9369175102013376103972864', '2', '9369175102013376103972864', '0', '0', '0'),('73b7157ace8b4aa7a114971ca5308cce', '商品管理', '292786721937918003249152', '0', '0', '0', '0', '0'),('765e3b9c335847489b64f0ba22eb08ab', '台北仓库管理员', '9369175102013376103972864', '2', '9369175102013376103972864', '0', '0', '0'),('85f233dc9c09489ca36ffa4c26590179', '天猫2号仓库管理员', '9369175102013376103972864', '2', '9369175102013376103972864', '0', '0', '0'),('a1cd9fef532c41088b3a3c7658dcf542', '京东仓库管理员', '9369175102013376103972864', '2', '9369175102013376103972864', '0', '0', '0'),('afc305be4af44267b0f27e41413dfb7d', '财务管理员', '9973638011820690691325952', '51dec32cd35e4ad5801bf8ccdcd36614', '0', '0', '0', '0'),('d9251756431e4be490a26827dfe94e3d', '天猫1号仓库管理员', '9369175102013376103972864', '2', '9369175102013376103972864', '9369175102013376103972864', '9369175102013376103972864', '9369175102013376103972864'),('e6543004da8044879d848bd56d1b4775', '商品管理员', '292786721937918003249152', '73b7157ace8b4aa7a114971ca5308cce', '292786721937918003249152', '292786721937918003249152', '292786721937918003249152', '292786721937918003249152');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_role_fhbutton` WRITE;
DELETE FROM `depstock`.`sys_role_fhbutton`;
INSERT INTO `depstock`.`sys_role_fhbutton` (`RB_ID`,`ROLE_ID`,`BUTTON_ID`) VALUES ('0c2363aebe21433dac2aa8708b1d8b60', 'a1cd9fef532c41088b3a3c7658dcf542', '46992ea280ba4b72b29dedb0d4bc0106'),('106cf5ef6a3a4bb08142a6f33ebabfd3', '6f81614977f64e079461796ed54a8e0e', '46992ea280ba4b72b29dedb0d4bc0106'),('3602af3aada543b9b0a7be7e354f29d8', 'd9251756431e4be490a26827dfe94e3d', '4efa162fce8340f0bd2dcd3b11d327ec'),('383a1085d3ef4b449e8f72db9458d92b', '765e3b9c335847489b64f0ba22eb08ab', '4efa162fce8340f0bd2dcd3b11d327ec'),('4f3c555986054a8e8b753d7d448855d5', '6f81614977f64e079461796ed54a8e0e', '4efa162fce8340f0bd2dcd3b11d327ec'),('5b8574119fb8402b887f2f539f4bb43b', 'e6543004da8044879d848bd56d1b4775', '4efa162fce8340f0bd2dcd3b11d327ec'),('66a73659c42c4ca8a0dcca4e9d6a338e', '85f233dc9c09489ca36ffa4c26590179', '4efa162fce8340f0bd2dcd3b11d327ec'),('71afa4982e8d459faeb8fee76357b1ba', 'e6543004da8044879d848bd56d1b4775', '46992ea280ba4b72b29dedb0d4bc0106'),('7f189298a06f44feb04d14ca09619d70', '6f81614977f64e079461796ed54a8e0e', '3542adfbda73410c976e185ffe50ad06'),('7f4a031f3a7443a8b773afa9d7a41e6e', '0dc21f6f55db4b8baf0c46aed7836b6c', '4efa162fce8340f0bd2dcd3b11d327ec'),('8725e6bf94a7474c9b46782acba8c19c', '765e3b9c335847489b64f0ba22eb08ab', '46992ea280ba4b72b29dedb0d4bc0106'),('96584ea2a2d948a6a96a026071dff12f', 'afc305be4af44267b0f27e41413dfb7d', '3542adfbda73410c976e185ffe50ad06'),('b4d56116b346468eba2699d4acf47091', 'afc305be4af44267b0f27e41413dfb7d', '4efa162fce8340f0bd2dcd3b11d327ec'),('c3a0af874eb94ac896ee9d79c7502ba6', 'd9251756431e4be490a26827dfe94e3d', '46992ea280ba4b72b29dedb0d4bc0106'),('cc7cc96556c54abc872845725ec2c854', '85f233dc9c09489ca36ffa4c26590179', '46992ea280ba4b72b29dedb0d4bc0106'),('d5b918c4cb1c4eeabee48f5ced64052e', '0dc21f6f55db4b8baf0c46aed7836b6c', '46992ea280ba4b72b29dedb0d4bc0106'),('d7f1ece38d604730aec1433cfc2d5115', '0dc21f6f55db4b8baf0c46aed7836b6c', 'cc51b694d5344d28a9aa13c84b7166cd'),('dc0b763133bd4f0eba1dbcfe64e483c0', 'a1cd9fef532c41088b3a3c7658dcf542', '4efa162fce8340f0bd2dcd3b11d327ec'),('f604d68094b642f29ebdef2b8d816a1f', '0dc21f6f55db4b8baf0c46aed7836b6c', '3542adfbda73410c976e185ffe50ad06'),('fe2f3c916578401e8a2c11eae94581fb', '0dc21f6f55db4b8baf0c46aed7836b6c', 'da7fd386de0b49ce809984f5919022b8');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_user` WRITE;
DELETE FROM `depstock`.`sys_user`;
INSERT INTO `depstock`.`sys_user` (`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`) VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-11-16 19:07:22', '0:0:0:0:0:0:0:1', '0', '系统管理员', 'default', 'lushuang0605@163.com', '1', '18614043867'),('11200d0af869496ea7d0aa412ac4a594', 'lushuang', 'fd527d1798c92757f12ea8d638b044df5bd616d4', '芦泷', '', '0dc21f6f55db4b8baf0c46aed7836b6c', '2017-07-19 20:31:52', '114.243.165.0', '0', '', 'default', '308742880@qq.com', '2', '18614043867'),('4f70930aef8e481c8a0a12b5fcf5a1a2', 'lisi', '41009ccf47f70965bed820412e63e3c46a455ba3', 'lisi', '', '73b7157ace8b4aa7a114971ca5308cce', '2017-07-19 21:16:10', '114.243.165.0', '0', '', 'default', 'lisi@163.com', '4', '18614043869'),('8be136dd0fcb4a378a10d6ed26363dae', 'zhangsan', '173c2a01f31a0edea4428217a8b834cccb383bf4', 'zhangsan', '', 'd9251756431e4be490a26827dfe94e3d', '2017-07-19 20:47:39', '114.243.165.0', '0', '', 'default', 'zhangsan@163.com', '3', '18614043868');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`sys_userphoto` WRITE;
DELETE FROM `depstock`.`sys_userphoto`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `depstock`.`tb_pictures` WRITE;
DELETE FROM `depstock`.`tb_pictures`;
INSERT INTO `depstock`.`tb_pictures` (`PICTURES_ID`,`TITLE`,`NAME`,`PATH`,`CREATETIME`,`MASTER_ID`,`BZ`) VALUES ('3913203d82854171985dcb673674c66f', '图片', '4e347b9b90834f8786e0046189237ab7.png', '20170505/4e347b9b90834f8786e0046189237ab7.png', '2017-05-05 20:22:57', '1', '图片管理处上传'),('43cd1d60d58545d0b26b53dda758f847', '图片', 'a638c83ddb9f4ff5919982c69b1d078d.jpg', '20170505/a638c83ddb9f4ff5919982c69b1d078d.jpg', '2017-05-05 20:22:57', '1', '图片管理处上传'),('4f529c9f902f40bfad55f2555916822a', '图片', 'cf6dd25a530e47be897ce9b7e5d8cfbb.jpg', '20170505/cf6dd25a530e47be897ce9b7e5d8cfbb.jpg', '2017-05-05 20:22:51', '1', '图片管理处上传'),('6994f122001a44e4b4a23879995d8f9a', '图片', 'dcbb9395b34247e2bfc4ee8451bec395.jpg', '20170505/dcbb9395b34247e2bfc4ee8451bec395.jpg', '2017-05-05 20:22:57', '1', '图片管理处上传'),('9d497eec905c4c79bf71f4930a2a0c27', '图片', '328807a8762f4cd18e94e65914114962.jpg', '20170505/328807a8762f4cd18e94e65914114962.jpg', '2017-05-05 20:22:51', '1', '图片管理处上传'),('a839e00019e24650bb83801482bb7efc', '图片', '938dc5204dd44bcd9f2d7f0dd34751a8.jpg', '20170505/938dc5204dd44bcd9f2d7f0dd34751a8.jpg', '2017-05-05 20:22:51', '1', '图片管理处上传');
UNLOCK TABLES;
COMMIT;
