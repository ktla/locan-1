-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 04 Mai 2015 à 11:05
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
  `anneeacademique` varchar(15) NOT NULL
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `connexions`
--

INSERT INTO `connexions` (`IDCONNEXION`, `COMPTE`, `DATEDEBUT`, `MACHINESOURCE`, `IPSOURCE`, `CONNEXION`, `DATEFIN`, `DECONNEXION`) VALUES
(1, 'armel', '2015-05-04 01:34:20', 'PET-PC', '::1', 'Connexion réussie', '2015-05-04 01:44:20', 'Session expriée'),
(2, 'armel', '2015-05-04 01:54:17', 'PET-PC', '::1', 'Connexion réussie', '2015-05-04 01:54:38', 'Session fermée correctement'),
(12, 'armel', '2015-05-04 03:26:00', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 03:48:00', 'Session expriÃ©e'),
(14, 'armel', '2015-05-04 03:48:44', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 03:58:52', 'Session expriÃ©e'),
(19, 'jp', '2015-05-04 03:58:03', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(20, 'jp', '2015-05-04 03:59:11', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 03:59:23', 'Session fermÃ©e correctement'),
(21, 'jp', '2015-05-04 03:59:27', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(22, 'jp', '2015-05-04 04:00:15', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 04:10:15', 'Session expriÃ©e'),
(23, 'armel', '2015-05-04 04:42:36', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 04:53:41', 'Session expriÃ©e'),
(24, 'armel', '2015-05-04 05:02:47', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 05:34:33', 'Session expriÃ©e'),
(25, 'jp', '2015-05-04 05:25:31', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 05:35:39', 'Session expriÃ©e'),
(26, 'armel', '2015-05-04 06:01:15', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 06:13:26', 'Session expriÃ©e'),
(27, 'armel', '2015-05-04 06:14:15', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 07:04:43', 'Session fermÃ©e correctement'),
(28, 'jp', '2015-05-04 07:12:01', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', ''),
(29, 'armel', '2015-05-04 07:14:18', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 07:41:29', 'Session expriÃ©e'),
(30, 'armel', '2015-05-04 08:20:51', 'PET-PC', '::1', 'Connexion rÃ©ussie', '2015-05-04 08:35:30', 'Session fermÃ©e correctement'),
(31, 'armel', '2015-05-04 09:43:56', 'PET-PC', '::1', 'Session en cours', '0000-00-00 00:00:00', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

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
(50, '507', 'Suppression du personnel');

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
  `PROVENANCE` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `REDOUBLANT` tinyint(1) NOT NULL DEFAULT '0',
  `DATESORTIE` date DEFAULT NULL,
  `MOTIFSORTIE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NATIONALITE` (`NATIONALITE`),
  KEY `LIEUNAISS` (`PAYSNAISS`),
  KEY `PROVENANCE` (`PROVENANCE`),
  KEY `MOTIFSORTIE` (`MOTIFSORTIE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `eleves`
--

INSERT INTO `eleves` (`ID`, `MATRICULE`, `NOM`, `PRENOM`, `AUTRENOM`, `SEXE`, `PHOTO`, `NATIONALITE`, `DATENAISS`, `PAYSNAISS`, `LIEUNAISS`, `DATEENTREE`, `PROVENANCE`, `REDOUBLANT`, `DATESORTIE`, `MOTIFSORTIE`) VALUES
(1, 'EL001', 'ELNOM1', 'Elprenom1', NULL, 'Masculin', NULL, NULL, '2015-04-07', NULL, NULL, '2015-04-14', NULL, 0, NULL, NULL),
(2, 'EL002', 'ELNOM2', 'Elprenom2', NULL, 'Feminin', NULL, NULL, '2015-04-06', NULL, NULL, '2015-04-28', NULL, 0, '2015-04-08', NULL);

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
  `ETABLISSEMENT` varchar(150) NOT NULL,
  PRIMARY KEY (`ETABLISSEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etablissements`
--

INSERT INTO `etablissements` (`ETABLISSEMENT`) VALUES
('Collège Adventiste de Yaoundé'),
('Lycée Leclerc');

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
('math', 'mathÃ©matique');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

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
(22, 4, 'Bilans bulletins', 'note/bilan', 'bilan.png', '403', NULL, NULL);

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
  `CIVILITE` varchar(10) DEFAULT NULL,
  `NOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `PRENOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `AUTRENOM` varchar(30) CHARACTER SET latin1 NOT NULL,
  `FK_FUNCTION` int(11) NOT NULL,
  `GRADE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `DATENAISS` date DEFAULT NULL,
  `PORTABLE` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `TELEPHONE` varchar(15) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`IDPERSONNEL`),
  KEY `CIVILITE` (`CIVILITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `personnels`
--

INSERT INTO `personnels` (`IDPERSONNEL`, `CIVILITE`, `NOM`, `PRENOM`, `AUTRENOM`, `FK_FUNCTION`, `GRADE`, `DATENAISS`, `PORTABLE`, `TELEPHONE`) VALUES
('ADMIN', 'M.', 'Bruno', 'Bruno', '', 4, NULL, NULL, NULL, ''),
('ASSIST01', 'Mme', 'Estelle', 'Estelle', '', 1, NULL, NULL, NULL, ''),
('PERSO01', 'M.', 'Nom1', 'Prenom2', '', 1, NULL, NULL, NULL, '+237652289165'),
('PESO02', 'Mme', 'Nom2', 'Prenom2', '', 2, NULL, NULL, NULL, '+237698106057');

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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(80) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `PROFILE` varchar(100) DEFAULT NULL,
  `DROITSPECIFIQUE` text,
  `ACTIF` int(11) NOT NULL DEFAULT '1' COMMENT 'Actif = 1 et 0 = Non actif (cad bloquee)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN` (`LOGIN`),
  KEY `PROFILE` (`PROFILE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `LOGIN`, `PASSWORD`, `PROFILE`, `DROITSPECIFIQUE`, `ACTIF`) VALUES
(1, 'jp', 'jp', 'Administrateur', NULL, 1),
(2, 'armel', 'tintin', 'Administrateur', NULL, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `eleves_ibfk_1` FOREIGN KEY (`NATIONALITE`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_2` FOREIGN KEY (`PAYSNAISS`) REFERENCES `pays` (`PAYS`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_3` FOREIGN KEY (`PROVENANCE`) REFERENCES `etablissements` (`ETABLISSEMENT`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `eleves_ibfk_4` FOREIGN KEY (`MOTIFSORTIE`) REFERENCES `motifsortie` (`IDMOTIF`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`CIVILITE`) REFERENCES `civilite` (`CIVILITE`) ON DELETE SET NULL ON UPDATE CASCADE;

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
