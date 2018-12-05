/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : duoduo

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 11/30/2018 17:57:42 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `app_demo_base`
-- ----------------------------
DROP TABLE IF EXISTS `app_demo_base`;
CREATE TABLE `app_demo_base` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `publish` datetime DEFAULT NULL COMMENT '发布时间',
  `content` mediumtext COMMENT '正文',
  `deleted` bit(1) DEFAULT b'0' COMMENT '删除',
  `version` smallint(6) DEFAULT '0' COMMENT '版本',
  `createAt` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateAt` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建者',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '更新者',
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基础表';

-- ----------------------------
--  Records of `app_demo_base`
-- ----------------------------
BEGIN;
INSERT INTO `app_demo_base` VALUES ('1027118616500408321', 'Vue 2.0 Hello World', '2018-08-17 11:59:00', '这是我的征文', b'0', '7', '2018-08-08 17:05:35', '2018-08-22 15:34:46', '1', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `k` varchar(100) DEFAULT NULL COMMENT '键',
  `v` varchar(1000) DEFAULT NULL COMMENT '值',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `kvType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('2', 'oss_qiniu', '{\"AccessKey\" : \"8-HMj9EgGNIP-xuOCpSzTn-OMyGOFtR3TxLdn4Uu\",\"SecretKey\" : \"SjpGg3V6PsMdJgn42PeEd5Ik-6aNyuwdqV5CPM6A\",\"bucket\" : \"ifast\",\"AccessUrl\" : \"http://p6r7ke2jc.bkt.clouddn.com/\"}', '七牛对象存储配置', '2018-04-06 14:31:26', '4300'), ('3', 'author', 'ekko', '代码生成器配置', '2018-05-27 19:57:04', '4401'), ('4', 'email', '1182842016@qq.com', '代码生成器配置', '2018-05-27 19:57:04', '4401'), ('5', 'package', 'com.duoduo.busi', '代码生成器配置', '2018-05-27 19:57:04', '4401'), ('6', 'autoRemovePre', 'true', '代码生成器配置', '2018-05-27 19:57:04', '4401'), ('7', 'tablePrefix', 't_', '代码生成器配置', '2018-05-27 19:57:04', '4401'), ('8', 'tinyint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('9', 'smallint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('10', 'mediumint', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('11', 'int', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('12', 'integer', 'Integer', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('13', 'bigint', 'Long', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('14', 'float', 'Float', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('15', 'double', 'Double', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('16', 'decimal', 'BigDecimal', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('17', 'bit', 'Boolean', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('18', 'char', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('19', 'varchar', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('20', 'tinytext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('21', 'text', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('22', 'mediumtext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('23', 'longtext', 'String', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('24', 'date', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('25', 'datetime', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400'), ('26', 'timestamp', 'Date', '代码生成器配置', '2018-05-27 19:57:04', '4400');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `delFlag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('6', '0', '研发部', '1', '1'), ('7', '6', '研发一部', '1', '1'), ('8', '6', '研发二部', '2', '1'), ('9', '0', '销售部', '2', '1'), ('11', '0', '产品部', '3', '1'), ('12', '11', '产品一部', '1', '1'), ('13', '0', '测试部', '5', '1'), ('14', '13', '测试一部', '1', '1'), ('15', '13', '测试二部', '2', '1'), ('16', '9', '销售一部', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parentId` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `createBy` int(64) DEFAULT NULL COMMENT '创建者',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(64) DEFAULT NULL COMMENT '更新者',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `delFlag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`delFlag`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', null, '1', null, null, '0'), ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0'), ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0'), ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0'), ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0'), ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0'), ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0'), ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0'), ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0'), ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0'), ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0'), ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0'), ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0'), ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0'), ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0'), ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0'), ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0'), ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0'), ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0'), ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0'), ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0'), ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0'), ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0'), ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0'), ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0'), ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0'), ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0'), ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0'), ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0'), ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0'), ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0'), ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0'), ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0'), ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0'), ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0'), ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0'), ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0'), ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0'), ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0'), ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0'), ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0'), ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1'), ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1'), ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0'), ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1'), ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1'), ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0'), ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1'), ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0'), ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0'), ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0'), ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0'), ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0'), ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0'), ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0'), ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0'), ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0'), ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0'), ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0'), ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0'), ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0'), ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0'), ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0'), ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0'), ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0'), ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0'), ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0'), ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0'), ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0'), ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0'), ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0'), ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1'), ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1'), ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1'), ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1'), ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1'), ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1'), ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1'), ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1'), ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1'), ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1'), ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1'), ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1'), ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1'), ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1'), ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1'), ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1'), ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1'), ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1'), ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1'), ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1'), ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1'), ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1'), ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类\0\0', '40', '0', '1', null, '1', null, null, '1'), ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0'), ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0'), ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1'), ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1'), ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1'), ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1'), ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0'), ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0'), ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0'), ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0'), ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0'), ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0'), ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0'), ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0'), ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', ''), ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, null, null, '全url是:/blog/open/page/about', ''), ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, null, null, '', ''), ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1032165188309323778 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1068443483154419714 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
--  Records of `sys_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('1068322903193321473', '1', 'admin', '登录', '60', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 09:56:43'), ('1068422489555718145', '1', 'admin', '登录', '62', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '192.168.100.151', '2018-11-30 16:32:26'), ('1068422536888438785', '1', 'admin', '登录', '6', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 16:32:38'), ('1068424831524962305', '1', 'admin', '登录', '106', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 16:41:45'), ('1068435113550852097', '1', 'admin', '登录', '53', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 17:22:36'), ('1068435366228307969', '1', 'admin', '更新代码生成配置', '183', 'POST /common/generator/update', '{\"author\":[\"ekko\"],\"email\":[\"1182842016@qq.com\"],\"package\":[\"com.duoduo\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"busi\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-30 17:23:37'), ('1068435525460865025', '1', 'admin', '根据数据表批量生成代码', '305', 'GET /common/generator/batchCode', '{\"tables\":[\"t_busi_chaper,t_busi_novel,t_busi_notag,t_busi_vip,t_busi_user,t_busi_comment,t_busi_tag\"]}', '127.0.0.1', '2018-11-30 17:24:14'), ('1068436542462144513', '1', 'admin', '删除菜单', '8', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876355\"]}', '127.0.0.1', '2018-11-30 17:28:17'), ('1068436588767260674', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876356\"]}', '127.0.0.1', '2018-11-30 17:28:28'), ('1068436604227465217', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876357\"]}', '127.0.0.1', '2018-11-30 17:28:32'), ('1068436626067206146', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876358\"]}', '127.0.0.1', '2018-11-30 17:28:37'), ('1068436645046431745', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876359\"]}', '127.0.0.1', '2018-11-30 17:28:41'), ('1068436662305992705', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876360\"]}', '127.0.0.1', '2018-11-30 17:28:46'), ('1068436706098720769', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876361\"]}', '127.0.0.1', '2018-11-30 17:28:56'), ('1068436727154126850', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876363\"]}', '127.0.0.1', '2018-11-30 17:29:01'), ('1068436739820924930', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876366\"]}', '127.0.0.1', '2018-11-30 17:29:04'), ('1068436752437391362', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876365\"]}', '127.0.0.1', '2018-11-30 17:29:07'), ('1068436763262889986', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876364\"]}', '127.0.0.1', '2018-11-30 17:29:10'), ('1068436776126820354', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876362\"]}', '127.0.0.1', '2018-11-30 17:29:13'), ('1068436818325712897', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876367\"]}', '127.0.0.1', '2018-11-30 17:29:23'), ('1068436843244072962', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876368\"]}', '127.0.0.1', '2018-11-30 17:29:29'), ('1068436869991149569', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876369\"]}', '127.0.0.1', '2018-11-30 17:29:35'), ('1068436884050456577', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876370\"]}', '127.0.0.1', '2018-11-30 17:29:38'), ('1068436894536216578', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876371\"]}', '127.0.0.1', '2018-11-30 17:29:41'), ('1068436906041192450', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876372\"]}', '127.0.0.1', '2018-11-30 17:29:44'), ('1068436948969893890', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876374\"]}', '127.0.0.1', '2018-11-30 17:29:54'), ('1068436981165371394', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876377\"]}', '127.0.0.1', '2018-11-30 17:30:02'), ('1068437047464734721', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876375\"]}', '127.0.0.1', '2018-11-30 17:30:17'), ('1068437102384951297', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876376\"]}', '127.0.0.1', '2018-11-30 17:30:30'), ('1068437144265076738', '1', 'admin', '删除菜单', '11', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876379\"]}', '127.0.0.1', '2018-11-30 17:30:40'), ('1068437197004255234', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876373\"]}', '127.0.0.1', '2018-11-30 17:30:53'), ('1068437250695540738', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876378\"]}', '127.0.0.1', '2018-11-30 17:31:06'), ('1068437264884871169', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876384\"]}', '127.0.0.1', '2018-11-30 17:31:09'), ('1068437276108828674', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876383\"]}', '127.0.0.1', '2018-11-30 17:31:12'), ('1068437285059473410', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876382\"]}', '127.0.0.1', '2018-11-30 17:31:14'), ('1068437296266653698', '1', 'admin', '删除菜单', '3', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876381\"]}', '127.0.0.1', '2018-11-30 17:31:17'), ('1068437308111368194', '1', 'admin', '删除菜单', '2', 'POST /sys/menu/remove', '{\"id\":[\"1034090238251876380\"]}', '127.0.0.1', '2018-11-30 17:31:20'), ('1068439518010454017', '1', 'admin', '更新代码生成配置', '105', 'POST /common/generator/update', '{\"author\":[\"ekko\"],\"email\":[\"1182842016@qq.com\"],\"package\":[\"com.duoduo.busi\"],\"autoRemovePre\":[\"on\"],\"tablePrefix\":[\"t_\"],\"tinyint\":[\"Integer\"],\"smallint\":[\"Integer\"],\"mediumint\":[\"Integer\"],\"int\":[\"Integer\"],\"integer\":[\"Integer\"],\"bigint\":[\"Long\"],\"float\":[\"Float\"],\"double\":[\"Double\"],\"decimal\":[\"BigDecimal\"],\"bit\":[\"Boolean\"],\"char\":[\"String\"],\"varchar\":[\"String\"],\"tinytext\":[\"String\"],\"text\":[\"String\"],\"mediumtext\":[\"String\"],\"longtext\":[\"String\"],\"date\":[\"Date\"],\"datetime\":[\"Date\"],\"timestamp\":[\"Date\"]}', '127.0.0.1', '2018-11-30 17:40:06'), ('1068439540626141185', '1', 'admin', '根据数据表批量生成代码', '149', 'GET /common/generator/batchCode', '{\"tables\":[\"t_busi_chaper,t_busi_novel,t_busi_notag,t_busi_vip,t_busi_user,t_busi_comment,t_busi_tag\"]}', '127.0.0.1', '2018-11-30 17:40:12'), ('1068441363969855490', '1', 'admin', '登录', '52', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 17:47:27'), ('1068441972898910209', '1', 'admin', '保存菜单', '7', 'POST /sys/menu/save', '{\"parentId\":[\"77\"],\"type\":[\"1\"],\"name\":[\"api文档\"],\"url\":[\"/common/config/swagger\"],\"perms\":[\"common:swagger\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-eyedropper\"]}', '127.0.0.1', '2018-11-30 17:49:52'), ('1068442644390203394', '1', 'admin', '更新角色', '24', 'POST /sys/role/update', '{\"id\":[\"1\"],\"menuIds\":[\"193,194,195,196,197,79,80,81,83,176,177,178,179,180,207,208,209,210,211,20,21,22,61,12,13,14,24,25,26,15,55,56,62,74,75,76,48,72,28,29,30,57,92,71,78,175,206,1,2,6,7,73,3,27,91,1068441972877938690,77,-1\"],\"roleName\":[\"超级用户角色\"],\"remark\":[\"超级管理员\"]}', '127.0.0.1', '2018-11-30 17:52:32'), ('1068443070728507393', '1', 'admin', '登录', '84', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 17:54:13'), ('1068443483154419713', '1', 'admin', '登录', '52', 'POST /login', '{\"username\":[\"admin\"],\"password\":[\"1\"]}', '127.0.0.1', '2018-11-30 17:55:52');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1068441972877938691 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '0', '基础管理', '', '', '0', 'fa fa-bars', '0', '2017-08-09 22:49:47', null), ('2', '3', '系统菜单', 'sys/menu/', 'sys:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null), ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', '2017-08-14 14:13:43'), ('6', '3', '用户管理', 'sys/user/', 'sys:user:user', '1', 'fa fa-user', '0', '2017-08-10 14:12:11', null), ('7', '3', '角色管理', 'sys/role', 'sys:role:role', '1', 'fa fa-paw', '1', '2017-08-10 14:13:19', null), ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null), ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null), ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null), ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null), ('20', '2', '新增', '', 'sys:menu:add', '2', '', '0', '2017-08-14 10:59:32', null), ('21', '2', '编辑', '', 'sys:menu:edit', '2', '', '0', '2017-08-14 10:59:56', null), ('22', '2', '删除', '', 'sys:menu:remove', '2', '', '0', '2017-08-14 11:00:26', null), ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null), ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null), ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null), ('27', '91', '系统日志', 'common/log', 'common:log', '1', 'fa fa-warning', '0', '2017-08-14 22:11:53', null), ('28', '27', '刷新', null, 'sys:log:list', '2', null, '0', '2017-08-14 22:30:22', null), ('29', '27', '删除', null, 'sys:log:remove', '2', null, '0', '2017-08-14 22:30:43', null), ('30', '27', '清空', null, 'sys:log:clear', '2', null, '0', '2017-08-14 22:31:02', null), ('48', '77', '代码生成', 'common/generator', 'common:generator', '1', 'fa fa-code', '3', null, null), ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null), ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null), ('57', '91', '运行监控', '/druid/index.html', '', '1', 'fa fa-caret-square-o-right', '1', null, null), ('61', '2', '批量删除', '', 'sys:menu:batchRemove', '2', null, null, null, null), ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null), ('71', '1', '文件管理', '/common/sysFile', 'oss:file:file', '1', 'fa fa-folder-open', '2', null, null), ('72', '77', '计划任务', 'common/job', 'common:taskScheduleJob', '1', 'fa fa-hourglass-1', '4', null, null), ('73', '3', '部门管理', '/sys/dept', 'system:sysDept:sysDept', '1', 'fa fa-users', '3', null, null), ('74', '73', '增加', '/sys/dept/add', 'system:sysDept:add', '2', null, '1', null, null), ('75', '73', '刪除', 'sys/dept/remove', 'system:sysDept:remove', '2', null, '2', null, null), ('76', '73', '编辑', '/sys/dept/edit', 'system:sysDept:edit', '2', null, '3', null, null), ('77', '0', '系统工具', '', '', '0', 'fa fa-gear', '4', null, null), ('78', '1', '数据字典', '/common/sysDict', 'common:sysDict:sysDict', '1', 'fa fa-book', '1', null, null), ('79', '78', '增加', '/common/sysDict/add', 'common:sysDict:add', '2', null, '2', null, null), ('80', '78', '编辑', '/common/sysDict/edit', 'common:sysDict:edit', '2', null, '2', null, null), ('81', '78', '删除', '/common/sysDict/remove', 'common:sysDict:remove', '2', '', '3', null, null), ('83', '78', '批量删除', '/common/sysDict/batchRemove', 'common:sysDict:batchRemove', '2', '', '4', null, null), ('91', '0', '系统监控', '', '', '0', 'fa fa-video-camera', '5', null, null), ('92', '91', '在线用户', 'sys/online', '', '1', 'fa fa-user', null, null, null), ('97', '0', '图表管理', '', '', '0', 'fa fa-bar-chart', '7', null, null), ('98', '97', '百度chart', '/chart/graph_echarts.html', '', '1', 'fa fa-area-chart', null, null, null), ('175', '1', '系统配置', '/common/config', null, '1', 'fa fa-file-code-o', '6', null, null), ('176', '175', '查看', null, 'common:config:config', '2', null, '6', null, null), ('177', '175', '新增', null, 'common:config:add', '2', null, '6', null, null), ('178', '175', '修改', null, 'common:config:edit', '2', null, '6', null, null), ('179', '175', '删除', null, 'common:config:remove', '2', null, '6', null, null), ('180', '175', '批量删除', null, 'common:config:batchRemove', '2', null, '6', null, null), ('181', '199', '公众号管理', '/wxmp/mpConfig', null, '1', 'fa fa-file-code-o', '6', null, null), ('182', '181', '查看', null, 'wxmp:mpConfig:mpConfig', '2', null, '6', null, null), ('183', '181', '新增', null, 'wxmp:mpConfig:add', '2', null, '6', null, null), ('184', '181', '修改', null, 'wxmp:mpConfig:edit', '2', null, '6', null, null), ('185', '181', '删除', null, 'wxmp:mpConfig:remove', '2', null, '6', null, null), ('186', '181', '批量删除', null, 'wxmp:mpConfig:batchRemove', '2', null, '6', null, null), ('187', '199', '微信粉丝表', '/wxmp/mpFans', null, '1', 'fa fa-file-code-o', '6', null, null), ('188', '187', '查看', null, 'wxmp:mpFans:mpFans', '2', null, '6', null, null), ('189', '187', '新增', null, 'wxmp:mpFans:add', '2', null, '6', null, null), ('190', '187', '修改', null, 'wxmp:mpFans:edit', '2', null, '6', null, null), ('191', '187', '删除', null, 'wxmp:mpFans:remove', '2', null, '6', null, null), ('192', '187', '批量删除', null, 'wxmp:mpFans:batchRemove', '2', null, '6', null, null), ('193', '71', '增加', '/common/sysFile/add', 'oss:file:add', '2', null, null, null, null), ('194', '71', '列表', '/common/sysFile/list', 'oss:file:list', '2', null, null, null, null), ('195', '71', '编辑', '/common/sysFile/edit', 'oss:file:update', '2', null, null, null, null), ('196', '71', '查询', '/common/sysFile/info', 'oss:file:info', '2', null, null, null, null), ('197', '71', '删除', '/common/sysFile/remove', 'oss:file:remove', '2', null, null, null, null), ('199', '0', '微信公众号', null, null, '0', 'fa fa-file-code-o', '3', null, null), ('205', '187', '同步', null, 'wxmp:mpFans:sync', '2', 'fa fa-refresh', '5', null, null), ('206', '1', '[Demo]基础表', '/demo/demoBase', '', '1', 'fa fa-file-code-o', '6', null, null), ('207', '206', '查看', null, 'demo:demoBase:demoBase', '2', null, '6', null, null), ('208', '206', '新增', null, 'demo:demoBase:add', '2', null, '6', null, null), ('209', '206', '修改', null, 'demo:demoBase:edit', '2', null, '6', null, null), ('210', '206', '删除', null, 'demo:demoBase:remove', '2', null, '6', null, null), ('211', '206', '批量删除', null, 'demo:demoBase:batchRemove', '2', null, '6', null, null), ('1034089959238385666', '0', 'api测试-用户更新', '', 'api:user:update', '2', '', null, null, null), ('1034090238251876354', '0', 'api测试-appUser角色', '', 'api:user:role', '2', '', null, null, null), ('1068441972877938690', '77', 'api文档', '/common/config/swagger', 'common:swagger', '1', 'fa fa-eyedropper', '3', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `roleSign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `userIdCreate` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1034088931742957570 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '超级用户角色', 'adminRole', '超级管理员', '2', '2017-08-12 00:43:52', '2017-08-12 19:14:59'), ('56', '普通用户', null, '普通用户', null, null, null), ('1034088931742957569', '前端API', 'apiRole', '前端API', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menuId` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4605 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1'), ('368', '44', '32'), ('369', '44', '33'), ('370', '44', '34'), ('371', '44', '35'), ('372', '44', '28'), ('373', '44', '29'), ('374', '44', '30'), ('375', '44', '38'), ('376', '44', '4'), ('377', '44', '27'), ('378', '45', '38'), ('379', '46', '3'), ('380', '46', '20'), ('381', '46', '21'), ('382', '46', '22'), ('383', '46', '23'), ('384', '46', '11'), ('385', '46', '12'), ('386', '46', '13'), ('387', '46', '14'), ('388', '46', '24'), ('389', '46', '25'), ('390', '46', '26'), ('391', '46', '15'), ('392', '46', '2'), ('393', '46', '6'), ('394', '46', '7'), ('598', '50', '38'), ('632', '38', '42'), ('737', '51', '38'), ('738', '51', '39'), ('739', '51', '40'), ('740', '51', '41'), ('741', '51', '4'), ('742', '51', '32'), ('743', '51', '33'), ('744', '51', '34'), ('745', '51', '35'), ('746', '51', '27'), ('747', '51', '28'), ('748', '51', '29'), ('749', '51', '30'), ('750', '51', '1'), ('1064', '54', '53'), ('1095', '55', '2'), ('1096', '55', '6'), ('1097', '55', '7'), ('1098', '55', '3'), ('1099', '55', '50'), ('1100', '55', '49'), ('1101', '55', '1'), ('1856', '53', '28'), ('1857', '53', '29'), ('1858', '53', '30'), ('1859', '53', '27'), ('1860', '53', '57'), ('1861', '53', '71'), ('1862', '53', '48'), ('1863', '53', '72'), ('1864', '53', '1'), ('1865', '53', '7'), ('1866', '53', '55'), ('1867', '53', '56'), ('1868', '53', '62'), ('1869', '53', '15'), ('1870', '53', '2'), ('1871', '53', '61'), ('1872', '53', '20'), ('1873', '53', '21'), ('1874', '53', '22'), ('2247', '63', '-1'), ('2248', '63', '84'), ('2249', '63', '85'), ('2250', '63', '88'), ('2251', '63', '87'), ('2252', '64', '84'), ('2253', '64', '89'), ('2254', '64', '88'), ('2255', '64', '87'), ('2256', '64', '86'), ('2257', '64', '85'), ('2258', '65', '89'), ('2259', '65', '88'), ('2260', '65', '86'), ('2262', '67', '48'), ('2263', '68', '88'), ('2264', '68', '87'), ('2265', '69', '89'), ('2266', '69', '88'), ('2267', '69', '86'), ('2268', '69', '87'), ('2269', '69', '85'), ('2270', '69', '84'), ('2271', '70', '85'), ('2272', '70', '89'), ('2273', '70', '88'), ('2274', '70', '87'), ('2275', '70', '86'), ('2276', '70', '84'), ('2277', '71', '87'), ('2278', '72', '59'), ('2279', '73', '48'), ('2280', '74', '88'), ('2281', '74', '87'), ('2282', '75', '88'), ('2283', '75', '87'), ('2284', '76', '85'), ('2285', '76', '89'), ('2286', '76', '88'), ('2287', '76', '87'), ('2288', '76', '86'), ('2289', '76', '84'), ('2292', '78', '88'), ('2293', '78', '87'), ('2294', '78', null), ('2295', '78', null), ('2296', '78', null), ('2308', '80', '87'), ('2309', '80', '86'), ('2310', '80', '-1'), ('2311', '80', '84'), ('2312', '80', '85'), ('2328', '79', '72'), ('2329', '79', '48'), ('2330', '79', '77'), ('2331', '79', '84'), ('2332', '79', '89'), ('2333', '79', '88'), ('2334', '79', '87'), ('2335', '79', '86'), ('2336', '79', '85'), ('2337', '79', '-1'), ('2338', '77', '89'), ('2339', '77', '88'), ('2340', '77', '87'), ('2341', '77', '86'), ('2342', '77', '85'), ('2343', '77', '84'), ('2344', '77', '72'), ('2345', '77', '-1'), ('2346', '77', '77'), ('3178', '56', '68'), ('3179', '56', '60'), ('3180', '56', '59'), ('3181', '56', '58'), ('3182', '56', '51'), ('3183', '56', '50'), ('3184', '56', '49'), ('3185', '56', '-1'), ('4544', '1034088931742957569', '1034089959238385666'), ('4545', '1034088931742957569', '1034090238251876354'), ('4546', '1034088931742957569', '-1'), ('4547', '1', '193'), ('4548', '1', '194'), ('4549', '1', '195'), ('4550', '1', '196'), ('4551', '1', '197'), ('4552', '1', '79'), ('4553', '1', '80'), ('4554', '1', '81'), ('4555', '1', '83'), ('4556', '1', '176'), ('4557', '1', '177'), ('4558', '1', '178'), ('4559', '1', '179'), ('4560', '1', '180'), ('4561', '1', '207'), ('4562', '1', '208'), ('4563', '1', '209'), ('4564', '1', '210'), ('4565', '1', '211'), ('4566', '1', '20'), ('4567', '1', '21'), ('4568', '1', '22'), ('4569', '1', '61'), ('4570', '1', '12'), ('4571', '1', '13'), ('4572', '1', '14'), ('4573', '1', '24'), ('4574', '1', '25'), ('4575', '1', '26'), ('4576', '1', '15'), ('4577', '1', '55'), ('4578', '1', '56'), ('4579', '1', '62'), ('4580', '1', '74'), ('4581', '1', '75'), ('4582', '1', '76'), ('4583', '1', '48'), ('4584', '1', '72'), ('4585', '1', '28'), ('4586', '1', '29'), ('4587', '1', '30'), ('4588', '1', '57'), ('4589', '1', '92'), ('4590', '1', '71'), ('4591', '1', '78'), ('4592', '1', '175'), ('4593', '1', '206'), ('4594', '1', '1'), ('4595', '1', '2'), ('4596', '1', '6'), ('4597', '1', '7'), ('4598', '1', '73'), ('4599', '1', '3'), ('4600', '1', '27'), ('4601', '1', '91'), ('4602', '1', '1068441972877938690'), ('4603', '1', '77'), ('4604', '1', '-1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_task`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cronExpression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `methodName` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `isConcurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `updateBy` varchar(64) DEFAULT NULL COMMENT '更新者',
  `beanClass` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `jobStatus` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `jobGroup` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `updateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(64) DEFAULT NULL COMMENT '创建者',
  `springBean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `jobName` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1020572889410367491 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_task`
-- ----------------------------
BEGIN;
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.ifast.job.TestJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'TestJob');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `deptId` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `userIdCreate` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmtCreate` datetime DEFAULT NULL COMMENT '创建时间',
  `gmtModified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `picId` bigint(32) DEFAULT NULL,
  `liveAddress` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1034088697579159555 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '33808479d49ca8a3cdc93d4f976d1e3d', '6', 'izenglong@163.com', '15277778888', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '96', '2018-04-02 00:00:00', '151', '创客基地', '', '广东省', '广州市', '番禺区'), ('2', 'test', '临时用户', 'b132f5f968c9373261f74025c23c2222', '6', 'test@ifast.com', '15278792752', '1', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36', '96', '2018-08-22 00:00:00', null, '', '', '北京市', '北京市市辖区', '东城区'), ('1034088697579159554', 'appUser', 'user', 'fc4d8bf7d69f03344a58f9381dd75dfe', '12', 'appUser@ifast.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('73', '30', '48'), ('74', '30', '49'), ('75', '30', '50'), ('76', '31', '48'), ('77', '31', '49'), ('78', '31', '52'), ('79', '32', '48'), ('80', '32', '49'), ('81', '32', '50'), ('82', '32', '51'), ('83', '32', '52'), ('84', '33', '38'), ('85', '33', '49'), ('86', '33', '52'), ('87', '34', '50'), ('88', '34', '51'), ('89', '34', '52'), ('110', '1', '1'), ('111', '2', '1'), ('117', '135', '1'), ('120', '134', '1'), ('121', '134', '48'), ('124', null, '48'), ('127', null, '1'), ('128', null, '1'), ('129', null, '1'), ('131', '137', '57'), ('133', '1034088697579159554', '1034088931742957569');
COMMIT;

-- ----------------------------
--  Table structure for `t_busi_chaper`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_chaper`;
CREATE TABLE `t_busi_chaper` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `novel_id` varchar(32) DEFAULT NULL COMMENT '小说ID',
  `chapername` varchar(50) DEFAULT NULL COMMENT '章节名称',
  `content` text COMMENT '章节内容',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `active_flag` tinyint(2) DEFAULT NULL COMMENT '删除标识，0--正常，1--删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='章节表';

-- ----------------------------
--  Table structure for `t_busi_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_comment`;
CREATE TABLE `t_busi_comment` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `content` text COMMENT '评论内容',
  `active_flag` tinyint(2) DEFAULT NULL COMMENT '删除标识，0--正常，1--删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小说评论表';

-- ----------------------------
--  Table structure for `t_busi_notag`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_notag`;
CREATE TABLE `t_busi_notag` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `tag_id` varchar(32) NOT NULL COMMENT '标签ID',
  `novel_id` varchar(32) NOT NULL COMMENT '小说ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签小说中间表';

-- ----------------------------
--  Table structure for `t_busi_novel`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_novel`;
CREATE TABLE `t_busi_novel` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `novelname` varchar(50) DEFAULT NULL COMMENT '小说名称',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `rank` double(3,1) DEFAULT NULL COMMENT '评分',
  `count` double(5,2) DEFAULT NULL COMMENT '字数，单位-万字',
  `clicks` double(5,2) DEFAULT NULL COMMENT '点击数，单位-万次',
  `active_flag` tinyint(2) DEFAULT NULL COMMENT '删除标识，0--正常，1--删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小说表';

-- ----------------------------
--  Table structure for `t_busi_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_tag`;
CREATE TABLE `t_busi_tag` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `tagname` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `active_flag` tinyint(2) DEFAULT NULL COMMENT '删除标识，0--正常，1--删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- ----------------------------
--  Table structure for `t_busi_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_user`;
CREATE TABLE `t_busi_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `vip_id` varchar(32) DEFAULT NULL COMMENT 'vipID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `active_flag` tinyint(2) DEFAULT NULL COMMENT '删除标识，0--正常，1--删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小说用户表';

-- ----------------------------
--  Table structure for `t_busi_vip`
-- ----------------------------
DROP TABLE IF EXISTS `t_busi_vip`;
CREATE TABLE `t_busi_vip` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `username` varchar(50) DEFAULT NULL COMMENT 'vip名称',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `active_flag` tinyint(2) DEFAULT NULL COMMENT '删除标识，0--正常，1--删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='vip表';

-- ----------------------------
--  Table structure for `wx_mp_config`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_config`;
CREATE TABLE `wx_mp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `token` varchar(120) DEFAULT NULL,
  `appId` varchar(64) NOT NULL COMMENT 'APPID',
  `appSecret` varchar(128) NOT NULL COMMENT 'AppSecret',
  `msgMode` int(11) DEFAULT NULL COMMENT '1加密 0不加密',
  `msgSecret` varchar(128) DEFAULT NULL,
  `mpName` varchar(250) DEFAULT NULL COMMENT '公众号名字',
  `appType` int(11) NOT NULL COMMENT '公众号类型： 1.订阅号 2.服务号 3.企业号 4.小程序 5. 测试号',
  `isAuth` int(11) DEFAULT NULL COMMENT '认证授权：1已认证 0未认证',
  `subscribeUrl` varchar(500) DEFAULT NULL COMMENT '提示订阅URL',
  `appKey` varchar(100) DEFAULT NULL COMMENT '开放的公众号key',
  `logo` varchar(255) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='微信配置表';

-- ----------------------------
--  Records of `wx_mp_config`
-- ----------------------------
BEGIN;
INSERT INTO `wx_mp_config` VALUES ('11', '72597b9628704ab09e8b9e8cbe9b540a', 'wxeb5638d307d3df71', '03b1501c72a91f2935037336e43e67e6', '0', '', '源码在线-测试', '5', '0', 'http://xxx.com/test', 'ymhTest', 'http://p6r7ke2jc.bkt.clouddn.com/ifast/20180822/photo_s-1534922328124.png', '2017-11-03 17:32:53');
COMMIT;

-- ----------------------------
--  Table structure for `wx_mp_fans`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_fans`;
CREATE TABLE `wx_mp_fans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mpId` bigint(11) NOT NULL COMMENT '公众号id',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `subscribe` tinyint(4) DEFAULT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。0未关注，1已关注',
  `subscribeTime` datetime DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `subscribeKey` varchar(100) DEFAULT NULL COMMENT '关注来源',
  `sex` tinyint(4) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL COMMENT '语言',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `unionid` varchar(125) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(20) DEFAULT NULL COMMENT '分组ID',
  `status` tinyint(11) DEFAULT NULL COMMENT '用户状态 1:正常，0：禁用',
  `tagidList` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2905 DEFAULT CHARSET=utf8mb4 COMMENT='微信粉丝表';

-- ----------------------------
--  Records of `wx_mp_fans`
-- ----------------------------
BEGIN;
INSERT INTO `wx_mp_fans` VALUES ('2899', '5', 'oorK7v4LWw3GMbwt_Ck6PuQ_8_D8', '你是我的眼', '0', null, null, '2', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/A7sq8BD8oewx50myY72SwetEVkBXbXDvT5jj6ytorRxqyGwtBu1XTnWGohGXhdTtTwh6VSAbUEUSWpibddJDChg/0', 'oI55m1o8VxrTFvV57WkzEFTHLRIM', null, null, '0', null), ('2902', '7', 'otO0P09bRa-YRLNlPbJEL1bdDjkQ', 'Aron', '1', '2017-11-24 11:14:28', '', '1', '广州', '中国', '广东', 'zh_CN', 'http://wx.qlogo.cn/mmopen/BQD9yxMcK6CicIrF6tU8Pqucb2VgYicn1iaTMTwm9war1KLT9RlibbsJ9cYal7yypERODjt6XGXC4dVJdVs9woJZBHwI0ibmaGQxY/0', 'oVzGa0kCIhSXljL9wDALjN00ylOs', '', '0', '0', null), ('2904', '9', 'ozbGr0vZhCS8Pe1lpTuy1tq9Wlls', 'SuSu', '0', '2017-11-26 21:03:25', '', '1', '江北', '中国', '重庆', 'zh_CN', 'http://wx.qlogo.cn/mmopen/8o7KgbIM6ibFyF3coD1mMMdm91kic6Tb68P0hq9lDccec0TllUm5MnBa4WEesfiaW1HUXWqNqCTNUsrYM5iceq9gnesbSPSaE0Yw/0', 'oJitl0bd590o0ONtSt1nB7hFh0Bo', '', '0', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `wx_mp_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_menu`;
CREATE TABLE `wx_mp_menu` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parentIdx` bigint(20) DEFAULT NULL,
  `menuType` varchar(50) NOT NULL COMMENT '菜单类型：1主菜单，2链接，3文本，4关键字，5扫码，6发图，7发送位置',
  `menuName` varchar(128) NOT NULL,
  `menuKey` varchar(64) DEFAULT NULL,
  `menuUrl` varchar(500) DEFAULT NULL COMMENT '菜单链接',
  `replyContent` varchar(500) DEFAULT NULL,
  `scanType` int(4) DEFAULT NULL COMMENT '扫码类型：1扫码带事件，2扫码带提示',
  `pictureType` int(4) DEFAULT NULL COMMENT '发图类型：1，系统拍照发图；2,，拍照或者相册发图；3，微信相册发图',
  `location` varchar(255) DEFAULT NULL COMMENT '发送位置',
  `sort` int(11) DEFAULT NULL COMMENT '菜单排序',
  `status` int(4) DEFAULT NULL COMMENT '菜单状态',
  `createBy` bigint(20) DEFAULT NULL COMMENT '创建人',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `mpId` bigint(20) NOT NULL COMMENT '微信配置ID',
  `idx` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
--  Table structure for `wx_mp_wechat_keys`
-- ----------------------------
DROP TABLE IF EXISTS `wx_mp_wechat_keys`;
CREATE TABLE `wx_mp_wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mpId` bigint(20) NOT NULL COMMENT '公众号id',
  `mediaId` varchar(50) DEFAULT NULL COMMENT '素材Id',
  `keyword` varchar(200) DEFAULT NULL COMMENT '关键字，以#,#隔开',
  `type` tinyint(4) DEFAULT NULL COMMENT '回复类型，1：关键字 2：关注自动回复 3：默认回复',
  `replyType` varchar(20) DEFAULT NULL COMMENT '回复类型，文字：text 图文：news 图片： image 语音：voice 音乐：music 视频：video',
  `content` text COMMENT '内容',
  `newsId` bigint(20) DEFAULT NULL COMMENT '图文素材Id',
  `musicTitle` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `musicCover` varchar(255) DEFAULT NULL COMMENT '音乐封面',
  `musicUrl` varchar(255) DEFAULT NULL COMMENT '音乐url',
  `musicDesc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `imageUrl` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `voiceUrl` varchar(255) DEFAULT NULL COMMENT '音频URL',
  `videoTitle` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `videoUrl` varchar(255) DEFAULT NULL COMMENT '视频url',
  `videoDesc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-关键字回复';

SET FOREIGN_KEY_CHECKS = 1;
