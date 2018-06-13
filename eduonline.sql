/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : eduonline

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-06-13 08:52:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '编辑部门');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('6', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('4', '1', '34');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '35');
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '65');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '66');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 轮播图', '8', 'add_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 轮播图', '8', 'change_banner');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 轮播图', '8', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 轮播图', '8', 'view_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 课程', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 课程', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 课程', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can add 章节', '10', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('37', 'Can change 章节', '10', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete 章节', '10', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('39', 'Can add 视频', '11', 'add_video');
INSERT INTO `auth_permission` VALUES ('40', 'Can change 视频', '11', 'change_video');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete 视频', '11', 'delete_video');
INSERT INTO `auth_permission` VALUES ('42', 'Can add 课程资源', '12', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('43', 'Can change 课程资源', '12', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete 课程资源', '12', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('45', 'Can view 课程', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('46', 'Can view 课程资源', '12', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('47', 'Can view 章节', '10', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 视频', '11', 'view_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 城市', '13', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 城市', '13', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 城市', '13', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程机构', '14', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程机构', '14', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程机构', '14', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 城市', '13', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 课程机构', '14', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 课程评论', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 课程评论', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 课程评论', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 用户收藏', '18', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 用户收藏', '18', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 用户收藏', '18', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 用户消息', '19', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 用户消息', '19', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 用户消息', '19', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 用户课程', '20', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 用户课程', '20', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 用户课程', '20', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课程评论', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 用户课程', '20', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 用户收藏', '18', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户消息', '19', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('91', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('93', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('94', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('96', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can add 轮播课程', '9', 'add_bannnercourse');
INSERT INTO `auth_permission` VALUES ('102', 'Can change 轮播课程', '9', 'change_bannnercourse');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete 轮播课程', '9', 'delete_bannnercourse');
INSERT INTO `auth_permission` VALUES ('104', 'Can view 轮播课程', '26', 'view_bannnercourse');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11),
  `teacher_tell` varchar(300) NOT NULL,
  `you_need_know` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'Mysql基础', 'MySQL基础', 'MySQL基础', 'cj', '110', '0', '0', 'courses/2017/12/mysql.jpg', '2', '2017-12-17 19:04:00.000000', '1', '后端开发', 'mysql', '2', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('2', 'django入门', 'django入门', '<p>&nbsp; &nbsp; django入门11</p>', 'zj', '26', '0', '0', 'courses/2017/12/timg.jpg', '1', '2017-12-26 19:58:00.000000', '1', '后端开发', 'django', '1', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('3', '微信小程序', '微信小程序', '微信小程序', 'zj', '80', '2', '0', 'courses/2017/12/ddc3edac-d9c5-4119-9dd4-431d10ccd76c.jpg', '7', '2017-12-28 16:07:00.000000', '1', '后端开发', '小程序', '2', '好好学，努力学', '学完涨薪！！！', '1');
INSERT INTO `courses_course` VALUES ('4', '基于Node.js的后端应用简介', '基于Node.js的后端应用简介', '基于Node.js的后端应用简介', 'cj', '10', '4', '0', 'courses/2017/12/55e3b20110acb.jpg', '2', '2017-12-28 16:07:00.000000', '1', '后端开发', 'node.js', '3', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('5', '万变不离C语言（基础篇）', '万变不离C语言（基础篇）', '万变不离C语言（基础篇）', 'cj', '30', '0', '0', 'courses/2017/12/236f7387-7dd0-43f3-9b5a-58bf868e3025.jpg', '5', '2017-12-28 16:10:00.000000', '1', '后端开发', 'c', '1', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('6', '深入浅出 — 自然语言处理', '深入浅出 — 自然语言处理', '深入浅出 — 自然语言处理', 'zj', '100', '9', '0', 'courses/2017/12/85a3364e-47a3-41df-b5c8-daf48a57b7cd.jpg', '100', '2017-12-28 16:11:00.000000', '1', '后端开发', 'nlp', '2', '好好学，努力学', '学完涨薪！！！', '1');
INSERT INTO `courses_course` VALUES ('7', 'TensorFlow框架入门实战', 'TensorFlow框架入门实战', 'TensorFlow框架入门实战', 'zj', '60', '10', '0', 'courses/2017/12/c4867940-3e7e-4ad7-b1ff-279f4fc814cc.jpg', '1', '2017-12-28 16:15:00.000000', '2', '后端开发', 'tensorflow', '3', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('8', 'Caffe框架入门实战', 'Caffe框架入门实战', 'Caffe框架入门实战', 'zj', '167', '0', '0', 'courses/2017/12/8b04b60a-677b-405a-8b31-4a78867064ed.jpg', '303', '2017-12-28 16:15:00.000000', '2', '后端开发', 'caffe', '3', '好好学，努力学', '学完涨薪！！！', '1');
INSERT INTO `courses_course` VALUES ('9', 'Java语言基础', 'Java语言基础', 'Java语言基础', 'cj', '50', '0', '0', 'courses/2017/12/311af3e2-5801-454c-a39a-06f620e634d5.png', '45', '2017-12-28 16:19:00.000000', '2', '后端开发', 'java', '1', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('10', 'Java语言进阶', 'Java语言进阶', 'Java语言进阶', 'zj', '600', '9', '0', 'courses/2017/12/d77976f0-487b-4f95-8e82-34bf2f8fa2f5.png', '10', '2017-12-28 16:20:00.000000', '2', '后端开发', 'java', '2', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('11', 'Android数据库开发精炼', 'Android数据库开发精炼', '<p><img src=\"/media/courses/ueditor/20160628233514068_20180123221730_417.jpg\" title=\"\" alt=\"20160628233514068.jpg\"/> </p><p style=\"line-height: 16px;\"><br/></p><p><br/> </p>', 'zj', '780', '5', '0', 'courses/2017/12/47623a7c-30fb-4a9c-8213-6aa41bf6b979.jpg', '65', '2017-12-28 16:21:00.000000', '2', '后端开发', 'android', '3', '好好学，努力学', '学完涨薪！！！', '0');
INSERT INTO `courses_course` VALUES ('12', '人工智能原理', '系统介绍人工智能的发展历程、核心思想、基本理论与应用', '人工智能是国内外著名大学计算机专业设置的骨干课之一，也是国内外著名高校和研究机构的主要研究方向之一。人工智能研究如何用计算机软件和硬件去实现Agent的感知、决策与智能行为，其理论基础表现为搜索、推理、规划和学习，应用领域包括计算机视觉、图像分析、模式识别、专家系统、自动规划、智能搜索、计算机博弈、智能控制、机器人学、自然语言处理、社交网络、数据挖掘、虚拟现实等。\r\n     本课程在系统回顾人工智能发展历程的基础上，重点介绍人工智能的核心思想、基本理论，基本方法与部分应用。 课程以该英文原版教材为主，并根据人工智能、特别是机器学习领域的发展和变化，编撰和充实了大量的内容。本课程共有12讲，采用双语教学，即中英文PPT和中英文作业等、中文讲授和交流。', 'cj', '205', '5', '1', 'courses/2018/01/B4839DBDE2346ADEAB71918D799EB73D.jpg', '6', '2018-01-18 20:02:00.000000', '11', '后端开发', 'AI', '2', '系统介绍人工智能的发展历程、核心思想、基本理论与应用。', 'python基础', '0');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', '课程代码', 'course/resource/18/01/daima.rar', '2018-01-05 16:17:00.000000', '11');
INSERT INTO `courses_courseresource` VALUES ('2', 'java_basic_resource', 'course/resource/18/01/java_basic_resource.zip', '2018-01-18 20:20:00.000000', '9');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '1.1 数据库简介', '2017-12-17 19:07:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('2', '第 1 课 GreenDAO 3简介', '2018-01-04 21:04:00.000000', '11');
INSERT INTO `courses_lesson` VALUES ('3', '第 2 课 在Android Studio中配置GreenDAO 3', '2018-01-04 21:06:00.000000', '11');
INSERT INTO `courses_lesson` VALUES ('4', '第 3 课 创建实体类及生成各相关文件', '2018-01-04 21:06:00.000000', '11');
INSERT INTO `courses_lesson` VALUES ('5', '第 4 课 添加、删除和修改记录', '2018-01-04 21:07:00.000000', '11');
INSERT INTO `courses_lesson` VALUES ('6', '第 5 课 增删改记录实战', '2018-01-04 21:07:00.000000', '11');
INSERT INTO `courses_lesson` VALUES ('7', '第 6 课 查询记录', '2018-01-04 21:07:00.000000', '11');
INSERT INTO `courses_lesson` VALUES ('8', '第 1 课 初识面向对象', '2018-01-07 21:25:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('9', '第 2 课 Java面向对象程序设计的特性', '2018-01-07 21:25:00.000000', '10');
INSERT INTO `courses_lesson` VALUES ('10', '第1章 导论', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('11', '第2章 智能体', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('12', '第3章 通过搜索求解问题', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('13', '第4章 局部搜索与群体智能', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('14', '第5章 对抗性搜索', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('15', '第6章 约束满足问题', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('16', '第7章 知识推理', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('17', '第8章 经典与现实世界规划', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('18', '第9章 研读机器学习的视角', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('19', '第10章 机器学习的任务', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('20', '第11章 机器学习的范式', '2018-01-18 20:02:00.000000', '12');
INSERT INTO `courses_lesson` VALUES ('21', '第12章 机器学习的模型', '2018-01-18 20:02:00.000000', '12');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', 'GreenDAO 3的基本原理', '2018-01-04 21:13:00.000000', '2', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '20');
INSERT INTO `courses_video` VALUES ('2', 'GreenDAO 3配置详解', '2018-01-04 21:13:00.000000', '3', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '23');
INSERT INTO `courses_video` VALUES ('3', 'GreenDAO 3配置实战', '2018-01-04 21:14:00.000000', '3', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '45');
INSERT INTO `courses_video` VALUES ('4', '实体类及其注解之详解', '2018-01-04 21:15:00.000000', '4', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '66');
INSERT INTO `courses_video` VALUES ('5', '生成的各相关文件简介', '2018-01-04 21:15:00.000000', '4', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '57');
INSERT INTO `courses_video` VALUES ('6', '创建实体类及完成注解', '2018-01-04 21:15:00.000000', '4', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '52');
INSERT INTO `courses_video` VALUES ('7', '添加记录详解', '2018-01-04 21:16:00.000000', '5', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '32');
INSERT INTO `courses_video` VALUES ('8', '删除记录详解', '2018-01-04 21:16:00.000000', '5', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '22');
INSERT INTO `courses_video` VALUES ('9', '修改记录详解', '2018-01-04 21:16:00.000000', '5', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '24');
INSERT INTO `courses_video` VALUES ('10', '实战准备', '2018-01-04 21:16:00.000000', '6', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '244');
INSERT INTO `courses_video` VALUES ('11', '添加记录实战', '2018-01-04 21:17:00.000000', '6', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '24');
INSERT INTO `courses_video` VALUES ('12', '删除、修改记录实战', '2018-01-04 21:17:00.000000', '6', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '5');
INSERT INTO `courses_video` VALUES ('13', 'DAO查询及QueryBuilder 查询', '2018-01-04 21:17:00.000000', '7', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '2');
INSERT INTO `courses_video` VALUES ('14', 'Query重复查询和SQL查询', '2018-01-04 21:19:00.000000', '7', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '20');
INSERT INTO `courses_video` VALUES ('15', '查询记录实战', '2018-01-04 21:19:00.000000', '7', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '10');
INSERT INTO `courses_video` VALUES ('16', 'Java面向对象程序设计', '2018-01-07 21:25:00.000000', '8', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '40');
INSERT INTO `courses_video` VALUES ('17', 'Java类与对象的含义', '2018-01-07 21:26:00.000000', '8', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '23');
INSERT INTO `courses_video` VALUES ('18', '面向对象-封装', '2018-01-07 21:26:00.000000', '9', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '12');
INSERT INTO `courses_video` VALUES ('19', '面向对象-继承', '2018-01-07 21:26:00.000000', '9', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '12');
INSERT INTO `courses_video` VALUES ('20', '面向对象-多态', '2018-01-07 21:27:00.000000', '9', 'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4', '9');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2018-02-17 00:55:00.951730', '2', 'django入门', '2', '[{\"changed\": {\"fields\": [\"detail\"]}}]', '9', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('26', 'courses', 'bannnercourse');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-01-11 18:48:19.074000');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-01-11 18:48:19.175000');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-01-11 18:48:19.505000');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-01-11 18:48:19.556000');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-01-11 18:48:19.566000');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-01-11 18:48:19.566000');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-01-11 18:48:19.576000');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-01-11 18:48:19.576000');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-01-11 18:48:19.586000');
INSERT INTO `django_migrations` VALUES ('10', 'users', '0001_initial', '2018-01-11 18:48:19.976000');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2018-01-11 18:48:20.096000');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2018-01-11 18:48:20.126000');
INSERT INTO `django_migrations` VALUES ('13', 'captcha', '0001_initial', '2018-01-11 18:48:20.146000');
INSERT INTO `django_migrations` VALUES ('14', 'organization', '0001_initial', '2018-01-11 18:48:20.344000');
INSERT INTO `django_migrations` VALUES ('15', 'organization', '0002_auto_20171224_2105', '2018-01-11 18:48:20.397000');
INSERT INTO `django_migrations` VALUES ('16', 'organization', '0003_auto_20171225_2043', '2018-01-11 18:48:20.577000');
INSERT INTO `django_migrations` VALUES ('17', 'organization', '0004_teacher_image', '2018-01-11 18:48:20.647000');
INSERT INTO `django_migrations` VALUES ('18', 'organization', '0005_auto_20171228_1657', '2018-01-11 18:48:20.667000');
INSERT INTO `django_migrations` VALUES ('19', 'courses', '0001_initial', '2018-01-11 18:48:20.912000');
INSERT INTO `django_migrations` VALUES ('20', 'courses', '0002_auto_20171220_1527', '2018-01-11 18:48:20.922000');
INSERT INTO `django_migrations` VALUES ('21', 'courses', '0003_course_course_org', '2018-01-11 18:48:21.032000');
INSERT INTO `django_migrations` VALUES ('22', 'courses', '0004_course_category', '2018-01-11 18:48:21.102000');
INSERT INTO `django_migrations` VALUES ('23', 'courses', '0005_course_tag', '2018-01-11 18:48:21.163000');
INSERT INTO `django_migrations` VALUES ('24', 'courses', '0006_video_url', '2018-01-11 18:48:21.233000');
INSERT INTO `django_migrations` VALUES ('25', 'courses', '0007_video_learn_times', '2018-01-11 18:48:21.284000');
INSERT INTO `django_migrations` VALUES ('26', 'courses', '0008_course_teacher', '2018-01-11 18:48:21.409000');
INSERT INTO `django_migrations` VALUES ('27', 'courses', '0009_auto_20180105_1654', '2018-01-11 18:48:21.518000');
INSERT INTO `django_migrations` VALUES ('28', 'operation', '0001_initial', '2018-01-11 18:48:21.920000');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0006_teacher_age', '2018-01-11 18:48:21.991000');
INSERT INTO `django_migrations` VALUES ('30', 'sessions', '0001_initial', '2018-01-11 18:48:22.040000');
INSERT INTO `django_migrations` VALUES ('31', 'users', '0002_auto_20171214_2220', '2018-01-11 18:48:22.050000');
INSERT INTO `django_migrations` VALUES ('32', 'users', '0003_auto_20171215_1445', '2018-01-11 18:48:22.080000');
INSERT INTO `django_migrations` VALUES ('33', 'users', '0004_auto_20171216_0127', '2018-01-11 18:48:22.080000');
INSERT INTO `django_migrations` VALUES ('34', 'users', '0005_auto_20180110_1322', '2018-01-11 18:48:22.100000');
INSERT INTO `django_migrations` VALUES ('35', 'users', '0006_auto_20180110_2155', '2018-01-11 18:48:22.131000');
INSERT INTO `django_migrations` VALUES ('36', 'xadmin', '0001_initial', '2018-01-11 18:48:22.483000');
INSERT INTO `django_migrations` VALUES ('37', 'xadmin', '0002_log', '2018-01-11 18:48:22.643000');
INSERT INTO `django_migrations` VALUES ('38', 'xadmin', '0003_auto_20160715_0100', '2018-01-11 18:48:22.703000');
INSERT INTO `django_migrations` VALUES ('39', 'courses', '0010_auto_20180114_2115', '2018-01-19 20:06:25.865000');
INSERT INTO `django_migrations` VALUES ('40', 'organization', '0007_courseorg_tag', '2018-01-19 20:06:26.050000');
INSERT INTO `django_migrations` VALUES ('41', 'organization', '0008_auto_20180116_1451', '2018-01-19 20:06:26.083000');
INSERT INTO `django_migrations` VALUES ('42', 'users', '0007_auto_20180114_2136', '2018-01-19 20:06:26.130000');
INSERT INTO `django_migrations` VALUES ('43', 'users', '0008_auto_20180116_1451', '2018-01-19 20:06:26.205000');
INSERT INTO `django_migrations` VALUES ('44', 'courses', '0011_auto_20180123_2133', '2018-01-23 21:34:14.214000');
INSERT INTO `django_migrations` VALUES ('45', 'auth', '0008_alter_user_username_max_length', '2018-02-17 00:33:25.170460');
INSERT INTO `django_migrations` VALUES ('46', 'users', '0009_auto_20180217_0032', '2018-02-17 00:33:25.270459');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('301v1o6s8j9zm09g1rew740ztwyax94n', 'ZTBkZjdlYjdkZjY0ODYyMTQwNWMxMGE0ZmM0YWM3YjYzMDNlMTQ2ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJzZSJdLCJfY29scz1uYW1lLmRlc2MubGVhcm5fdGltZXMuc3R1ZGVudHMudGVhY2hlci5nZXRfempfbnVtcy5nb190by5kZWdyZWUiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMTc4YmU5NjUwZWJlM2JmN2M3ZmIxZDA3MzAyNGU1YThiZGRkODA0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2018-02-15 14:49:56.084000');
INSERT INTO `django_session` VALUES ('fe00w4ze6tprpse3s6ug4jer923xodac', 'NzMyNGMzNTA1NjBlNzMzMDkyYWEyZWM2NGYzZjgwNTFiZTM2N2JjMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMwY2JhNzBjNzM1MmI4OTI3MWUyNzZjZDQ3M2MyZmE0Njg2NTI3ZDIiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-03-03 01:30:41.347005');
INSERT INTO `django_session` VALUES ('gxsvlrw1fykagw447yj5yb3424bbf3rs', 'NzMyNGMzNTA1NjBlNzMzMDkyYWEyZWM2NGYzZjgwNTFiZTM2N2JjMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMwY2JhNzBjNzM1MmI4OTI3MWUyNzZjZDQ3M2MyZmE0Njg2NTI3ZDIiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-05-06 19:08:33.600989');
INSERT INTO `django_session` VALUES ('jpn5sld6sa6hc2idjfjzu7yhpok3qr56', 'ZTdhODQ4OWMwOWU1YmEwZGIxYTkwNThjOTU2ZTZjMDkyYjFhM2RjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMwY2JhNzBjNzM1MmI4OTI3MWUyNzZjZDQ3M2MyZmE0Njg2NTI3ZDIiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwidmlkZW8iXSwiIl19', '2018-06-10 22:07:37.569034');
INSERT INTO `django_session` VALUES ('m1jjggf42zszi18pis3q2kz4aqhpdmku', 'MDA5YjE3ZWVkMmY4OWNmNzQyOTMzYTVlOGI5YzZiODU2ZDhhMTdjODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJlbWFpbHZlcmlmeXJlY29yZCJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiMTc4YmU5NjUwZWJlM2JmN2M3ZmIxZDA3MzAyNGU1YThiZGRkODA0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2018-02-09 18:23:02.562000');
INSERT INTO `django_session` VALUES ('nt3qm0fbbzxg57n5rwp497qqxc99120l', 'ZTIzOTE5Mzc2NThmMTdmZDhkM2RlNGJjZGUyYTc5NjY3YTk4ODdmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIxNzhiZTk2NTBlYmUzYmY3YzdmYjFkMDczMDI0ZTVhOGJkZGQ4MDQwIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-02-20 19:14:09.835000');
INSERT INTO `django_session` VALUES ('opxll1a1d7pdckr456hrbk2lv32vmlh6', 'ZTIzOTE5Mzc2NThmMTdmZDhkM2RlNGJjZGUyYTc5NjY3YTk4ODdmOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiIxNzhiZTk2NTBlYmUzYmY3YzdmYjFkMDczMDI0ZTVhOGJkZGQ4MDQwIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-02-04 15:56:33.385000');
INSERT INTO `django_session` VALUES ('uzek6hdnzrgfoz3ejby2cywzgujaf95z', 'ZWJkZTEzODI3MmExMWUzMDBkMWM5ZTJlZTI2Y2NmOGU1OGEzNGFjYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3OGJlOTY1MGViZTNiZjdjN2ZiMWQwNzMwMjRlNWE4YmRkZDgwNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-02-04 13:01:12.574000');
INSERT INTO `django_session` VALUES ('w2lmy75zylhesbrjoga5dffg4grzvjzp', 'ZWJkZTEzODI3MmExMWUzMDBkMWM5ZTJlZTI2Y2NmOGU1OGEzNGFjYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3OGJlOTY1MGViZTNiZjdjN2ZiMWQwNzMwMjRlNWE4YmRkZDgwNDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-02-20 22:23:29.816000');
INSERT INTO `django_session` VALUES ('wvc7gpchy0r5jysmd40df85i3lf0r9dx', 'Zjc4ZGViNGRkZmU3YmJmNjNhMjI3NzQ5M2I0NjgxODY3NjE5NWI4MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE3ODU3YjQwZDFjOTYzYzJiYWI1NmNiMjg4OWJjY2RlN2RkMTc5Y2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2018-02-02 20:29:06.663000');
INSERT INTO `django_session` VALUES ('xtfcdcemh6y9ezuyu3konzconu42m3q8', 'NzMyNGMzNTA1NjBlNzMzMDkyYWEyZWM2NGYzZjgwNTFiZTM2N2JjMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjMwY2JhNzBjNzM1MmI4OTI3MWUyNzZjZDQ3M2MyZmE0Njg2NTI3ZDIiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-04-19 11:16:38.692334');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '讲的不错~~~!!!', '2018-01-07 20:47:18.169000', '11', '1');
INSERT INTO `operation_coursecomments` VALUES ('2', '66666', '2018-01-07 20:47:33.116000', '11', '1');
INSERT INTO `operation_coursecomments` VALUES ('3', '终于学完，讲得还是算挺细致的了。虽然现在老师QQ不是经常在线，不过在提问区解答还算挺快。这个的确是初级课程而且几乎没有讲什么前端知识，不过学完能对Django使用有个基本了解，也多少有一些设计业务逻辑的思维。不过真实企业的项目需求会跟复杂。如果想直接找工作还有很多需要自己学习的知识。总体来说，作为入门的项目课程还是很不错的。', '2018-01-07 21:05:08.276000', '11', '2');
INSERT INTO `operation_coursecomments` VALUES ('4', '对于新手可以事半功倍学习常见开发功能，对于已经入门的也有学习和借鉴的地方，对于实战来讲非常不错，欣赏老师有始有终一直保持课程质量到最后，谢谢。', '2018-01-07 21:06:35.570000', '11', '2');
INSERT INTO `operation_coursecomments` VALUES ('5', '还可以，感觉比较适合找工作进入工作环境用，感觉学完了能找到工作吧，之前学了不少视频还是没有信心拿出手去找工作，之前是多年的asp程序员，但也有些不足，相比网易的视频，清晰度、流畅度差了些。', '2018-01-07 21:07:46.971000', '11', '2');
INSERT INTO `operation_coursecomments` VALUES ('7', '老师讲的还是挺好的，细节讲的比较完善，期待老师新的课程', '2018-01-07 21:14:41.364000', '11', '2');
INSERT INTO `operation_coursecomments` VALUES ('8', '很好 对于新人来说通俗易懂', '2018-01-07 21:21:03.477000', '11', '2');
INSERT INTO `operation_coursecomments` VALUES ('9', 'java 666', '2018-01-07 21:23:58.307000', '10', '2');
INSERT INTO `operation_coursecomments` VALUES ('10', '可以看看', '2018-01-07 21:27:36.776000', '10', '1');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2018-01-03 20:59:00.000000', '11', '2');
INSERT INTO `operation_usercourse` VALUES ('2', '2018-01-07 21:44:00.000000', '4', '2');
INSERT INTO `operation_usercourse` VALUES ('3', '2018-01-07 21:44:00.000000', '11', '1');
INSERT INTO `operation_usercourse` VALUES ('4', '2018-01-07 21:44:00.000000', '7', '1');
INSERT INTO `operation_usercourse` VALUES ('5', '2018-01-11 20:13:24.608000', '6', '2');
INSERT INTO `operation_usercourse` VALUES ('6', '2018-01-11 20:13:32.980000', '5', '2');
INSERT INTO `operation_usercourse` VALUES ('7', '2018-01-19 20:29:53.540000', '12', '2');
INSERT INTO `operation_usercourse` VALUES ('8', '2018-02-16 23:46:21.101254', '12', '1');
INSERT INTO `operation_usercourse` VALUES ('9', '2018-02-16 23:47:24.410103', '10', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('8', '1', '3', '2018-01-08 23:24:33.049000', '2');
INSERT INTO `operation_userfavorite` VALUES ('13', '6', '1', '2018-01-11 21:19:02.956000', '2');
INSERT INTO `operation_userfavorite` VALUES ('14', '10', '1', '2018-01-11 21:32:09.118000', '2');
INSERT INTO `operation_userfavorite` VALUES ('15', '3', '3', '2018-01-11 21:32:24.559000', '2');
INSERT INTO `operation_userfavorite` VALUES ('16', '3', '2', '2018-01-11 21:32:35.790000', '2');
INSERT INTO `operation_userfavorite` VALUES ('17', '5', '2', '2018-01-11 21:33:01.221000', '2');
INSERT INTO `operation_userfavorite` VALUES ('18', '12', '1', '2018-02-16 23:46:17.446847', '1');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('3', '2', '欢迎注册暮学在线网', '1', '2018-01-11 22:05:58.929000');
INSERT INTO `operation_usermessage` VALUES ('4', '2', '6666', '1', '2018-01-11 22:16:00.000000');
INSERT INTO `operation_usermessage` VALUES ('6', '2', '测试一下.', '1', '2018-01-11 22:18:00.000000');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '北京市', '2017-12-24 20:02:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '上海市', '上海市', '2017-12-24 20:02:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '广州市', '广州市', '2017-12-24 20:02:00.000000');
INSERT INTO `organization_citydict` VALUES ('4', '深圳市', '深圳市', '2017-12-24 20:02:00.000000');
INSERT INTO `organization_citydict` VALUES ('5', '天津市', '天津市', '2017-12-24 20:03:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n       慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。', '11', '0', 'org/2017/12/imooc.png', '北京市', '2017-12-24 20:06:00.000000', '1', 'pxjg', '6', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('2', '极客学院', '极客学院是中国android开发在线学习平台，汇集了几十名国内顶尖的有多年项目和实战经验的Android开发授课大师，精心制作了上千个高质量视频教程，涵盖了Android开发学习的基础入门、中级进阶，高级提升、项目实战开发等专业的android开发课程。\r\n      极客学院背后是一支疯狂喜欢编程，狂热开发移动app的超有活力团队。他们希望通过最新的，高质量的，专业实战的在线开发课程打破传统的编程学习模式，以新一代的编程学习模式帮助开发者更快更好的学习Android开发，帮助开发者通过技术实现自己的理想。', '10', '0', 'org/2017/12/logo.png', '深圳市', '2017-12-24 20:20:00.000000', '4', 'pxjg', '5', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('3', '麦子学院', '麦子学院，国内第一家在美国建立商务中心的IT在线教育机构，目前已与美国知名教育公司取得合作，未来将源源不断向国内输出大量高质量教育资源\r\n      前身麦可网，2014年，麦可网完成千万级A轮融资，并更名为”麦子学院“，同时通过“麦子圈”IT职业实名社交圈——提供包括企业招聘对接，猎头，项目外包，经验分享，职业交友等一系列增值服务。\r\n      做在线职业教育示范学院，将教育和课程做到极致。除了提供高质量的课程学习之外，也提供包括就业推荐，职业交友，项目外包，创业服务等全面的增值服务，并且线上线下结合，移动设备和传统网络相结合，打造IT职业教育的一个完整生态链。\r\n      以高端IT技术型人才培养及服务为核心，探索及倡导技术交流创新模式。提供的不仅仅是技能培养，而是务实的职业导向。', '1', '0', 'org/2017/12/logo_greenx2.png', '广州市', '2017-12-24 20:21:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('4', '千锋教育', '千锋教育ios培训、android培训全称北京千锋互联科技有限公司一直“用心做教育”，是中国移动互联网研发人才一体化服务的领导者，打造移动互联网高端研发人才服务。有全国权威的移动互联网教学就业保障团队，毕业学员占全国移动互联网培训人才一半的份额，做到了毕业学员业内高薪水，成为学员信赖的IT培训机构。有百所合作高校，千家移动互联网方向合作企业。千锋教育以两倍以上的速度发展，在上海、北京、广州、武汉和深圳开设分公司，将会在更多的城市建立分校。有数十万名学员受益于千锋教育组织的技术研讨会、技术培训课、网络公开课及免费教学视频。\r\n      千锋教育一直秉承“用良心做教育”的理念，中国移动互联网研发人才一体化服务的领导品牌，全力打造移动互联网高端研发人才服务平台。拥有全国权威的移动互联网教学就业保障团队，毕业学员占据了全国移动互联网培训人才一半以上的份额，做到了毕业学员业内高薪水，成为学员信赖的IT培训机构。拥有上百所合作高校，上千家移动互联网方向合作企业。\r\n      千锋教育以北京校区为中心，在深圳和上海开设分校，将会在广州、成都、武汉等地建立更多分校。千锋用微薄之力改变着中国的IT教育培训事业。每年有数十万学员受益于千锋教育组织的技术研讨会、技术培训课、网络公开课以及免费教学视频。', '1', '0', 'org/2017/12/new_logo.png', '天津市', '2017-12-24 20:22:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('5', '阿卡索外教网', '阿卡索外教网是一个网络英语教学平台，成立于2011年。主要通过网络视频进行教学，老师全部是外教，来自欧美，印度等国家，目前已经有500多位外教老师。', '5', '0', 'org/2017/12/logo-christmas.png', '上海市', '2017-12-24 20:24:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('6', '沪江网校', '沪江网校是沪江旗下的海量优质课程平台，以社群学习为核心，致力于为亿万用户提供丰富、系统的学习课程和专业的教学服务。首创以班级为基础的服务体系。\r\n    倡导一起学，多屏互动，随时随地，使学习变得简单、真实、有趣 。沪江网校课程囊括四大体系，分别是语言服务、留学服务、升学服务、职业职场兴趣等多领域的在线课程。', '0', '0', 'org/2017/12/hujiang.jpg', '北京市', '2017-12-24 20:25:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('7', '光环国际', '光环国际教育集团创办于2001年，在管理培训领域，光环卓而不凡的服务品质，已经成为国内该领域的著名品牌。多年来我们一直致力于传播国际领先的管理思想和方法，并推动其在中国企业的广泛应用，帮助个人与组织取得持久竞争力，以此助推国家发展。目前，光环国际教育集团在项目管理、国际财会、国际MBA教育等领域积累了丰富成熟的经验，并取得了令人骄傲的成绩，荣获08年腾讯网主办的“中国最具实力教育集团”的称号。', '0', '0', 'org/2017/12/timg.jpg', '上海市', '2017-12-24 20:27:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('8', '项目管理者联盟', '项目管理者联盟成立于2001年5月，是国内最早、知名度最高的项目管理专业组织，是国内最大的项目经理会员机构，拥有会员100000多人。会员分布于全国各省及海外华人地区。联盟目前已在全国11个主要城市成立了地方俱乐部。\r\n      项目管理者联盟网站是流量最大、最知名的中文项目管理专业站点，每天有超过6000名项目经理访问该网站。网站下属项目管理者论坛是国内项目经理及其知识爱好者主要的网络交流空间。北京共创时网络管理技术有限公司是项目管理者联盟所有服务运作的法人单位。', '0', '0', 'org/2017/12/logo.gif', '深圳市', '2017-12-24 20:30:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('9', '新东方', '新东方，全名北京新东方教育科技（集团）有限公司，总部位于北京市海淀区中关村，是规模最大的综合性教育集团，同时也是教育培训集团。公司业务包括外语培训、中小学基础教育、学前教育、在线教育、出国咨询、图书出版等各个领域。\r\n      除新东方外，旗下还有优能中学教育、泡泡少儿教育、前途出国咨询、迅程在线教育、大愚文化出版、满天星亲子教育、同文高考复读等子品牌。公司于2006年在美国纽约证券交易所上市，是中国大陆第一家在美国上市的教育机构。2012年7月18日，新东方因调整VIE结构遭SEC调查股价暴跌。2016年2月1日，新东方教育集团发布公告，宣布腾讯将向迅程（即新东方在线）投资3.2亿人民币（5000万美元），并宣布新东方在线即将在国内IPO。这项投资预计于2016年第一季度完成，完成后迅程仍由新东方控股。', '0', '0', 'org/2017/12/logo_Og0Npe3.png', '天津市', '2017-12-24 20:52:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('10', '起点学院', '起点学院创办于2010年12月9日，本学院致力于免费网络技术教学。创立之初以Photoshop设计教学为主到现在发展为一个多元化的免费网络技术教学平台，学院根据学员所需经历了不断的改革。', '0', '0', 'org/2017/12/header_logo.png', '广州市', '2017-12-24 20:57:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('11', '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。\r\n      清华大学的前身清华学堂始建于1911年，因水木清华而得名，是清政府设立的留美预备学校，其建校的资金源于1908年美国退还的部分庚子赔款。1912年更名为清华学校。1928年更名为国立清华大学。1937年抗日战争全面爆发后南迁长沙，与北京大学、南开大学组建国立长沙临时大学，1938年迁至昆明改名为国立西南联合大学。1946年迁回清华园。1949年中华人民共和国成立，清华大学进入了新的发展阶段。1952年全国高等学校院系调整后成为多科性工业大学。1978年以来逐步恢复和发展为综合性的研究型大学。\r\n      水木清华，钟灵毓秀，清华大学秉持“自强不息、厚德载物”的校训和“行胜于言”的校风，坚持“中西融汇、古今贯通、文理渗透”的办学风格和“又红又专、全面发展”的培养特色，弘扬“爱国奉献、追求卓越”传统和“人文日新”精神。恰如清华园工字厅内对联所书——“槛外山光，历春夏秋冬、万千变幻，都非凡境；窗中云影，任东西南北、去来澹荡，洵是仙居”。', '1', '0', 'org/2017/12/timg_1.jpg', '北京市', '2017-12-24 21:10:00.000000', '1', 'gx', '0', '0', '全国知名');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', 'sun', '5', '百度', '高级Python工程师', '简单明了', '9', '0', '2017-12-26 19:48:00.000000', '1', 'teacher/2017/12/u28051151243197150147fm27gp0.jpg', '35');
INSERT INTO `organization_teacher` VALUES ('2', 'mark', '6', '华为', '高级软件工程师', '敏捷开发', '1', '0', '2017-12-26 19:49:00.000000', '2', 'teacher/2017/12/3bc79f3df8dcd1007a8ccfcd708b4710b8122fcd.jpg', '37');
INSERT INTO `organization_teacher` VALUES ('3', 'Ling', '10', '腾讯', '开发经理', '牛逼', '1', '0', '2017-12-26 19:49:00.000000', '1', 'teacher/2017/12/3_140818171934_4.jpg', '27');
INSERT INTO `organization_teacher` VALUES ('4', 'Fly', '5', '网易', '开发经理', '清晰易懂', '51', '0', '2018-01-08 21:27:00.000000', '3', 'teacher/2018/01/34baac487629d4731d42487f99fab4ba.jpg', '36');
INSERT INTO `organization_teacher` VALUES ('5', 'Mokiie', '7', '阿里巴巴', 'python工程师', '会喊666', '62', '0', '2018-01-08 21:29:00.000000', '4', 'teacher/2018/01/5020ae15ca166_200x200_3.jpg', '34');
INSERT INTO `organization_teacher` VALUES ('6', 'Ioo', '10', '蚂蚁金服', '开发专家', '酱油!', '0', '0', '2018-01-08 21:29:00.000000', '1', 'teacher/2018/01/2014061614584588193.jpg', '37');
INSERT INTO `organization_teacher` VALUES ('7', 'Rore', '6', '英雄互娱', '算法专家', '游戏式教学', '0', '0', '2018-01-08 21:30:00.000000', '2', 'teacher/2018/01/1.jpg', '36');
INSERT INTO `organization_teacher` VALUES ('8', 'UiO', '10', '饿了么', 'python工程师', '简单明了', '100', '0', '2018-01-08 21:32:00.000000', '2', 'teacher/2018/01/52.jpg', '37');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', '1', 'banner/2018/01/1.jpg', 'https://github.com/xojisi/eduOnline', '1', '2018-01-14 21:18:00.000000');
INSERT INTO `users_banner` VALUES ('2', '2', 'banner/2018/01/2.jpg', 'https://github.com/xojisi/eduOnline', '2', '2018-01-14 21:28:00.000000');
INSERT INTO `users_banner` VALUES ('3', '3', 'banner/2018/01/3.jpg', 'https://github.com/xojisi/eduOnline', '3', '2018-01-14 21:28:00.000000');
INSERT INTO `users_banner` VALUES ('4', '4', 'banner/2018/01/4.jpg', 'https://github.com/xojisi/eduOnline', '4', '2018-01-14 21:28:00.000000');
INSERT INTO `users_banner` VALUES ('5', '5', 'banner/2018/01/5.jpg', 'https://github.com/xojisi/eduOnline', '5', '2018-01-14 21:29:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(15) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$nurHxsfrS6Qd$26WVhNvP9neWWuBI8BgXtl+OWw09qbnp9qR8cWvP+No=', '2018-05-27 22:04:48.951732', '1', 'admin', '', '', '271398289@qq.com', '1', '1', '2017-12-16 01:28:00.000000', 'admin', null, 'female', 'xxxx', '', 'image/2018/01/qidai4.jpg');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$24000$ZpYQem1BAlI0$EOYAsq8GigNX7/5iUhYTpeyAOPpAxCX/gALZhX1Yxmc=', '2018-01-19 21:38:58.009000', '0', 'xojisi@sina.com.cn', '', '', 'xojisi@sina.com.cn', '0', '1', '2017-12-21 21:27:00.000000', '鸡丝', '2018-01-01', 'male', '外太空', '4567890', 'image/2018/01/1.jpg');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2017-12-17 19:06:17.342000', '127.0.0.1', '1', 'Course object', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2017-12-17 19:11:00.289000', '127.0.0.1', '1', 'Lesson object', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2017-12-24 20:02:37.725000', '127.0.0.1', '1', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2017-12-24 20:02:50.338000', '127.0.0.1', '2', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2017-12-24 20:02:55.727000', '127.0.0.1', '3', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2017-12-24 20:03:02.122000', '127.0.0.1', '4', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2017-12-24 20:03:11.749000', '127.0.0.1', '5', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2017-12-24 20:15:23.659000', '127.0.0.1', '1', '慕课网', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2017-12-24 20:21:08.124000', '127.0.0.1', '2', '极客学院', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2017-12-24 20:22:17.677000', '127.0.0.1', '3', '麦子学院', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2017-12-24 20:24:04.823000', '127.0.0.1', '4', '千锋教育', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2017-12-24 20:25:51.536000', '127.0.0.1', '5', '阿卡索外教网', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2017-12-24 20:27:54.086000', '127.0.0.1', '6', '沪江网校', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2017-12-24 20:29:39.751000', '127.0.0.1', '7', '光环国际', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2017-12-24 20:30:06.890000', '127.0.0.1', '1', '慕课网', 'change', '已修改 desc 。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2017-12-24 20:30:52.038000', '127.0.0.1', '8', '项目管理者联盟', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2017-12-24 20:53:07.041000', '127.0.0.1', '9', '新东方', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2017-12-24 20:57:22.990000', '127.0.0.1', '10', '起点学院', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2017-12-24 21:12:05.083000', '127.0.0.1', '11', '清华大学', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2017-12-26 19:49:14.767000', '127.0.0.1', '1', 'sun', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2017-12-26 19:49:51.284000', '127.0.0.1', '2', 'mark', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2017-12-26 19:50:38.858000', '127.0.0.1', '3', 'Ling', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2017-12-26 19:51:34.104000', '127.0.0.1', '1', 'Mysql基础', 'change', '已修改 detail 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2017-12-26 19:58:06.649000', '127.0.0.1', '1', 'Mysql基础', 'change', '已修改 course_org 和 desc 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2017-12-26 20:00:17.345000', '127.0.0.1', '2', 'django入门', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2017-12-26 20:00:57.010000', '127.0.0.1', '1', 'Mysql基础', 'change', '已修改 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2017-12-26 21:10:57.999000', '127.0.0.1', '2', 'django入门', 'change', '没有字段被修改。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2017-12-26 21:46:51.697000', '127.0.0.1', '3', 'Ling', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2017-12-26 21:46:56.309000', '127.0.0.1', '2', 'mark', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2017-12-26 21:47:02.149000', '127.0.0.1', '1', 'sun', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-01-03 21:00:06.371000', '127.0.0.1', '1', 'UserCourse object', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-01-03 21:01:59.983000', '127.0.0.1', '2', 'xojisi@sina.com.cn', 'change', '已修改 last_login，nick_name，gender 和 address 。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-01-03 21:02:07.937000', '127.0.0.1', '2', 'xojisi@sina.com.cn', 'change', '已修改 image 。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-01-04 21:06:45.451000', '127.0.0.1', '2', '第 1 课 GreenDAO 3简介', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-01-04 21:06:51.937000', '127.0.0.1', '3', '第 2 课 在Android Studio中配置GreenDAO 3', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-01-04 21:07:01.338000', '127.0.0.1', '4', '第 3 课 创建实体类及生成各相关文件', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-01-04 21:07:10.510000', '127.0.0.1', '5', '第 4 课 添加、删除和修改记录', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-01-04 21:07:16.372000', '127.0.0.1', '6', '第 5 课 增删改记录实战', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-01-04 21:07:23.816000', '127.0.0.1', '7', '第 6 课 查询记录', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-01-04 21:07:29.925000', '127.0.0.1', '8', '第 7 课 一对一关联', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-01-04 21:07:41.104000', '127.0.0.1', '9', '第 8 课 一对多关联', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-01-04 21:13:38.543000', '127.0.0.1', '1', 'GreenDAO 3的基本原理', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-01-04 21:14:43.550000', '127.0.0.1', '2', 'GreenDAO 3配置详解', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-01-04 21:15:03.354000', '127.0.0.1', '3', 'GreenDAO 3配置实战', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-01-04 21:15:28.163000', '127.0.0.1', '4', '实体类及其注解之详解', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-01-04 21:15:49.404000', '127.0.0.1', '5', '生成的各相关文件简介', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-01-04 21:16:11.593000', '127.0.0.1', '6', '创建实体类及完成注解', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-01-04 21:16:32.896000', '127.0.0.1', '7', '添加记录详解', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-01-04 21:16:45.623000', '127.0.0.1', '8', '删除记录详解', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-01-04 21:16:54.777000', '127.0.0.1', '9', '修改记录详解', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-01-04 21:17:17.880000', '127.0.0.1', '10', '实战准备', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-01-04 21:17:26.430000', '127.0.0.1', '11', '添加记录实战', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-01-04 21:17:40.495000', '127.0.0.1', '12', '删除、修改记录实战', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-01-04 21:17:55.303000', '127.0.0.1', '13', 'DAO查询及QueryBuilder 查询', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-01-04 21:19:51.900000', '127.0.0.1', '14', 'Query重复查询和SQL查询', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-01-04 21:20:13.492000', '127.0.0.1', '15', '查询记录实战', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-01-04 21:20:30.555000', '127.0.0.1', null, '', 'delete', '批量删除 2 个 章节', null, '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-01-07 21:03:34.731000', '127.0.0.1', '1', 'admin', 'change', '已修改 last_login，nick_name，address 和 image 。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-01-07 21:25:39.846000', '127.0.0.1', '8', '第 1 课 初识面向对象', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-01-07 21:25:46.128000', '127.0.0.1', '9', '第 2 课 Java面向对象程序设计的特性', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-01-07 21:26:13.571000', '127.0.0.1', '16', 'Java面向对象程序设计', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-01-07 21:26:30.072000', '127.0.0.1', '17', 'Java类与对象的含义', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-01-07 21:26:46.994000', '127.0.0.1', '18', '面向对象-封装', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-01-07 21:27:01.122000', '127.0.0.1', '19', '面向对象-继承', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-01-07 21:27:12.795000', '127.0.0.1', '20', '面向对象-多态', 'create', '已添加', '11', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-01-07 21:44:26.313000', '127.0.0.1', '2', 'UserCourse object', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-01-07 21:44:48.669000', '127.0.0.1', '3', 'UserCourse object', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-01-07 21:44:56.943000', '127.0.0.1', '4', 'UserCourse object', 'create', '已添加', '20', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2018-01-08 21:25:23.847000', '127.0.0.1', '3', 'Ling', 'change', '已修改 work_company，work_position 和 points 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2018-01-08 21:25:49.214000', '127.0.0.1', '2', 'mark', 'change', '已修改 work_company，work_position 和 points 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2018-01-08 21:26:17.526000', '127.0.0.1', '1', 'sun', 'change', '已修改 work_company，work_position 和 points 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2018-01-08 21:28:41.116000', '127.0.0.1', '4', 'Fly', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2018-01-08 21:28:49.617000', '127.0.0.1', '3', 'Ling', 'change', '已修改 age 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2018-01-08 21:28:56.015000', '127.0.0.1', '2', 'mark', 'change', '已修改 age 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2018-01-08 21:29:00.052000', '127.0.0.1', '1', 'sun', 'change', '已修改 age 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2018-01-08 21:29:59.461000', '127.0.0.1', '5', 'Mokiie', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2018-01-08 21:30:50.113000', '127.0.0.1', '6', 'Ioo', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2018-01-08 21:32:11.419000', '127.0.0.1', '7', 'Rore', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2018-01-08 21:33:19.358000', '127.0.0.1', '8', 'UiO', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2018-01-26 17:21:12.724000', '127.0.0.1', '2', 'java_basic_resource', 'change', '已修改 download 。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2018-02-17 00:37:00.447102', '127.0.0.1', '2', 'java_basic_resource', 'change', '没有字段被修改。', '12', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'courses_course_editform_portal', 'box-0,courseresource_set-group,,lesson_set-group', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
