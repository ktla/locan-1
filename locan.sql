-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 02 Juin 2015 à 16:34
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `locan`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneeacademique`
--

CREATE TABLE IF NOT EXISTS `anneeacademique` (
  `anneeacademique` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`anneeacademique`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `anneeacademique`
--

INSERT INTO `anneeacademique` (`anneeacademique`) VALUES
('2014-2015'),
('2015-2016');

-- --------------------------------------------------------

--
-- Structure de la table `charge`
--

CREATE TABLE IF NOT EXISTS `charge` (
  `IDCHARGE` varchar(15) NOT NULL,
  `LIBELLE` varchar(150) NOT NULL,
  PRIMARY KEY (`IDCHARGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `charge`
--

INSERT INTO `charge` (`IDCHARGE`, `LIBELLE`) VALUES
('Accident', 'Resp. à prévénir en cas d''accident'),
('Contact', 'Resp. contact'),
('Financier', 'Resp. financier');

-- --------------------------------------------------------

--
-- Structure de la table `civilite`
--

CREATE TABLE IF NOT EXISTS `civilite` (
  `CIVILITE` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`CIVILITE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `civilite`
--

INSERT INTO `civilite` (`CIVILITE`) VALUES
('Dr'),
('Mlle'),
('Mme'),
('Mr');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `IDCLASSE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(150) NOT NULL,
  `DECOUPAGE` int(11) DEFAULT NULL,
  `NIVEAU` int(11) DEFAULT NULL,
  `ANNEEACADEMIQUE` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`IDCLASSE`),
  KEY `DECOUPAGE` (`DECOUPAGE`),
  KEY `NIVEAU` (`NIVEAU`),
  KEY `classes_ibfk_2` (`ANNEEACADEMIQUE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Contenu de la table `classes`
--

INSERT INTO `classes` (`IDCLASSE`, `LIBELLE`, `DECOUPAGE`, `NIVEAU`, `ANNEEACADEMIQUE`) VALUES
(11, 'vevweve', 1, 5, '2014-2015'),
(22, 'cinquieme', 1, 6, '2014-2015'),
(23, 'ewrewrber', 1, 6, '2014-2015'),
(24, 'wervwerv', 1, 6, '2014-2015'),
(25, 'gwergwerg', 1, 6, '2014-2015'),
(26, 'fwfwe', 1, 6, '2014-2015'),
(27, 'weherh', 1, 6, '2014-2015'),
(30, 'grwergegehe', 1, 6, '2014-2015'),
(31, 'Sixieme', 1, 6, '2014-2015'),
(32, 'erherrt', 1, 6, '2014-2015'),
(36, 'rehrhrhr', 1, 6, '2014-2015'),
(42, 'erbwerewr', 1, 6, '2014-2015'),
(51, 'rbtrbrtb', 1, 6, '2014-2015'),
(52, 'bbtbtb', 1, 6, '2014-2015');

-- --------------------------------------------------------

--
-- Structure de la table `classes_parametres`
--

CREATE TABLE IF NOT EXISTS `classes_parametres` (
  `IDPARAMETRE` int(11) NOT NULL AUTO_INCREMENT,
  `IDCLASSE` int(11) DEFAULT NULL,
  `PROFPRINCIPALE` int(11) DEFAULT NULL,
  `CPEPRINCIPALE` int(11) DEFAULT NULL,
  `RESPADMINISTRATIF` int(11) DEFAULT NULL,
  `ANNEEACADEMIQUE` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IDPARAMETRE`),
  UNIQUE KEY `IDCLASSE_2` (`IDCLASSE`,`PROFPRINCIPALE`,`CPEPRINCIPALE`,`RESPADMINISTRATIF`,`ANNEEACADEMIQUE`),
  KEY `IDCLASSE` (`IDCLASSE`,`PROFPRINCIPALE`,`CPEPRINCIPALE`,`RESPADMINISTRATIF`,`ANNEEACADEMIQUE`),
  KEY `PROFPRINCIPALE` (`PROFPRINCIPALE`),
  KEY `CPEPRINCIPALE` (`CPEPRINCIPALE`),
  KEY `RESPADMINISTRATIF` (`RESPADMINISTRATIF`),
  KEY `ANNEEACADEMIQUE` (`ANNEEACADEMIQUE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Contenu de la table `classes_parametres`
--

INSERT INTO `classes_parametres` (`IDPARAMETRE`, `IDCLASSE`, `PROFPRINCIPALE`, `CPEPRINCIPALE`, `RESPADMINISTRATIF`, `ANNEEACADEMIQUE`) VALUES
(7, 11, 3, NULL, NULL, '2014-2015'),
(18, 22, 6, NULL, NULL, '2014-2015'),
(19, 23, NULL, NULL, NULL, '2014-2015'),
(20, 24, NULL, NULL, NULL, '2014-2015'),
(21, 25, NULL, NULL, NULL, '2014-2015'),
(22, 26, NULL, NULL, NULL, '2014-2015'),
(23, 27, NULL, NULL, NULL, '2014-2015'),
(26, 30, NULL, NULL, 5, '2014-2015'),
(27, 31, 2, 53, 5, '2014-2015'),
(28, 32, NULL, NULL, NULL, '2014-2015'),
(32, 36, NULL, NULL, NULL, '2014-2015'),
(38, 42, NULL, NULL, NULL, '2014-2015'),
(47, 51, NULL, NULL, NULL, '2014-2015'),
(48, 52, NULL, NULL, NULL, '2014-2015');

-- --------------------------------------------------------

--
-- Structure de la table `connexions`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=295 ;

--
-- Contenu de la table `connexions`
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
(260, 'jp', '2015-05-25 22:47:15', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(261, 'armel', '2015-05-26 00:53:36', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-26 01:03:43', 'Session fermÃ©e correctement'),
(262, 'jp', '2015-05-26 01:03:51', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-26 04:19:42', 'Session expriÃ©e'),
(263, 'armel', '2015-05-26 06:54:41', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(264, 'jp', '2015-05-26 09:39:58', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-26 10:44:28', 'Session expriÃ©e'),
(265, 'jp', '2015-05-26 11:41:54', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-26 12:42:03', 'Session expriÃ©e'),
(266, 'jp', '2015-05-26 16:32:22', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-26 17:32:35', 'Session expriÃ©e'),
(267, 'jp', '2015-05-26 20:10:13', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(268, 'jp', '2015-05-26 22:43:07', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-26 23:57:18', 'Session expriÃ©e'),
(269, 'armel', '2015-05-26 22:57:40', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-27 00:00:25', 'Session expriÃ©e'),
(270, 'armel', '2015-05-27 10:44:48', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-27 11:28:34', 'Session fermÃ©e correctement'),
(271, 'armel', '2015-05-27 11:28:41', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-27 12:45:20', 'Session expriÃ©e'),
(272, 'jp', '2015-05-28 15:02:57', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(273, 'armel', '2015-05-28 15:25:27', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(274, 'armel', '2015-05-28 15:55:37', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-28 18:57:46', 'Session expriÃ©e'),
(275, 'armel', '2015-05-28 19:42:12', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(276, 'armel', '2015-05-29 21:04:05', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(277, 'jp', '2015-05-31 06:57:06', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-31 09:50:12', 'Session expriÃ©e'),
(278, 'armel', '2015-05-31 08:42:51', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-31 09:42:51', 'Session expriÃ©e'),
(279, 'jp', '2015-05-31 10:14:07', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(280, 'armel', '2015-05-31 10:27:35', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(281, 'armel', '2015-05-31 12:46:26', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-31 16:05:46', 'Session expriÃ©e'),
(282, 'jp', '2015-05-31 14:49:45', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(283, 'armel', '2015-05-31 17:49:40', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(284, 'armel', '2015-05-31 19:19:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-31 20:23:19', 'Session expriÃ©e'),
(285, 'armel', '2015-05-31 20:41:11', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-06-01 00:27:31', 'Session fermÃ©e correctement'),
(286, 'jp', '2015-05-31 20:49:21', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(287, 'armel', '2015-06-01 08:22:03', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-06-01 09:57:05', 'Session expriÃ©e'),
(288, 'armel', '2015-06-01 10:14:13', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-06-01 12:19:59', 'Session expriÃ©e'),
(289, 'armel', '2015-06-01 13:52:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-06-01 15:40:32', 'Session expriÃ©e'),
(290, 'armel', '2015-06-01 15:48:07', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-06-01 19:28:33', 'Session expriÃ©e'),
(291, 'armel', '2015-06-01 19:36:48', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(292, 'armel', '2015-06-02 11:05:39', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-06-02 14:09:37', 'Session expriÃ©e'),
(293, 'armel', '2015-06-02 14:13:26', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(294, 'armel', '2015-06-02 15:03:48', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Structure de la table `decoupage`
--

CREATE TABLE IF NOT EXISTS `decoupage` (
  `IDDECOUPAGE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(30) NOT NULL,
  PRIMARY KEY (`IDDECOUPAGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `decoupage`
--

INSERT INTO `decoupage` (`IDDECOUPAGE`, `LIBELLE`) VALUES
(1, 'Séquence'),
(2, 'Trimestre'),
(3, 'Semestre');

-- --------------------------------------------------------

--
-- Structure de la table `droits`
--

CREATE TABLE IF NOT EXISTS `droits` (
  `IDDROIT` int(11) NOT NULL AUTO_INCREMENT,
  `CODEDROIT` varchar(10) NOT NULL,
  `LIBELLE` varchar(255) NOT NULL,
  PRIMARY KEY (`IDDROIT`),
  UNIQUE KEY `CODE` (`CODEDROIT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Contenu de la table `droits`
--

INSERT INTO `droits` (`IDDROIT`, `CODEDROIT`, `LIBELLE`) VALUES
(1, '101', 'Modifier mon mot de passe'),
(2, '102', 'Modifier mon adresse email'),
(3, '103', 'Mes connexions'),
(4, '104', 'Modifier mon numéro de téléphone'),
(5, '201', 'Consulter les informations sur l''etablissement'),
(6, '202', 'Consulter les informations sur les classes'),
(7, '203', 'Consulter les informations sur le personnels'),
(8, '204', 'Consulter les informations sur les élèves'),
(11, '205', 'Afficher les clauses des conseils de classe'),
(12, '206', 'Consulter le répertoire téléphonique de l''établissement et du personnels'),
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
(51, '207', 'Consulter les informations sur les enseignants'),
(52, '315', 'Saisie d''une punition'),
(53, '407', 'Modification des notes'),
(54, '408', 'Verrouillage et Déverrouillage des notes'),
(56, '508', 'Saisie des scolarités'),
(57, '208', 'Consulter la scolarités de chaque classes');

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`IDELEVE`, `MATRICULE`, `NOM`, `PRENOM`, `AUTRENOM`, `SEXE`, `PHOTO`, `CNI`, `NATIONALITE`, `DATENAISS`, `PAYSNAISS`, `LIEUNAISS`, `DATEENTREE`, `PROVENANCE`, `REDOUBLANT`, `DATESORTIE`, `MOTIFSORTIE`) VALUES
(1, '155001', 'wgreg', 'werge', 'gegre', 'F', 'http://localhost/locan/photos/eleves/elab_logo.png', NULL, 'Cameroun', '0000-00-00', 'Cameroun', 'ergerg', '0000-00-00', 1, 0, '0000-00-00', 2),
(2, '155002', 'egrt', 'etgrtgr', '', 'M', '', NULL, 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, '0000-00-00', 1),
(3, '54eleve', 'dnhr', 'tyjrtjr', '', 'M', 'http://localhost/locan/photos/eleves/WIN_20150309_163112.JPG', NULL, 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, '0000-00-00', 1),
(4, '62eleve', 'grege', 'wergerg', '', 'M', '', NULL, 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', NULL, 0, '0000-00-00', 1),
(5, 'EL001', 'ELNOM1', 'Elprenom1', NULL, 'Masculin', NULL, NULL, NULL, '2015-04-07', NULL, NULL, '2015-04-14', NULL, 0, NULL, NULL),
(6, 'EL002', 'ELNOM2', 'Elprenom2', NULL, 'Feminin', NULL, NULL, NULL, '2015-04-06', NULL, NULL, '2015-04-28', NULL, 0, '2015-04-08', NULL),
(20, '156002', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(21, '156001', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(22, '156001', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(23, '156002', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(24, '156003', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(25, '156001', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(26, '156002', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(27, '156001', 'ycytcy', 'vvuvu', 'tcvuv', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-06', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(28, '156003', 'gege', 'seher', 'oihioin', 'M', '031014_1754_Connectinga20.png', 'uog8g', 'Cameroun', '2015-05-06', 'Cameroun', '', '2015-05-20', 1, 0, NULL, NULL),
(29, '156004', 'gege', 'seher', 'oihioin', 'M', '031014_1754_Connectinga20.png', 'uog8g', 'Cameroun', '2015-05-06', 'Cameroun', '', '2015-05-20', 1, 0, NULL, NULL),
(30, '156002', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(31, '156005', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(32, '156001', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(33, '156003', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(34, '156001', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(35, '156002', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(36, '155001', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(37, '156003', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(38, '156001', 'ELNOM3', 'ELPRENOM3', 'ELAUTRENOM3', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(39, '156002', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(40, '156001', 'jchvjhv', 'lkbjk', 'vkbkj', 'M', '031014_1754_Connectinga20.png', 'kuvyuv', 'Cameroun', '2015-05-20', 'Cameroun', 'iuigui', '2015-05-19', 1, 0, NULL, NULL),
(41, '', 'j g uyu', '', '', 'M', '', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(42, '', 'j g uyu', '', '', 'M', '', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(43, '', 'j g uyu', '', '', 'M', '', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(44, '', 'j g uyu', '', '', 'M', '', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(45, '', 'vasdvsdv', '', '', 'M', '', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(46, '', 'verrv', '', '', 'M', '', '', 'Cameroun', '2015-05-04', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(47, '', 'verrv', '', '', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-05-04', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(48, '', 'erver', '', '', 'M', '', '', 'Cameroun', '2015-05-04', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(49, 'tbrtybtbbrb', 'erver', '', '', 'M', '', '', 'Cameroun', '2015-05-04', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(50, '', 'vervr', '', '', 'M', '', '', 'Cameroun', '2015-06-16', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(51, '', 'vervr', '', '', 'M', '', '', 'Cameroun', '2015-06-16', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(52, '', 'vervr', '', '', 'M', '', '', 'Cameroun', '2015-06-16', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(53, '', 'vsfv', '', '', 'M', '', '', 'Cameroun', '2015-07-08', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(54, '', 'berwervwe', '', '', 'M', '', '', 'Cameroun', '2015-06-02', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(55, '', 'berwervwe', '', '', 'M', '', '', 'Cameroun', '2015-06-02', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(56, '', 'sbdf dfrd', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(57, '', 'sbdf dfrd', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(58, '', 'sbdf dfrd', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(59, '', 'sbdf dfrd', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(60, '', 'zvevzerv', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(61, '', 'drgbddrgf', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(62, '', 'vsefvsefv', '', '', 'M', '', '', 'Cameroun', '2015-06-08', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(63, '', 'drberbwer', '', '', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(64, '', 'drberbwer', '', '', 'M', '031014_1754_Connectinga20.png', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(65, '', 'vwevwerv', '', '', 'M', '', '', 'Cameroun', '2015-06-15', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(66, '', 'vwevwerv', '', '', 'M', '', '', 'Cameroun', '2015-06-15', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(67, '', 'vwevwerv', '', '', 'M', '', '', 'Cameroun', '2015-06-15', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(68, '', 'vfverv', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(69, '', 'fwferf', '', '', 'M', '', '', 'Cameroun', '2015-06-09', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(70, '', 'vrevwerve', '', '', 'M', '', '', 'Cameroun', '2015-06-16', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(71, '', 'fwerfwre', '', '', 'M', '', '', 'Cameroun', '2015-06-10', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(72, '', 'werfwref', '', '', 'M', '', '', 'Cameroun', '2015-06-08', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(73, '', 'fwefwe', '', '', 'M', '', '', 'Cameroun', '2015-06-02', 'Cameroun', '', '0000-00-00', 1, 0, NULL, NULL),
(74, '', 'Ainam', 'Jean-Paul', '', 'M', '031014_1754_Connectinga20.png', '1454', 'Cameroun', '2015-06-02', 'Cameroun', 'bongor', '2015-06-15', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
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
-- Structure de la table `enseignements`
--

CREATE TABLE IF NOT EXISTS `enseignements` (
  `IDENSEIGNEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `MATIERE` int(11) DEFAULT NULL,
  `PROFESSEUR` int(11) DEFAULT NULL,
  `CLASSE` int(11) NOT NULL,
  `GROUPE` int(11) DEFAULT NULL,
  `COEFF` int(11) NOT NULL,
  PRIMARY KEY (`IDENSEIGNEMENT`),
  KEY `MATIERE` (`MATIERE`,`PROFESSEUR`,`CLASSE`),
  KEY `PROFESSEUR` (`PROFESSEUR`),
  KEY `CLASSE` (`CLASSE`),
  KEY `GROUPE` (`GROUPE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Contenu de la table `enseignements`
--

INSERT INTO `enseignements` (`IDENSEIGNEMENT`, `MATIERE`, `PROFESSEUR`, `CLASSE`, `GROUPE`, `COEFF`) VALUES
(39, 1, 3, 31, 1, 2),
(40, 3, 3, 31, 1, 2),
(41, 2, 3, 31, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `etablissements`
--

CREATE TABLE IF NOT EXISTS `etablissements` (
  `IDETABLISSEMENT` int(11) NOT NULL AUTO_INCREMENT,
  `ETABLISSEMENT` varchar(150) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`IDETABLISSEMENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `etablissements`
--

INSERT INTO `etablissements` (`IDETABLISSEMENT`, `ETABLISSEMENT`) VALUES
(1, 'Collège Adventiste de Yaoundé'),
(2, 'Lycée Leclerc'),
(3, 'Lycee Provenance');

-- --------------------------------------------------------

--
-- Structure de la table `fonctions`
--

CREATE TABLE IF NOT EXISTS `fonctions` (
  `IDFONCTION` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`IDFONCTION`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `fonctions`
--

INSERT INTO `fonctions` (`IDFONCTION`, `LIBELLE`) VALUES
(1, 'Enseignant'),
(2, 'Assistant éducation'),
(3, 'Direction'),
(4, 'Consultant');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `IDGROUPE` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(250) NOT NULL,
  PRIMARY KEY (`IDGROUPE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`IDGROUPE`, `DESCRIPTION`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3');

-- --------------------------------------------------------

--
-- Structure de la table `groupemenus`
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
-- Contenu de la table `groupemenus`
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
-- Structure de la table `inscription`
--

CREATE TABLE IF NOT EXISTS `inscription` (
  `IDINSCRIPTION` int(11) NOT NULL AUTO_INCREMENT,
  `IDELEVE` int(11) NOT NULL,
  `IDCLASSE` int(11) NOT NULL,
  `ANNEEACADEMIQUE` varchar(15) NOT NULL,
  PRIMARY KEY (`IDINSCRIPTION`),
  UNIQUE KEY `IDELEVE` (`IDELEVE`,`IDCLASSE`,`ANNEEACADEMIQUE`),
  KEY `IDCLASSE` (`IDCLASSE`),
  KEY `ANNEEACADEMIQUE` (`ANNEEACADEMIQUE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `inscription`
--

INSERT INTO `inscription` (`IDINSCRIPTION`, `IDELEVE`, `IDCLASSE`, `ANNEEACADEMIQUE`) VALUES
(48, 27, 52, '2014-2015'),
(29, 32, 31, '2014-2015'),
(30, 35, 31, '2014-2015'),
(28, 36, 11, '2014-2015'),
(27, 38, 11, '2014-2015');

-- --------------------------------------------------------

--
-- Structure de la table `locan`
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
-- Contenu de la table `locan`
--

INSERT INTO `locan` (`ID`, `NOM`, `RESPONSABLE`, `ADRESSE`, `BP`, `TELEPHONE`, `TELEPHONE2`, `MOBILE`, `FAX`, `EMAIL`, `SITEWEB`, `LOGO`) VALUES
('IPW', 'Institut Polyvalent WAGUE', 'Mme WACGUE', 'Route vers SOA', NULL, '+237654258182', '+237958652142', '+237584961536', NULL, 'institutwague@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

CREATE TABLE IF NOT EXISTS `matieres` (
  `IDMATIERE` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(15) NOT NULL,
  `LIBELLE` varchar(255) NOT NULL,
  PRIMARY KEY (`IDMATIERE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `matieres`
--

INSERT INTO `matieres` (`IDMATIERE`, `CODE`, `LIBELLE`) VALUES
(1, 'ATEPTS', 'Atelier d''éducation physique et sportive'),
(2, 'ATEXA', 'Atelier d''expression artistique'),
(3, 'CPTTA', 'Comptabilité'),
(4, 'jrtyj', 'Atelier d''éducation physique et sportive'),
(5, 'rethrtyh', 'Atelier d''éducation physique et sportive'),
(6, 'thrt', 'Atelier d''éducation physique et sportive'),
(7, 'vwerge', 'gwerge'),
(8, 'rther', 'hwrthre'),
(9, 'erber', 'werge'),
(10, 'geqr', 'erger'),
(11, 'gwerge', 'berherhtre'),
(12, 'hwerher', 'vefert'),
(13, 'herthert', 'erthret'),
(14, 'ernr', 'erhre'),
(15, 'gerg', 'werger'),
(16, 'gqwegwq', 'gwerger'),
(17, 'rthre', 'rthret'),
(18, 'math', 'mathÃ©matique'),
(19, 'ntjty', 'rtrjht'),
(20, 'transformation', 'transforme'),
(21, 'rthrthrt', 'ukykt');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Contenu de la table `menus`
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
(40, 3, 'Saisie d''une punition', 'punition/saisie', 'punition.png', '315', NULL, NULL),
(41, 2, 'Scolarités', 'scolarite', 'scolarite', '208', NULL, NULL),
(42, 5, 'Saisie scolarités', 'scolarite/saisie', 'saisiescolarite', '508', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `motifsortie`
--

CREATE TABLE IF NOT EXISTS `motifsortie` (
  `IDMOTIF` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(150) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`IDMOTIF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `motifsortie`
--

INSERT INTO `motifsortie` (`IDMOTIF`, `LIBELLE`, `DESCRIPTION`) VALUES
(1, 'Départ pour l''étranger', NULL),
(2, 'Décès', NULL),
(3, 'Exclusion', NULL),
(4, 'Aucune précision', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `IDNIVEAU` int(11) NOT NULL AUTO_INCREMENT,
  `NIVEAUSELECT` varchar(30) NOT NULL,
  `NIVEAUHTML` varchar(30) NOT NULL,
  `GROUPE` int(11) NOT NULL,
  PRIMARY KEY (`IDNIVEAU`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `niveau`
--

INSERT INTO `niveau` (`IDNIVEAU`, `NIVEAUSELECT`, `NIVEAUHTML`, `GROUPE`) VALUES
(0, 'T&#x2e1;&#x1D49;', 'T<sup>le</sup>', 0),
(1, '1&#x1D49;&#x2b3;&#x1D49;', '1<sup>ère</sup>', 1),
(2, '2&#x1db0;&#x1d48;&#x1D49;', '2<sup>nde</sup>', 2),
(3, '3&#x1D49;&#x1d50;&#x1D49;', '3<sup>ème</sup>', 3),
(4, '4&#x1D49;&#x1d50;&#x1D49;', '4<sup>ème</sup>', 4),
(5, '5&#x1D49;&#x1d50;&#x1D49;', '5<sup>ème</sup>', 5),
(6, '6&#x1D49;&#x1d50;&#x1D49;', '6<sup>ème</sup>', 6);

-- --------------------------------------------------------

--
-- Structure de la table `parente`
--

CREATE TABLE IF NOT EXISTS `parente` (
  `LIBELLE` varchar(15) NOT NULL,
  PRIMARY KEY (`LIBELLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `parente`
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
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `PAYS` varchar(30) NOT NULL,
  PRIMARY KEY (`PAYS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`PAYS`) VALUES
('Cameroun'),
('Guinée Equ.'),
('Nigeria'),
('Tchad');

-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE IF NOT EXISTS `personnels` (
  `IDPERSONNEL` int(11) NOT NULL AUTO_INCREMENT,
  `MATRICULE` varchar(15) CHARACTER SET latin1 NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `personnels`
--

INSERT INTO `personnels` (`IDPERSONNEL`, `MATRICULE`, `IDUSER`, `CIVILITE`, `NOM`, `PRENOM`, `AUTRENOM`, `FONCTION`, `GRADE`, `DATENAISS`, `PORTABLE`, `TELEPHONE`, `EMAIL`) VALUES
(1, 'ADMIN', 1, 'Mr', 'Bruno', 'Bruno', '', 4, NULL, NULL, '652847527', '65847224', 'fort'),
(2, 'ADMIN2', 4, 'Mr', 'Ainam', 'Jean-paul', '', 3, NULL, '2015-05-05', NULL, '235', 'erberre'),
(3, 'ASSIST01', 5, 'Mlle', 'Estelle', 'Estelle', '', 1, NULL, NULL, NULL, '', NULL),
(4, 'dtfty416', 6, 'Dr', 'dtfty', 'fhtmfgh', 'FGM', 1, 'fm', '0000-00-00', 'fhjm', 'hfjm', NULL),
(5, 'PERSO01', 2, 'Mr', 'Nom1', 'Prenom2', '', 1, NULL, NULL, NULL, '+237652289165', NULL),
(6, '', NULL, 'Mr', 'ainam ', 'jean paul', '', 1, '', '2015-05-12', 'nrtjh', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `IDPROFILE` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE` varchar(100) CHARACTER SET utf8 NOT NULL,
  `LISTEDROIT` text,
  PRIMARY KEY (`IDPROFILE`),
  KEY `PROFILE` (`PROFILE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `profile`
--

INSERT INTO `profile` (`IDPROFILE`, `PROFILE`, `LISTEDROIT`) VALUES
(1, 'Administrateur', NULL),
(2, 'Assistant de bureau', NULL),
(3, 'Enseignant', NULL),
(4, 'Infirmerie', NULL),
(5, 'Responsable', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `responsables`
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
  `ACCEPTESMS` int(11) DEFAULT NULL COMMENT '0 = n''accepte pas de sms, 1 = accepte de sms',
  `NUMSMS` varchar(15) DEFAULT NULL COMMENT 'numero sur lequel il accepte les sms',
  PRIMARY KEY (`IDRESPONSABLE`),
  KEY `CIVILITE` (`CIVILITE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Contenu de la table `responsables`
--

INSERT INTO `responsables` (`IDRESPONSABLE`, `CIVILITE`, `NOM`, `PRENOM`, `ADRESSE`, `BP`, `TELEPHONE`, `PORTABLE`, `EMAIL`, `PROFESSION`, `ACCEPTESMS`, `NUMSMS`) VALUES
(28, 'Dr', 'bibinno', 'jbb', 'ohhoi#lnoi#', '235', 'nlnk', 'ino', '', '', 1, NULL),
(53, 'Mr', 'rdbrber', 'berberb', 'berb#ber#ebrbre', '', 'erber', 'berb', 'erberb', 'berbretb', 0, NULL),
(54, 'Mr', 'bewrbwer', '', '##', '', '', 'vwrevwerv', '', '', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `responsable_eleve`
--

CREATE TABLE IF NOT EXISTS `responsable_eleve` (
  `IDRESPONSABLEELEVE` int(11) NOT NULL AUTO_INCREMENT,
  `IDRESPONSABLE` int(11) NOT NULL,
  `IDELEVE` int(11) NOT NULL,
  `PARENTE` varchar(15) DEFAULT NULL,
  `CHARGES` varchar(250) DEFAULT NULL COMMENT 'Les charges de ce responsable sous forme d''objet JSON',
  PRIMARY KEY (`IDRESPONSABLEELEVE`),
  KEY `PARENTE` (`PARENTE`),
  KEY `IDRESPONSABLE` (`IDRESPONSABLE`,`IDELEVE`),
  KEY `IDELEVE` (`IDELEVE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Contenu de la table `responsable_eleve`
--

INSERT INTO `responsable_eleve` (`IDRESPONSABLEELEVE`, `IDRESPONSABLE`, `IDELEVE`, `PARENTE`, `CHARGES`) VALUES
(12, 28, 39, 'COUSINE', NULL),
(34, 53, 62, 'COUSINE', '["Accident"]'),
(37, 28, 64, 'COUSINE', '["Accident","Contact"]'),
(40, 53, 64, 'COUSINE', '["Accident","Contact"]'),
(41, 28, 65, 'COUSINE', '["Accident","Contact","Financier"]'),
(42, 28, 66, 'COUSINE', '["Accident","Contact","Financier"]'),
(44, 28, 68, 'COUSINE', '[]'),
(47, 28, 70, 'COUSINE', '["Accident","Contact"]'),
(49, 53, 71, 'COUSINE', '["Accident","Contact","Financier"]'),
(50, 53, 72, 'COUSINE', '["Accident","Contact","Financier"]'),
(51, 53, 73, 'COUSINE', '["Accident","Contact","Financier"]'),
(52, 53, 74, 'COUSINE', '["Accident","Contact","Financier"]'),
(54, 28, 74, 'MERE', '["Accident","Contact","Financier"]'),
(56, 54, 74, 'MERE', '["Accident","Contact","Financier"]');

-- --------------------------------------------------------

--
-- Structure de la table `scolarites`
--

CREATE TABLE IF NOT EXISTS `scolarites` (
  `IDSCOLARITE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(150) NOT NULL,
  `MONTANT` int(11) NOT NULL,
  `ECHEANCES` date NOT NULL,
  `CLASSE` int(11) NOT NULL,
  PRIMARY KEY (`IDSCOLARITE`),
  KEY `CLASSE` (`CLASSE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `scolarites`
--

INSERT INTO `scolarites` (`IDSCOLARITE`, `LIBELLE`, `MONTANT`, `ECHEANCES`, `CLASSE`) VALUES
(6, 'Tranche 1', 75000, '2015-06-17', 24);

-- --------------------------------------------------------

--
-- Structure de la table `users`
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
-- Contenu de la table `users`
--

INSERT INTO `users` (`IDUSER`, `LOGIN`, `PASSWORD`, `PROFILE`, `DROITSPECIFIQUE`, `ACTIF`) VALUES
(1, 'armel', '069a6a9ccaaca7967a0c43cb5e161187', 1, '["101","103","104","105","201","202","203","204","205","206","207","208","401","402","403","404","405","406","501","502","503","504","505","508","602","603"]', 1),
(2, 'bruno', 'md5(''bruno'')', 1, '["101","102","103","104","105","201","202","203","204","205","206","207","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","401","402","403","404","405","406","501","502","503","504","505","506","507","601","602","603","604","605","701","702","801","802","803"]', 1),
(3, 'estelle', 'md5(''estelle'')', 2, '["104","105","201"]', 1),
(4, 'jp', '55add3d845bfcd87a9b0949b0da49c0a', 1, '["103","104","105","201","202","203","204","205","206","207","208","401","402","403","404","405","406","501","502","503","504","505","508","602","603","605"]', 1),
(5, 'nom1', 'md5(''nom1'')', 2, '["102","103","201","202"]', 1),
(6, 'nom2', 'md5(''nom2'')', 4, '["101","102","103","104","105","201","202","203","204","205","206","207","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","401","402","403","404","405","406","501","502","503","504","505","506","507","601","602","603","604","605","701","702","801","802","803"]', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`DECOUPAGE`) REFERENCES `decoupage` (`IDDECOUPAGE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`ANNEEACADEMIQUE`) REFERENCES `anneeacademique` (`anneeacademique`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`NIVEAU`) REFERENCES `niveau` (`IDNIVEAU`);

--
-- Contraintes pour la table `classes_parametres`
--
ALTER TABLE `classes_parametres`
  ADD CONSTRAINT `classes_parametres_ibfk_1` FOREIGN KEY (`IDCLASSE`) REFERENCES `classes` (`IDCLASSE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_parametres_ibfk_2` FOREIGN KEY (`ANNEEACADEMIQUE`) REFERENCES `anneeacademique` (`anneeacademique`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_parametres_ibfk_3` FOREIGN KEY (`PROFPRINCIPALE`) REFERENCES `personnels` (`IDPERSONNEL`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_parametres_ibfk_4` FOREIGN KEY (`CPEPRINCIPALE`) REFERENCES `responsables` (`IDRESPONSABLE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_parametres_ibfk_5` FOREIGN KEY (`RESPADMINISTRATIF`) REFERENCES `personnels` (`IDPERSONNEL`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`NATIONALITE`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_2` FOREIGN KEY (`PAYSNAISS`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_4` FOREIGN KEY (`MOTIFSORTIE`) REFERENCES `motifsortie` (`IDMOTIF`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_5` FOREIGN KEY (`PROVENANCE`) REFERENCES `etablissements` (`IDETABLISSEMENT`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `enseignements`
--
ALTER TABLE `enseignements`
  ADD CONSTRAINT `enseignements_ibfk_1` FOREIGN KEY (`MATIERE`) REFERENCES `matieres` (`IDMATIERE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignements_ibfk_2` FOREIGN KEY (`PROFESSEUR`) REFERENCES `personnels` (`IDPERSONNEL`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignements_ibfk_3` FOREIGN KEY (`CLASSE`) REFERENCES `classes` (`IDCLASSE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enseignements_ibfk_4` FOREIGN KEY (`GROUPE`) REFERENCES `groupe` (`IDGROUPE`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`IDELEVE`) REFERENCES `eleves` (`IDELEVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`IDCLASSE`) REFERENCES `classes` (`IDCLASSE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscription_ibfk_3` FOREIGN KEY (`ANNEEACADEMIQUE`) REFERENCES `anneeacademique` (`anneeacademique`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`CODEDROIT`) REFERENCES `droits` (`CODEDROIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`IDGROUPE`) REFERENCES `groupemenus` (`IDGROUPE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`CIVILITE`) REFERENCES `civilite` (`CIVILITE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `personnels_ibfk_3` FOREIGN KEY (`FONCTION`) REFERENCES `fonctions` (`IDFONCTION`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `personnels_ibfk_4` FOREIGN KEY (`IDUSER`) REFERENCES `users` (`IDUSER`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_ibfk_1` FOREIGN KEY (`CIVILITE`) REFERENCES `civilite` (`CIVILITE`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `responsable_eleve`
--
ALTER TABLE `responsable_eleve`
  ADD CONSTRAINT `responsable_eleve_ibfk_1` FOREIGN KEY (`IDRESPONSABLE`) REFERENCES `responsables` (`IDRESPONSABLE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsable_eleve_ibfk_2` FOREIGN KEY (`IDELEVE`) REFERENCES `eleves` (`IDELEVE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responsable_eleve_ibfk_3` FOREIGN KEY (`PARENTE`) REFERENCES `parente` (`LIBELLE`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `scolarites`
--
ALTER TABLE `scolarites`
  ADD CONSTRAINT `scolarites_ibfk_1` FOREIGN KEY (`CLASSE`) REFERENCES `classes` (`IDCLASSE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`PROFILE`) REFERENCES `profile` (`IDPROFILE`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
