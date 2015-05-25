-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2015 at 12:08 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `locan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anneeacademique`
--

CREATE TABLE IF NOT EXISTS `anneeacademique` (
  `anneeacademique` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`anneeacademique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anneeacademique`
--

INSERT INTO `anneeacademique` (`anneeacademique`) VALUES
('2014-2015'),
('2015-2016');

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE IF NOT EXISTS `charge` (
  `IDCHARGE` varchar(15) NOT NULL,
  `LIBELLE` varchar(150) NOT NULL,
  PRIMARY KEY (`IDCHARGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charge`
--

INSERT INTO `charge` (`IDCHARGE`, `LIBELLE`) VALUES
('Accident', 'Resp. à prévénir en cas d''accident'),
('Contact', 'Resp. contact'),
('Financier', 'Resp. financier');

-- --------------------------------------------------------

--
-- Table structure for table `civilite`
--

CREATE TABLE IF NOT EXISTS `civilite` (
  `CIVILITE` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`CIVILITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `civilite`
--

INSERT INTO `civilite` (`CIVILITE`) VALUES
('Dr'),
('Mlle'),
('Mme'),
('Mr');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `CODE` varchar(15) NOT NULL,
  `LIBELLE` varchar(150) NOT NULL,
  `DECOUPAGE` int(11) DEFAULT NULL,
  `ANNEEACADEMIQUE` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`CODE`,`ANNEEACADEMIQUE`),
  KEY `DECOUPAGE` (`DECOUPAGE`),
  KEY `ANNEEACADEMIQUE` (`ANNEEACADEMIQUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`CODE`, `LIBELLE`, `DECOUPAGE`, `ANNEEACADEMIQUE`) VALUES
('5A', 'Cinquième A', 1, '2014-2015');

-- --------------------------------------------------------

--
-- Table structure for table `connexions`
--

CREATE TABLE IF NOT EXISTS `connexions` (
  `IDCONNEXION` int(11) NOT NULL AUTO_INCREMENT,
  `COMPTE` varchar(30) CHARACTER SET latin1 NOT NULL,
  `DATEDEBUT` datetime NOT NULL,
  `MACHINESOURCE` varchar(100) CHARACTER SET latin1 NOT NULL,
  `IPSOURCE` varchar(48) CHARACTER SET latin1 DEFAULT NULL,
  `CONNEXION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEFIN` datetime DEFAULT NULL,
  `DECONNEXION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDCONNEXION`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=261 ;

--
-- Dumping data for table `connexions`
--

INSERT INTO `connexions` (`IDCONNEXION`, `COMPTE`, `DATEDEBUT`, `MACHINESOURCE`, `IPSOURCE`, `CONNEXION`, `DATEFIN`, `DECONNEXION`) VALUES
(161, 'armel', '2015-05-17 02:40:32', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 02:40:43', 'Session fermÃ©e correctement'),
(162, 'armel', '2015-05-17 02:40:52', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 03:13:23', 'Session expriÃ©e'),
(163, 'armel', '2015-05-17 03:18:12', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 03:35:16', 'Session expriÃ©e'),
(164, 'armel', '2015-05-17 03:43:38', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 03:58:13', 'Session expriÃ©e'),
(165, 'armel', '2015-05-17 04:03:00', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 04:14:52', 'Session expriÃ©e'),
(166, 'armel', '2015-05-17 04:29:08', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 04:39:08', 'Session expriÃ©e'),
(167, 'armel', '2015-05-17 11:31:36', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 12:19:24', 'Session expriÃ©e'),
(168, 'armel', '2015-05-17 12:20:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 12:36:35', 'Session expriÃ©e'),
(169, 'armel', '2015-05-17 14:09:45', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 14:53:23', 'Session expriÃ©e'),
(170, 'armel', '2015-05-17 19:33:28', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 19:48:49', 'Session expriÃ©e'),
(171, 'armel', '2015-05-17 19:53:40', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 20:21:59', 'Session expriÃ©e'),
(172, 'armel', '2015-05-17 20:35:19', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 20:49:50', 'Session expriÃ©e'),
(173, 'armel', '2015-05-17 21:01:25', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 21:22:27', 'Session expriÃ©e'),
(174, 'armel', '2015-05-17 21:23:44', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 22:34:53', 'Session expriÃ©e'),
(175, 'armel', '2015-05-17 22:37:05', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 22:47:11', 'Session expriÃ©e'),
(176, 'armel', '2015-05-17 22:55:27', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-17 23:12:08', 'Session expriÃ©e'),
(177, 'armel', '2015-05-17 23:55:43', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 00:10:54', 'Session expriÃ©e'),
(178, 'armel', '2015-05-18 00:12:16', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 01:04:19', 'Session expriÃ©e'),
(179, 'armel', '2015-05-18 01:17:24', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 01:43:16', 'Session expriÃ©e'),
(180, 'armel', '2015-05-18 05:33:21', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 06:54:59', 'Session expriÃ©e'),
(181, 'armel', '2015-05-18 06:57:53', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 07:40:44', 'Session expriÃ©e'),
(182, 'jp', '2015-05-18 07:07:44', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 07:17:52', 'Session expriÃ©e'),
(183, 'jp', '2015-05-18 07:33:08', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 08:06:33', 'Session expriÃ©e'),
(184, 'armel', '2015-05-18 07:47:04', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 08:04:04', 'Session expriÃ©e'),
(185, 'jp', '2015-05-18 11:55:53', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 12:05:54', 'Session expriÃ©e'),
(186, 'armel', '2015-05-18 12:00:30', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 12:21:51', 'Session expriÃ©e'),
(187, 'jp', '2015-05-18 12:12:14', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 12:37:03', 'Session expriÃ©e'),
(188, 'armel', '2015-05-18 12:22:36', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 13:17:50', 'Session expriÃ©e'),
(189, 'jp', '2015-05-18 12:49:57', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 13:00:14', 'Session expriÃ©e'),
(190, 'jp', '2015-05-18 13:03:12', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 13:17:07', 'Session expriÃ©e'),
(191, 'armel', '2015-05-18 15:20:47', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 15:58:23', 'Session expriÃ©e'),
(192, 'jp', '2015-05-18 15:44:30', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 16:24:01', 'Session expriÃ©e'),
(193, 'armel', '2015-05-18 15:59:08', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 16:24:06', 'Session expriÃ©e'),
(194, 'jp', '2015-05-18 16:14:48', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(195, 'armel', '2015-05-18 16:24:25', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 16:47:09', 'Session expriÃ©e'),
(196, 'jp', '2015-05-18 16:37:37', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 17:03:54', 'Session expriÃ©e'),
(197, 'armel', '2015-05-18 16:47:57', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 17:08:47', 'Session expriÃ©e'),
(198, 'armel', '2015-05-18 17:11:21', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 18:08:29', 'Session expriÃ©e'),
(199, 'armel', '2015-05-18 18:38:53', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 18:52:22', 'Session expriÃ©e'),
(200, 'armel', '2015-05-18 19:03:06', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(201, 'jp', '2015-05-18 20:01:35', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(202, 'armel', '2015-05-18 20:02:37', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 20:24:40', 'Session expriÃ©e'),
(203, 'armel', '2015-05-18 20:27:59', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 20:38:09', 'Session expriÃ©e'),
(204, 'armel', '2015-05-18 20:41:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 21:07:47', 'Session expriÃ©e'),
(205, 'armel', '2015-05-18 22:06:45', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-18 22:35:32', 'Session expriÃ©e'),
(206, 'armel', '2015-05-18 22:49:24', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-18 23:23:54', 'Session expriÃ©e'),
(207, 'jp', '2015-05-18 23:00:02', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-18 23:21:37', 'Session expriÃ©e'),
(208, 'armel', '2015-05-19 11:50:49', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 11:59:24', 'Session fermÃ©e correctement'),
(209, 'armel', '2015-05-19 11:59:27', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 12:01:49', 'Session fermÃ©e correctement'),
(210, 'armel', '2015-05-19 12:02:13', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 12:33:28', 'Session expriÃ©e'),
(211, 'jp', '2015-05-19 12:08:12', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(212, 'armel', '2015-05-19 12:35:52', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 12:42:18', 'Session fermÃ©e correctement'),
(213, 'armel', '2015-05-19 12:43:45', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 12:53:38', 'Session fermÃ©e correctement'),
(214, 'armel', '2015-05-19 12:53:48', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 12:54:25', 'Session fermÃ©e correctement'),
(215, 'armel', '2015-05-19 12:54:30', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 14:19:53', 'Session expriÃ©e'),
(216, 'armel', '2015-05-19 15:46:06', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 15:55:31', 'Session fermÃ©e correctement'),
(217, 'armel', '2015-05-19 15:55:36', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 16:10:37', 'Session expriÃ©e'),
(218, 'armel', '2015-05-19 16:16:42', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 16:38:40', 'Session expriÃ©e'),
(219, 'jp', '2015-05-19 16:28:50', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-19 16:56:49', 'Session expriÃ©e'),
(220, 'armel', '2015-05-19 16:47:02', 'PET-PC', '127.0.0.1', 'Connexion rÃ©ussie', '2015-05-19 16:57:13', 'Session expriÃ©e'),
(221, 'jp', '2015-05-19 19:45:43', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(222, 'armel', '2015-05-19 19:48:12', 'PET-PC', '127.0.0.1', 'Session en cours', '0000-00-00 00:00:00', ''),
(223, 'jp', '2015-05-20 07:05:46', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 07:37:26', 'Session expriÃ©e'),
(224, 'armel', '2015-05-20 07:39:57', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 07:58:37', 'Session expriÃ©e'),
(225, 'jp', '2015-05-20 07:52:00', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 08:02:15', 'Session expriÃ©e'),
(226, 'jp', '2015-05-20 08:07:48', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 08:18:46', 'Session expriÃ©e'),
(227, 'jp', '2015-05-20 08:32:57', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 09:52:57', 'Session fermÃ©e correctement'),
(228, 'jp', '2015-05-20 09:53:13', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 11:22:28', 'Session expriÃ©e'),
(229, 'armel', '2015-05-20 09:58:56', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-20 13:27:01', 'Session fermÃ©e correctement'),
(230, 'jp', '2015-05-20 12:07:15', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(231, 'armel', '2015-05-20 13:27:41', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(232, 'jp', '2015-05-21 00:04:39', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-21 01:57:39', 'Session expriÃ©e'),
(233, 'armel', '2015-05-21 00:53:26', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-21 01:56:11', 'Session expriÃ©e'),
(234, 'jp', '2015-05-21 08:18:34', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-21 10:49:15', 'Session expriÃ©e'),
(235, 'armel', '2015-05-21 08:33:07', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-21 12:33:31', 'Session expriÃ©e'),
(236, 'jp', '2015-05-21 11:26:51', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(237, 'armel', '2015-05-21 17:58:20', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(238, 'armel', '2015-05-22 15:28:03', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(239, 'jp', '2015-05-22 16:26:52', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-22 18:04:56', 'Session expriÃ©e'),
(240, 'jp', '2015-05-22 16:30:51', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-22 17:57:38', 'Session expriÃ©e'),
(241, 'jp', '2015-05-23 15:45:08', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-23 16:48:47', 'Session expriÃ©e'),
(242, 'jp', '2015-05-23 18:25:56', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-23 19:31:00', 'Session expriÃ©e'),
(243, 'jp', '2015-05-23 21:37:13', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(244, 'armel', '2015-05-23 21:43:25', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-23 23:33:09', 'Session expriÃ©e'),
(245, 'armel', '2015-05-23 23:43:29', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 01:53:00', 'Session expriÃ©e'),
(246, 'armel', '2015-05-24 06:40:48', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 07:49:13', 'Session fermÃ©e correctement'),
(247, 'armel', '2015-05-24 07:49:23', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 09:00:28', 'Session fermÃ©e correctement'),
(248, 'jp', '2015-05-24 08:59:11', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 10:03:50', 'Session expriÃ©e'),
(249, 'armel', '2015-05-24 09:00:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 10:07:43', 'Session expriÃ©e'),
(250, 'armel', '2015-05-24 10:16:38', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 10:24:23', 'Session fermÃ©e correctement'),
(251, 'armel', '2015-05-24 10:28:24', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 14:04:03', 'Session expriÃ©e'),
(252, 'jp', '2015-05-24 10:29:20', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 12:24:48', 'Session expriÃ©e'),
(253, 'armel', '2015-05-24 19:02:27', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 22:21:46', 'Session expriÃ©e'),
(254, 'jp', '2015-05-24 19:03:28', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 23:54:17', 'Session fermÃ©e correctement'),
(255, 'armel', '2015-05-24 22:29:23', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(256, 'armel', '2015-05-24 23:54:26', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-24 23:55:29', 'Session fermÃ©e correctement'),
(257, 'armel', '2015-05-24 23:55:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-25 00:01:07', 'Session fermÃ©e correctement'),
(258, 'armel', '2015-05-25 00:01:09', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-25 00:01:10', 'Session fermÃ©e correctement'),
(259, 'jp', '2015-05-25 00:01:15', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(260, 'jp', '2015-05-25 22:47:15', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `decoupage`
--

CREATE TABLE IF NOT EXISTS `decoupage` (
  `IDDECOUPAGE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(30) NOT NULL,
  PRIMARY KEY (`IDDECOUPAGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `decoupage`
--

INSERT INTO `decoupage` (`IDDECOUPAGE`, `LIBELLE`) VALUES
(1, 'Trimestre'),
(2, 'Semestre');

-- --------------------------------------------------------

--
-- Table structure for table `droits`
--

CREATE TABLE IF NOT EXISTS `droits` (
  `IDDROIT` int(11) NOT NULL AUTO_INCREMENT,
  `CODEDROIT` varchar(10) NOT NULL,
  `LIBELLE` varchar(255) NOT NULL,
  PRIMARY KEY (`IDDROIT`),
  UNIQUE KEY `CODE` (`CODEDROIT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `droits`
--

INSERT INTO `droits` (`IDDROIT`, `CODEDROIT`, `LIBELLE`) VALUES
(1, '101', 'Modifier mon mot de passe'),
(2, '102', 'Modifier mon adresse email'),
(3, '103', 'Mes connexions'),
(4, '104', 'Modifier mon numéro de téléphone'),
(5, '201', 'Etablissement'),
(6, '202', 'Classes'),
(7, '203', 'Personnels'),
(8, '204', 'Elèves'),
(11, '205', 'Conseils de classe'),
(12, '206', 'Répertoire téléphonique'),
(13, '301', 'Appel en salle'),
(14, '302', 'Absences du jour'),
(15, '303', 'Consultation des absences'),
(16, '304', 'Suivi des absences'),
(17, '305', 'Saisie d''une absence'),
(18, '306', 'Justification des absences'),
(19, '307', 'Envoi de SMS'),
(20, '308', 'Suivi des SMS'),
(21, '309', 'Saisie des appréciations'),
(22, '310', 'Passages à l''infirmerie'),
(23, '311', 'Punitions'),
(24, '312', 'Sanctions'),
(25, '313', 'Paramétrage des justifications'),
(26, '314', 'Paramétrage des modèles de SMS'),
(27, '401', 'Saisie des notes'),
(28, '402', 'Récapitulatif des notes'),
(29, '403', 'Bilan bulletins'),
(30, '404', 'Verrouillage des périodes'),
(31, '405', 'Observations du conseil de classe'),
(32, '406', 'Impression des bulletins'),
(33, '501', 'Saisie établissement'),
(34, '502', 'Saisie du personnel'),
(35, '503', 'Saisie des élèves'),
(36, '504', 'Saisie des matières'),
(37, '505', 'Saisie des classes'),
(38, '506', 'Saisie des emplois du temps'),
(39, '601', 'Options générales'),
(40, '602', 'Tous les mots de passe'),
(41, '603', 'Gestion des utilisateurs'),
(43, '605', 'Calendrier scolaire'),
(44, '701', 'Sauvegarder la base de données'),
(45, '702', 'Restaurer la base de données'),
(46, '801', 'Récupération du personnel'),
(47, '802', 'Récupération des élèves'),
(48, '803', 'Récupération des classes'),
(49, '105', 'Déconnexion'),
(50, '507', 'Suppression du personnel'),
(51, '207', 'Enseignants'),
(52, '315', 'Saisie d''une punition');

-- --------------------------------------------------------

--
-- Table structure for table `eleves`
--

CREATE TABLE IF NOT EXISTS `eleves` (
  `IDELEVE` int(11) NOT NULL AUTO_INCREMENT,
  `MATRICULE` varchar(15) NOT NULL,
  `NOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `PRENOM` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `AUTRENOM` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `SEXE` varchar(15) CHARACTER SET latin1 NOT NULL,
  `PHOTO` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `CNI` varchar(15) DEFAULT NULL,
  `NATIONALITE` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `DATENAISS` date NOT NULL,
  `PAYSNAISS` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `LIEUNAISS` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `DATEENTREE` date NOT NULL,
  `PROVENANCE` int(11) DEFAULT NULL,
  `REDOUBLANT` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = non redoublant, 1 = redoublant',
  `DATESORTIE` date DEFAULT NULL,
  `MOTIFSORTIE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDELEVE`),
  KEY `NATIONALITE` (`NATIONALITE`),
  KEY `LIEUNAISS` (`PAYSNAISS`),
  KEY `PROVENANCE` (`PROVENANCE`),
  KEY `MOTIFSORTIE` (`MOTIFSORTIE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `eleves`
--

INSERT INTO `eleves` (`IDELEVE`, `MATRICULE`, `NOM`, `PRENOM`, `AUTRENOM`, `SEXE`, `PHOTO`, `CNI`, `NATIONALITE`, `DATENAISS`, `PAYSNAISS`, `LIEUNAISS`, `DATEENTREE`, `PROVENANCE`, `REDOUBLANT`, `DATESORTIE`, `MOTIFSORTIE`) VALUES
(1, '27eleve', 'wgreg', 'werge', 'gegre', 'F', 'http://localhost/locan/photos/eleves/elab_logo.png', NULL, 'Cameroun', '0000-00-00', 'Cameroun', 'ergerg', '0000-00-00', 1, 0, '0000-00-00', 2),
(2, '39eleve', 'egrt', 'etgrtgr', '', 'M', '', NULL, 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, '0000-00-00', 1),
(3, '54eleve', 'dnhr', 'tyjrtjr', '', 'M', 'http://localhost/locan/photos/eleves/WIN_20150309_163112.JPG', NULL, 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, '0000-00-00', 1),
(4, '62eleve', 'grege', 'wergerg', '', 'M', '', NULL, 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', NULL, 0, '0000-00-00', 1),
(5, 'EL001', 'ELNOM1', 'Elprenom1', NULL, 'Masculin', NULL, NULL, NULL, '2015-04-07', NULL, NULL, '2015-04-14', NULL, 0, NULL, NULL),
(6, 'EL002', 'ELNOM2', 'Elprenom2', NULL, 'Feminin', NULL, NULL, NULL, '2015-04-06', NULL, NULL, '2015-04-28', NULL, 0, '2015-04-08', NULL),
(20, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(21, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(22, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(23, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(24, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(25, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(26, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(27, '', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(28, '', 'gege', 'seher', 'oihioin', 'M', '031014_1754_Connectinga20.png', 'uog8g', 'Cameroun', '2015-05-06', 'Cameroun', '', '2015-05-20', 1, 0, NULL, NULL),
(29, '', 'gege', 'seher', 'oihioin', 'M', '031014_1754_Connectinga20.png', 'uog8g', 'Cameroun', '2015-05-06', 'Cameroun', '', '2015-05-20', 1, 0, NULL, NULL),
(30, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(31, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(32, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(33, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(34, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(35, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(36, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(37, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(38, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(39, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(40, '', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enseignants`
--

CREATE TABLE IF NOT EXISTS `enseignants` (
  `IDENSEIGNANT` varchar(15) NOT NULL,
  `NOM` varchar(30) NOT NULL,
  `PRENOM` varchar(30) NOT NULL,
  `AUTRENOM` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDENSEIGNANT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `etablissements`
--

CREATE TABLE IF NOT EXISTS `etablissements` (
  `IDETABLISSEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `ETABLISSEMENT` varchar(150) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`IDETABLISSEMENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `etablissements`
--

INSERT INTO `etablissements` (`IDETABLISSEMENT`, `ETABLISSEMENT`) VALUES
(1, 'Collège Adventiste de Yaoundé'),
(2, 'Lycée Leclerc'),
(3, 'Lycee Provenance');

-- --------------------------------------------------------

--
-- Table structure for table `fonctions`
--

CREATE TABLE IF NOT EXISTS `fonctions` (
  `IDFONCTION` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`IDFONCTION`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fonctions`
--

INSERT INTO `fonctions` (`IDFONCTION`, `LIBELLE`) VALUES
(1, 'Enseignant'),
(2, 'Assistant éducation'),
(3, 'Direction'),
(4, 'Consultant');

-- --------------------------------------------------------

--
-- Table structure for table `groupemenus`
--

CREATE TABLE IF NOT EXISTS `groupemenus` (
  `IDGROUPE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(250) NOT NULL,
  `ICON` varchar(150) NOT NULL,
  `ALT` varchar(50) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDGROUPE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `groupemenus`
--

INSERT INTO `groupemenus` (`IDGROUPE`, `LIBELLE`, `ICON`, `ALT`, `TITLE`) VALUES
(1, 'Mon Compte', 'compte.png', NULL, NULL),
(2, 'Informations internes', 'infointerne.png', NULL, NULL),
(3, 'Vie scolaire', 'viescolaire.png', NULL, NULL),
(4, 'Notes et bulletins', 'bulletin.png', NULL, NULL),
(5, 'Gestion des données', 'gestiondonnees.png', NULL, NULL),
(6, 'Paramètres', 'parametre.png', NULL, NULL),
(7, 'Sauvegarde', 'sauvegarde.png', NULL, NULL),
(8, 'Année précédente', 'anneeprecende.png', NULL, NULL),
(9, 'Imports/Exports', 'compte.png', NULL, NULL),
(10, 'Tableau d''affichage', 'compte.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locan`
--

CREATE TABLE IF NOT EXISTS `locan` (
  `ID` varchar(15) NOT NULL,
  `NOM` varchar(150) NOT NULL,
  `RESPONSABLE` varchar(150) NOT NULL,
  `ADRESSE` varchar(150) NOT NULL,
  `BP` varchar(10) DEFAULT NULL,
  `TELEPHONE` varchar(30) NOT NULL,
  `TELEPHONE2` varchar(30) NOT NULL,
  `MOBILE` varchar(30) NOT NULL,
  `FAX` varchar(30) CHARACTER SET ucs2 DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `SITEWEB` varchar(30) DEFAULT NULL,
  `LOGO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locan`
--

INSERT INTO `locan` (`ID`, `NOM`, `RESPONSABLE`, `ADRESSE`, `BP`, `TELEPHONE`, `TELEPHONE2`, `MOBILE`, `FAX`, `EMAIL`, `SITEWEB`, `LOGO`) VALUES
('IPW', 'Institut Polyvalent WAGUE', 'Mme WACGUE', 'Route vers SOA', NULL, '+237654258182', '+237958652142', '+237584961536', NULL, 'institutwague@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matieres`
--

CREATE TABLE IF NOT EXISTS `matieres` (
  `CODE` varchar(15) NOT NULL,
  `LIBELLE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matieres`
--

INSERT INTO `matieres` (`CODE`, `LIBELLE`) VALUES
('ATEPTS', 'Atelier d''éducation physique et sportive'),
('ATEXA', 'Atelier d''expression artistique'),
('CPTTA', 'Comptabilité'),
('jrtyj', 'Atelier d''éducation physique et sportive'),
('rethrtyh', 'Atelier d''éducation physique et sportive'),
('thrt', 'Atelier d''éducation physique et sportive'),
('vwerge', 'gwerge'),
('rther', 'hwrthre'),
('erber', 'werge'),
('geqr', 'erger'),
('gwerge', 'berherhtre'),
('hwerher', 'vefert'),
('herthert', 'erthret'),
('ernr', 'erhre'),
('gerg', 'werger'),
('gqwegwq', 'gwerger'),
('rthre', 'rthret'),
('math', 'mathÃ©matique'),
('ntjty', 'rtrjht'),
('transformation', 'transforme'),
('rthrthrt', 'ukykt');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `IDMENUS` int(11) NOT NULL AUTO_INCREMENT,
  `IDGROUPE` int(11) NOT NULL,
  `LIBELLE` varchar(100) NOT NULL,
  `HREF` varchar(250) NOT NULL,
  `ICON` varchar(250) NOT NULL,
  `CODEDROIT` varchar(10) NOT NULL,
  `ALT` varchar(50) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDMENUS`),
  KEY `CODEDROIT` (`CODEDROIT`),
  KEY `IDGROUPE` (`IDGROUPE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`IDMENUS`, `IDGROUPE`, `LIBELLE`, `HREF`, `ICON`, `CODEDROIT`, `ALT`, `TITLE`) VALUES
(1, 1, 'Mon mot de passe', 'user/mdp', 'mdp.png', '101', NULL, NULL),
(2, 1, 'Mon email', 'user/email', 'email.png', '102', NULL, NULL),
(3, 1, 'Mes connexions', 'user/connexion', 'connexion.png', '103', NULL, NULL),
(4, 1, 'Mon téléphone', 'user/telephone', 'telephone.png', '104', NULL, NULL),
(5, 2, 'Etablissement', 'etablissement', 'etablissement.png', '201', NULL, NULL),
(6, 2, 'Classes', 'classe', 'classe.png', '202', NULL, NULL),
(7, 2, 'Personnels', 'personnel', 'personnel.png', '203', NULL, NULL),
(8, 2, 'Elèves', 'eleve', 'eleve.png', '204', NULL, NULL),
(9, 2, 'Conseils de classe', 'conseil', 'conseil.png', '205', NULL, NULL),
(10, 2, 'Repertoire', 'repertoire', 'repertoire.png', '206', NULL, NULL),
(11, 5, 'Saisie établissement', 'etablissement/saisie', 'etablissement.png', '501', NULL, NULL),
(12, 5, 'Saisie personnel', 'personnel/saisie', 'personnel.png', '502', NULL, NULL),
(13, 5, 'Saisie élèves', 'eleve/saisie', 'addeleve.png', '503', NULL, NULL),
(14, 5, 'Saisie matiere', 'matiere/saisie', 'addmatiere.png', '504', NULL, NULL),
(15, 5, 'Saisie classes', 'classe/saisie', 'addclasse.png', '505', NULL, NULL),
(16, 5, 'Emplois du temps', 'emplois/saisie', 'emplois.png', '506', NULL, NULL),
(17, 6, 'Gestion utilisateurs', 'user', 'utilisateur.png', '603', NULL, NULL),
(18, 3, 'Appel en salle', 'salle/appel', 'appel.png', '301', NULL, NULL),
(19, 1, 'Déconnexion', 'connexion/disconnect', 'disconnect.png', '105', NULL, NULL),
(20, 4, 'Saisie notes', 'note/saisie', 'addnote.png', '401', NULL, NULL),
(21, 4, 'Récapitulatif', 'note/recapitulatif', 'recapitulatif.png', '402', NULL, NULL),
(22, 4, 'Bilans bulletins', 'note/bilan', 'bilan.png', '403', NULL, NULL),
(23, 2, 'Enseignants', 'enseignant', 'enseignant.png', '207', NULL, 'Gestion des enseignants'),
(24, 3, 'Absences du jour', 'salle/absence', 'absence.png', '302', NULL, NULL),
(25, 3, 'Consultation des absences', 'salle/consultation', 'consultation.png', '303', NULL, NULL),
(26, 3, 'Suivi des absences', 'absence/suivi', 'suivi.png', '304', NULL, NULL),
(27, 3, 'Saisie d''une absence', 'absence/saisie', 'absence.png', '305', NULL, NULL),
(28, 3, 'Justification des absences', 'absence/justification', 'justification.png', '306', NULL, NULL),
(29, 3, 'Envoi de SMS', 'sms/envoi', 'envoi.png', '307', NULL, NULL),
(30, 3, 'Suivi des SMS', 'sms/suivi', 'suivi.png', '308', NULL, NULL),
(31, 3, 'Saisie des appréciations', 'salle/appreciation', 'appreciation.png', '309', NULL, NULL),
(32, 3, 'Passages à l''infirmerie', 'infirmerie/passage', 'passage.png', '310', NULL, NULL),
(33, 3, 'Punitions', 'punition', 'punition.png', '311', NULL, NULL),
(34, 3, 'Sanctions', 'salle/sanction', 'sanction.png', '312', NULL, NULL),
(35, 3, 'Paramétrage des justification', 'absence/parametrage', 'parametrage.png', '313', NULL, NULL),
(36, 6, 'Options générales', 'parametres/options', 'option.png', '601', NULL, NULL),
(37, 6, 'Tous les mots de passe', 'parametres/mdp', 'mdp.png', '602', NULL, NULL),
(39, 6, 'Calendrier scolaire', 'etablissement/calendrier', 'calendrier.png', '605', NULL, NULL),
(40, 3, 'Saisie d''une punition', 'punition/saisie', 'punition.png', '315', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `motifsortie`
--

CREATE TABLE IF NOT EXISTS `motifsortie` (
  `IDMOTIF` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(150) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`IDMOTIF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `motifsortie`
--

INSERT INTO `motifsortie` (`IDMOTIF`, `LIBELLE`, `DESCRIPTION`) VALUES
(1, 'Départ pour l''étranger', NULL),
(2, 'Décès', NULL),
(3, 'Exclusion', NULL),
(4, 'Aucune précision', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parente`
--

CREATE TABLE IF NOT EXISTS `parente` (
  `LIBELLE` varchar(15) NOT NULL,
  PRIMARY KEY (`LIBELLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parente`
--

INSERT INTO `parente` (`LIBELLE`) VALUES
('COUSINE'),
('FRERE'),
('MERE'),
('NIECE'),
('PERE'),
('SOEUR');

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `PAYS` varchar(30) NOT NULL,
  PRIMARY KEY (`PAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`PAYS`) VALUES
('Cameroun'),
('Guinée Equ.'),
('Nigeria'),
('Tchad');

-- --------------------------------------------------------

--
-- Table structure for table `personnels`
--

CREATE TABLE IF NOT EXISTS `personnels` (
  `IDPERSONNEL` varchar(15) CHARACTER SET latin1 NOT NULL,
  `IDUSER` int(11) DEFAULT NULL,
  `CIVILITE` varchar(10) DEFAULT NULL,
  `NOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `PRENOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `AUTRENOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `FONCTION` int(11) DEFAULT NULL,
  `GRADE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `DATENAISS` date DEFAULT NULL,
  `PORTABLE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `TELEPHONE` varchar(15) CHARACTER SET latin1 NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDPERSONNEL`),
  KEY `CIVILITE` (`CIVILITE`),
  KEY `LOGIN` (`IDUSER`),
  KEY `FONCTION` (`FONCTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personnels`
--

INSERT INTO `personnels` (`IDPERSONNEL`, `IDUSER`, `CIVILITE`, `NOM`, `PRENOM`, `AUTRENOM`, `FONCTION`, `GRADE`, `DATENAISS`, `PORTABLE`, `TELEPHONE`, `EMAIL`) VALUES
('ADMIN', 1, 'Mr', 'Bruno', 'Bruno', '', 4, NULL, NULL, '652847527', '65847224', 'fort'),
('ADMIN2', 4, 'Mr', 'Ainam', 'Jean-paul', '', 3, NULL, '2015-05-05', NULL, '235', 'erberre'),
('ASSIST01', 5, 'Mlle', 'Estelle', 'Estelle', '', 1, NULL, NULL, NULL, '', NULL),
('dtfty416', 6, 'Dr', 'dtfty', 'fhtmfgh', 'FGM', 1, 'fm', '0000-00-00', 'fhjm', 'hfjm', NULL),
('PERSO01', 2, 'Mr', 'Nom1', 'Prenom2', '', 1, NULL, NULL, NULL, '+237652289165', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `IDPROFILE` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE` varchar(100) CHARACTER SET utf8 NOT NULL,
  `LISTEDROIT` text,
  PRIMARY KEY (`IDPROFILE`),
  KEY `PROFILE` (`PROFILE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`IDPROFILE`, `PROFILE`, `LISTEDROIT`) VALUES
(1, 'Administrateur', NULL),
(2, 'Assistant de bureau', NULL),
(3, 'Enseignant', NULL),
(4, 'Infirmerie', NULL),
(5, 'Responsable', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `responsables`
--

CREATE TABLE IF NOT EXISTS `responsables` (
  `IDRESPONSABLE` int(11) NOT NULL AUTO_INCREMENT,
  `CIVILITE` varchar(15) DEFAULT NULL,
  `NOM` varchar(30) NOT NULL,
  `PRENOM` varchar(30) NOT NULL,
  `ADRESSE` varchar(150) NOT NULL,
  `BP` varchar(8) DEFAULT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `PORTABLE` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(75) DEFAULT NULL,
  `PROFESSION` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`IDRESPONSABLE`),
  KEY `CIVILITE` (`CIVILITE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `responsables`
--

INSERT INTO `responsables` (`IDRESPONSABLE`, `CIVILITE`, `NOM`, `PRENOM`, `ADRESSE`, `BP`, `TELEPHONE`, `PORTABLE`, `EMAIL`, `PROFESSION`) VALUES
(25, 'Dr', 'lbobn', 'blknn', '##', '', '', 'kbb', '', ';knln'),
(26, 'Dr', 'bibinno', 'jbb', 'ohhoi#lnoi#', '235', 'nlnk', 'ino', '', ''),
(27, 'Dr', 'lbobn', 'blknn', '##', '', '', 'kbb', '', ';knln'),
(28, 'Dr', 'bibinno', 'jbb', 'ohhoi#lnoi#', '235', 'nlnk', 'ino', '', ''),
(29, 'Dr', 'lbobn', 'blknn', '##', '', '', 'kbb', '', ';knln'),
(30, 'Dr', 'bibinno', 'jbb', 'ohhoi#lnoi#', '235', 'nlnk', 'ino', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `responsable_charge`
--

CREATE TABLE IF NOT EXISTS `responsable_charge` (
  `IDRESPONSABLEELEVE` int(11) NOT NULL,
  `IDCHARGE` varchar(15) NOT NULL,
  PRIMARY KEY (`IDRESPONSABLEELEVE`,`IDCHARGE`),
  KEY `IDCHARGE` (`IDCHARGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `responsable_charge`
--

INSERT INTO `responsable_charge` (`IDRESPONSABLEELEVE`, `IDCHARGE`) VALUES
(9, 'Accident'),
(10, 'Accident'),
(11, 'Accident'),
(12, 'Accident'),
(13, 'Accident'),
(14, 'Accident'),
(9, 'Contact'),
(11, 'Contact'),
(13, 'Contact');

-- --------------------------------------------------------

--
-- Table structure for table `responsable_eleve`
--

CREATE TABLE IF NOT EXISTS `responsable_eleve` (
  `IDRESPONSABLEELEVE` int(11) NOT NULL AUTO_INCREMENT,
  `IDRESPONSABLE` int(11) NOT NULL,
  `IDELEVE` int(11) NOT NULL,
  `PARENTE` varchar(15) DEFAULT NULL,
  `ACCEPTESMS` bit(1) DEFAULT NULL COMMENT '1 = recois sms, 0 = ne recois pas',
  `NUMSMS` varchar(15) DEFAULT NULL COMMENT 'Num sur lequel il recois le sms',
  PRIMARY KEY (`IDRESPONSABLEELEVE`),
  KEY `PARENTE` (`PARENTE`),
  KEY `IDRESPONSABLE` (`IDRESPONSABLE`,`IDELEVE`),
  KEY `IDELEVE` (`IDELEVE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `responsable_eleve`
--

INSERT INTO `responsable_eleve` (`IDRESPONSABLEELEVE`, `IDRESPONSABLE`, `IDELEVE`, `PARENTE`, `ACCEPTESMS`, `NUMSMS`) VALUES
(9, 25, 38, 'COUSINE', b'1', 'kubiub'),
(10, 26, 38, 'COUSINE', b'1', 'iononoi'),
(11, 27, 39, 'COUSINE', b'1', 'kubiub'),
(12, 28, 39, 'COUSINE', b'1', 'iononoi'),
(13, 29, 40, 'COUSINE', b'1', 'kubiub'),
(14, 30, 40, 'COUSINE', b'1', 'iononoi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `IDUSER` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(80) CHARACTER SET utf8 NOT NULL,
  `PASSWORD` text CHARACTER SET utf8 NOT NULL,
  `PROFILE` int(11) DEFAULT NULL,
  `DROITSPECIFIQUE` text CHARACTER SET utf8,
  `ACTIF` int(11) NOT NULL DEFAULT '1' COMMENT 'Actif = 1 et 0 = Non actif (cad bloquee)',
  PRIMARY KEY (`IDUSER`),
  UNIQUE KEY `LOGIN` (`LOGIN`),
  KEY `PROFILE` (`PROFILE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`IDUSER`, `LOGIN`, `PASSWORD`, `PROFILE`, `DROITSPECIFIQUE`, `ACTIF`) VALUES
(1, 'armel', '069a6a9ccaaca7967a0c43cb5e161187', 1, '["104","105","201","202","203","204","205","206","207","305","401","402","403","404","405","406","501","502","503","504","505","602","603","605"]', 1),
(2, 'bruno', 'md5(''bruno'')', 1, '["101","102","103","104","105","201","202","203","204","205","206","207","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","401","402","403","404","405","406","501","502","503","504","505","506","507","601","602","603","604","605","701","702","801","802","803"]', 1),
(3, 'estelle', 'md5(''estelle'')', 2, NULL, 1),
(4, 'jp', '55add3d845bfcd87a9b0949b0da49c0a', 1, '["101","102","103","104","105","201","202","203","204","205","206","207","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","401","402","403","404","405","406","501","502","503","504","505","506","507","601","602","603","604","605","701","702","801","802","803"]', 1),
(5, 'nom1', 'md5(''nom1'')', 2, NULL, 1),
(6, 'nom2', 'md5(''nom2'')', 4, '["101","102","103","104","105","201","202","203","204","205","206","207","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","401","402","403","404","405","406","501","502","503","504","505","506","507","601","602","603","604","605","701","702","801","802","803"]', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`DECOUPAGE`) REFERENCES `decoupage` (`IDDECOUPAGE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`ANNEEACADEMIQUE`) REFERENCES `anneeacademique` (`anneeacademique`) ON UPDATE CASCADE;

--
-- Constraints for table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`NATIONALITE`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_2` FOREIGN KEY (`PAYSNAISS`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_4` FOREIGN KEY (`MOTIFSORTIE`) REFERENCES `motifsortie` (`IDMOTIF`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_5` FOREIGN KEY (`PROVENANCE`) REFERENCES `etablissements` (`IDETABLISSEMENT`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`CODEDROIT`) REFERENCES `droits` (`CODEDROIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`IDGROUPE`) REFERENCES `groupemenus` (`IDGROUPE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personnels`
--
ALTER TABLE `personnels`
  ADD CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`CIVILITE`) REFERENCES `civilite` (`CIVILITE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `personnels_ibfk_3` FOREIGN KEY (`FONCTION`) REFERENCES `fonctions` (`IDFONCTION`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `personnels_ibfk_4` FOREIGN KEY (`IDUSER`) REFERENCES `users` (`IDUSER`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_ibfk_1` FOREIGN KEY (`CIVILITE`) REFERENCES `civilite` (`CIVILITE`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `responsable_charge`
--
ALTER TABLE `responsable_charge`
  ADD CONSTRAINT `responsable_charge_ibfk_1` FOREIGN KEY (`IDRESPONSABLEELEVE`) REFERENCES `responsable_eleve` (`IDRESPONSABLEELEVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsable_charge_ibfk_2` FOREIGN KEY (`IDCHARGE`) REFERENCES `charge` (`IDCHARGE`);

--
-- Constraints for table `responsable_eleve`
--
ALTER TABLE `responsable_eleve`
  ADD CONSTRAINT `responsable_eleve_ibfk_1` FOREIGN KEY (`IDRESPONSABLE`) REFERENCES `responsables` (`IDRESPONSABLE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsable_eleve_ibfk_2` FOREIGN KEY (`IDELEVE`) REFERENCES `eleves` (`IDELEVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsable_eleve_ibfk_3` FOREIGN KEY (`PARENTE`) REFERENCES `parente` (`LIBELLE`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`PROFILE`) REFERENCES `profile` (`IDPROFILE`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
