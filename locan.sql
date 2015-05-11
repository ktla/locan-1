-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 11 Mai 2015 à 23:45
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
  `LIBELLE` varchar(30) NOT NULL,
  PRIMARY KEY (`LIBELLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `charge`
--

INSERT INTO `charge` (`LIBELLE`) VALUES
('Contact'),
('Financier');

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
('M.'),
('Mlle'),
('Mme');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
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
-- Contenu de la table `classes`
--

INSERT INTO `classes` (`CODE`, `LIBELLE`, `DECOUPAGE`, `ANNEEACADEMIQUE`) VALUES
('5A', 'Cinquième A', 1, '2014-2015');

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
  `CONNEXION` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DATEFIN` datetime DEFAULT NULL,
  `DECONNEXION` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IDCONNEXION`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Contenu de la table `connexions`
--

INSERT INTO `connexions` (`IDCONNEXION`, `COMPTE`, `DATEDEBUT`, `MACHINESOURCE`, `IPSOURCE`, `CONNEXION`, `DATEFIN`, `DECONNEXION`) VALUES
(1, 'armel', '2015-05-04 19:21:48', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(2, 'jp', '2015-05-05 09:23:41', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 09:52:30', 'Session expriÃ©e'),
(3, 'jp', '2015-05-05 10:38:52', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 10:51:51', 'Session expriÃ©e'),
(4, 'jp', '2015-05-05 12:53:47', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 13:03:47', 'Session expriÃ©e'),
(5, 'jp', '2015-05-05 13:16:38', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 13:37:04', 'Session expriÃ©e'),
(6, 'jp', '2015-05-05 14:02:41', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 14:36:18', 'Session fermÃ©e correctement'),
(7, 'jp', '2015-05-05 16:06:02', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 16:16:02', 'Session expriÃ©e'),
(8, 'jp', '2015-05-05 17:36:48', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-05 17:47:46', 'Session expriÃ©e'),
(9, 'jp', '2015-05-05 17:53:38', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(10, 'armel', '2015-05-06 09:06:38', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(11, 'armel', '2015-05-06 17:02:38', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-06 17:47:04', 'Session expriÃ©e'),
(12, 'armel', '2015-05-06 17:47:55', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-06 18:12:52', 'Session expriÃ©e'),
(13, 'armel', '2015-05-06 18:27:47', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-06 18:48:11', 'Session expriÃ©e'),
(14, 'armel', '2015-05-06 19:09:12', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-06 19:28:49', 'Session expriÃ©e'),
(15, 'armel', '2015-05-06 19:31:46', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-06 19:56:13', 'Session expriÃ©e'),
(16, 'armel', '2015-05-06 21:48:16', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-06 22:04:06', 'Session expriÃ©e'),
(17, 'armel', '2015-05-06 22:08:08', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(18, 'jp', '2015-05-07 10:06:34', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 10:18:28', 'Session expriÃ©e'),
(19, 'armel', '2015-05-07 13:02:17', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 13:13:31', 'Session expriÃ©e'),
(20, 'armel', '2015-05-07 13:22:56', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 14:32:16', 'Session expriÃ©e'),
(21, 'jp', '2015-05-07 14:00:36', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 14:19:59', 'Session expriÃ©e'),
(22, 'armel', '2015-05-07 15:04:46', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(23, 'armel', '2015-05-07 19:43:45', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 20:12:51', 'Session expriÃ©e'),
(24, 'armel', '2015-05-07 20:42:30', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 21:13:51', 'Session expriÃ©e'),
(25, 'armel', '2015-05-07 21:26:08', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 21:38:39', 'Session expriÃ©e'),
(26, 'armel', '2015-05-07 21:44:02', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 21:55:57', 'Session expriÃ©e'),
(27, 'armel', '2015-05-07 22:01:25', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-07 22:26:53', 'Session expriÃ©e'),
(28, 'armel', '2015-05-08 07:41:04', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-08 07:51:51', 'Session expriÃ©e'),
(29, 'armel', '2015-05-08 14:37:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-08 15:06:27', 'Session expriÃ©e'),
(30, 'jp', '2015-05-08 14:42:05', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(31, 'jp', '2015-05-08 15:08:00', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(32, 'armel', '2015-05-08 15:10:23', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-08 15:39:38', 'Session expriÃ©e'),
(33, 'armel', '2015-05-08 15:49:25', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-08 16:54:27', 'Session expriÃ©e'),
(34, 'armel', '2015-05-08 16:59:50', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-08 17:12:36', 'Session expriÃ©e'),
(35, 'armel', '2015-05-08 20:57:26', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(36, 'armel', '2015-05-11 07:23:30', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(37, 'jp', '2015-05-11 07:32:02', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(38, 'jp', '2015-05-11 07:33:31', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(39, 'armel', '2015-05-11 11:26:41', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(40, 'armel', '2015-05-11 19:48:49', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:28:02', 'Session expriÃ©e'),
(41, 'armel', '2015-05-11 20:45:10', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:45:28', 'Session fermÃ©e correctement'),
(42, 'armel', '2015-05-11 20:46:33', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:46:53', 'Session fermÃ©e correctement'),
(43, 'armel', '2015-05-11 20:46:58', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:47:29', 'Session fermÃ©e correctement'),
(44, 'armel', '2015-05-11 20:47:36', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:47:52', 'Session fermÃ©e correctement'),
(45, 'armel', '2015-05-11 20:47:58', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:49:07', 'Session fermÃ©e correctement'),
(46, 'jp', '2015-05-11 20:49:14', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 20:50:37', 'Session fermÃ©e correctement'),
(47, 'jp', '2015-05-11 21:04:40', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:08:13', 'Session fermÃ©e correctement'),
(48, 'jp', '2015-05-11 21:12:19', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:12:25', 'Session fermÃ©e correctement'),
(49, 'jp', '2015-05-11 21:12:49', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:13:15', 'Session fermÃ©e correctement'),
(50, 'jp', '2015-05-11 21:14:32', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:15:02', 'Session fermÃ©e correctement'),
(51, 'jp', '2015-05-11 21:15:10', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:15:29', 'Session fermÃ©e correctement'),
(52, 'armel', '2015-05-11 21:15:56', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:36:21', 'Session expriÃ©e'),
(53, 'armel', '2015-05-11 21:47:20', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 21:59:35', 'Session fermÃ©e correctement'),
(54, 'jp', '2015-05-11 21:59:42', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-11 22:17:25', 'Session expriÃ©e'),
(55, 'jp', '2015-05-11 22:21:04', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Structure de la table `decoupage`
--

CREATE TABLE IF NOT EXISTS `decoupage` (
  `IDDECOUPAGE` int(11) NOT NULL AUTO_INCREMENT,
  `LIBELLE` varchar(30) NOT NULL,
  PRIMARY KEY (`IDDECOUPAGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `decoupage`
--

INSERT INTO `decoupage` (`IDDECOUPAGE`, `LIBELLE`) VALUES
(1, 'Trimestre'),
(2, 'Semestre');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `droits`
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
(40, '602', 'Mot de passe administrateur'),
(41, '603', 'Gestion des utilisateurs'),
(42, '604', 'Droits d''accès utilisateurs'),
(43, '605', 'Calendrier scolaire'),
(44, '701', 'Sauvegarder la base de données'),
(45, '702', 'Restaurer la base de données'),
(46, '801', 'Récupération du personnel'),
(47, '802', 'Récupération des élèves'),
(48, '803', 'Récupération des classes'),
(49, '105', 'Déconnexion'),
(50, '507', 'Suppression du personnel'),
(51, '207', 'Enseignants');

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

CREATE TABLE IF NOT EXISTS `eleves` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MATRICULE` varchar(15) CHARACTER SET latin1 NOT NULL,
  `NOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `PRENOM` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `AUTRENOM` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `SEXE` varchar(15) CHARACTER SET latin1 NOT NULL,
  `PHOTO` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `NATIONALITE` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `DATENAISS` date NOT NULL,
  `PAYSNAISS` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `LIEUNAISS` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `DATEENTREE` date NOT NULL,
  `PROVENANCE` int(11) DEFAULT NULL,
  `REDOUBLANT` tinyint(1) NOT NULL DEFAULT '0',
  `DATESORTIE` date DEFAULT NULL,
  `MOTIFSORTIE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NATIONALITE` (`NATIONALITE`),
  KEY `LIEUNAISS` (`PAYSNAISS`),
  KEY `PROVENANCE` (`PROVENANCE`),
  KEY `MOTIFSORTIE` (`MOTIFSORTIE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`ID`, `MATRICULE`, `NOM`, `PRENOM`, `AUTRENOM`, `SEXE`, `PHOTO`, `NATIONALITE`, `DATENAISS`, `PAYSNAISS`, `LIEUNAISS`, `DATEENTREE`, `PROVENANCE`, `REDOUBLANT`, `DATESORTIE`, `MOTIFSORTIE`) VALUES
(1, 'EL001', 'ELNOM1', 'Elprenom1', NULL, 'Masculin', NULL, NULL, '2015-04-07', NULL, NULL, '2015-04-14', NULL, 0, NULL, NULL),
(2, 'EL002', 'ELNOM2', 'Elprenom2', NULL, 'Feminin', NULL, NULL, '2015-04-06', NULL, NULL, '2015-04-28', NULL, 0, '2015-04-08', NULL),
(7, '62eleve', 'grege', 'wergerg', '', 'M', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', NULL, 0, '0000-00-00', 1),
(8, '39eleve', 'egrt', 'etgrtgr', '', 'M', '', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, '0000-00-00', 1),
(9, '54eleve', 'dnhr', 'tyjrtjr', '', 'M', 'http://localhost/locan/photos/eleves/WIN_20150309_163112.JPG', 'Cameroun', '0000-00-00', 'Cameroun', '', '0000-00-00', 1, 0, '0000-00-00', 1),
(11, '27eleve', 'wgreg', 'werge', 'gegre', 'F', 'http://localhost/locan/photos/eleves/elab_logo.png', 'Cameroun', '0000-00-00', 'Cameroun', 'ergerg', '0000-00-00', 1, 0, '0000-00-00', 2);

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
-- Structure de la table `estresponsablede`
--

CREATE TABLE IF NOT EXISTS `estresponsablede` (
  `IDRESPONSABLE` int(11) NOT NULL,
  `IDELEVE` int(11) NOT NULL,
  `PARENTE` varchar(15) DEFAULT NULL,
  `CHARGE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDRESPONSABLE`,`IDELEVE`),
  KEY `PARENTE` (`PARENTE`,`CHARGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Structure de la table `functions`
--

CREATE TABLE IF NOT EXISTS `functions` (
  `IDFUNCTION` int(11) NOT NULL AUTO_INCREMENT,
  `FUNCTION` varchar(50) NOT NULL,
  PRIMARY KEY (`IDFUNCTION`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `functions`
--

INSERT INTO `functions` (`IDFUNCTION`, `FUNCTION`) VALUES
(1, 'Enseignant'),
(2, 'Assistant éducation'),
(3, 'Direction'),
(4, 'Consultant');

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
-- Structure de la table `listedroits`
--

CREATE TABLE IF NOT EXISTS `listedroits` (
  `CODEDROIT` varchar(10) NOT NULL,
  `PROFILE` varchar(100) NOT NULL,
  PRIMARY KEY (`CODEDROIT`,`PROFILE`),
  KEY `PROFILE` (`PROFILE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `listedroits`
--

INSERT INTO `listedroits` (`CODEDROIT`, `PROFILE`) VALUES
('101', 'Administrateur'),
('102', 'Administrateur'),
('103', 'Administrateur'),
('104', 'Administrateur'),
('105', 'Administrateur'),
('201', 'Administrateur'),
('202', 'Administrateur'),
('203', 'Administrateur'),
('204', 'Administrateur'),
('205', 'Administrateur'),
('206', 'Administrateur'),
('207', 'Administrateur'),
('301', 'Administrateur'),
('302', 'Administrateur'),
('303', 'Administrateur'),
('304', 'Administrateur'),
('305', 'Administrateur'),
('306', 'Administrateur'),
('307', 'Administrateur'),
('308', 'Administrateur'),
('401', 'Administrateur'),
('402', 'Administrateur'),
('403', 'Administrateur'),
('404', 'Administrateur'),
('501', 'Administrateur'),
('502', 'Administrateur'),
('503', 'Administrateur'),
('504', 'Administrateur'),
('505', 'Administrateur'),
('506', 'Administrateur'),
('507', 'Administrateur'),
('601', 'Administrateur'),
('602', 'Administrateur'),
('603', 'Administrateur'),
('604', 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `locan`
--

CREATE TABLE IF NOT EXISTS `locan` (
  `ID` varchar(15) NOT NULL,
  `NOM` varchar(150) NOT NULL,
  `RESPONSABLE` varchar(150) NOT NULL,
  `ADRESSE` varchar(150) NOT NULL,
  `TELEPHONE` varchar(30) NOT NULL,
  `TELEPHONE2` varchar(30) NOT NULL,
  `MOBILE` varchar(30) NOT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `locan`
--

INSERT INTO `locan` (`ID`, `NOM`, `RESPONSABLE`, `ADRESSE`, `TELEPHONE`, `TELEPHONE2`, `MOBILE`, `EMAIL`) VALUES
('IPW', 'Institut Polyvalent WAGUE', 'Mme WACGUE', 'Route vers SOA', '+237654258182', '+237958652142', '+237584961536', 'institutwague@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

CREATE TABLE IF NOT EXISTS `matieres` (
  `CODE` varchar(15) NOT NULL,
  `LIBELLE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matieres`
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
('hrthr', 'erther'),
('erger', 'gerge'),
('herthert', 'erthret'),
('ernr', 'erhre'),
('gerg', 'werger'),
('gqwegwq', 'gwerger'),
('rthre', 'rthret'),
('math', 'mathÃ©matique'),
('ntjty', 'rtrjht'),
('gergr', 'vevrt'),
('transformation', 'transforme');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `menus`
--

INSERT INTO `menus` (`IDMENUS`, `IDGROUPE`, `LIBELLE`, `HREF`, `ICON`, `CODEDROIT`, `ALT`, `TITLE`) VALUES
(1, 1, 'Mot de passe', 'user/mdp', 'mdp.png', '101', NULL, NULL),
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
(23, 2, 'Enseignants', 'enseignant', 'enseignant.png', '207', NULL, 'Gestion des enseignants');

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
  `IDPERSONNEL` varchar(15) CHARACTER SET latin1 NOT NULL,
  `LOGIN` varchar(80) DEFAULT NULL,
  `CIVILITE` varchar(10) DEFAULT NULL,
  `NOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `PRENOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `AUTRENOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `FK_FUNCTION` int(11) NOT NULL,
  `GRADE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `DATENAISS` date DEFAULT NULL,
  `PORTABLE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `TELEPHONE` varchar(15) CHARACTER SET latin1 NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDPERSONNEL`),
  KEY `CIVILITE` (`CIVILITE`),
  KEY `LOGIN` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `personnels`
--

INSERT INTO `personnels` (`IDPERSONNEL`, `LOGIN`, `CIVILITE`, `NOM`, `PRENOM`, `AUTRENOM`, `FK_FUNCTION`, `GRADE`, `DATENAISS`, `PORTABLE`, `TELEPHONE`, `EMAIL`) VALUES
('ADMIN', 'bruno', 'M.', 'Bruno', 'Bruno', '', 4, NULL, NULL, NULL, '', NULL),
('ADMIN2', 'jp', 'M.', 'Ainam', 'Jean-paul', '', 3, NULL, '2015-05-05', NULL, '235', 'jpainam@gmail.com'),
('ASSIST01', 'estelle', 'Mme', 'Estelle', 'Estelle', '', 1, NULL, NULL, NULL, '', NULL),
('PERSO01', 'nom1', 'M.', 'Nom1', 'Prenom2', '', 1, NULL, NULL, NULL, '+237652289165', NULL),
('PESO02', 'nom2', 'Mme', 'Nom2', 'Prenom2', '', 2, NULL, NULL, NULL, '+237698106057', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `PROFILE` varchar(100) NOT NULL,
  `DROIT` blob NOT NULL,
  PRIMARY KEY (`PROFILE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `profile`
--

INSERT INTO `profile` (`PROFILE`, `DROIT`) VALUES
('Administrateur', ''),
('Enseignant', '');

-- --------------------------------------------------------

--
-- Structure de la table `responsables`
--

CREATE TABLE IF NOT EXISTS `responsables` (
  `IDRESPONSABLE` int(11) NOT NULL AUTO_INCREMENT,
  `CIVILITE` varchar(15) DEFAULT NULL,
  `IDENTITE` varchar(250) NOT NULL,
  `ADRESSE` varchar(150) NOT NULL,
  `TELEPHONE` varchar(15) NOT NULL,
  `PORTABLE` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(75) DEFAULT NULL,
  `PROFESSIONS` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`IDRESPONSABLE`),
  KEY `CIVILITE` (`CIVILITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `LOGIN` varchar(80) CHARACTER SET utf8 NOT NULL,
  `PASSWORD` text CHARACTER SET utf8 NOT NULL,
  `PROFILE` varchar(100) DEFAULT NULL,
  `DROITSPECIFIQUE` text,
  `ACTIF` int(11) NOT NULL DEFAULT '1' COMMENT 'Actif = 1 et 0 = Non actif (cad bloquee)',
  PRIMARY KEY (`LOGIN`),
  UNIQUE KEY `LOGIN` (`LOGIN`),
  KEY `PROFILE` (`PROFILE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`LOGIN`, `PASSWORD`, `PROFILE`, `DROITSPECIFIQUE`, `ACTIF`) VALUES
('armel', '069a6a9ccaaca7967a0c43cb5e161187', 'Administrateur', NULL, 1),
('bruno', 'md5(''bruno'')', 'Enseignant', NULL, 1),
('estelle', 'md5(''estelle'')', 'Enseignant', NULL, 1),
('jp', '55add3d845bfcd87a9b0949b0da49c0a', 'Administrateur', NULL, 1),
('nom1', 'md5(''nom1'')', 'Enseignant', NULL, 1),
('nom2', 'md5(''nom2'')', 'Enseignant', NULL, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`DECOUPAGE`) REFERENCES `decoupage` (`IDDECOUPAGE`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`ANNEEACADEMIQUE`) REFERENCES `anneeacademique` (`anneeacademique`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`NATIONALITE`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_2` FOREIGN KEY (`PAYSNAISS`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_4` FOREIGN KEY (`MOTIFSORTIE`) REFERENCES `motifsortie` (`IDMOTIF`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_5` FOREIGN KEY (`PROVENANCE`) REFERENCES `etablissements` (`IDETABLISSEMENT`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `listedroits`
--
ALTER TABLE `listedroits`
  ADD CONSTRAINT `listedroits_ibfk_1` FOREIGN KEY (`CODEDROIT`) REFERENCES `droits` (`CODEDROIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `listedroits_ibfk_2` FOREIGN KEY (`PROFILE`) REFERENCES `profile` (`PROFILE`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `personnels_ibfk_2` FOREIGN KEY (`LOGIN`) REFERENCES `users` (`LOGIN`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_ibfk_1` FOREIGN KEY (`CIVILITE`) REFERENCES `civilite` (`CIVILITE`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`PROFILE`) REFERENCES `profile` (`PROFILE`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
