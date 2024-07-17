/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.27-MariaDB : Database - school_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`school_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `school_management`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add class_det',7,'add_class_det'),
(26,'Can change class_det',7,'change_class_det'),
(27,'Can delete class_det',7,'delete_class_det'),
(28,'Can view class_det',7,'view_class_det'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add occation',9,'add_occation'),
(34,'Can change occation',9,'change_occation'),
(35,'Can delete occation',9,'delete_occation'),
(36,'Can view occation',9,'view_occation'),
(37,'Can add student',10,'add_student'),
(38,'Can change student',10,'change_student'),
(39,'Can delete student',10,'delete_student'),
(40,'Can view student',10,'view_student'),
(41,'Can add subject',11,'add_subject'),
(42,'Can change subject',11,'change_subject'),
(43,'Can delete subject',11,'delete_subject'),
(44,'Can view subject',11,'view_subject'),
(45,'Can add upload',12,'add_upload'),
(46,'Can change upload',12,'change_upload'),
(47,'Can delete upload',12,'delete_upload'),
(48,'Can view upload',12,'view_upload'),
(49,'Can add timetable',13,'add_timetable'),
(50,'Can change timetable',13,'change_timetable'),
(51,'Can delete timetable',13,'delete_timetable'),
(52,'Can view timetable',13,'view_timetable'),
(53,'Can add teacher',14,'add_teacher'),
(54,'Can change teacher',14,'change_teacher'),
(55,'Can delete teacher',14,'delete_teacher'),
(56,'Can view teacher',14,'view_teacher'),
(57,'Can add result',15,'add_result'),
(58,'Can change result',15,'change_result'),
(59,'Can delete result',15,'delete_result'),
(60,'Can view result',15,'view_result'),
(61,'Can add payment',16,'add_payment'),
(62,'Can change payment',16,'change_payment'),
(63,'Can delete payment',16,'delete_payment'),
(64,'Can view payment',16,'view_payment'),
(65,'Can add note',17,'add_note'),
(66,'Can change note',17,'change_note'),
(67,'Can delete note',17,'delete_note'),
(68,'Can view note',17,'view_note'),
(69,'Can add fee',18,'add_fee'),
(70,'Can change fee',18,'change_fee'),
(71,'Can delete fee',18,'delete_fee'),
(72,'Can view fee',18,'view_fee'),
(73,'Can add class_assign',19,'add_class_assign'),
(74,'Can change class_assign',19,'change_class_assign'),
(75,'Can delete class_assign',19,'delete_class_assign'),
(76,'Can view class_assign',19,'view_class_assign'),
(77,'Can add attendance',20,'add_attendance'),
(78,'Can change attendance',20,'change_attendance'),
(79,'Can delete attendance',20,'delete_attendance'),
(80,'Can view attendance',20,'view_attendance'),
(81,'Can add assignment',21,'add_assignment'),
(82,'Can change assignment',21,'change_assignment'),
(83,'Can delete assignment',21,'delete_assignment'),
(84,'Can view assignment',21,'view_assignment'),
(85,'Can add expense',22,'add_expense'),
(86,'Can change expense',22,'change_expense'),
(87,'Can delete expense',22,'delete_expense'),
(88,'Can view expense',22,'view_expense');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(21,'main','assignment'),
(20,'main','attendance'),
(19,'main','class_assign'),
(7,'main','class_det'),
(22,'main','expense'),
(18,'main','fee'),
(8,'main','login'),
(17,'main','note'),
(9,'main','occation'),
(16,'main','payment'),
(15,'main','result'),
(10,'main','student'),
(11,'main','subject'),
(14,'main','teacher'),
(13,'main','timetable'),
(12,'main','upload'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-03-03 10:59:32.859938'),
(2,'auth','0001_initial','2023-03-03 10:59:33.243602'),
(3,'admin','0001_initial','2023-03-03 10:59:33.347673'),
(4,'admin','0002_logentry_remove_auto_add','2023-03-03 10:59:33.359641'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-03-03 10:59:33.371609'),
(6,'contenttypes','0002_remove_content_type_name','2023-03-03 10:59:33.426462'),
(7,'auth','0002_alter_permission_name_max_length','2023-03-03 10:59:33.468362'),
(8,'auth','0003_alter_user_email_max_length','2023-03-03 10:59:33.491289'),
(9,'auth','0004_alter_user_username_opts','2023-03-03 10:59:33.503258'),
(10,'auth','0005_alter_user_last_login_null','2023-03-03 10:59:33.576062'),
(11,'auth','0006_require_contenttypes_0002','2023-03-03 10:59:33.579055'),
(12,'auth','0007_alter_validators_add_error_messages','2023-03-03 10:59:33.589027'),
(13,'auth','0008_alter_user_username_max_length','2023-03-03 10:59:33.610968'),
(14,'auth','0009_alter_user_last_name_max_length','2023-03-03 10:59:33.629917'),
(15,'auth','0010_alter_group_name_max_length','2023-03-03 10:59:33.650862'),
(16,'auth','0011_update_proxy_permissions','2023-03-03 10:59:33.661832'),
(17,'auth','0012_alter_user_first_name_max_length','2023-03-03 10:59:33.679785'),
(18,'main','0001_initial','2023-03-03 10:59:34.685896'),
(19,'sessions','0001_initial','2023-03-03 10:59:34.724121'),
(20,'main','0002_remove_teacher_class_det','2023-03-03 11:06:15.109930'),
(21,'main','0003_assignment_teacher','2023-03-03 14:11:44.218321'),
(22,'main','0004_note_teacher','2023-03-03 14:39:22.990741'),
(23,'main','0005_note_file','2023-03-03 14:41:59.122717'),
(24,'main','0006_expense','2023-03-03 15:53:51.560669'),
(25,'main','0007_fee_fees_title','2023-03-04 09:48:11.432490'),
(26,'main','0008_fee_status','2023-03-04 10:01:29.626952');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('6m6db2dx9pik27ntchshqp3os39vlbkc','.eJyrVspMUbJSMlTSUSrJL0nMAbJNDQyAvJz89My8eJCksY5ScUlpSmpeCZhrBFSZmpickVoE5hrqKCXnFIOZSkZKtQC13BgC:1pYPNV:Db1MHojsvB6Pyvi5LqSBouUMSVVsAhLhLGDK5sLFs1s','2023-03-18 10:44:37.759823'),
('8k3y6bo0f5zuzp8l9ibbitqcjwhwjwbh','eyJsb2dpbl9pZCI6MywidGVhY2hlcl9pZCI6MSwiY2xzX2lkIjoiMSJ9:1pYTHs:_oLp6Z7RvzZWsuPjL8wKLAHCw8b4Bv3cONpKz56aQKg','2023-03-18 14:55:04.123472'),
('k88l9bh6jlacy49nxsqalhyy2hzcshe1','.eJyrVsrJT8_Mi89MUbIy1FEqSU1MzkgtgnGTc4rBTCVDJR2l4pLSlNS8ErCAUS0AHbgSbA:1pY7fN:YUl1fSUOEMnvMFzMvzUSW3gMO5ZDpcsWKCJR36biaJI','2023-03-17 15:49:53.315613'),
('ku4wbanljdyh337bs565g3mwdo1uwejs','.eJyrVsrJT8_Mi89MUbIy0lEqSU1MzkgtAnMNdZSSc4rBTCVDJR2l4pLSlNS8EpgcXLwkvyQxB8g2NTBQqgUAA8YX_w:1pYPDb:F0M4X68UGtevD8wSgoDsPB11_ydCRDek7nC_kYigf_s','2023-03-18 10:34:23.244417'),
('oe7im4botnnke1pio8flrfdk50sn0b8h','eyJsb2dpbl9pZCI6MywidGVhY2hlcl9pZCI6MX0:1pYOEW:6UfnNoMLAhJkusk12eDvru1OmksLr9I6zsAvS6LbMc0','2023-03-18 09:31:16.398887'),
('y7x1ns9ri9gd24idbcuz8ikoh267h057','eyJsb2dpbl9pZCI6Miwic3R1ZGVudF9pZCI6MSwiaWQiOiIyIiwidG90YWwiOiIyMDAifQ:1pYflO:9PQc4nq2UIxzb7ds5mwTRctBhrD7MmyidvDqjAqPdp8','2023-03-19 04:14:22.085051');

/*Table structure for table `main_assignment` */

DROP TABLE IF EXISTS `main_assignment`;

CREATE TABLE `main_assignment` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(225) NOT NULL,
  `assignment` varchar(225) NOT NULL,
  `details` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `class_det_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `main_assignment_class_det_id_70c9633c_fk_main_class_det_class_id` (`class_det_id`),
  KEY `main_assignment_teacher_id_5a08eb17_fk_main_teacher_teacher_id` (`teacher_id`),
  CONSTRAINT `main_assignment_class_det_id_70c9633c_fk_main_class_det_class_id` FOREIGN KEY (`class_det_id`) REFERENCES `main_class_det` (`class_id`),
  CONSTRAINT `main_assignment_teacher_id_5a08eb17_fk_main_teacher_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `main_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_assignment` */

insert  into `main_assignment`(`assignment_id`,`subject`,`assignment`,`details`,`date`,`class_det_id`,`teacher_id`) values 
(1,'malayalam','malayalam assignment 1','vsgsezgedr','2023-03-03',1,1),
(2,'english','sample','gfghfghgujhn','2023-03-03',2,1);

/*Table structure for table `main_attendance` */

DROP TABLE IF EXISTS `main_attendance`;

CREATE TABLE `main_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `class_det_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `main_attendance_class_det_id_f31be4e3_fk_main_class_det_class_id` (`class_det_id`),
  KEY `main_attendance_student_id_07549adf_fk_main_student_student_id` (`student_id`),
  CONSTRAINT `main_attendance_class_det_id_f31be4e3_fk_main_class_det_class_id` FOREIGN KEY (`class_det_id`) REFERENCES `main_class_det` (`class_id`),
  CONSTRAINT `main_attendance_student_id_07549adf_fk_main_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `main_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_attendance` */

insert  into `main_attendance`(`attendance_id`,`date`,`status`,`class_det_id`,`student_id`) values 
(1,'2023-03-03','Present',1,6),
(2,'2023-03-03','Absent',1,9),
(3,'2023-03-03','Absent',2,2),
(4,'2023-03-04','Present',2,7),
(5,'2023-03-04','Present',2,2);

/*Table structure for table `main_class_assign` */

DROP TABLE IF EXISTS `main_class_assign`;

CREATE TABLE `main_class_assign` (
  `class_assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_det_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`class_assign_id`),
  KEY `main_class_assign_class_det_id_146377c9_fk_main_clas` (`class_det_id`),
  KEY `main_class_assign_teacher_id_ebee3cd8_fk_main_teacher_teacher_id` (`teacher_id`),
  CONSTRAINT `main_class_assign_class_det_id_146377c9_fk_main_clas` FOREIGN KEY (`class_det_id`) REFERENCES `main_class_det` (`class_id`),
  CONSTRAINT `main_class_assign_teacher_id_ebee3cd8_fk_main_teacher_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `main_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_class_assign` */

insert  into `main_class_assign`(`class_assign_id`,`class_det_id`,`teacher_id`) values 
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,2,2),
(6,3,3),
(7,4,4),
(8,5,2),
(9,5,3),
(10,1,3);

/*Table structure for table `main_class_det` */

DROP TABLE IF EXISTS `main_class_det`;

CREATE TABLE `main_class_det` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_det` varchar(225) NOT NULL,
  `academic_year` varchar(225) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_class_det` */

insert  into `main_class_det`(`class_id`,`class_det`,`academic_year`) values 
(1,'1st','2022-2023'),
(2,'2nd','2022-2023'),
(3,'3rd','2022-2023'),
(4,'4th','2022-2023'),
(5,'5th','2022-2023');

/*Table structure for table `main_expense` */

DROP TABLE IF EXISTS `main_expense`;

CREATE TABLE `main_expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_title` varchar(225) NOT NULL,
  `expense_amount` varchar(225) NOT NULL,
  `expense_date` varchar(225) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_expense` */

insert  into `main_expense`(`expense_id`,`expense_title`,`expense_amount`,`expense_date`) values 
(3,' Voluptas a omnis eos ','500','2023-03-03'),
(4,'rent','15000','2023-03-03');

/*Table structure for table `main_fee` */

DROP TABLE IF EXISTS `main_fee`;

CREATE TABLE `main_fee` (
  `fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `fees` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `student_id` int(11) NOT NULL,
  `fees_title` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  PRIMARY KEY (`fee_id`),
  KEY `main_fee_student_id_44b85df3_fk_main_student_student_id` (`student_id`),
  CONSTRAINT `main_fee_student_id_44b85df3_fk_main_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `main_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_fee` */

insert  into `main_fee`(`fee_id`,`fees`,`date`,`student_id`,`fees_title`,`status`) values 
(1,'500','2023-03-04',1,'BUS','Paid'),
(2,'200','2023-03-05',1,'sports','Paid'),
(3,'250','2023-03-05',1,'arts','Pending'),
(4,'100','2023-03-05',1,'exam','Pending');

/*Table structure for table `main_login` */

DROP TABLE IF EXISTS `main_login`;

CREATE TABLE `main_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `usertype` varchar(225) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_login` */

insert  into `main_login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'s1','s1','Student'),
(3,'tt','tt','Teacher'),
(4,'ss','ss','Student'),
(5,'Rhiannon Ryan','Paw0rd','Student'),
(6,'Isaiah Harper','Paw0rd','Student'),
(7,'Violet Hall','Paw0rd','Student'),
(8,'Lana Newton','Paw0rd','Student'),
(9,'Lance Hendricks','Paw0rd','Student'),
(10,'Fletcher Lowery','Paw0rd','Student'),
(11,'Fay Wilkerson','Paw0rd','Student'),
(12,'Branden York','Paw0rd','Teacher'),
(13,'Jillian Hoffman','Paw0rd','Teacher'),
(14,'Hunter Thompson','Paw0rd','Teacher'),
(15,'Lee Roberson','Paw0rd','Student'),
(16,'Beatrice Ferrell','Paw0rd','Teacher');

/*Table structure for table `main_note` */

DROP TABLE IF EXISTS `main_note`;

CREATE TABLE `main_note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(225) NOT NULL,
  `notes` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `class_det_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `main_note_class_det_id_11e03556_fk_main_class_det_class_id` (`class_det_id`),
  KEY `main_note_teacher_id_dd13caeb_fk_main_teacher_teacher_id` (`teacher_id`),
  CONSTRAINT `main_note_class_det_id_11e03556_fk_main_class_det_class_id` FOREIGN KEY (`class_det_id`) REFERENCES `main_class_det` (`class_id`),
  CONSTRAINT `main_note_teacher_id_dd13caeb_fk_main_teacher_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `main_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_note` */

insert  into `main_note`(`note_id`,`subject`,`notes`,`date`,`class_det_id`,`teacher_id`,`file`) values 
(1,'social','Cupiditate et sint a','2023-03-03',3,1,'1-s2.0-S0952197622006881-main.pdf');

/*Table structure for table `main_occation` */

DROP TABLE IF EXISTS `main_occation`;

CREATE TABLE `main_occation` (
  `occation_id` int(11) NOT NULL AUTO_INCREMENT,
  `occation_det` varchar(225) NOT NULL,
  `occation_date` varchar(225) NOT NULL,
  PRIMARY KEY (`occation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_occation` */

insert  into `main_occation`(`occation_id`,`occation_det`,`occation_date`) values 
(2,'Recusandae Consequa','2023-03-03'),
(3,'A voluptas duis dolo','2023-03-03');

/*Table structure for table `main_payment` */

DROP TABLE IF EXISTS `main_payment`;

CREATE TABLE `main_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `fee_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `main_payment_fee_id_b9ff3fa0_fk_main_class_det_class_id` (`fee_id`),
  CONSTRAINT `main_payment_fee_id_b9ff3fa0_fk_main_class_det_class_id` FOREIGN KEY (`fee_id`) REFERENCES `main_class_det` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_payment` */

insert  into `main_payment`(`payment_id`,`amount`,`date`,`fee_id`) values 
(1,'500','2023-03-04',1),
(2,'200','2023-03-05',2);

/*Table structure for table `main_result` */

DROP TABLE IF EXISTS `main_result`;

CREATE TABLE `main_result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(225) NOT NULL,
  `result` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`result_id`),
  KEY `main_result_student_id_31c3c71a_fk_main_student_student_id` (`student_id`),
  CONSTRAINT `main_result_student_id_31c3c71a_fk_main_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `main_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_result` */

insert  into `main_result`(`result_id`,`subject`,`result`,`date`,`student_id`) values 
(1,'english','45','2023-03-03',1);

/*Table structure for table `main_student` */

DROP TABLE IF EXISTS `main_student`;

CREATE TABLE `main_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(225) NOT NULL,
  `lname` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `dob` varchar(225) NOT NULL,
  `doa` varchar(225) NOT NULL,
  `academic_year` varchar(225) NOT NULL,
  `class_det_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `main_student_class_det_id_8a48e120_fk_main_class_det_class_id` (`class_det_id`),
  KEY `main_student_login_id_7dbe6044_fk_main_login_login_id` (`login_id`),
  CONSTRAINT `main_student_class_det_id_8a48e120_fk_main_class_det_class_id` FOREIGN KEY (`class_det_id`) REFERENCES `main_class_det` (`class_id`),
  CONSTRAINT `main_student_login_id_7dbe6044_fk_main_login_login_id` FOREIGN KEY (`login_id`) REFERENCES `main_login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_student` */

insert  into `main_student`(`student_id`,`fname`,`lname`,`place`,`phone`,`dob`,`doa`,`academic_year`,`class_det_id`,`login_id`) values 
(1,'Fallon Harper','Nissim Yates','Inventore dolorum in','18253578943','1977-09-24','2023-03-02','2023-2024',5,2),
(2,'Curran Riddle','Orla Osborne','Inventore illum qui','11394966065','1982-11-11','1986-12-25','1992',2,4),
(3,'Wesley Duran','Stephen Potts','Dolorem aut ex dolor','13923252243','1993-02-15','2023-03-02','1974',4,5),
(4,'Lareina Patel','Leandra Montoya','Elit dolor nemo acc','11693343579','1983-07-01','1983-10-21','1989',5,6),
(5,'Ignatius Dorsey','Sasha Floyd','Nemo quidem sed est ','15423235998','1984-06-21','2008-06-05','1989',4,7),
(6,'Cheryl Travis','Dieter Lopez','Tempora est dicta eo','14157655281','1997-10-01','2009-10-22','1977',1,8),
(7,'Fay Weaver','Denton Weber','Quidem qui harum omn','12771394684','1994-02-16','2023-03-03','2003',2,9),
(8,'Nicole Levine','Macaulay Jones','Facilis ut blanditii','12018932298','1974-04-10','2000-09-25','1987',2,10),
(9,'Uriel Gentry','William Rojas','Sunt corporis tempor','11436248921','1991-03-01','2023-03-04','1973',1,11),
(10,'Robert Robles','David Hobbs','Impedit qui nisi er','12046152553','1999-10-01','2000-01-16','2012',3,15);

/*Table structure for table `main_subject` */

DROP TABLE IF EXISTS `main_subject`;

CREATE TABLE `main_subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(225) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_subject` */

insert  into `main_subject`(`subject_id`,`subject_name`) values 
(1,'maths'),
(2,'social'),
(3,'malayalam'),
(4,'english');

/*Table structure for table `main_teacher` */

DROP TABLE IF EXISTS `main_teacher`;

CREATE TABLE `main_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(225) NOT NULL,
  `lname` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `login_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `main_teacher_login_id_aac103cd_fk_main_login_login_id` (`login_id`),
  KEY `main_teacher_subject_id_01027ce0_fk_main_subject_subject_id` (`subject_id`),
  CONSTRAINT `main_teacher_login_id_aac103cd_fk_main_login_login_id` FOREIGN KEY (`login_id`) REFERENCES `main_login` (`login_id`),
  CONSTRAINT `main_teacher_subject_id_01027ce0_fk_main_subject_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `main_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_teacher` */

insert  into `main_teacher`(`teacher_id`,`fname`,`lname`,`place`,`phone`,`email`,`login_id`,`subject_id`) values 
(1,'Reed Puckett','Ignacia Ramirez','Quod explicabo Dolo','44','lebyzox@gmail.com',3,4),
(2,'Leandra Mcpherson','Jorden Gordon','Elit reiciendis asp','98','wunamyjin@gmail.com',12,4),
(3,'Tad Sanchez','Tanisha Leach','Accusamus ipsum iru','23','tumiza@gmail.com',13,2),
(4,'Rhiannon Walton','Nigel Benton','Vel ex ut beatae eiu','66','tiguqu@gmail.com',14,1),
(5,'Xyla Crawford','Sigourney Nash','Nihil sunt duis dolo','16077772487','syqyvog@gmail.com',16,3);

/*Table structure for table `main_timetable` */

DROP TABLE IF EXISTS `main_timetable`;

CREATE TABLE `main_timetable` (
  `timetable_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(225) NOT NULL,
  `p1_id` varchar(225) NOT NULL,
  `p2_id` varchar(225) NOT NULL,
  `p3_id` varchar(225) NOT NULL,
  `p4_id` varchar(225) NOT NULL,
  `p5_id` varchar(225) NOT NULL,
  `class_det_id` int(11) NOT NULL,
  PRIMARY KEY (`timetable_id`),
  KEY `main_timetable_class_det_id_5aeef81b_fk_main_class_det_class_id` (`class_det_id`),
  CONSTRAINT `main_timetable_class_det_id_5aeef81b_fk_main_class_det_class_id` FOREIGN KEY (`class_det_id`) REFERENCES `main_class_det` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_timetable` */

insert  into `main_timetable`(`timetable_id`,`day`,`p1_id`,`p2_id`,`p3_id`,`p4_id`,`p5_id`,`class_det_id`) values 
(1,'monday','social','malayalam','social','maths','malayalam',2);

/*Table structure for table `main_upload` */

DROP TABLE IF EXISTS `main_upload`;

CREATE TABLE `main_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `date` varchar(225) NOT NULL,
  `mark` varchar(225) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `main_upload_assignment_id_41d3deb9_fk_main_class_det_class_id` (`assignment_id`),
  KEY `main_upload_student_id_e6bda324_fk_main_student_student_id` (`student_id`),
  CONSTRAINT `main_upload_assignment_id_41d3deb9_fk_main_class_det_class_id` FOREIGN KEY (`assignment_id`) REFERENCES `main_class_det` (`class_id`),
  CONSTRAINT `main_upload_student_id_e6bda324_fk_main_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `main_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `main_upload` */

insert  into `main_upload`(`upload_id`,`file`,`date`,`mark`,`assignment_id`,`student_id`) values 
(1,'1-s2.0-S0952197622006881-main_FrpMM1C.pdf','2023-03-03','NA',2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
