-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 17 juil. 2023 à 19:32
-- Version du serveur : 5.7.36
-- Version de PHP : 8.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `emmapierre`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` text NOT NULL,
  `complement` text,
  `code_postal` varchar(5) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(50) NOT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `adresse`, `complement`, `code_postal`, `ville`, `pays`) VALUES
(1, '114 Enim. Ave', NULL, '43449', 'Hinckley', 'France'),
(2, 'Ap #611-8802 Proin Ave', NULL, '96582', 'Cajazeiras', 'France'),
(3, 'P.O. Box 193, 9298 Sit Street', NULL, '82982', 'Caruaru', 'France'),
(4, '5107 Cras Av.', NULL, '48632', 'Gyeongsan', 'France'),
(5, '966-5897 Ut Ave', NULL, '86216', 'Vereeniging', 'France'),
(6, '201-2773 Arcu. Avenue', NULL, '25926', 'Brønnøysund', 'France'),
(7, '2364 Donec Rd.', NULL, '62354', 'Kimberley', 'France'),
(8, '2077 Tellus Rd.', NULL, '55666', 'Cannole', 'France'),
(9, '7735 A, Rd.', NULL, '79947', 'Beijing', 'France'),
(10, '183-8095 Magna. Ave', NULL, '88647', 'Jeju', 'France'),
(11, 'Ap #551-3425 Lectus Street', NULL, '35717', 'Périgueux', 'France'),
(12, '835-436 Nullam Road', NULL, '81441', 'Certaldo', 'France'),
(13, '653-9378 Orci, St.', NULL, '83313', 'Donetsk', 'France'),
(14, '820-8245 Nulla Road', NULL, '09430', 'Edmundston', 'France'),
(15, 'Ap #770-7875 Varius Av.', NULL, '17365', 'Perth', 'France'),
(16, 'Ap #795-3120 Vulputate, St.', NULL, '90523', 'Oviedo', 'France'),
(17, 'Ap #820-6324 Odio Avenue', NULL, '77259', 'Jaén', 'France'),
(18, '345-5775 Rhoncus. Road', NULL, '34581', 'Wageningen', 'France'),
(19, '315-1068 Molestie Street', NULL, '77363', 'Iqaluit', 'France'),
(20, '5296 Et Avenue', NULL, '96710', 'Guysborough', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `longueur` varchar(30) NOT NULL,
  `prix` float NOT NULL,
  `remise` float NOT NULL,
  `stock` int(4) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_couleur` int(11) NOT NULL,
  PRIMARY KEY (`id_article`),
  KEY `id_type` (`id_type`),
  KEY `id_matiere` (`id_matiere`),
  KEY `id_couleur` (`id_couleur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `code_promo`
--

DROP TABLE IF EXISTS `code_promo`;
CREATE TABLE IF NOT EXISTS `code_promo` (
  `id_code_promo` varchar(50) NOT NULL,
  `remise` float NOT NULL,
  PRIMARY KEY (`id_code_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `code_promo`
--

INSERT INTO `code_promo` (`id_code_promo`, `remise`) VALUES
('20SUR20', 20),
('JOYEUXANNIVMAXIME', 50),
('LOVEJS', 30),
('LOVEPHP', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_code_promo` varchar(50) DEFAULT NULL,
  `date_commande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_reglement` date DEFAULT NULL,
  `id_statut` int(11) NOT NULL,
  `id_adresse_livraison` int(11) NOT NULL,
  `id_adresse_facturation` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_user` (`id_user`),
  KEY `id_code_promo` (`id_code_promo`),
  KEY `id_adresse_livraison` (`id_adresse_livraison`),
  KEY `id_adresse_facturation` (`id_adresse_facturation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_user`, `id_code_promo`, `date_commande`, `date_reglement`, `id_statut`, `id_adresse_livraison`, `id_adresse_facturation`) VALUES
(1, 17, '20SUR20', '2023-07-17 16:18:18', '2023-07-11', 0, 1, 1),
(2, 8, 'LOVEJS', '2023-07-17 16:18:18', '2023-07-16', 0, 7, 13),
(3, 20, NULL, '2023-07-17 16:20:59', NULL, 0, 12, 12),
(4, 6, 'JOYEUXANNIVMAXIME', '2023-07-17 16:20:59', '2023-07-17', 0, 9, 9);

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

DROP TABLE IF EXISTS `couleur`;
CREATE TABLE IF NOT EXISTS `couleur` (
  `id_couleur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_couleur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_commande` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`,`id_article`) USING BTREE,
  KEY `id_article` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nom`) VALUES
(1, 'client'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(50) COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id_statut`, `statut`) VALUES
(1, 'en attente de payement'),
(2, 'en cours de préparation'),
(3, 'préparée'),
(4, 'envoyée'),
(5, 'réceptionnée');

-- --------------------------------------------------------

--
-- Structure de la table `type_article`
--

DROP TABLE IF EXISTS `type_article`;
CREATE TABLE IF NOT EXISTS `type_article` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `genre` enum('h','f') NOT NULL,
  `tel` varchar(15) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_passe` varchar(150) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_adresse` (`id_adresse`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `genre`, `tel`, `date_naissance`, `email`, `mot_passe`, `id_adresse`, `id_role`) VALUES
(1, 'Wade', 'Whilemina', 'h', '02 14 58 79 09', '1971-10-18', 'lacinia@protonmail.edu', 'EGD15HTY5FB', 4, 1),
(2, 'Hutchinson', 'Cheryl', 'f', '03 27 37 20 41', '1982-04-13', 'sed.pede.nec@hotmail.net', 'ORM37ZVU4SC', 9, 1),
(3, 'Rios', 'Caesar', 'f', '08 44 28 08 87', '1976-06-27', 'donec.consectetuer@aol.edu', 'LOA86RVM6LS', 16, 1),
(4, 'Webb', 'Lewis', 'f', '03 89 38 31 29', '1949-11-12', 'integer.vulputate.risus@protonmail.net', 'JNC43UQM0HO', 14, 1),
(5, 'Mcdowell', 'Scarlet', 'f', '03 96 97 28 91', '1969-04-25', 'orci.in@protonmail.ca', 'WEG12NNK7MM', 10, 1),
(6, 'Bender', 'Elijah', 'f', '07 67 55 14 84', '1994-09-03', 'diam@aol.org', 'ETM42PML7IL', 12, 1),
(7, 'Graham', 'Reed', 'h', '07 01 15 81 25', '1989-08-04', 'ut.sem@icloud.couk', 'PBD03XSB9CH', 18, 1),
(8, 'Daugherty', 'Hope', 'f', '03 65 53 33 27', '1958-08-03', 'tellus.nunc.lectus@hotmail.ca', 'DGM78TUN4VH', 4, 1),
(9, 'Spears', 'Edan', 'h', '02 64 60 51 25', '1960-07-08', 'sem.mollis@aol.edu', 'WLO44JVB1LX', 6, 1),
(10, 'Velazquez', 'Mary', 'h', '06 57 61 25 31', '1967-01-13', 'et.magnis@protonmail.ca', 'YUH06OBM6IL', 11, 1),
(11, 'Lindsey', 'Keiko', 'f', '02 21 81 56 93', '1968-04-17', 'phasellus.nulla@yahoo.com', 'RXX13EKW8CM', 17, 1),
(12, 'Calhoun', 'Denton', 'h', '08 78 85 51 85', '1949-04-15', 'diam@protonmail.ca', 'SFR44OUH2NS', 7, 1),
(13, 'Carey', 'Sonia', 'h', '05 34 27 91 84', '1963-07-18', 'sed.et.libero@icloud.edu', 'WCO40YUP8LU', 2, 1),
(14, 'Mccarty', 'Catherine', 'f', '04 59 54 03 36', '1959-05-31', 'vel@icloud.com', 'VHW73YTF3VD', 6, 1),
(15, 'Trevino', 'Jorden', 'h', '08 65 88 20 20', '1978-01-13', 'sed.dui@hotmail.com', 'NMJ31HDG0HC', 12, 1),
(16, 'Garrett', 'Stephen', 'h', '07 74 53 77 71', '1967-07-31', 'at.lacus@yahoo.couk', 'EUR09IVR5UW', 4, 1),
(17, 'Burke', 'Talon', 'f', '07 37 62 71 65', '1962-02-26', 'phasellus.in.felis@google.ca', 'RYK28BSJ0RP', 3, 1),
(18, 'Velez', 'Imogene', 'f', '03 79 51 83 05', '1942-07-16', 'in.mi.pede@aol.ca', 'GDK91IMX4SK', 17, 1),
(19, 'Wise', 'Alan', 'f', '03 35 32 74 74', '1987-06-04', 'montes.nascetur.ridiculus@protonmail.edu', 'GXA55RRH6JO', 3, 1),
(20, 'Farley', 'Zeph', 'h', '01 33 27 12 93', '2008-11-23', 'consectetuer@protonmail.org', 'GJY31PNN8UD', 13, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `id_couleur` FOREIGN KEY (`id_couleur`) REFERENCES `couleur` (`id_couleur`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_matiere` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_type` FOREIGN KEY (`id_type`) REFERENCES `type_article` (`id_type`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `id_adresse_facturation` FOREIGN KEY (`id_adresse_facturation`) REFERENCES `adresse` (`id_adresse`),
  ADD CONSTRAINT `id_adresse_livraison` FOREIGN KEY (`id_adresse_livraison`) REFERENCES `adresse` (`id_adresse`),
  ADD CONSTRAINT `id_code_promo` FOREIGN KEY (`id_code_promo`) REFERENCES `code_promo` (`id_code_promo`),
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `id_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE CASCADE,
  ADD CONSTRAINT `id_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
