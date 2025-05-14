-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 14 mai 2025 à 09:40
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lafbswindev`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

DROP TABLE IF EXISTS `abonne`;
CREATE TABLE IF NOT EXISTS `abonne` (
  `abo_matricule` int(11) NOT NULL AUTO_INCREMENT,
  `abo_nom` varchar(100) NOT NULL,
  `abo_prenom` varchar(100) NOT NULL,
  `abo_email` varchar(100) NOT NULL,
  `abo_mdp` varchar(255) DEFAULT NULL,
  `abo_telephone` varchar(20) DEFAULT NULL,
  `abo_club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`abo_matricule`),
  UNIQUE KEY `abo_email` (`abo_email`),
  KEY `abo_club_id` (`abo_club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`abo_matricule`, `abo_nom`, `abo_prenom`, `abo_email`, `abo_mdp`, `abo_telephone`, `abo_club_id`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', 'test', '0612345678', 1),
(2, 'Martin', 'Claire', 'claire.martin@example.com', '', '0623456789', 1),
(3, 'Durand', 'Luc', 'luc.durand@example.com', '', '0634567890', 2),
(4, 'Petit', 'Anna', 'anna.petit@example.com', '', '0645678901', 3),
(5, 'Bernard', 'Leo', 'leo.bernard@example.com', '', '0656789012', 2),
(17, 'Jrad', 'a', 'a', 'FFE9AAEAA2A2D5048174DF0B80599EF0197EC024C4B051BC9860CFF58EF7F9F3', '01.02.03.04.05', 1),
(18, 'b', 'b', 'b', '1E57B933B0A78203E21D41CC4B16D731B255B04058D48A4AC2731F0089312129', '0102030405', 1);

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

DROP TABLE IF EXISTS `abonnement`;
CREATE TABLE IF NOT EXISTS `abonnement` (
  `ab_id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_abo_matricule` int(11) DEFAULT NULL,
  `ab_tab_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ab_id`),
  KEY `ab_abo_matricule` (`ab_abo_matricule`),
  KEY `ab_tab_code` (`ab_tab_code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`ab_id`, `ab_abo_matricule`, `ab_tab_code`) VALUES
(1, 1, 'BAS'),
(2, 2, 'STD'),
(3, 3, 'PRE'),
(4, 4, 'PRE'),
(5, 5, 'BAS'),
(21, 17, 'STD'),
(22, 18, 'STD');

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
CREATE TABLE IF NOT EXISTS `prestation` (
  `pre_code` varchar(10) NOT NULL,
  `pre_libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`pre_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `prestation`
--

INSERT INTO `prestation` (`pre_code`, `pre_libelle`) VALUES
('BOX', 'Boxe'),
('CRF', 'CrossFit'),
('MUS', 'Musculation'),
('YOG', 'Yoga'),
('ZUM', 'Zumba');

-- --------------------------------------------------------

--
-- Structure de la table `prestationabonnement`
--

DROP TABLE IF EXISTS `prestationabonnement`;
CREATE TABLE IF NOT EXISTS `prestationabonnement` (
  `apr_tab_code` varchar(10) NOT NULL,
  `apr_pre_code` varchar(10) NOT NULL,
  PRIMARY KEY (`apr_tab_code`,`apr_pre_code`),
  KEY `apr_pre_code` (`apr_pre_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `prestationabonnement`
--

INSERT INTO `prestationabonnement` (`apr_tab_code`, `apr_pre_code`) VALUES
('PRE', 'BOX'),
('PRE', 'CRF'),
('STD', 'CRF'),
('BAS', 'MUS'),
('PRE', 'MUS'),
('BAS', 'YOG'),
('PRE', 'YOG'),
('PRE', 'ZUM'),
('STD', 'ZUM');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_sea_id` int(11) DEFAULT NULL,
  `res_abo_id` int(11) DEFAULT NULL,
  `res_date` date DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  KEY `res_sea_id` (`res_sea_id`),
  KEY `res_abo_id` (`res_abo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`res_id`, `res_sea_id`, `res_abo_id`, `res_date`) VALUES
(1, 1, 1, '2025-04-24'),
(2, 2, 1, '2025-04-24'),
(3, 3, 2, '2025-04-24'),
(4, 4, 3, '2025-04-24'),
(5, 5, 3, '2025-04-24'),
(6, 6, 4, '2025-04-24'),
(7, 7, 5, '2025-04-24');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `sal_id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_nom` varchar(100) NOT NULL,
  PRIMARY KEY (`sal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`sal_id`, `sal_nom`) VALUES
(1, 'FBS Paris'),
(2, 'FBS Lyon'),
(3, 'FBS Marseille');

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `sea_id` int(11) NOT NULL AUTO_INCREMENT,
  `sea_sal_id` int(11) DEFAULT NULL,
  `sea_pre_code` varchar(10) DEFAULT NULL,
  `sea_joursem` varchar(10) DEFAULT NULL,
  `sea_horaire` time DEFAULT NULL,
  `sea_nbplace` int(11) DEFAULT NULL,
  PRIMARY KEY (`sea_id`),
  KEY `sea_sal_id` (`sea_sal_id`),
  KEY `sea_pre_code` (`sea_pre_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`sea_id`, `sea_sal_id`, `sea_pre_code`, `sea_joursem`, `sea_horaire`, `sea_nbplace`) VALUES
(1, 1, 'YOG', 'Lundi', '10:00:00', 20),
(2, 1, 'MUS', 'Mardi', '14:00:00', 15),
(3, 1, 'CRF', 'Mercredi', '18:00:00', 9),
(4, 2, 'ZUM', 'Jeudi', '17:00:00', 18),
(5, 2, 'BOX', 'Vendredi', '19:00:00', 12),
(6, 3, 'YOG', 'Samedi', '09:00:00', 25),
(7, 3, 'MUS', 'Dimanche', '11:00:00', 18);

-- --------------------------------------------------------

--
-- Structure de la table `typeabonnement`
--

DROP TABLE IF EXISTS `typeabonnement`;
CREATE TABLE IF NOT EXISTS `typeabonnement` (
  `tab_code` varchar(10) NOT NULL,
  `tab_libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`tab_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `typeabonnement`
--

INSERT INTO `typeabonnement` (`tab_code`, `tab_libelle`) VALUES
('BAS', 'Basic'),
('PRE', 'Premium'),
('STD', 'Standard');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_abopresta`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_abopresta`;
CREATE TABLE IF NOT EXISTS `v_abopresta` (
`abo_matricule` int(11)
,`pre_code` varchar(10)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_seance`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_seance`;
CREATE TABLE IF NOT EXISTS `v_seance` (
`sal_nom` varchar(100)
,`pre_libelle` varchar(100)
,`sea_joursem` varchar(10)
,`sea_horaire` time
,`sea_nbplace` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_abopresta`
--
DROP TABLE IF EXISTS `v_abopresta`;

DROP VIEW IF EXISTS `v_abopresta`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_abopresta`  AS SELECT `a2`.`abo_matricule` AS `abo_matricule`, `p`.`pre_code` AS `pre_code` FROM (((`abonne` `a2` join `abonnement` `ab` on(`a2`.`abo_matricule` = `ab`.`ab_abo_matricule`)) join `prestationabonnement` `pa` on(`ab`.`ab_tab_code` = `pa`.`apr_tab_code`)) join `prestation` `p` on(`pa`.`apr_pre_code` = `p`.`pre_code`)) ORDER BY `a2`.`abo_matricule` ASC, `p`.`pre_code` ASC ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_seance`
--
DROP TABLE IF EXISTS `v_seance`;

DROP VIEW IF EXISTS `v_seance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_seance`  AS   (select `s`.`sal_nom` AS `sal_nom`,`p`.`pre_libelle` AS `pre_libelle`,`sc`.`sea_joursem` AS `sea_joursem`,`sc`.`sea_horaire` AS `sea_horaire`,`sc`.`sea_nbplace` AS `sea_nbplace` from ((`prestation` `p` join `seance` `sc`) join `salle` `s`) where `s`.`sal_id` = `sc`.`sea_sal_id` and `sc`.`sea_pre_code` = `p`.`pre_code` order by 1,2,3,4)  ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD CONSTRAINT `abonne_ibfk_1` FOREIGN KEY (`abo_club_id`) REFERENCES `salle` (`sal_id`);

--
-- Contraintes pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `abonnement_ibfk_1` FOREIGN KEY (`ab_abo_matricule`) REFERENCES `abonne` (`abo_matricule`),
  ADD CONSTRAINT `abonnement_ibfk_2` FOREIGN KEY (`ab_tab_code`) REFERENCES `typeabonnement` (`tab_code`);

--
-- Contraintes pour la table `prestationabonnement`
--
ALTER TABLE `prestationabonnement`
  ADD CONSTRAINT `prestationabonnement_ibfk_1` FOREIGN KEY (`apr_tab_code`) REFERENCES `typeabonnement` (`tab_code`),
  ADD CONSTRAINT `prestationabonnement_ibfk_2` FOREIGN KEY (`apr_pre_code`) REFERENCES `prestation` (`pre_code`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`res_sea_id`) REFERENCES `seance` (`sea_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`res_abo_id`) REFERENCES `abonne` (`abo_matricule`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`sea_sal_id`) REFERENCES `salle` (`sal_id`),
  ADD CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`sea_pre_code`) REFERENCES `prestation` (`pre_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
