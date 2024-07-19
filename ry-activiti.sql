-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: ry-activiti
-- ------------------------------------------------------
-- Server version	5.7.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8mb4_bin DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8mb4_bin DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8mb4_bin DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveapply`
--

DROP TABLE IF EXISTS `leaveapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(20) DEFAULT NULL COMMENT '请假人',
  `start_time` datetime DEFAULT NULL COMMENT '起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(45) DEFAULT NULL COMMENT '类型',
  `reason` varchar(400) DEFAULT NULL COMMENT '原因',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际起始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='请假表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveapply`
--

LOCK TABLES `leaveapply` WRITE;
/*!40000 ALTER TABLE `leaveapply` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaveapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `topic` varchar(100) DEFAULT NULL COMMENT '会议主题',
  `host` varchar(50) DEFAULT NULL COMMENT '主持人',
  `place` varchar(50) DEFAULT NULL COMMENT '会议地址',
  `peoplelist` varchar(255) DEFAULT NULL COMMENT '参会人员',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `content` text COMMENT '会议纪要',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemlist` text NOT NULL,
  `total` varchar(10) NOT NULL,
  `applytime` datetime DEFAULT NULL,
  `applyer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-04-10 22:00:54','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-04-10 22:00:54','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-04-10 22:00:54','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-04-10 22:00:54','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-04-10 22:00:54','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-04-10 22:00:54','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-10 22:00:54','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8mb4_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-04-10 22:00:54','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-04-10 22:00:54','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-04-10 22:00:54','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-04-10 22:00:54','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-04-10 22:00:54','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-04-10 22:00:54','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-04-10 22:00:54','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-04-10 22:00:54','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-04-10 22:00:54','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-04-10 22:00:54','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-04-10 22:00:54','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-04-10 22:00:54','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-04-10 22:00:54','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-04-10 22:00:54','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-04-10 22:00:54','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-04-10 22:00:54','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-04-10 22:00:54','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-04-10 22:00:54','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-04-10 22:00:54','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-04-10 22:00:54','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-04-10 22:00:54','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-04-10 22:00:54','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-04-10 22:00:54','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-04-10 22:00:54','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-04-10 22:00:54','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-04-10 22:00:54','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-04-10 22:00:54','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-04-10 22:00:54','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-04-10 22:00:54','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-04-10 22:00:54','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-04-10 22:00:54','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8mb4_bin DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-04-10 22:00:54','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-04-10 22:00:54','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-04-10 22:00:54','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8mb4_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-10 22:04:05'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-10 22:08:48'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-15 22:09:19'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-15 22:22:25'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-16 00:01:42'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-16 00:01:47'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-17 22:23:37'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-17 22:29:50'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-17 22:29:57'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-22 23:05:19'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-24 23:13:06'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-25 00:34:36'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-25 00:34:41'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-04-25 23:09:51'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-25 23:09:58'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-28 22:55:34'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-29 00:33:38'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-07 23:37:00'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 00:08:34'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-08 11:12:49'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-11 15:19:30'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-13 09:34:27'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-14 15:59:48'),(123,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-14 22:45:33'),(124,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-20 23:43:31'),(125,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-21 23:55:45'),(126,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-23 00:09:06'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-23 00:15:25'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-05-23 00:15:30'),(129,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-05-23 00:15:35'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-23 00:15:41'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-23 01:28:31'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-23 22:49:40'),(133,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-29 21:18:04'),(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-30 22:27:45'),(135,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-30 22:31:29'),(136,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-30 22:36:31'),(137,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-30 23:07:23'),(138,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-30 23:45:40'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-04 22:41:21'),(140,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2024-06-06 06:34:32'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 06:45:19'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 09:36:41'),(143,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-06-06 10:20:15'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 10:20:20'),(145,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-06 14:52:21'),(146,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 14:52:25'),(147,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-06 17:01:38'),(148,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-06-10 10:01:49'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-10 10:01:51'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-10 13:09:09'),(151,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-10 15:57:36'),(152,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-06-10 16:24:54'),(153,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-06-10 16:24:57');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8mb4_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8mb4_bin DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,4,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-04-10 22:00:54','admin','2024-04-22 23:12:43','系统管理目录'),(2,'系统监控',0,4,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-04-10 22:00:54','admin','2024-04-22 23:32:11','系统监控目录'),(3,'系统工具',0,4,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-04-10 22:00:54','admin','2024-04-22 23:32:22','系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2024-04-10 22:00:54','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-04-10 22:00:54','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-04-10 22:00:54','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-04-10 22:00:54','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-04-10 22:00:54','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-04-10 22:00:54','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-04-10 22:00:54','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-04-10 22:00:54','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-04-10 22:00:54','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-04-10 22:00:54','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-04-10 22:00:54','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-04-10 22:00:54','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-04-10 22:00:54','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-04-10 22:00:54','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-04-10 22:00:54','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-04-10 22:00:54','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-04-10 22:00:54','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-04-10 22:00:54','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-04-10 22:00:54','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-04-10 22:00:54','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-04-10 22:00:54','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-04-10 22:00:54','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-04-10 22:00:54','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-04-10 22:00:54','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-04-10 22:00:54','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-04-10 22:00:54','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-04-10 22:00:54','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-04-10 22:00:54','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-04-10 22:00:54','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-04-10 22:00:54','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-04-10 22:00:54','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-04-10 22:00:54','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-04-10 22:00:54','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-04-10 22:00:54','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-04-10 22:00:54','',NULL,''),(2000,'流程管理',0,0,'12',NULL,NULL,1,0,'M','0','0','','form','admin','2024-04-10 22:09:46','admin','2024-05-23 02:49:48',''),(2001,'模型管理',2000,1,'/model','process/modelManagement',NULL,1,0,'C','0','0','','druid','admin','2024-04-15 22:15:33','admin','2024-06-06 17:03:01',''),(2002,'部署管理',2000,2,'/deploy','process/deployManagement',NULL,1,0,'C','0','0','','swagger','admin','2024-04-15 22:16:09','admin','2024-06-06 17:03:48',''),(2003,'待办任务',0,2,'/todo',NULL,NULL,1,0,'M','0','0','','checkbox','admin','2024-04-22 23:12:23','admin','2024-05-23 02:51:01',''),(2004,'我的待办',2003,1,'/myTodoList','todo/myTodoList',NULL,1,0,'C','0','0','','user','admin','2024-04-22 23:13:36','admin','2024-06-06 17:05:00',''),(2005,'全部待办',2003,2,'/allTodoList','todo/allTodoList',NULL,1,0,'C','0','0','','wechat','admin','2024-04-22 23:14:45','admin','2024-06-06 17:05:18',''),(2006,'功能表',0,1,'/function',NULL,NULL,1,0,'M','0','0','','dict','admin','2024-04-22 23:21:22','admin','2024-05-23 02:45:47',''),(2007,'请假申请',2006,1,'/leaveApply','function/leaveApply',NULL,1,0,'C','0','0','','date','admin','2024-04-22 23:24:07','admin','2024-06-06 17:03:58',''),(2008,'采购申请',2006,2,'/purchaseApply','function/purchaseApply',NULL,1,0,'C','0','0','','form','admin','2024-04-22 23:26:08','admin','2024-06-06 17:04:08',''),(2009,'发起会议',2006,3,'/launchMeeting','function/lauchMeeting',NULL,1,0,'C','0','0','','guide','admin','2024-04-22 23:28:00','admin','2024-06-06 17:04:24',''),(2010,'流程监控',0,3,'/inspection',NULL,NULL,1,0,'M','0','0','','druid','admin','2024-04-22 23:29:15','admin','2024-05-23 02:51:40',''),(2011,'流程实例',2010,1,'/processInstance','inspection/processInstance',NULL,1,0,'C','0','0','','monitor','admin','2024-04-22 23:33:38','admin','2024-06-06 17:05:54',''),(2012,'执行实例',2010,2,'/runInstance','inspection/runInstance',NULL,1,0,'C','0','0','','cascader','admin','2024-04-22 23:35:04','admin','2024-06-06 17:06:04',''),(2013,'执行历史',2010,3,'/runHistory','inspection/runHistory',NULL,1,0,'C','0','0','','logininfor','admin','2024-04-22 23:35:56','admin','2024-06-06 17:06:17',''),(2014,'作业管理',2010,4,'/workManagement','inspection/workManagement',NULL,1,0,'C','0','0','','job','admin','2024-04-22 23:36:56','admin','2024-06-06 17:06:26','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-04-10 22:00:55','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-04-10 22:00:55','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8mb4_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"12\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 22:09:46',20),(101,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-10 22:09:46\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"12\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 22:14:41',23),(102,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"模型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"/modelManagement\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 22:15:33',16),(103,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"部署管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"/deploy\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 22:16:09',12),(104,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-15 22:15:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"模型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"/model\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 22:16:18',17),(105,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"process/modelManagement\",\"createTime\":\"2024-04-15 22:15:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"模型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"/model\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 23:33:31',10),(106,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"process/deployManagement\",\"createTime\":\"2024-04-15 22:16:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"部署管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"/deploy\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 23:35:07',12),(107,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"待办任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/todo\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:12:23',17),(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-10 22:00:54\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:12:43',15),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-10 22:00:54\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:12:57',10),(110,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的待办\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/myTodoList\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:13:36',19),(111,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:13:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"我的待办\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"/myTodoList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:13:48',18),(112,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"全部待办\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"/allTodoList\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:14:45',30),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"todo/myTodoList\",\"createTime\":\"2024-04-22 23:13:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"我的待办\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"/myTodoList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:18:03',12),(114,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"todo/allTodoList\",\"createTime\":\"2024-04-22 23:14:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"全部待办\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"/allTodoList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:18:28',14),(115,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"功能表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/function\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:21:22',11),(116,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:12:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"待办任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/todo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:21:29',16),(117,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"function/leaveApply\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"请假申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"/leaveApply\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:24:07',12),(118,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"function/purchaseApply\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购申请\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"/purchaseApply\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:26:08',12),(119,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"function/lauchMeeting\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"发起会议\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"/launchMeeting\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:28:00',14),(120,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/inspection\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:29:15',13),(121,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/inspection\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"新增菜单\'流程监控\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-04-22 23:31:00',4),(122,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/inspection\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"新增菜单\'流程监控\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-04-22 23:31:35',5),(123,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:29:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"流程监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/inspection\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:31:56',10),(124,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-10 22:00:54\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:32:11',13),(125,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-10 22:00:54\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:32:22',11),(126,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/processInstance\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流程实例\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"path\":\"/processInstance\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:33:38',8),(127,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/runInstance\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"执行实例\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"path\":\"/runInstance\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:35:04',11),(128,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/runHistory\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"执行历史\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2010,\"path\":\"/runHistory\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:35:56',14),(129,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/workManagement\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作业管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2010,\"path\":\"/workManagement\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:36:56',16),(130,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"todo/myTodoList\",\"createTime\":\"2024-04-22 23:13:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"我的待办\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"/myTodoList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:40:48',8),(131,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:12:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"待办任务\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/todo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 23:41:10',8),(132,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"请假\",\"leaveType\":\"事假\",\"startTime\":\"Fri Apr 05 2024 00:00:00 GMT+0800 (中国标准时间)\",\"endTime\":\"Tue Apr 23 2024 00:00:00 GMT+0800 (中国标准时间)\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 23:35:38',204),(133,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"有事\",\"leaveType\":\"事假\",\"startTime\":\"2024-04-01 00:00:00\",\"endTime\":\"2024-04-16 00:00:00\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 23:37:29',67),(134,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"12\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"笔\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 23:51:04',46),(135,'请假',5,'com.ruoyi.web.controller.activiti.LeaveapplyController.export()','POST',1,'admin','研发部门','/leaveapply/export','127.0.0.1','内网IP','{\"leaveType\":\"\",\"isAsc\":\"asc\",\"params[beginApplyTime]\":\"\",\"params[endApplyTime]\":\"\"}','{\"msg\":\"3040bd81-6ea6-4380-bc8a-6874c97d29b7_请假数据.xlsx\",\"code\":200}',0,NULL,'2024-05-13 09:46:26',1161),(136,'请假',5,'com.ruoyi.web.controller.activiti.LeaveapplyController.export()','POST',1,'admin','研发部门','/leaveapply/export','127.0.0.1','内网IP','{\"leaveType\":\"\",\"isAsc\":\"asc\",\"params[beginApplyTime]\":\"\",\"params[endApplyTime]\":\"\"}','{\"msg\":\"bbbbffa6-c337-417c-8108-ece63e1f3196_请假数据.xlsx\",\"code\":200}',0,NULL,'2024-05-13 09:46:32',36),(137,'请假',5,'com.ruoyi.web.controller.activiti.LeaveapplyController.export()','POST',1,'admin','研发部门','/leaveapply/export','127.0.0.1','内网IP','{\"leaveType\":\"\",\"isAsc\":\"asc\",\"params[beginApplyTime]\":\"\",\"params[endApplyTime]\":\"\"}','{\"msg\":\"ac01b8f1-d60c-45dd-b809-4dd0ae4742b1_请假数据.xlsx\",\"code\":200}',0,NULL,'2024-05-13 09:46:35',32),(138,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"task:1:17507\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-13 10:01:01',28),(139,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"sad:1:17526\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-13 10:16:03',29),(140,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"sad:2:17541\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-13 10:19:27',22),(141,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"task:2:20004\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-14 16:02:50',108),(142,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"job:1:20022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-14 16:17:16',49),(143,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"job:1:20022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-14 16:19:38',333),(144,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"job:1:20022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-14 16:19:40',64),(145,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"job:1:20022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-14 16:19:41',17),(146,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"job:1:20022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-14 16:19:41',5),(147,'采购',3,'com.ruoyi.web.controller.activiti.PurchaseController.remove()','POST',1,'admin','研发部门','/purchase/remove','127.0.0.1','内网IP','{\"ids\":\"56\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-21 01:27:01',86),(148,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"100\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"笔笔笔笔笔笔笔笔\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-21 01:27:13',61),(149,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"100\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"书书书\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-21 01:36:28',28),(150,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"111\",\"leaveType\":\"事假\",\"startTime\":\"2024-05-01 00:00:00\",\"endTime\":\"2024-05-24 00:00:00\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 01:52:10',38),(151,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"111\",\"leaveType\":\"事假\",\"startTime\":\"2024-05-01 00:00:00\",\"endTime\":\"2024-05-22 00:00:00\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 01:54:10',31),(152,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"111\",\"leaveType\":\"事假\",\"startTime\":\"2024-05-01 00:00:00\",\"endTime\":\"2024-05-24 00:00:00\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 02:16:23',50),(153,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:21:22\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"功能表\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/function\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 02:45:48',28),(154,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-10 22:09:46\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"流程管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"12\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 02:49:48',10),(155,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:12:23\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"待办任务\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/todo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 02:51:01',11),(156,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-22 23:29:15\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"流程监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/inspection\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-23 02:51:40',12),(157,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"123\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"哈哈\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-05-29 23:10:07',41),(158,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"123\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"123\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-04 23:33:10',35),(159,'请假',3,'com.ruoyi.web.controller.activiti.LeaveapplyController.remove()','POST',1,'admin','研发部门','/leaveapply/remove','127.0.0.1','内网IP','{\"ids\":\"15\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 08:09:29',47),(160,'请假',3,'com.ruoyi.web.controller.activiti.LeaveapplyController.remove()','POST',1,'admin','研发部门','/leaveapply/remove','127.0.0.1','内网IP','{\"ids\":\"16\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 08:09:32',11),(161,'请假',3,'com.ruoyi.web.controller.activiti.LeaveapplyController.remove()','POST',1,'admin','研发部门','/leaveapply/remove','127.0.0.1','内网IP','{\"ids\":\"18\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 08:09:48',12),(162,'请假',3,'com.ruoyi.web.controller.activiti.LeaveapplyController.remove()','POST',1,'admin','研发部门','/leaveapply/remove','127.0.0.1','内网IP','{\"ids\":\"17,19\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 09:36:56',20),(163,'采购',3,'com.ruoyi.web.controller.activiti.PurchaseController.remove()','POST',1,'admin','研发部门','/purchase/remove','127.0.0.1','内网IP','{\"ids\":\"57,58,59,60\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 09:37:02',31),(164,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"ZX\",\"leaveType\":\"事假\",\"startTime\":\"2024-06-04 00:01:00\",\"endTime\":\"2024-06-11 00:02:00\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 09:37:33',213),(165,'请假',5,'com.ruoyi.web.controller.activiti.LeaveapplyController.export()','POST',1,'admin','研发部门','/leaveapply/export','127.0.0.1','内网IP','{\"leaveType\":\"\",\"isAsc\":\"asc\",\"params[beginApplyTime]\":\"\",\"params[endApplyTime]\":\"\"}','{\"msg\":\"5167a1fc-7559-455c-bbd8-01cd6a04e252_请假数据.xlsx\",\"code\":200}',0,NULL,'2024-06-06 09:39:19',1099),(166,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"1111\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"asdasd\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 09:40:09',32),(167,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"tasjd:1:5107\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 10:05:34',54),(168,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"yibu:1:5120\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 10:12:52',13),(169,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"yibu:1:5120\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 10:22:27',233),(170,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"yibu:1:5120\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 10:23:43',24),(171,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"tasjd:1:5107\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 10:26:39',87),(172,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"tasjd:1:5107\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 10:26:40',12),(173,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"process/modelManagement\",\"createTime\":\"2024-04-15 22:15:33\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"模型管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"/model\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:03:01',41),(174,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"process/deployManagement\",\"createTime\":\"2024-04-15 22:16:09\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"部署管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"/deploy\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:03:48',9),(175,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"function/leaveApply\",\"createTime\":\"2024-04-22 23:24:07\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"请假申请\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"/leaveApply\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:03:58',9),(176,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"function/purchaseApply\",\"createTime\":\"2024-04-22 23:26:08\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"采购申请\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"/purchaseApply\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:04:08',8),(177,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"function/lauchMeeting\",\"createTime\":\"2024-04-22 23:28:00\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"发起会议\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"/launchMeeting\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:04:24',9),(178,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"todo/myTodoList\",\"createTime\":\"2024-04-22 23:13:36\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"我的待办\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"/myTodoList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:05:00',8),(179,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"todo/allTodoList\",\"createTime\":\"2024-04-22 23:14:45\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"全部待办\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"/allTodoList\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:05:18',8),(180,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/processInstance\",\"createTime\":\"2024-04-22 23:33:38\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"流程实例\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2010,\"path\":\"/processInstance\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:05:54',9),(181,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/runInstance\",\"createTime\":\"2024-04-22 23:35:04\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"执行实例\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2010,\"path\":\"/runInstance\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:06:04',8),(182,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/runHistory\",\"createTime\":\"2024-04-22 23:35:56\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"执行历史\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2010,\"path\":\"/runHistory\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:06:17',9),(183,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"inspection/workManagement\",\"createTime\":\"2024-04-22 23:36:56\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"作业管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2010,\"path\":\"/workManagement\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-06 17:06:26',9),(184,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:1:10029\"}',NULL,1,'always exception 手动抛出','2024-06-10 13:50:53',51),(185,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:1:10029\"}',NULL,1,'always exception 手动抛出','2024-06-10 13:50:59',4),(186,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:40',43),(187,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:41',19),(188,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:41',18),(189,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:41',5),(190,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:41',15),(191,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:42',10),(192,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:42',13),(193,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 13:53:42',17),(194,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:05:18',121),(195,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:05:19',11),(196,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"timer-job:1:10022\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:05:21',17),(197,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:2:12538\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:06:20',36),(198,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:2:12538\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:06:22',20),(199,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:2:12538\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:06:23',39),(200,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:2:12538\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:06:23',16),(201,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"exception-job:2:12586\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:08:34',24),(202,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"exception-job:2:12586\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:08:35',17),(203,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"exception-job:2:12586\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:08:36',14),(204,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"exception-job:2:12586\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:08:36',26),(205,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"exception-job:2:12586\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:08:36',13),(206,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"exception-job:2:12586\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:08:38',21),(207,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"萨达\",\"leaveType\":\"事假\",\"startTime\":\"2024-06-04 02:00:00\",\"endTime\":\"2024-06-11 00:02:00\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:10:29',90),(208,'采购',1,'com.ruoyi.web.controller.activiti.PurchaseController.addSave()','POST',1,'admin','研发部门','/purchase/add','127.0.0.1','内网IP','{\"total\":\"111\",\"applyer\":\"admin\",\"manager\":\"admin\",\"pay\":\"admin\",\"itemlist\":\"阿斯顿\",\"purchasemanager\":\"admin\",\"finance\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:11:29',39),(209,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:1:10029\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:27:47',1339291),(210,'发起一个流程',1,'com.ruoyi.web.controller.activiti.FlowController.startProcess()','POST',1,'admin','研发部门','/flow/manage/startProcess','127.0.0.1','内网IP','{\"pdid\":\"asyn-job:1:10029\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 14:27:47',1304500),(211,'请假',1,'com.ruoyi.web.controller.activiti.LeaveapplyController.addSave()','POST',1,'admin','研发部门','/leaveapply/add','127.0.0.1','内网IP','{\"deptleader\":\"admin\",\"reason\":\"111\",\"leaveType\":\"事假\",\"startTime\":\"2024-06-04 02:00:00\",\"endTime\":\"2024-06-10 16:08:11\",\"userId\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 16:08:13',126),(212,'请假',3,'com.ruoyi.web.controller.activiti.LeaveapplyController.remove()','POST',1,'admin','研发部门','/leaveapply/remove','127.0.0.1','内网IP','{\"ids\":\"20,21,22\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 16:28:21',51),(213,'采购',3,'com.ruoyi.web.controller.activiti.PurchaseController.remove()','POST',1,'admin','研发部门','/purchase/remove','127.0.0.1','内网IP','{\"ids\":\"61,62\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-06-10 16:28:27',25);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-04-10 22:00:54','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-04-10 22:00:54','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-04-10 22:00:54','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-04-10 22:00:54','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8mb4_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-04-10 22:00:54','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-04-10 22:00:54','',NULL,'普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8mb4_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8mb4_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8mb4_bin DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-06-10 16:24:58','admin','2024-04-10 22:00:54','','2024-06-10 16:24:57','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-04-10 22:00:54','admin','2024-04-10 22:00:54','',NULL,'测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 16:30:33
