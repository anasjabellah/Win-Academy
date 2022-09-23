-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 23 sep. 2022 à 07:54
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `winacademy_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `adresse_id` bigint NOT NULL AUTO_INCREMENT,
  `college_numero` bigint DEFAULT NULL,
  `ville_id` bigint DEFAULT NULL,
  PRIMARY KEY (`adresse_id`),
  KEY `college_numero` (`college_numero`),
  KEY `ville_id` (`ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`adresse_id`, `college_numero`, `ville_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4),
(9, 9, 5),
(10, 10, 5);

-- --------------------------------------------------------

--
-- Structure de la table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
CREATE TABLE IF NOT EXISTS `colleges` (
  `college_numero` bigint NOT NULL AUTO_INCREMENT,
  `college_nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`college_numero`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `colleges`
--

INSERT INTO `colleges` (`college_numero`, `college_nom`) VALUES
(1, 'Green Inc'),
(2, 'Welch-Kovacek'),
(3, 'Buckridge-Feest'),
(4, 'Hackett-Aufderhar'),
(5, 'Bailey, Kilback and Leannon'),
(6, 'Stokes Ltd'),
(7, 'Ryan, Keebler and Ortiz'),
(8, 'Gottlieb, Moore and Hamill'),
(9, 'Sanford Inc'),
(10, 'Conn Inc');

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE IF NOT EXISTS `departements` (
  `departement_id` bigint NOT NULL AUTO_INCREMENT,
  `college_numero` bigint DEFAULT NULL,
  `nom_departement` varchar(255) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`departement_id`),
  KEY `college_numero` (`college_numero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`departement_id`, `college_numero`, `nom_departement`, `responsable`, `is_deleted`) VALUES
(1, 1, 'francais', NULL, 0),
(2, 1, 'math', NULL, 0),
(3, 2, 'svt', NULL, 0),
(4, 1, 'svt', NULL, 0),
(5, 1, 'physique', NULL, 0),
(6, 2, 'math', NULL, 0),
(7, 2, 'francais', NULL, 0),
(8, 2, 'arabe', NULL, 0),
(9, 2, 'physique', NULL, 0),
(10, 1, 'arabe', NULL, 0),
(11, 2, 'SI', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
CREATE TABLE IF NOT EXISTS `enseignants` (
  `user_id` bigint NOT NULL,
  `depatement_id` bigint NOT NULL,
  `matiere_id` bigint NOT NULL,
  `is_responsable` tinyint(1) DEFAULT '0',
  `date_prise_fonction` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `departement_id` (`depatement_id`),
  KEY `matiere_id` (`matiere_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`user_id`, `depatement_id`, `matiere_id`, `is_responsable`, `date_prise_fonction`) VALUES
(1, 1, 1, 1, '1990-01-17'),
(2, 5, 5, 1, '2022-09-13'),
(4, 3, 3, 0, '2022-09-06');

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `user_id` bigint NOT NULL,
  `enseignant_id` bigint NOT NULL,
  `groupe_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `enseignant_id` (`enseignant_id`),
  KEY `groupe_id` (`groupe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `etudiants`
--

INSERT INTO `etudiants` (`user_id`, `enseignant_id`, `groupe_id`) VALUES
(3, 1, 1),
(5, 4, 3),
(6, 4, 3),
(7, 1, 1),
(8, 2, 2),
(9, 4, 3),
(10, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE IF NOT EXISTS `groupes` (
  `groupe_id` bigint NOT NULL AUTO_INCREMENT,
  `groupe_nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`groupe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`groupe_id`, `groupe_nom`) VALUES
(1, 'o'),
(2, 'c'),
(3, 'k');

-- --------------------------------------------------------

--
-- Structure de la table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
CREATE TABLE IF NOT EXISTS `matieres` (
  `matiere_id` bigint NOT NULL AUTO_INCREMENT,
  `college_numero` bigint DEFAULT NULL,
  `matiere_nom` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`matiere_id`),
  KEY `college_numero` (`college_numero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `matieres`
--

INSERT INTO `matieres` (`matiere_id`, `college_numero`, `matiere_nom`, `is_deleted`) VALUES
(1, 1, 'math', 0),
(2, 1, 'physique', 0),
(3, 2, 'science', 0),
(4, 1, 'anglais', 0),
(5, 1, 'francais', 0),
(6, 1, 'arabe', 0),
(7, 1, 'SI', 0),
(8, 2, 'math', 0),
(9, 2, 'physique', 0),
(10, 2, 'francais', 0),
(11, 2, 'SI', 0),
(12, 2, 'arabe', 0);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `matiere_id` bigint DEFAULT NULL,
  `user_etudiant_id` bigint DEFAULT NULL,
  `valeur` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`note_id`),
  KEY `matiere_id` (`matiere_id`),
  KEY `user_etudiant_id` (`user_etudiant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `notes`
--

INSERT INTO `notes` (`note_id`, `matiere_id`, `user_etudiant_id`, `valeur`, `is_deleted`) VALUES
(1, 1, 3, 12, 0),
(2, 2, 3, 11, 0),
(3, 5, 3, 19, 0),
(4, 6, 3, 16, 0),
(5, 1, 7, 11, 0),
(6, 2, 7, 10, 0),
(7, 5, 7, 18, 0),
(8, 6, 7, 10, 0),
(9, 7, 7, 10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`role_id`, `nom`) VALUES
(1, 'enseignant'),
(2, 'etudiant'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

DROP TABLE IF EXISTS `salles`;
CREATE TABLE IF NOT EXISTS `salles` (
  `salle_id` bigint NOT NULL AUTO_INCREMENT,
  `college_numero` bigint DEFAULT NULL,
  `matiere_id` bigint DEFAULT NULL,
  `nbr_place` int DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`salle_id`),
  KEY `college_numero` (`college_numero`),
  KEY `matiere_id` (`matiere_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`salle_id`, `college_numero`, `matiere_id`, `nbr_place`, `is_deleted`) VALUES
(1, 1, 1, 24, 0),
(2, 2, 2, 24, 0),
(3, 3, 3, 24, 0),
(4, 4, 4, 24, 0),
(5, 5, 5, 24, 0),
(6, 6, 6, 24, 0),
(7, 7, 7, 24, 0),
(8, 8, 1, 24, 0),
(9, 9, 2, 24, 0),
(10, 10, 3, 24, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `college_numero` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mail` (`mail`),
  KEY `college_numero` (`college_numero`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `college_numero`, `role_id`, `nom`, `prenom`, `mail`, `tel`, `is_deleted`) VALUES
(1, 1, 1, 'Lavon', 'Nienow', 'o\'connell.rosa@example.org', '1-094-927-0664x54383', 0),
(2, 1, 1, 'Moises', 'Jacobson', 'savannah32@example.org', '957-355-5113', 0),
(3, 1, 2, 'Margot', 'Zieme', 'trevion.christiansen@example.com', '925.376.0808x1897', 0),
(4, 2, 1, 'Noemy', 'Shields', 'connelly.sasha@example.org', '803.488.3954', 0),
(5, 2, 2, 'Makenzie', 'Oberbrunner', 'joelle.huel@example.org', '032.515.1701', 0),
(6, 2, 2, 'Alden', 'Hayes', 'zerdman@example.net', '017.152.3139x588', 0),
(7, 1, 2, 'Guadalupe', 'Ebert', 'sonya66@example.net', '367.120.9396', 0),
(8, 1, 2, 'Jairo', 'Marquardt', 'rortiz@example.net', '+90(2)8844057844', 0),
(9, 2, 2, 'Karen', 'Connelly', 'cstark@example.net', '(240)688-8944x94828', 0),
(10, 1, 2, 'Marcelino', 'Wolf', 'medhurst.shad@example.com', '(815)209-3266', 0);

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

DROP TABLE IF EXISTS `villes`;
CREATE TABLE IF NOT EXISTS `villes` (
  `ville_id` bigint NOT NULL AUTO_INCREMENT,
  `ville_nom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `villes`
--

INSERT INTO `villes` (`ville_id`, `ville_nom`) VALUES
(1, 'Port Rheamouth'),
(2, 'New Zetta'),
(3, 'Klockoland'),
(4, 'Cormierberg'),
(5, 'Floside'),
(6, 'South Linnie'),
(7, 'Murielfort'),
(8, 'Lake Paytonchester'),
(9, 'West Emelieside'),
(10, 'Dakotafort');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`college_numero`) REFERENCES `colleges` (`college_numero`),
  ADD CONSTRAINT `adresses_ibfk_2` FOREIGN KEY (`ville_id`) REFERENCES `villes` (`ville_id`);

--
-- Contraintes pour la table `departements`
--
ALTER TABLE `departements`
  ADD CONSTRAINT `departements_ibfk_1` FOREIGN KEY (`college_numero`) REFERENCES `colleges` (`college_numero`);

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `enseignants_ibfk_2` FOREIGN KEY (`depatement_id`) REFERENCES `departements` (`departement_id`),
  ADD CONSTRAINT `enseignants_ibfk_3` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`matiere_id`);

--
-- Contraintes pour la table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `etudiants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `etudiants_ibfk_2` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`user_id`),
  ADD CONSTRAINT `etudiants_ibfk_3` FOREIGN KEY (`groupe_id`) REFERENCES `groupes` (`groupe_id`);

--
-- Contraintes pour la table `matieres`
--
ALTER TABLE `matieres`
  ADD CONSTRAINT `matieres_ibfk_1` FOREIGN KEY (`college_numero`) REFERENCES `colleges` (`college_numero`);

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`matiere_id`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`user_etudiant_id`) REFERENCES `etudiants` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `salles`
--
ALTER TABLE `salles`
  ADD CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`college_numero`) REFERENCES `colleges` (`college_numero`),
  ADD CONSTRAINT `salles_ibfk_2` FOREIGN KEY (`matiere_id`) REFERENCES `matieres` (`matiere_id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`college_numero`) REFERENCES `colleges` (`college_numero`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
