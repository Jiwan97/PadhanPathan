-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2022 at 09:32 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pathan`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_profile`
--

CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phonenumber` varchar(200) DEFAULT NULL,
  `facebooklink` varchar(200) DEFAULT NULL,
  `skills` varchar(200) DEFAULT NULL,
  `university` varchar(200) DEFAULT NULL,
  `highschool` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `occupation` varchar(200) DEFAULT NULL,
  `profile_pic` varchar(500) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `sendNotification` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_profile`
--

INSERT INTO `accounts_profile` (`id`, `username`, `firstname`, `lastname`, `birthdate`, `country`, `address`, `phonenumber`, `facebooklink`, `skills`, `university`, `highschool`, `gender`, `email`, `occupation`, `profile_pic`, `created_date`, `sendNotification`, `user_id`) VALUES
(1, 'Jiwan', 'Name not Updated', '', NULL, 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'jiwan@gmail.com', 'Not Updated', '', '2022-05-13 13:41:02.039887', 1, 1),
(15, '190288', 'Name not Updated', '', NULL, 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'Not Updated', 'jiwanthapa06@gmail.com', 'Not Updated', '', '2022-05-15 04:52:53.061191', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL,
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
  `is_email_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_email_verified`) VALUES
(1, 'pbkdf2_sha256$260000$iPd3rghsraMVwzj9feNxjQ$Ma6+IbyCuXOjPMB45WcFNMwTAfTclzNIKhmBK7jmZNQ=', '2022-05-16 04:04:58.037054', 1, 'Jiwan', '', '', 'jiwan@gmail.com', 1, 1, '2022-05-13 13:41:01.000000', 1),
(15, 'pbkdf2_sha256$260000$90icdp0yWPBG2RYJ62Encl$yOpnQ43KdTeo0k6VjwrufKQYV7Rk0wwq+QMmcmY8VDw=', '2022-05-15 04:53:30.130681', 0, '190288', '', '', 'jiwanthapa06@gmail.com', 0, 1, '2022-05-15 04:52:53.056191', 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admins_response`
--

CREATE TABLE `admins_response` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `contactMessage_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add site', 1, 'add_site'),
(2, 'Can change site', 1, 'change_site'),
(3, 'Can delete site', 1, 'delete_site'),
(4, 'Can view site', 1, 'view_site'),
(5, 'Can add email address', 2, 'add_emailaddress'),
(6, 'Can change email address', 2, 'change_emailaddress'),
(7, 'Can delete email address', 2, 'delete_emailaddress'),
(8, 'Can view email address', 2, 'view_emailaddress'),
(9, 'Can add email confirmation', 3, 'add_emailconfirmation'),
(10, 'Can change email confirmation', 3, 'change_emailconfirmation'),
(11, 'Can delete email confirmation', 3, 'delete_emailconfirmation'),
(12, 'Can view email confirmation', 3, 'view_emailconfirmation'),
(13, 'Can add social account', 4, 'add_socialaccount'),
(14, 'Can change social account', 4, 'change_socialaccount'),
(15, 'Can delete social account', 4, 'delete_socialaccount'),
(16, 'Can view social account', 4, 'view_socialaccount'),
(17, 'Can add social application', 5, 'add_socialapp'),
(18, 'Can change social application', 5, 'change_socialapp'),
(19, 'Can delete social application', 5, 'delete_socialapp'),
(20, 'Can view social application', 5, 'view_socialapp'),
(21, 'Can add social application token', 6, 'add_socialtoken'),
(22, 'Can change social application token', 6, 'change_socialtoken'),
(23, 'Can delete social application token', 6, 'delete_socialtoken'),
(24, 'Can view social application token', 6, 'view_socialtoken'),
(25, 'Can add log entry', 7, 'add_logentry'),
(26, 'Can change log entry', 7, 'change_logentry'),
(27, 'Can delete log entry', 7, 'delete_logentry'),
(28, 'Can view log entry', 7, 'view_logentry'),
(29, 'Can add permission', 8, 'add_permission'),
(30, 'Can change permission', 8, 'change_permission'),
(31, 'Can delete permission', 8, 'delete_permission'),
(32, 'Can view permission', 8, 'view_permission'),
(33, 'Can add group', 9, 'add_group'),
(34, 'Can change group', 9, 'change_group'),
(35, 'Can delete group', 9, 'delete_group'),
(36, 'Can view group', 9, 'view_group'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session'),
(45, 'Can add completed task', 12, 'add_completedtask'),
(46, 'Can change completed task', 12, 'change_completedtask'),
(47, 'Can delete completed task', 12, 'delete_completedtask'),
(48, 'Can view completed task', 12, 'view_completedtask'),
(49, 'Can add task', 13, 'add_task'),
(50, 'Can change task', 13, 'change_task'),
(51, 'Can delete task', 13, 'delete_task'),
(52, 'Can view task', 13, 'view_task'),
(53, 'Can add tag', 14, 'add_tag'),
(54, 'Can change tag', 14, 'change_tag'),
(55, 'Can delete tag', 14, 'delete_tag'),
(56, 'Can view tag', 14, 'view_tag'),
(57, 'Can add tagged item', 15, 'add_taggeditem'),
(58, 'Can change tagged item', 15, 'change_taggeditem'),
(59, 'Can delete tagged item', 15, 'delete_taggeditem'),
(60, 'Can view tagged item', 15, 'view_taggeditem'),
(61, 'Can add contact message', 16, 'add_contactmessage'),
(62, 'Can change contact message', 16, 'change_contactmessage'),
(63, 'Can delete contact message', 16, 'delete_contactmessage'),
(64, 'Can view contact message', 16, 'view_contactmessage'),
(65, 'Can add course', 17, 'add_course'),
(66, 'Can change course', 17, 'change_course'),
(67, 'Can delete course', 17, 'delete_course'),
(68, 'Can view course', 17, 'view_course'),
(69, 'Can add exam model', 18, 'add_exammodel'),
(70, 'Can change exam model', 18, 'change_exammodel'),
(71, 'Can delete exam model', 18, 'delete_exammodel'),
(72, 'Can view exam model', 18, 'view_exammodel'),
(73, 'Can add news', 19, 'add_news'),
(74, 'Can change news', 19, 'change_news'),
(75, 'Can delete news', 19, 'delete_news'),
(76, 'Can view news', 19, 'view_news'),
(77, 'Can add exam question', 20, 'add_examquestion'),
(78, 'Can change exam question', 20, 'change_examquestion'),
(79, 'Can delete exam question', 20, 'delete_examquestion'),
(80, 'Can view exam question', 20, 'view_examquestion'),
(81, 'Can add exam qna', 21, 'add_examqna'),
(82, 'Can change exam qna', 21, 'change_examqna'),
(83, 'Can delete exam qna', 21, 'delete_examqna'),
(84, 'Can view exam qna', 21, 'view_examqna'),
(85, 'Can add exam answer', 22, 'add_examanswer'),
(86, 'Can change exam answer', 22, 'change_examanswer'),
(87, 'Can delete exam answer', 22, 'delete_examanswer'),
(88, 'Can view exam answer', 22, 'view_examanswer'),
(89, 'Can add course review', 23, 'add_coursereview'),
(90, 'Can change course review', 23, 'change_coursereview'),
(91, 'Can delete course review', 23, 'delete_coursereview'),
(92, 'Can view course review', 23, 'view_coursereview'),
(93, 'Can add course module', 24, 'add_coursemodule'),
(94, 'Can change course module', 24, 'change_coursemodule'),
(95, 'Can delete course module', 24, 'delete_coursemodule'),
(96, 'Can view course module', 24, 'view_coursemodule'),
(97, 'Can add course like', 25, 'add_courselike'),
(98, 'Can change course like', 25, 'change_courselike'),
(99, 'Can delete course like', 25, 'delete_courselike'),
(100, 'Can view course like', 25, 'view_courselike'),
(101, 'Can add course enrollement', 26, 'add_courseenrollement'),
(102, 'Can change course enrollement', 26, 'change_courseenrollement'),
(103, 'Can delete course enrollement', 26, 'delete_courseenrollement'),
(104, 'Can view course enrollement', 26, 'view_courseenrollement'),
(105, 'Can add comment', 27, 'add_comment'),
(106, 'Can change comment', 27, 'change_comment'),
(107, 'Can delete comment', 27, 'delete_comment'),
(108, 'Can view comment', 27, 'view_comment'),
(109, 'Can add attempted', 28, 'add_attempted'),
(110, 'Can change attempted', 28, 'change_attempted'),
(111, 'Can delete attempted', 28, 'delete_attempted'),
(112, 'Can view attempted', 28, 'view_attempted'),
(113, 'Can add user', 29, 'add_user'),
(114, 'Can change user', 29, 'change_user'),
(115, 'Can delete user', 29, 'delete_user'),
(116, 'Can view user', 29, 'view_user'),
(117, 'Can add profile', 30, 'add_profile'),
(118, 'Can change profile', 30, 'change_profile'),
(119, 'Can delete profile', 30, 'delete_profile'),
(120, 'Can view profile', 30, 'view_profile'),
(121, 'Can add response', 31, 'add_response'),
(122, 'Can change response', 31, 'change_response'),
(123, 'Can delete response', 31, 'delete_response'),
(124, 'Can view response', 31, 'view_response');

-- --------------------------------------------------------

--
-- Table structure for table `background_task`
--

CREATE TABLE `background_task` (
  `id` int(11) NOT NULL,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) UNSIGNED DEFAULT NULL CHECK (`creator_object_id` >= 0),
  `creator_content_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `background_task_completedtask`
--

CREATE TABLE `background_task_completedtask` (
  `id` int(11) NOT NULL,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) UNSIGNED DEFAULT NULL CHECK (`creator_object_id` >= 0),
  `creator_content_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-14 13:28:02.713329', '1', 'jiwan@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Is email verified\"]}}]', 29, 1),
(2, '2022-05-14 13:29:20.316512', '2', 'jiwanthapa06@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Is email verified\"]}}]', 29, 1),
(3, '2022-05-14 13:40:26.553934', '2', 'jiwanthapa06@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Is email verified\"]}}]', 29, 1),
(4, '2022-05-14 13:42:00.667830', '2', 'jiwanthapa06@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Is email verified\"]}}]', 29, 1),
(5, '2022-05-14 14:00:32.882747', '2', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(6, '2022-05-14 14:01:22.697232', '3', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(7, '2022-05-14 14:20:21.974688', '4', '190288', 3, '', 30, 1),
(8, '2022-05-14 14:28:58.394670', '4', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(9, '2022-05-14 14:34:01.585930', '5', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(10, '2022-05-14 14:35:52.134988', '8', '127.0.0.1:8000', 1, '[{\"added\": {}}]', 1, 1),
(11, '2022-05-14 14:37:30.756719', '6', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(12, '2022-05-14 14:39:07.502698', '7', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(13, '2022-05-14 14:39:27.635069', '8', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(14, '2022-05-14 14:40:12.160715', '9', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(15, '2022-05-14 14:40:56.746448', '8', '1', 2, '[{\"changed\": {\"fields\": [\"Domain name\"]}}]', 1, 1),
(16, '2022-05-14 14:41:00.314594', '7', '127.0.0.1:8000', 2, '[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]', 1, 1),
(17, '2022-05-14 14:41:35.257614', '10', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(18, '2022-05-14 14:46:21.474046', '11', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(19, '2022-05-14 14:55:55.350437', '12', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(20, '2022-05-16 04:05:09.809756', '13', 'jiwanthapa06@gmail.com', 3, '', 29, 1),
(21, '2022-05-16 04:05:16.167762', '14', 'jiji@email.com', 3, '', 29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'account', 'emailaddress'),
(3, 'account', 'emailconfirmation'),
(30, 'accounts', 'profile'),
(29, 'accounts', 'user'),
(7, 'admin', 'logentry'),
(31, 'admins', 'response'),
(9, 'auth', 'group'),
(8, 'auth', 'permission'),
(12, 'background_task', 'completedtask'),
(13, 'background_task', 'task'),
(10, 'contenttypes', 'contenttype'),
(28, 'PadhanPathan', 'attempted'),
(27, 'PadhanPathan', 'comment'),
(16, 'PadhanPathan', 'contactmessage'),
(17, 'PadhanPathan', 'course'),
(26, 'PadhanPathan', 'courseenrollement'),
(25, 'PadhanPathan', 'courselike'),
(24, 'PadhanPathan', 'coursemodule'),
(23, 'PadhanPathan', 'coursereview'),
(22, 'PadhanPathan', 'examanswer'),
(18, 'PadhanPathan', 'exammodel'),
(21, 'PadhanPathan', 'examqna'),
(20, 'PadhanPathan', 'examquestion'),
(19, 'PadhanPathan', 'news'),
(11, 'sessions', 'session'),
(1, 'sites', 'site'),
(4, 'socialaccount', 'socialaccount'),
(5, 'socialaccount', 'socialapp'),
(6, 'socialaccount', 'socialtoken'),
(14, 'taggit', 'tag'),
(15, 'taggit', 'taggeditem');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-13 13:39:24.985340'),
(2, 'taggit', '0001_initial', '2022-05-13 13:39:25.229985'),
(3, 'taggit', '0002_auto_20150616_2121', '2022-05-13 13:39:25.261888'),
(4, 'contenttypes', '0002_remove_content_type_name', '2022-05-13 13:39:25.344629'),
(5, 'taggit', '0003_taggeditem_add_unique_index', '2022-05-13 13:39:25.364868'),
(6, 'auth', '0001_initial', '2022-05-13 13:39:25.819965'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-13 13:39:25.838150'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-13 13:39:25.846153'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-13 13:39:25.854148'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-13 13:39:25.862151'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-13 13:39:25.867143'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-13 13:39:25.874144'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-13 13:39:25.882159'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-13 13:39:25.892186'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-13 13:39:25.908188'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-13 13:39:25.917196'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-13 13:39:25.926199'),
(18, 'accounts', '0001_initial', '2022-05-13 13:39:26.499488'),
(19, 'PadhanPathan', '0001_initial', '2022-05-13 13:39:28.371825'),
(20, 'account', '0001_initial', '2022-05-13 13:39:28.589060'),
(21, 'account', '0002_email_max_length', '2022-05-13 13:39:28.614865'),
(22, 'admin', '0001_initial', '2022-05-13 13:39:28.858022'),
(23, 'admin', '0002_logentry_remove_auto_add', '2022-05-13 13:39:28.876007'),
(24, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-13 13:39:28.892019'),
(25, 'admins', '0001_initial', '2022-05-13 13:39:29.064505'),
(26, 'background_task', '0001_initial', '2022-05-13 13:39:29.583140'),
(27, 'background_task', '0002_auto_20170927_1109', '2022-05-13 13:39:29.605130'),
(28, 'sessions', '0001_initial', '2022-05-13 13:39:29.682155'),
(29, 'sites', '0001_initial', '2022-05-13 13:39:29.717871'),
(30, 'sites', '0002_alter_domain_unique', '2022-05-13 13:39:29.742188'),
(31, 'socialaccount', '0001_initial', '2022-05-13 13:39:30.363261'),
(32, 'socialaccount', '0002_token_max_lengths', '2022-05-13 13:39:30.416266'),
(33, 'socialaccount', '0003_extra_data_default_dict', '2022-05-13 13:39:30.433281');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('97g79rf0n4l7hwq742fxeciewyubmkbz', '.eJxVjDsOwjAQBe_iGln4n6Wkzxks27uLA8iR4qRC3B0ipYD2zcx7iZi2tcat0xInFBehjDj9jjmVB7Wd4D212yzL3NZlynJX5EG7HGek5_Vw_w5q6vVbO2-sCkl7N7BGtC4Um8krQELPymgonsG4kGFQ5mx1gaxAF2ZOOjsS7w_vVDfo:1nptlp:AnYOW9dDwGFmqBKrUHPiVCkspKEieOQcGB3r9twl5ys', '2022-05-28 15:33:29.077585'),
('qvt6hkesiw2qsmattshne5walbfr21qj', '.eJxVjLEOwjAMRP8lM4oaV-CEkZ1viBzbIQWUSk07Vfw7rdQBpJvuvbvVRFrmEpemUxzEXI0Dc_otE_FL607kSfUxWh7rPA3J7oo9aLP3UfR9O9y_g0KtbOvcI7L4LYCUA5yBSTvlS_A-kHhlduzEYQYNWZgJCTBldBm6XoP5fAE2dzlp:1nptAs:6MMwWYaLCla2fZTmUc-_W1oGYpc29KIOPdUqWNT-aTg', '2022-05-28 14:55:18.984240'),
('x4185l2mv06b7w3f8a0hch6dkirnssly', '.eJxVjDsOwjAQRO_iGlnerIM3lPScwdr1BweQI8VJhbg7iZQCminmvZm38rwuxa8tzX6M6qJAnX474fBMdQfxwfU-6TDVZR5F74o-aNO3KabX9XD_Dgq3sq2DgBOMhGYwbISBmHowTBbFgoPcUQJ2GSWx7SnDIFtScJTw3DlUny_Xfjdr:1nqRyc:35qmM7wExGLLjGjKcwfqSkD2H9mAwPfPZZe6n0sdqFM', '2022-05-30 04:04:58.052057'),
('ycw9ewapa2ad1ek4r0jakomij9wo6j75', '.eJxVjDsOwjAQRO_iGlnerIM3lPScwdr1BweQI8VJhbg7iZQCminmvZm38rwuxa8tzX6M6qJAnX474fBMdQfxwfU-6TDVZR5F74o-aNO3KabX9XD_Dgq3sq2DgBOMhGYwbISBmHowTBbFgoPcUQJ2GSWx7SnDIFtScJTw3DlUny_Xfjdr:1npVXm:4ESU8XgkmWBF9E7vZLvqYRGwuUBiZmzR04_WygunUjA', '2022-05-27 13:41:22.999623');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(7, '127.0.0.1:8000', '127.0.0.1:8000'),
(8, '1', 'Jiwan');

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_attempted`
--

CREATE TABLE `padhanpathan_attempted` (
  `id` int(11) NOT NULL,
  `date_attempted` datetime(6) NOT NULL,
  `attempted` tinyint(1) NOT NULL,
  `user_score` smallint(5) UNSIGNED NOT NULL CHECK (`user_score` >= 0),
  `exammodel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_comment`
--

CREATE TABLE `padhanpathan_comment` (
  `id` int(11) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `date_commented` datetime(6) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_contactmessage`
--

CREATE TABLE `padhanpathan_contactmessage` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phonenumber` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `query` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `responded` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_course`
--

CREATE TABLE `padhanpathan_course` (
  `id` int(11) NOT NULL,
  `course_name` varchar(200) DEFAULT NULL,
  `course_summary` varchar(200) DEFAULT NULL,
  `to_learn` longtext DEFAULT NULL,
  `course_pic` varchar(500) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_courseenrollement`
--

CREATE TABLE `padhanpathan_courseenrollement` (
  `id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `enrolled` tinyint(1) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_courselike`
--

CREATE TABLE `padhanpathan_courselike` (
  `id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `like` tinyint(1) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_coursemodule`
--

CREATE TABLE `padhanpathan_coursemodule` (
  `id` int(11) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `modulenumber` int(11) DEFAULT NULL,
  `module` varchar(200) DEFAULT NULL,
  `ModuleLecture` longtext DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_coursereview`
--

CREATE TABLE `padhanpathan_coursereview` (
  `id` int(11) NOT NULL,
  `comment` varchar(50000) DEFAULT NULL,
  `rate` smallint(5) UNSIGNED NOT NULL CHECK (`rate` >= 0),
  `edited` tinyint(1) NOT NULL,
  `date_commented` datetime(6) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_examanswer`
--

CREATE TABLE `padhanpathan_examanswer` (
  `id` int(11) NOT NULL,
  `time` int(10) UNSIGNED NOT NULL CHECK (`time` >= 0),
  `attempted` tinyint(1) NOT NULL,
  `answer` longtext DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `examquestion_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_exammodel`
--

CREATE TABLE `padhanpathan_exammodel` (
  `id` int(11) NOT NULL,
  `ExamNumber` smallint(5) UNSIGNED DEFAULT NULL CHECK (`ExamNumber` >= 0),
  `ExamTitle` varchar(500) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_examqna`
--

CREATE TABLE `padhanpathan_examqna` (
  `id` int(11) NOT NULL,
  `numb` smallint(5) UNSIGNED NOT NULL CHECK (`numb` >= 0),
  `question` varchar(5000) DEFAULT NULL,
  `option1` varchar(5000) DEFAULT NULL,
  `option2` varchar(5000) DEFAULT NULL,
  `option3` varchar(5000) DEFAULT NULL,
  `option4` varchar(5000) DEFAULT NULL,
  `answer` varchar(5000) DEFAULT NULL,
  `exammodel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_examquestion`
--

CREATE TABLE `padhanpathan_examquestion` (
  `id` int(11) NOT NULL,
  `question` longtext DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `exammodel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `padhanpathan_news`
--

CREATE TABLE `padhanpathan_news` (
  `id` int(11) NOT NULL,
  `heading` varchar(200) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `news_pic` varchar(500) NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taggit_tag`
--

CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taggit_taggeditem`
--

CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `admins_response`
--
ALTER TABLE `admins_response`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_response_contactMessage_id_24e7d6bd_fk_PadhanPat` (`contactMessage_id`),
  ADD KEY `admins_response_user_id_df7b79a1_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `background_task`
--
ALTER TABLE `background_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  ADD KEY `background_task_task_name_4562d56a` (`task_name`),
  ADD KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  ADD KEY `background_task_priority_88bdbce9` (`priority`),
  ADD KEY `background_task_run_at_7baca3aa` (`run_at`),
  ADD KEY `background_task_queue_1d5f3a40` (`queue`),
  ADD KEY `background_task_attempts_a9ade23d` (`attempts`),
  ADD KEY `background_task_failed_at_b81bba14` (`failed_at`),
  ADD KEY `background_task_locked_by_db7779e3` (`locked_by`),
  ADD KEY `background_task_locked_at_0fb0f225` (`locked_at`);

--
-- Indexes for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  ADD KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  ADD KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  ADD KEY `background_task_completedtask_priority_9080692e` (`priority`),
  ADD KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  ADD KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  ADD KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  ADD KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  ADD KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  ADD KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `padhanpathan_attempted`
--
ALTER TABLE `padhanpathan_attempted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_attempt_exammodel_id_68797c54_fk_PadhanPat` (`exammodel_id`),
  ADD KEY `PadhanPathan_attempted_user_id_61592fe5_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_comment`
--
ALTER TABLE `padhanpathan_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_comment_news_id_89caaebb_fk_PadhanPathan_news_id` (`news_id`),
  ADD KEY `PadhanPathan_comment_user_id_f954b571_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_contactmessage`
--
ALTER TABLE `padhanpathan_contactmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `padhanpathan_course`
--
ALTER TABLE `padhanpathan_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_course_user_id_a1ff5d99_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_courseenrollement`
--
ALTER TABLE `padhanpathan_courseenrollement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_coursee_course_id_10ca33d1_fk_PadhanPat` (`course_id`),
  ADD KEY `PadhanPathan_coursee_user_id_b2fc1ad5_fk_accounts_` (`user_id`);

--
-- Indexes for table `padhanpathan_courselike`
--
ALTER TABLE `padhanpathan_courselike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_coursel_course_id_16ae4c6d_fk_PadhanPat` (`course_id`),
  ADD KEY `PadhanPathan_courselike_user_id_b6ac0048_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_coursemodule`
--
ALTER TABLE `padhanpathan_coursemodule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_coursem_course_id_364761ff_fk_PadhanPat` (`course_id`);

--
-- Indexes for table `padhanpathan_coursereview`
--
ALTER TABLE `padhanpathan_coursereview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_courser_course_id_cd46123c_fk_PadhanPat` (`course_id`),
  ADD KEY `PadhanPathan_coursereview_user_id_5b6b9df2_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_examanswer`
--
ALTER TABLE `padhanpathan_examanswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_examans_examquestion_id_ae50ba62_fk_PadhanPat` (`examquestion_id`),
  ADD KEY `PadhanPathan_examanswer_user_id_fee89c43_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_exammodel`
--
ALTER TABLE `padhanpathan_exammodel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_exammod_course_id_4fb49de4_fk_PadhanPat` (`course_id`),
  ADD KEY `PadhanPathan_exammodel_user_id_e5f8f3b2_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_examqna`
--
ALTER TABLE `padhanpathan_examqna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_examqna_exammodel_id_247878be_fk_PadhanPat` (`exammodel_id`);

--
-- Indexes for table `padhanpathan_examquestion`
--
ALTER TABLE `padhanpathan_examquestion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exammodel_id` (`exammodel_id`),
  ADD KEY `PadhanPathan_examquestion_user_id_8def6e2c_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `padhanpathan_news`
--
ALTER TABLE `padhanpathan_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PadhanPathan_news_user_id_297532be_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`);

--
-- Indexes for table `taggit_tag`
--
ALTER TABLE `taggit_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  ADD KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  ADD KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  ADD KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins_response`
--
ALTER TABLE `admins_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `background_task`
--
ALTER TABLE `background_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `padhanpathan_attempted`
--
ALTER TABLE `padhanpathan_attempted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_comment`
--
ALTER TABLE `padhanpathan_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_contactmessage`
--
ALTER TABLE `padhanpathan_contactmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_course`
--
ALTER TABLE `padhanpathan_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_courseenrollement`
--
ALTER TABLE `padhanpathan_courseenrollement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_courselike`
--
ALTER TABLE `padhanpathan_courselike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_coursemodule`
--
ALTER TABLE `padhanpathan_coursemodule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_coursereview`
--
ALTER TABLE `padhanpathan_coursereview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_examanswer`
--
ALTER TABLE `padhanpathan_examanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_exammodel`
--
ALTER TABLE `padhanpathan_exammodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_examqna`
--
ALTER TABLE `padhanpathan_examqna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_examquestion`
--
ALTER TABLE `padhanpathan_examquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `padhanpathan_news`
--
ALTER TABLE `padhanpathan_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggit_tag`
--
ALTER TABLE `taggit_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_profile`
--
ALTER TABLE `accounts_profile`
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `admins_response`
--
ALTER TABLE `admins_response`
  ADD CONSTRAINT `admins_response_contactMessage_id_24e7d6bd_fk_PadhanPat` FOREIGN KEY (`contactMessage_id`) REFERENCES `padhanpathan_contactmessage` (`id`),
  ADD CONSTRAINT `admins_response_user_id_df7b79a1_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `background_task`
--
ALTER TABLE `background_task`
  ADD CONSTRAINT `background_task_creator_content_type_61cc9af3_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  ADD CONSTRAINT `background_task_comp_creator_content_type_21d6a741_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_attempted`
--
ALTER TABLE `padhanpathan_attempted`
  ADD CONSTRAINT `PadhanPathan_attempt_exammodel_id_68797c54_fk_PadhanPat` FOREIGN KEY (`exammodel_id`) REFERENCES `padhanpathan_exammodel` (`id`),
  ADD CONSTRAINT `PadhanPathan_attempted_user_id_61592fe5_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_comment`
--
ALTER TABLE `padhanpathan_comment`
  ADD CONSTRAINT `PadhanPathan_comment_news_id_89caaebb_fk_PadhanPathan_news_id` FOREIGN KEY (`news_id`) REFERENCES `padhanpathan_news` (`id`),
  ADD CONSTRAINT `PadhanPathan_comment_user_id_f954b571_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_course`
--
ALTER TABLE `padhanpathan_course`
  ADD CONSTRAINT `PadhanPathan_course_user_id_a1ff5d99_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_courseenrollement`
--
ALTER TABLE `padhanpathan_courseenrollement`
  ADD CONSTRAINT `PadhanPathan_coursee_course_id_10ca33d1_fk_PadhanPat` FOREIGN KEY (`course_id`) REFERENCES `padhanpathan_course` (`id`),
  ADD CONSTRAINT `PadhanPathan_coursee_user_id_b2fc1ad5_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_courselike`
--
ALTER TABLE `padhanpathan_courselike`
  ADD CONSTRAINT `PadhanPathan_coursel_course_id_16ae4c6d_fk_PadhanPat` FOREIGN KEY (`course_id`) REFERENCES `padhanpathan_course` (`id`),
  ADD CONSTRAINT `PadhanPathan_courselike_user_id_b6ac0048_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_coursemodule`
--
ALTER TABLE `padhanpathan_coursemodule`
  ADD CONSTRAINT `PadhanPathan_coursem_course_id_364761ff_fk_PadhanPat` FOREIGN KEY (`course_id`) REFERENCES `padhanpathan_course` (`id`);

--
-- Constraints for table `padhanpathan_coursereview`
--
ALTER TABLE `padhanpathan_coursereview`
  ADD CONSTRAINT `PadhanPathan_courser_course_id_cd46123c_fk_PadhanPat` FOREIGN KEY (`course_id`) REFERENCES `padhanpathan_course` (`id`),
  ADD CONSTRAINT `PadhanPathan_coursereview_user_id_5b6b9df2_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_examanswer`
--
ALTER TABLE `padhanpathan_examanswer`
  ADD CONSTRAINT `PadhanPathan_examans_examquestion_id_ae50ba62_fk_PadhanPat` FOREIGN KEY (`examquestion_id`) REFERENCES `padhanpathan_examquestion` (`id`),
  ADD CONSTRAINT `PadhanPathan_examanswer_user_id_fee89c43_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_exammodel`
--
ALTER TABLE `padhanpathan_exammodel`
  ADD CONSTRAINT `PadhanPathan_exammod_course_id_4fb49de4_fk_PadhanPat` FOREIGN KEY (`course_id`) REFERENCES `padhanpathan_course` (`id`),
  ADD CONSTRAINT `PadhanPathan_exammodel_user_id_e5f8f3b2_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_examqna`
--
ALTER TABLE `padhanpathan_examqna`
  ADD CONSTRAINT `PadhanPathan_examqna_exammodel_id_247878be_fk_PadhanPat` FOREIGN KEY (`exammodel_id`) REFERENCES `padhanpathan_exammodel` (`id`);

--
-- Constraints for table `padhanpathan_examquestion`
--
ALTER TABLE `padhanpathan_examquestion`
  ADD CONSTRAINT `PadhanPathan_examque_exammodel_id_a598b34c_fk_PadhanPat` FOREIGN KEY (`exammodel_id`) REFERENCES `padhanpathan_exammodel` (`id`),
  ADD CONSTRAINT `PadhanPathan_examquestion_user_id_8def6e2c_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `padhanpathan_news`
--
ALTER TABLE `padhanpathan_news`
  ADD CONSTRAINT `PadhanPathan_news_user_id_297532be_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `taggit_taggeditem`
--
ALTER TABLE `taggit_taggeditem`
  ADD CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
