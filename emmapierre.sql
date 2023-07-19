-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 19 juil. 2023 à 12:06
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

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

CREATE TABLE `adresse` (
  `id_adresse` int(11) NOT NULL,
  `adresse` text NOT NULL,
  `complement` text,
  `code_postal` varchar(5) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `article` (
  `id_article` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text,
  `longueur` varchar(30) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `remise` float NOT NULL DEFAULT '0',
  `stock` int(4) NOT NULL DEFAULT '2',
  `id_type` int(11) DEFAULT NULL,
  `id_matiere` int(11) DEFAULT NULL,
  `id_couleur` int(11) DEFAULT NULL,
  `remarques` text,
  `photos` json DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `id_collection` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_article`, `nom`, `description`, `longueur`, `prix`, `remise`, `stock`, `id_type`, `id_matiere`, `id_couleur`, `remarques`, `photos`, `id_categorie`, `id_collection`) VALUES
(1, 'Tulum', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires en plaqué or 24 carats et 4 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 33 à 41 cm, conviendra à un cou très fin', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(2, 'Azteca', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires fantaisie en plaqué or 24 carats et 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 39 à 45 cm, ce ras-de-cou magnifiera toutes les morphologies', NULL, 78, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(3, 'Anta', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est simplement mise en valeur par 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, perles Miyuki,longueur environ de 39 à 45 cm, ce ras-de-cou saura vous séduire par son authenticité', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(4, 'Pichu', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 4 perles d\'agate givrée et 6 en hématite, perles Miyuki, autres composants en argent, longueur environ de 33,5 à 39,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(5, 'Jaya', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 6 perles d\'agate givrée et 4 en hématite, perles Miyuki, autres composants en argent, longueur environ de 39 à 46,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(6, 'Sinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en argent comme les autres composants, petite pampille argentée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs froides', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison|Modèle A : ', NULL, 1, 1),
(7, 'Dinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en plaqué or 24 carats comme les autres composants, petite pampille dorée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs chaudes', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(8, 'Square blue', 'Bijou plein de caractère, le rang de 7 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki, chaînette d\'extension et  fermoir en argent, longueur environ de 37 à 41,5 cm. Bracelet assorti', NULL, 65, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(9, 'Mandana', 'On ne pourra que vous remarquer avec ce rang de 15 apatites bleu néon facettées (diamètre d\'environ 4 mm), qui est sublimé par des perles plaqué or 24 carats, comme la chaînette d\'extension et le fermoir, longueur environ de 35,5 à 39,5 cm', NULL, 74, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(10, 'Fish', 'Bracelet en perles Miyuki et rang de 10 apatites bleu néon (diamètre 2-3 mm) agrémenté d\'une pampille argentée et d\'une perle en argent, longueur de 15 à 17 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet fin à moyen', NULL, 40, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(11, 'Square blue', 'Rang de 6 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki et une petite pampille dorée, chaînette d\'extension et  fermoir en plaqué or 24 carats, longueur environ de 16,5 à 19,5 cm', NULL, 38, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(12, 'Lagoon star', 'BO crochets plaqué or rose 24 carats, perles en céramique bleu lagon (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche rock à ce modèle', NULL, 48, 0, 2, 3, 3, 3, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(13, 'Koralia', 'Ce ravissant ras-de-cou en corail rouge et perle de bambou de mer (diamètre 8 mm), autres composants en plaqué or 24 carats, apportera une touche de couleur raffinée qui sublimera votre bronzage, longueur environ de 39 à 43,5 cm', NULL, 64, 0, 2, 1, 4, 4, '', NULL, 1, 1),
(14, 'Green gold leaf', 'De véritables émeraudes pour ce ras-de-cou qui en comptabilise 18 (diamètre 2/3 mm), elles enserrent une jolie feuille de philodendron dorée 14 carats, sur perles Miyuki, autres composants en plaqué or 24 carats, longueur d\'environ de 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine (version argent Green Silver Leaf)', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(15, 'Green silver leaf', 'De véritables émeraudes vert intense  pour ce ras-de-cou qui en comptabilise 18 (diamètre 3/4 mm), elles enserrent une jolie feuille de philodendron plaqué argent, perles Miyuki et hématites, fermoir et chaîne d\'extension en argent, longueur d\'environ 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine  (version dorée Green Gold Leaf)', NULL, 85, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(16, 'Green lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 16 émeraudes de couleur vive, diamètre 3 mm, entrecoupé de perles en hématite, perles Miyuki, autres composants en argent, longueur d\'environ 35,5 à 40,5 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(17, 'Square green', 'Elégant ras-de-cou en perles Miyuki brunes qui mettent en valeur un rang de 14 émeraudes (diamètre 3 mm), autres composants en plaqué or 24 carats, longueur environ de 38 à 42 cm, parfait pour les petites et grandes occasions pour mettre en valeur ses yeux', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(18, 'Square green', 'Bracelet de 15 émeraudes de belle couleur vive, diamètre de 3/4 mm, encadrés par des perles Miyuki dorées argentées et en hématite, longueur de 15 à 17 cm, autres composants en argent', NULL, 72, 0, 2, 2, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(19, 'Baingan', 'Ce collier qui se porte un peu long marie la couleur violette de la fluorite (dimensions 18x14 mm) à la douceur gris bleu des 18 perles de labradorite facettées (diamètre 4 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(20, 'Dhahabi', 'Ce collier qui se porte un peu long met en valeur le gris teinté de violet de la fluorite (dimensions 18x14 mm) à celui des 18 perles de labradorite facettées (diamètre 3 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(21, 'Cuichi', 'Ce collier porte les couleurs de l\'arc-en-ciel de la fluorite (dimensions 18x14 mm) et des perles de rocaille, sublimées par le gris bleu des 16 perles de labradorite facettées (diamètre 4 mm) et le doré des  16 perles carrées en laiton composant un modèle idéal pour l\'été, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(22, 'Luck', 'série composée d\'un pendentif de 3 grenats rhodolite (diamètre d\'environ 6 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur rose foncé qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm', NULL, 62, 0, 2, 1, 10, 7, '', NULL, 1, 4),
(23, 'Darjeeling', 'Nom magique pour un ras-de-cou qui ne l\'est pas moins, les perles Miyuki mates font ressortir le brillant de ces 15 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et des intercalaires en plaqué or 24 carats (comme les autres composants), longueur environ de 35 à 40,5 cm, laissez-vous tenter par l\'orient avec cette pièce originale. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(24, 'Red velvet lotus', 'Le délicat lotus en plaqué or 14 carats est inséré entre 14 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par des intercalaires en plaqué or 24 carats mats comme les perles Miyuki qui font ressortir leur éclat, autres composants en plaqué or 24 carats, longueur environ de 36 à 41 cm, ce ras-du-cou saura vous séduire par son harmonie. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(25, 'Rani', 'Bracelet composé de 12 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par une pampille dorée et des intercalaires en plaqué or 24 carats mats comme les autres composants, perles Miyuki, longueur environ de 16 à 19 cm. Ras-de-cou Darjeeling et Red velvet lotus assortis', NULL, 53, 0, 2, 2, 10, 7, '', NULL, 1, 1),
(26, 'Feather ', 'Bracelet en perles Miyuki et rang de 11 labradorites agrémenté d\'une pampille argentée, diamètre environ 3 mm, longueur de 13 à 15 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet très fin', NULL, 38, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(27, 'Storm', 'Bracelet en perles Miyuki et rang de 9 labradorites agrémenté d\'une pampille argentée, diamètre 3-4 mm, longueur de 15,5 à 17,5 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet moyen', NULL, 43, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(28, 'Blue lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 14 magnifiques lapis-lazuli facetés, diamètre 3 mm, perles Miyuki, autres composants en argent, longueur d\'environ 35 à 39 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 1),
(29, 'Blue pearls', 'Ras-de-cou composé de 3 perles de lapis-lazuli, diamètre 6 mm, mises en valeur par des intercalaires plaqué or 24 carats, perles Miyuki, longueur d\'environ 36 à 40,5 cm, fermoir et chaînette d\'extension en argent, l\'alliance délicate argent/or en fait un bijou simple mais sophistiqué qui vous accompagnera longtemps', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 4),
(30, 'Bali', 'Un ravissant ras-de-cou en perles d\'opale rose et 1 de quartz (diamètre 6 mm) sur perles Miyuki dorées, les autres composants en plaqué or 24 carats, longueur environ de 34 à 42 cm, vous apportera douceur et sérénité symbolisés par le lotus ', NULL, 65, 0, 2, 1, 15, 12, '', NULL, 1, 1),
(31, 'Mahina', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm) mais boostés par 12 perles d\'hématite gris foncé et des perles Miyuki bleu anthracite donnant un côté plus rock à ce modèle, fermoir et chaînette en argent, longueur environ de 48 à 52 cm, série très limitée', NULL, 85, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(32, 'Céleste', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm), perles baroques d\'eau douce, fermoir et chaînette en plaqué or 24 carats, longueur environ de 48 à 52 cm, série très limitée', NULL, 105, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(33, 'Tulum', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires en plaqué or 24 carats et 4 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 33 à 41 cm, conviendra à un cou très fin', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(34, 'Azteca', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires fantaisie en plaqué or 24 carats et 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 39 à 45 cm, ce ras-de-cou magnifiera toutes les morphologies', NULL, 78, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(35, 'Anta', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est simplement mise en valeur par 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, perles Miyuki,longueur environ de 39 à 45 cm, ce ras-de-cou saura vous séduire par son authenticité', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(36, 'Pichu', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 4 perles d\'agate givrée et 6 en hématite, perles Miyuki, autres composants en argent, longueur environ de 33,5 à 39,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(37, 'Jaya', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 6 perles d\'agate givrée et 4 en hématite, perles Miyuki, autres composants en argent, longueur environ de 39 à 46,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(38, 'Sinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en argent comme les autres composants, petite pampille argentée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs froides', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison|Modèle A : ', NULL, 1, 1),
(39, 'Dinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en plaqué or 24 carats comme les autres composants, petite pampille dorée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs chaudes', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(41, 'Square blue', 'Bijou plein de caractère, le rang de 7 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki, chaînette d\'extension et  fermoir en argent, longueur environ de 37 à 41,5 cm. Bracelet assorti', NULL, 65, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(42, 'Mandana', 'On ne pourra que vous remarquer avec ce rang de 15 apatites bleu néon facettées (diamètre d\'environ 4 mm), qui est sublimé par des perles plaqué or 24 carats, comme la chaînette d\'extension et le fermoir, longueur environ de 35,5 à 39,5 cm', NULL, 74, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(43, 'Fish', 'Bracelet en perles Miyuki et rang de 10 apatites bleu néon (diamètre 2-3 mm) agrémenté d\'une pampille argentée et d\'une perle en argent, longueur de 15 à 17 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet fin à moyen', NULL, 40, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(44, 'Square blue', 'Rang de 6 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki et une petite pampille dorée, chaînette d\'extension et  fermoir en plaqué or 24 carats, longueur environ de 16,5 à 19,5 cm', NULL, 38, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(45, 'Lagoon star', 'BO crochets plaqué or rose 24 carats, perles en céramique bleu lagon (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche rock à ce modèle', NULL, 48, 0, 2, 3, 3, 3, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(47, 'Koralia', 'Ce ravissant ras-de-cou en corail rouge et perle de bambou de mer (diamètre 8 mm), autres composants en plaqué or 24 carats, apportera une touche de couleur raffinée qui sublimera votre bronzage, longueur environ de 39 à 43,5 cm', NULL, 64, 0, 2, 1, 4, 4, '', NULL, 1, 1),
(57, 'Green gold leaf', 'De véritables émeraudes pour ce ras-de-cou qui en comptabilise 18 (diamètre 2/3 mm), elles enserrent une jolie feuille de philodendron dorée 14 carats, sur perles Miyuki, autres composants en plaqué or 24 carats, longueur d\'environ de 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine (version argent Green Silver Leaf)', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(58, 'Green silver leaf', 'De véritables émeraudes vert intense  pour ce ras-de-cou qui en comptabilise 18 (diamètre 3/4 mm), elles enserrent une jolie feuille de philodendron plaqué argent, perles Miyuki et hématites, fermoir et chaîne d\'extension en argent, longueur d\'environ 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine  (version dorée Green Gold Leaf)', NULL, 85, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(59, 'Green lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 16 émeraudes de couleur vive, diamètre 3 mm, entrecoupé de perles en hématite, perles Miyuki, autres composants en argent, longueur d\'environ 35,5 à 40,5 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(60, 'Square green', 'Elégant ras-de-cou en perles Miyuki brunes qui mettent en valeur un rang de 14 émeraudes (diamètre 3 mm), autres composants en plaqué or 24 carats, longueur environ de 38 à 42 cm, parfait pour les petites et grandes occasions pour mettre en valeur ses yeux', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(61, 'Square green', 'Bracelet de 15 émeraudes de belle couleur vive, diamètre de 3/4 mm, encadrés par des perles Miyuki dorées argentées et en hématite, longueur de 15 à 17 cm, autres composants en argent', NULL, 72, 0, 2, 2, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(62, 'Baingan', 'Ce collier qui se porte un peu long marie la couleur violette de la fluorite (dimensions 18x14 mm) à la douceur gris bleu des 18 perles de labradorite facettées (diamètre 4 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(63, 'Dhahabi', 'Ce collier qui se porte un peu long met en valeur le gris teinté de violet de la fluorite (dimensions 18x14 mm) à celui des 18 perles de labradorite facettées (diamètre 3 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(64, 'Cuichi', 'Ce collier porte les couleurs de l\'arc-en-ciel de la fluorite (dimensions 18x14 mm) et des perles de rocaille, sublimées par le gris bleu des 16 perles de labradorite facettées (diamètre 4 mm) et le doré des  16 perles carrées en laiton composant un modèle idéal pour l\'été, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(65, 'Luck', 'série composée d\'un pendentif de 3 grenats rhodolite (diamètre d\'environ 6 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur rose foncé qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm', NULL, 62, 0, 2, 1, 10, 7, '', NULL, 1, 4),
(66, 'Darjeeling', 'Nom magique pour un ras-de-cou qui ne l\'est pas moins, les perles Miyuki mates font ressortir le brillant de ces 15 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et des intercalaires en plaqué or 24 carats (comme les autres composants), longueur environ de 35 à 40,5 cm, laissez-vous tenter par l\'orient avec cette pièce originale. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(67, 'Red velvet lotus', 'Le délicat lotus en plaqué or 14 carats est inséré entre 14 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par des intercalaires en plaqué or 24 carats mats comme les perles Miyuki qui font ressortir leur éclat, autres composants en plaqué or 24 carats, longueur environ de 36 à 41 cm, ce ras-du-cou saura vous séduire par son harmonie. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(68, 'Rani', 'Bracelet composé de 12 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par une pampille dorée et des intercalaires en plaqué or 24 carats mats comme les autres composants, perles Miyuki, longueur environ de 16 à 19 cm. Ras-de-cou Darjeeling et Red velvet lotus assortis', NULL, 53, 0, 2, 2, 10, 7, '', NULL, 1, 1),
(72, 'Feather ', 'Bracelet en perles Miyuki et rang de 11 labradorites agrémenté d\'une pampille argentée, diamètre environ 3 mm, longueur de 13 à 15 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet très fin', NULL, 38, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(73, 'Storm', 'Bracelet en perles Miyuki et rang de 9 labradorites agrémenté d\'une pampille argentée, diamètre 3-4 mm, longueur de 15,5 à 17,5 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet moyen', NULL, 43, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(74, 'Blue lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 14 magnifiques lapis-lazuli facetés, diamètre 3 mm, perles Miyuki, autres composants en argent, longueur d\'environ 35 à 39 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 1),
(75, 'Blue pearls', 'Ras-de-cou composé de 3 perles de lapis-lazuli, diamètre 6 mm, mises en valeur par des intercalaires plaqué or 24 carats, perles Miyuki, longueur d\'environ 36 à 40,5 cm, fermoir et chaînette d\'extension en argent, l\'alliance délicate argent/or en fait un bijou simple mais sophistiqué qui vous accompagnera longtemps', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 4),
(80, 'Bali', 'Un ravissant ras-de-cou en perles d\'opale rose et 1 de quartz (diamètre 6 mm) sur perles Miyuki dorées, les autres composants en plaqué or 24 carats, longueur environ de 34 à 42 cm, vous apportera douceur et sérénité symbolisés par le lotus ', NULL, 65, 0, 2, 1, 15, 12, '', NULL, 1, 1),
(81, 'Mahina', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm) mais boostés par 12 perles d\'hématite gris foncé et des perles Miyuki bleu anthracite donnant un côté plus rock à ce modèle, fermoir et chaînette en argent, longueur environ de 48 à 52 cm, série très limitée', NULL, 85, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(82, 'Céleste', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm), perles baroques d\'eau douce, fermoir et chaînette en plaqué or 24 carats, longueur environ de 48 à 52 cm, série très limitée', NULL, 105, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(84, 'Tulum', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires en plaqué or 24 carats et 4 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 33 à 41 cm, conviendra à un cou très fin', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(85, 'Azteca', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires fantaisie en plaqué or 24 carats et 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 39 à 45 cm, ce ras-de-cou magnifiera toutes les morphologies', NULL, 78, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(86, 'Anta', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est simplement mise en valeur par 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, perles Miyuki,longueur environ de 39 à 45 cm, ce ras-de-cou saura vous séduire par son authenticité', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(87, 'Pichu', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 4 perles d\'agate givrée et 6 en hématite, perles Miyuki, autres composants en argent, longueur environ de 33,5 à 39,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(88, 'Jaya', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 6 perles d\'agate givrée et 4 en hématite, perles Miyuki, autres composants en argent, longueur environ de 39 à 46,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(89, 'Sinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en argent comme les autres composants, petite pampille argentée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs froides', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison|Modèle A : ', NULL, 1, 1),
(90, 'Dinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en plaqué or 24 carats comme les autres composants, petite pampille dorée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs chaudes', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(91, 'Kristina', 'Ravissantes petites créoles plaqué or rose 24 carats, diamètre 1,2 cm agrémentées de magnifiques amzonites (diamètre d\'environ 8/9 mm), hauteur totale 2,6 cm, vous ne vous lasserez pas de leur couleur unique', NULL, 55, 0, 2, 3, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(92, 'Square blue', 'Bijou plein de caractère, le rang de 7 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki, chaînette d\'extension et  fermoir en argent, longueur environ de 37 à 41,5 cm. Bracelet assorti', NULL, 65, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(93, 'Mandana', 'On ne pourra que vous remarquer avec ce rang de 15 apatites bleu néon facettées (diamètre d\'environ 4 mm), qui est sublimé par des perles plaqué or 24 carats, comme la chaînette d\'extension et le fermoir, longueur environ de 35,5 à 39,5 cm', NULL, 74, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(94, 'Fish', 'Bracelet en perles Miyuki et rang de 10 apatites bleu néon (diamètre 2-3 mm) agrémenté d\'une pampille argentée et d\'une perle en argent, longueur de 15 à 17 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet fin à moyen', NULL, 40, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(95, 'Square blue', 'Rang de 6 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki et une petite pampille dorée, chaînette d\'extension et  fermoir en plaqué or 24 carats, longueur environ de 16,5 à 19,5 cm', NULL, 38, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(96, 'Lagoon star', 'BO crochets plaqué or rose 24 carats, perles en céramique bleu lagon (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche rock à ce modèle', NULL, 48, 0, 2, 3, 3, 3, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(97, 'Marjane', 'Grand sautoir de perles de corail et 13 perles de bambou de mer sculptées (diamètre 8 mm), hauteur approximative de 60 cm, qui sublimera toutes vos tenues d\'été', NULL, 82, 0, 2, 4, 4, 4, '', NULL, 2, 1),
(98, 'Koralia', 'Ce ravissant ras-de-cou en corail rouge et perle de bambou de mer (diamètre 8 mm), autres composants en plaqué or 24 carats, apportera une touche de couleur raffinée qui sublimera votre bronzage, longueur environ de 39 à 43,5 cm', NULL, 64, 0, 2, 1, 4, 4, '', NULL, 1, 1),
(99, 'Gypsy Koralia', 'Hauteur d\'environ 51 cm pour ce sautoir, le cordon en chanvre orangé est agrémenté de perles en céramique rouge qui se marient parfaitement à la grosse perle en véritable corail d\'un diamètre d\'environ 1,6 cm, cette pièce unique apportera une touche bohème à vos tenues', NULL, 55, 0, 2, 4, 4, 4, '', NULL, 2, 1),
(100, 'Alexa ', 'BO crochets en plaqué or 14 carats réhaussés d\'une perle en cristal de bohème verte et parme surmontant une pampille dorée, hauteur totale d\'environ 4,5 cm, vous ne pourrez plus vous passer de leur éclat discret', NULL, 35, 0, 2, 3, 5, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(101, 'Ara', 'BO crochets, créoles et lotus en plaqué or 14 carats et perle de cristal vert, diamètre 3 cm, hauteur d\'environ 5 cm, elle s\'accorderont parfaitement avec un teint doré ou brun mais aussi flatteront les blondes', NULL, 47, 0, 2, 3, 5, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(102, 'Blu', 'BO crochets, créoles et lotus en plaqué or 14 carats et perles en cristal vert, diamètre 3 cm, hauteur d\'environ 5 cm, elle s\'accorderont parfaitement avec un teint doré ou brun mais aussi aux blondes, ce subtil dégradé de vert mettra particulièrement les yeux bleus en valeur', NULL, 45, 0, 2, 4, 6, 6, '', NULL, 1, 1),
(103, 'Yona', 'Charme subtilement oriental pour ce sautoir d\'une hauteur d\'environ 56 cm, les perles de rocaille bronze font ressortir l\'éclat des perles japonaises Tensha et en cristal, intercalaires en plaqué or 24 carats, vous ne pourrez plus vous passer du raffinement de cette pièce unique ', NULL, 88, 0, 2, 4, 6, 6, '', NULL, 2, 1),
(104, 'Gaby', 'BO crochets plaqué or 14 carats, pampille dorée et éventail en résine écaille de tortue largeur 3 cm, hauteur totale environ 4,3 cm, très légères, elles apporteront une touche tendance à votre look', NULL, 42, 0, 2, 3, 7, 6, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(105, 'Gastby', 'BO crochets & créoles plaqué or 14 carats, diamètre 4 cms,  pampille dorée, éventail en résine écaille de tortue et perles de rocaille, hauteur totale environ 6,3 cm, légères et aériennes, ces BO elles vous accompagneront d\'un doux éclat 24/24', NULL, 50, 0, 2, 3, 7, 6, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(106, 'Sophie', 'BO crochets plaqué or 14 carats et laiton, pampille dorée et éventail en résine écaille de tortue largeur 3 cm, hauteur totale environ 7,3 cm, elles souligneront subtilement votre port de tête', NULL, 53, 0, 2, 3, 7, 6, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(107, 'Joséphine', 'Ecaille de tortue en résine de 3 cm et pièce en laiton, perle en pierre naturelle et crochet fermé compose ce modèle néo-rétro sophistiqué, hauteur d\'environ 6,5 cm, il reste léger aux oreilles', NULL, 42, 0, 2, 3, 7, 6, '', NULL, 1, 1),
(108, 'Green gold leaf', 'De véritables émeraudes pour ce ras-de-cou qui en comptabilise 18 (diamètre 2/3 mm), elles enserrent une jolie feuille de philodendron dorée 14 carats, sur perles Miyuki, autres composants en plaqué or 24 carats, longueur d\'environ de 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine (version argent Green Silver Leaf)', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(109, 'Green silver leaf', 'De véritables émeraudes vert intense  pour ce ras-de-cou qui en comptabilise 18 (diamètre 3/4 mm), elles enserrent une jolie feuille de philodendron plaqué argent, perles Miyuki et hématites, fermoir et chaîne d\'extension en argent, longueur d\'environ 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine  (version dorée Green Gold Leaf)', NULL, 85, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(110, 'Green lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 16 émeraudes de couleur vive, diamètre 3 mm, entrecoupé de perles en hématite, perles Miyuki, autres composants en argent, longueur d\'environ 35,5 à 40,5 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(111, 'Square green', 'Elégant ras-de-cou en perles Miyuki brunes qui mettent en valeur un rang de 14 émeraudes (diamètre 3 mm), autres composants en plaqué or 24 carats, longueur environ de 38 à 42 cm, parfait pour les petites et grandes occasions pour mettre en valeur ses yeux', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(112, 'Square green', 'Bracelet de 15 émeraudes de belle couleur vive, diamètre de 3/4 mm, encadrés par des perles Miyuki dorées argentées et en hématite, longueur de 15 à 17 cm, autres composants en argent', NULL, 72, 0, 2, 5, 9, 5, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(113, 'Baingan', 'Ce collier qui se porte un peu long marie la couleur violette de la fluorite (dimensions 18x14 mm) à la douceur gris bleu des 18 perles de labradorite facettées (diamètre 4 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(114, 'Dhahabi', 'Ce collier qui se porte un peu long met en valeur le gris teinté de violet de la fluorite (dimensions 18x14 mm) à celui des 18 perles de labradorite facettées (diamètre 3 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(115, 'Cuichi', 'Ce collier porte les couleurs de l\'arc-en-ciel de la fluorite (dimensions 18x14 mm) et des perles de rocaille, sublimées par le gris bleu des 16 perles de labradorite facettées (diamètre 4 mm) et le doré des  16 perles carrées en laiton composant un modèle idéal pour l\'été, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(116, 'Luck', 'série composée d\'un pendentif de 3 grenats rhodolite (diamètre d\'environ 6 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur rose foncé qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm', NULL, 62, 0, 2, 1, 10, 7, '', NULL, 1, 4),
(117, 'Darjeeling', 'Nom magique pour un ras-de-cou qui ne l\'est pas moins, les perles Miyuki mates font ressortir le brillant de ces 15 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et des intercalaires en plaqué or 24 carats (comme les autres composants), longueur environ de 35 à 40,5 cm, laissez-vous tenter par l\'orient avec cette pièce originale. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(118, 'Red velvet lotus', 'Le délicat lotus en plaqué or 14 carats est inséré entre 14 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par des intercalaires en plaqué or 24 carats mats comme les perles Miyuki qui font ressortir leur éclat, autres composants en plaqué or 24 carats, longueur environ de 36 à 41 cm, ce ras-du-cou saura vous séduire par son harmonie. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(119, 'Rani', 'Bracelet composé de 12 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par une pampille dorée et des intercalaires en plaqué or 24 carats mats comme les autres composants, perles Miyuki, longueur environ de 16 à 19 cm. Ras-de-cou Darjeeling et Red velvet lotus assortis', NULL, 53, 0, 2, 2, 10, 7, '', NULL, 1, 1),
(120, 'Farah', 'Double plaisir pour ce magnifique collier qui se porte selon votre humeur en sautoir ou double ras-du-cou, il incarne l\'esprit bohême chic d\'Emma Pierre avec ses grenats rhodolites (4 mm de diamètre) réhaussées par des intercalaires en plaqué or 24 carats et par la couleur bronze des perles de rocaille, les pampilles apportent le côté mode à ce modèle', NULL, 86, 0, 2, 5, 10, 2, '', NULL, 1, 1),
(121, 'Amorgos', 'Hauteur d\'environ 58 cm pour ce sautoir en perles argentées qui font ressortir les différentes nuances  de celles en jade bleu et verres travaillé à la main, je l\'ai prénommé Amorgos, île des Cyclades où l\'on retrouve les couleurs employées, l\'outremer de la mer Egée et le blanc et bleu éclatants des habitations, pièce unique', NULL, 88, 0, 2, 4, 11, 8, '', NULL, 2, 1),
(122, 'Moon', 'Entièrement en argent, ces BO crochets ovales d\'une hauteur d\'environ 3,9 cm supportent un rang de 5 labradorites facettées brillant discrètement d\'une douce couleur gris bleu, une valeur sûre tout au long de l\'année', NULL, 49, 0, 2, 2, 12, 9, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 1),
(123, 'Feather ', 'Bracelet en perles Miyuki et rang de 11 labradorites agrémenté d\'une pampille argentée, diamètre environ 3 mm, longueur de 13 à 15 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet très fin', NULL, 38, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(124, 'Storm', 'Bracelet en perles Miyuki et rang de 9 labradorites agrémenté d\'une pampille argentée, diamètre 3-4 mm, longueur de 15,5 à 17,5 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet moyen', NULL, 43, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(125, 'Blue lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 14 magnifiques lapis-lazuli facetés, diamètre 3 mm, perles Miyuki, autres composants en argent, longueur d\'environ 35 à 39 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 1),
(126, 'Blue pearls', 'Ras-de-cou composé de 3 perles de lapis-lazuli, diamètre 6 mm, mises en valeur par des intercalaires plaqué or 24 carats, perles Miyuki, longueur d\'environ 36 à 40,5 cm, fermoir et chaînette d\'extension en argent, l\'alliance délicate argent/or en fait un bijou simple mais sophistiqué qui vous accompagnera longtemps', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 4),
(127, 'Blue pearls', 'Rang de 12 magnifiques lapis-lazuli facettés, diamètre 3 mm, perles Miyuki, autres composants en argent qu\'une petite pampille argentée souligne de façon impertinente', NULL, 49, 0, 2, 2, 13, 10, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 1),
(128, 'Kirsten', 'Ravissantes petites créoles plaqué or rose 24 carats, diamètre 1,2 cm agrémentées de lapis+lazuli (diamètre d\'environ8 mm), hauteur totale 2,6 cm, elles accompagneront toutes vos tenues', NULL, 50, 0, 2, 3, 13, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(129, 'Kendra', 'Allie les différentes tonalités de brun de l\'œil-de-tigre, ambre et perles ethniques aux perles de rocaille délicatement irisées, à porter en toutes saisons et personnalisable', NULL, 74, 0, 2, 4, 14, 11, '', NULL, 1, 1),
(130, 'Alexandra', 'Des perles Miuki dorées réchauffent le rose délicat d\'une opale et perles de quartz givré, autres composants en plaqué or 24 carats, longeur d\'environ 41 à 44 cms, vous serez séduite par son côté précieux ', NULL, 65, 0, 2, 1, 15, 12, '', NULL, 1, 1),
(131, 'Bali', 'Un ravissant ras-de-cou en perles d\'opale rose et 1 de quartz (diamètre 6 mm) sur perles Miyuki dorées, les autres composants en plaqué or 24 carats, longueur environ de 34 à 42 cm, vous apportera douceur et sérénité symbolisés par le lotus ', NULL, 65, 0, 2, 1, 15, 12, '', NULL, 1, 1),
(132, 'Mahina', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm) mais boostés par 12 perles d\'hématite gris foncé et des perles Miyuki bleu anthracite donnant un côté plus rock à ce modèle, fermoir et chaînette en argent, longueur environ de 48 à 52 cm, série très limitée', NULL, 85, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3);
INSERT INTO `article` (`id_article`, `nom`, `description`, `longueur`, `prix`, `remise`, `stock`, `id_type`, `id_matiere`, `id_couleur`, `remarques`, `photos`, `id_categorie`, `id_collection`) VALUES
(133, 'Céleste', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm), perles baroques d\'eau douce, fermoir et chaînette en plaqué or 24 carats, longueur environ de 48 à 52 cm, série très limitée', NULL, 105, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(134, 'Babylone', 'BO crochets plaqué or 14 carats et laiton, pampilles dorées, perles Miyuki bleu cobalt, rocaille dorée et perle en cristal bleu, hauteur 5,5 cm, la touche orientale apportée par les différentes matières dorées met en valeur le bleu profond des perles', NULL, 53, 0, 2, 3, 17, 8, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(135, 'Bora-Bora black', 'BO crochets plaqué or rose 24 carats, perles baroques noires teintées (diamètre environ 1 cm) surmontées d\'un cristal brun, hauteur d\'environ 3,5 cm, l\'imperfection parfaite de ces perles apportera une touche glam à un classique', NULL, 58, 0, 2, 3, 18, 9, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone|NB : les perles naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 2),
(136, 'Pink star', 'BO crochets plaqué or rose 24 carats, perles de culture d\'eau douce couleur pêche (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche originale à l\'intemporalité des perles', NULL, 55, 0, 2, 3, 18, 12, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(137, 'Bora-Bora pink', 'BO crochets plaqué or rose 24 carats, perles baroques noires teintées (diamètre environ 1 cm) surmontées d\'un cristal rose soutenu, hauteur d\'environ 3,5 cm, l\'imperfection parfaite de ces perles apportera une touche glam à un classique', NULL, 58, 0, 2, 3, 18, 9, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone|NB : les perles naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 2),
(138, 'White star', 'BO crochets plaqué or rose 24 carats, perles de culture d\'eau douce blanche (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche originale à l\'intemporalité des perles', NULL, 55, 0, 2, 3, 18, 13, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(139, 'Manua', 'Les perles Miyuki bronze mettent particulièrement en valeur cette perle de nacre baroque d\'une rare couleur dorée, autres composants en plaqué or 24 carats, longueur de 40,5 à 45 cm, attention pièce unique !', NULL, 85, 0, 2, 1, 18, 14, '', NULL, 1, 2),
(140, 'Hina', 'Les perles Miyuki gris métal mettent particulièrement en valeur cette perle de nacre baroque avec des irisations aubergine, autres composants en argent, longueur de 36,5 à 41 cm, attention pièce unique !', NULL, 85, 0, 2, 1, 18, 9, '', NULL, 1, 2),
(141, 'Tahia', 'Les perles Miyuki gris foncé mettent particulièrement en valeur cette perle de nacre baroque couleur bleu et reflets aubergine, autres composants en plaqué or 24 carats, longueur de 41 à 45,5 cm, attention pièce unique !', NULL, 85, 0, 2, 1, 18, 9, '', NULL, 1, 2),
(142, 'Pink May Ling', 'Bracelet en perles Miyuki, perle en quartz rose ovale d\'environ 1 cm et 3 perles baroques d\'eau douce rosée, autres composants en plaqué or 24 carats, il allie le raffinement des perles à la modernité de la pierre et conviendra à tous types de poignets', NULL, 49, 0, 2, 2, 18, 12, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 2),
(143, 'White May Ling', 'Bracelet en perles Miyuki, perle en quartz rose ovale d\'environ 1 cm et 3 perles baroques d\'eau douce blanches, autres composants en argent et plaqué or 24 carats, il allie le raffinement des perles à la modernité de la pierre et conviendra à tous types de poignets', NULL, 49, 0, 2, 2, 18, 12, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 2),
(144, 'White May   ', 'Bracelet en perles Miyuki, perle en quartz rose rectangulaire d\'environ 1 cm et 3 perles baroques d\'eau douce blanches, autres composants en plaqué or 24 carats, il allie le raffinement des perles à la modernité de la pierre et conviendra à tous types de poignets', NULL, 49, 0, 2, 2, 18, 12, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 2),
(145, 'Paua', 'Sophistication pour ce sautoir qui allie le raffinement des perles de nacre à celles de jade vert et d\'abalone pour une hauteur d\'environ 57 cm, les perles de rocaille turquoise les mettent subtilement en valeur, il pourra être porté en toutes saisons comme sur la photo avec un pull blanc', NULL, 92, 0, 2, 4, 18, 2, '', NULL, 2, 1),
(146, 'Taori', 'Ce collier d\'une hauteur d\'environ 43 cm composé de perles de nacre et abalone, pierre dure et cristal pour les noires, soulignées par des perles de rocaille turquoise en font un bijou très facile à porter et qui ira avec beaucoup de vos tenues, été comme hiver', NULL, 85, 0, 2, 4, 18, 2, '', NULL, 2, 1),
(147, 'Alba', 'Les perles revisitées avec ce bracelet composé de 8 perles d\'eau douce baroques, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, le modèle proposé arbore une jolie perle travaillée en plaqué or 24 carats et d\'autres plus petites, comme le fermoir et la chaînette d\'extension, perles Miyuki, ras-de-cou assorti', NULL, 49, 0, 2, 2, 18, 13, 'modèle A : longueur d\'environ 15,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 1),
(148, 'Albane', 'Les perles revisitées avec ce bracelet composé de 8 perles d\'eau douce baroques entourant une plus grosse, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, autres perles, fermoir et la chaînette d\'extension en plaqué or 24 carats, perles Miyuki, ras-de-cou assorti', NULL, 47, 0, 2, 2, 18, 13, 'modèle A : longueur d\'environ 15,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 1),
(149, 'Alba', 'Les perles revisitées avec ce ras-de-cou composé de 14 perles d\'eau douce baroques, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, le modèle proposé arbore une jolie perle travaillée en plaqué or 24 carats et d\'autres plus petites, comme le fermoir et la chaînette d\'extension, perles Miyuki, bracelet assorti', NULL, 77, 0, 2, 1, 18, 13, 'modèle A : longueur d\'environ 36 à 41 cm|modèle B : longueur d\'environ 41 à 47 cm', NULL, 1, 1),
(150, 'Albane', 'Les perles revisitées avec ce ras-de-cou composé de 10 perles d\'eau douce baroques entourant une plus grosse, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, autres perles, fermoir et la chaînette d\'extension en plaqué or 24 carats, perles Miyuki, bracelet assorti', NULL, 72, 0, 2, 1, 18, 13, 'modèle A : longueur d\'environ 36 à 41 cm|modèle B : longueur d\'environ 41 à 47 cm', NULL, 1, 1),
(151, 'Romilda', 'Ce collier unique porte le nom de mon arrière-grand-mère Romilda, qui signifie \"guerrier glorieux\" et je peux vous assurer qu\'elle le portait très bien ! Les perles de Murano d\'un bleu soutenu pailleté d\'or ont été chinées à Budapest et les noires en pierres dures', NULL, 75, 0, 2, 5, 19, 15, '', NULL, 1, 1),
(152, 'Bubble', 'Rien de plus facile d\'être de bonne humeur avec ce sautoir, ses différentes nuances de vert s\'accorde étonnamment avec beaucoup de tenues, hauteur de 55 cm, perles en verre et en plastique', NULL, 65, 0, 2, 4, 19, 9, '', NULL, 1, 1),
(153, 'Sofia', 'Voilà une création dont vous ne pourrez plus vous passez, avec ces délicates perles soufflées en verre et tourmaline, leurs multiples nuances de gris apporteront un chic infini à vos vêtements les plus simples, hauteur de 52 cm', NULL, 88, 0, 2, 4, 19, 9, '', NULL, 1, 1),
(154, 'Rosée du Matin', 'BO crochets, créoles et lotus en plaqué or 14 carats, diamètre 3 cm, hauteur d\'environ 5 cm, perle baroque d\'eau douce blanche accompagnant celles en cristal rose, ces BO vous apporteront une fraîcheur douce toute la journée', NULL, 42, 0, 2, 3, 20, 12, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(155, 'Eloise', 'Série Bridgerton ! Perles baroques d\'eau douce pour réactualiser le bracelet de perles traditionnel que pourrait porter Eloise, la jeune fille curieuse de la série, subtilement réhaussées par de jolis cristaux rose pâle et autres composants en plaqué or 24 carats, vous voilà transportée au coeur de la régence anglaise !', NULL, 69, 0, 2, 2, 20, 12, 'Modèle A : longueur d\'environ 14,5 à 17 cm|Modèle B : longueur d\'environ 16 à 19 cm', NULL, 1, 1),
(156, 'Zahri', 'Ce sautoir argenté, blanc et gris est composé de perles de nacre grise associées à celles en verre en provenance de Budapest, d\'une hauteur d\'environ 50 cm, il sublimera vos tenues noires ou blanches en apportant cette note chic et choc d\'une pièce unique', NULL, 88, 0, 2, 4, 1, 9, '', NULL, 2, 1),
(157, 'Caraïbes', 'BO crochets, créoles et philodendron plaqué or 14 carats, diamètre 4 cm, hauteur d\'environ 6 cm, anneau en émail bleu canard, une touche d\'exotisme qui s\'invite facilement en ville', NULL, 48, 0, 2, 3, 1, 8, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(158, 'Manaus', 'BO crochets & créoles plaqué or 14 carats, diamètre 4 cms,  pampille éventail en émail bleu canard, délicates plumes bleues et jaunes, perles en verre, hauteur totale environ 6,3 cm, vivez cet été au rythme de la samba avec ces créations originales et légères', NULL, 53, 0, 2, 3, 1, 16, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(159, 'Rio', 'BO crochets & créoles plaqué or 14 carats, diamètre 4 cms,  pampille éventail en émail bleu canard, délicates plumes bleues et jaunes, perles en verre, hauteur totale environ 6,3 cm, vivez cet été au rythme de la samba avec ces créations originales et légères', NULL, 53, 0, 2, 3, 1, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(160, 'Copacabana', 'BO crochets & créoles légères comme une plume, plaqué or 14 carats, de 4 cm de diamètre, hauteur d\'environ 6 cm, agrémentées d\'une pampille en émail rouge et de fines plumes fuchsia, perles de rocaille rouge et or, la gaîté de ces BO vous accompagnera jusqu\'à l\'automne !', NULL, 54, 0, 2, 3, 1, 17, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(161, 'Artemis', 'BO crochets, créoles en plaqué or 14 carats, diamètre 3 cm, hauteur d\'environ 5 cm, ces petites plumes mutines vous feront voler de vos propres ailes', NULL, 44, 0, 2, 3, 1, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(162, 'Athéna', 'Les couleurs complémentaires de ces 5 quartz sont mises en valeur par des perles Miyuki dorées, autres composants en plaqué or 24 carats,  longeur d\'environ 41 à 44 cms, le quartz porté à même la peau rassure, détend, apaise les émotions fortes pour mieux les vivre et les accepter', NULL, 61, 0, 2, 1, 1, 18, '', NULL, 1, 1),
(163, 'Sekhmet', 'Les couleurs complémentaires de ces 3 quartz sont mises en valeur par des perles Miyuki dorées, perles et autres composants en plaqué or 24 carats,  longeur d\'environ 41 à 44 cms, le quartz porté à même la peau rassure, détend, apaise les émotions fortes pour mieux les vivre et les accepter', NULL, 61, 0, 2, 1, 1, 18, '', NULL, 1, 1),
(164, 'Arjumand', 'Délicat collier en véritables rubis (diamètre 4 mm) et perles Miyuki dorées, les autres composants en plaqué or 24 carats, longueur environ de 36 à 43 cm, le pendentif en filigrane golden rose met en valeur les différentes nuances des rubis, ce qui rend ce ras-de-cou tout simplement irrésistible', NULL, 89, 0, 2, 1, 1, 12, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(165, 'Square red', 'Elégant ras-de-cou en perles Miyuki dorées qui mettent en valeur un rang de 18 rubis (diamètre 4 mm) et perles en hématite couleur argent, les autres composants en argent, longueur environ de 39 à 45 cm, parfait pour les petites et grandes occasions', NULL, 92, 0, 2, 1, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(166, 'Red square lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 16 magnifiques rubis, diamètre 4 mm, entrecoupé de perles en hématite, perles Miyuki, autres composants en argent, longueur d\'environ 41 à 45 cm, l\'alliance de yin et de yang de ce modèle saura séduire une personnalité forte', NULL, 92, 0, 2, 1, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(167, 'Red lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 14 rubis rose foncé, diamètre 3/4 mm, perles Miyuki, autres composants en argent, longueur d\'environ 37,5 à 41,5 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou fin', NULL, 85, 0, 2, 1, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(168, 'Family Red', 'Fin bracelet pour mini poignet, perles Miyuki dorées argentées encadrant un rang de 14 rubis, diamètre 2/3 mm, longueur de 13 à 15 cm, autres composants en argent', NULL, 63, 0, 2, 2, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(169, 'Square red', 'Bracelet de 12 rubis, diamètre de 4/5 mm, encadrés par des perles Miyuki dorées argentées et en hématite, longueur de 16 à 18 cm, autres composants en argent, convient pour poignet large', NULL, 72, 0, 2, 2, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(170, 'Daphne', 'Série Bridgerton ! J\'aurais bien vu ce double ras-de-cou orner le cou de Daphne, ces rangs de magnifiques rubis (diamètre d\'environ 3 mm) sublimés par des perles japonaises dorées mat mettraient particulièr, autres composants en plaqué or 24 caratsement en valeur sa délicatesse, ou pourquoi pas la vôtre ! Une petite pampille dorée apporte une touche impertinente à ce modèle intemporel , autres composants en plaqué or 24 carats, bracelet assorti', NULL, 93, 0, 2, 1, 1, 19, 'Modèle A (perles rubis de 3 mm) : longueur d\'environ 69 à 74 cm|Modèle B (perles rubis de 4 mm) : longueur d\'environ 16 à 19 cm', NULL, 1, 1),
(171, 'Daphne', 'Série Bridgerton ! J\'aurais bien vu ce double bracelet orner le poignet de Daphne, ces rangs de magnifiques rubis (diamètre d\'environ 3 mm) sublimés par des perles japonaises dorées mat mettraient particulièrement en valeur sa délicatesse, ou pourquoi pas la vôtre ! Une petite pampille dorée apporte une touche impertinente à ce modèle intemporel, autres composants en plaqué or 24 carats, ras-de-cou asdorti', NULL, 78, 0, 2, 2, 1, 19, 'Modèle A (perles rubis de 3 mm) : longueur d\'environ 14,5 à 17 cm|Modèle B (perles rubis de 4 mm) : longueur d\'environ 16 à 19 cm', NULL, 1, 1),
(172, 'Jahan', 'Une composition pleine d\'originalité pour ce collier de 16 saphirs (diamètre 5 mm) et perles Miyuki d\'un bleu cobalt qui souligne le camaieu de bleu, les autres composants en plaqué or 24 carats, longueur environ de 36,5 à 43 cm. Bracelet Juma assorti', NULL, 95, 0, 2, 1, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 4),
(173, 'Zen', '3 saphirs de différentes tailles apportent une zénitude à ce pendentif, suspendu à un cordon', NULL, 65, 0, 2, 1, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 4),
(174, 'Dawn gold leaf', 'Ce ras-de-cou vous comblera si vous recherchez un modèle très original autant par la couleur orangée des 24 saphirs, diamètre entre 2 et 3 mm, qu\'avec cette feuille de philodendron en plaqué or 14 carats, perles Miyuki ébène, autres composants en plaqué or 24 carats, longueur d\'environ 35 à 40 cm, conviendra à une ossature fine, série très limitée. Bracelet Family Dawn', NULL, 82, 0, 2, 1, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(175, 'Family sun', 'Ce ras-de-cou est épuré mais original avec cette rare couleur jaune de ces 20 saphirs, 3/4 mm de diamètre, réhaussés par des perles Miyuki brunes, autres composants en plaqué or 24 carats, longueur d\'environ 33,5 à 40 cm, ce bijou sublimera particulièrement une peau dorée/foncée. Bracelet Family Sun', NULL, 78, 0, 2, 1, 1, 16, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(176, 'Juma', 'Perles Miyuki bleu cobalt et sublimes saphirs bleu clair, diamètre de 4/5 mm, pour ce bracelet d\'une longueur de 16,5 à 19,5 cm agrémenté d\'une pampille dorée qui vient apporter une petite note fantaisiste, autres composants en plaqué or 24 carats. Collier assorti Jahan', NULL, 72, 0, 2, 2, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(177, 'Family Light blue', 'Fin bracelet pour mini poignet, perles Miyuki dorées argentées encadrant un rang de 14 saphirs bleu clair, diamètre 2/3 mm, longueur de 13 à 15 cm', NULL, 63, 0, 2, 2, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(178, 'Family Dark blue', 'Fin bracelet pour mini poignet, perles Miyuki dorées argentées encadrant un rang de 17 saphirs bleu foncé, diamètre 2 mm, longueur de 13 à 15 cm, autres composants en argent', NULL, 63, 0, 2, 2, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(179, 'Dawn', 'Fin bracelet en perles Miyuki dorées ébène encadrant un rang de 13 rares saphirs orangés, diamètre 2/3 mm, pampille dorée libre, longueur de 14 à 16,5 cm, autres composants en plaqué or 24 carats. Collier Dawn gold leaf', NULL, 63, 0, 2, 2, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(180, 'Sun', 'Fin bracelet en perles Miyuki dorées ébène encadrant un rang de 15 rares saphirs jaunes, diamètre 2 mm, pampille dorée libre, longueur de 14 à 16,5 cm, autres composants en plaqué or 24 carats. Collier Family Sun', NULL, 63, 0, 2, 2, 1, 16, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(181, 'Grape gold', 'série composée d\'un pendentif de 3 topazes impériales facettées (diamètre d\'environ 4 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur dorée qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm. ', NULL, 62, 0, 2, 1, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 4),
(182, 'Tulum', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires en plaqué or 24 carats et 4 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 33 à 41 cm, conviendra à un cou très fin', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(183, 'Azteca', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par des intercalaires fantaisie en plaqué or 24 carats et 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, longueur environ de 39 à 45 cm, ce ras-de-cou magnifiera toutes les morphologies', NULL, 78, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(184, 'Anta', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est simplement mise en valeur par 6 perles d\'agate givrée, perles Miyuki, autres composants en plaqué or 24 carats, perles Miyuki,longueur environ de 39 à 45 cm, ce ras-de-cou saura vous séduire par son authenticité', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(185, 'Pichu', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 4 perles d\'agate givrée et 6 en hématite, perles Miyuki, autres composants en argent, longueur environ de 33,5 à 39,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(186, 'Jaya', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 6 perles d\'agate givrée et 4 en hématite, perles Miyuki, autres composants en argent, longueur environ de 39 à 46,5 cm, ce ras-de-cou convient pour les personnes préférant les couleurs froides', NULL, 75, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(187, 'Sinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en argent comme les autres composants, petite pampille argentée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs froides', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison|Modèle A : ', NULL, 1, 1),
(188, 'Dinti', 'La couleur merveilleuse de cette amazonite (environ 1 cm) est mise en valeur par 2 perles d\'agate givrée et d\'autres en plaqué or 24 carats comme les autres composants, petite pampille dorée et perles Miyuki, longueur environ de 14,5 à 17 cm, ce bracelet  convient pour les personnes préférant les couleurs chaudes', NULL, 59, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(189, 'Kristina', 'Ravissantes petites créoles plaqué or rose 24 carats, diamètre 1,2 cm agrémentées de magnifiques amzonites (diamètre d\'environ 8/9 mm), hauteur totale 2,6 cm, vous ne vous lasserez pas de leur couleur unique', NULL, 55, 0, 2, 3, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(190, 'Square blue', 'Bijou plein de caractère, le rang de 7 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki, chaînette d\'extension et  fermoir en argent, longueur environ de 37 à 41,5 cm. Bracelet assorti', NULL, 65, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(191, 'Mandana', 'On ne pourra que vous remarquer avec ce rang de 15 apatites bleu néon facettées (diamètre d\'environ 4 mm), qui est sublimé par des perles plaqué or 24 carats, comme la chaînette d\'extension et le fermoir, longueur environ de 35,5 à 39,5 cm', NULL, 74, 0, 2, 1, 2, 2, '', NULL, 1, 1),
(192, 'Fish', 'Bracelet en perles Miyuki et rang de 10 apatites bleu néon (diamètre 2-3 mm) agrémenté d\'une pampille argentée et d\'une perle en argent, longueur de 15 à 17 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet fin à moyen', NULL, 40, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(193, 'Square blue', 'Rang de 6 apatites rectangulaires bleues (diamètre d\'environ 6x4 mm) que souligne le rouge délicat des perles Miyuki et une petite pampille dorée, chaînette d\'extension et  fermoir en plaqué or 24 carats, longueur environ de 16,5 à 19,5 cm', NULL, 38, 0, 2, 2, 2, 2, '', NULL, 1, 1),
(194, 'Lagoon star', 'BO crochets plaqué or rose 24 carats, perles en céramique bleu lagon (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche rock à ce modèle', NULL, 48, 0, 2, 3, 3, 3, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(195, 'Marjane', 'Grand sautoir de perles de corail et 13 perles de bambou de mer sculptées (diamètre 8 mm), hauteur approximative de 60 cm, qui sublimera toutes vos tenues d\'été', NULL, 82, 0, 2, 4, 4, 4, '', NULL, 2, 1),
(196, 'Koralia', 'Ce ravissant ras-de-cou en corail rouge et perle de bambou de mer (diamètre 8 mm), autres composants en plaqué or 24 carats, apportera une touche de couleur raffinée qui sublimera votre bronzage, longueur environ de 39 à 43,5 cm', NULL, 64, 0, 2, 1, 4, 4, '', NULL, 1, 1),
(197, 'Gypsy Koralia', 'Hauteur d\'environ 51 cm pour ce sautoir, le cordon en chanvre orangé est agrémenté de perles en céramique rouge qui se marient parfaitement à la grosse perle en véritable corail d\'un diamètre d\'environ 1,6 cm, cette pièce unique apportera une touche bohème à vos tenues', NULL, 55, 0, 2, 4, 4, 4, '', NULL, 2, 1),
(198, 'Alexa ', 'BO crochets en plaqué or 14 carats réhaussés d\'une perle en cristal de bohème verte et parme surmontant une pampille dorée, hauteur totale d\'environ 4,5 cm, vous ne pourrez plus vous passer de leur éclat discret', NULL, 35, 0, 2, 3, 5, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(199, 'Ara', 'BO crochets, créoles et lotus en plaqué or 14 carats et perle de cristal vert, diamètre 3 cm, hauteur d\'environ 5 cm, elle s\'accorderont parfaitement avec un teint doré ou brun mais aussi flatteront les blondes', NULL, 47, 0, 2, 3, 5, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(200, 'Blu', 'BO crochets, créoles et lotus en plaqué or 14 carats et perles en cristal vert, diamètre 3 cm, hauteur d\'environ 5 cm, elle s\'accorderont parfaitement avec un teint doré ou brun mais aussi aux blondes, ce subtil dégradé de vert mettra particulièrement les yeux bleus en valeur', NULL, 45, 0, 2, 4, 6, 6, '', NULL, 1, 1),
(201, 'Yona', 'Charme subtilement oriental pour ce sautoir d\'une hauteur d\'environ 56 cm, les perles de rocaille bronze font ressortir l\'éclat des perles japonaises Tensha et en cristal, intercalaires en plaqué or 24 carats, vous ne pourrez plus vous passer du raffinement de cette pièce unique ', NULL, 88, 0, 2, 4, 6, 6, '', NULL, 2, 1),
(202, 'Gaby', 'BO crochets plaqué or 14 carats, pampille dorée et éventail en résine écaille de tortue largeur 3 cm, hauteur totale environ 4,3 cm, très légères, elles apporteront une touche tendance à votre look', NULL, 42, 0, 2, 3, 7, 6, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(203, 'Gastby', 'BO crochets & créoles plaqué or 14 carats, diamètre 4 cms,  pampille dorée, éventail en résine écaille de tortue et perles de rocaille, hauteur totale environ 6,3 cm, légères et aériennes, ces BO elles vous accompagneront d\'un doux éclat 24/24', NULL, 50, 0, 2, 3, 7, 6, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(204, 'Sophie', 'BO crochets plaqué or 14 carats et laiton, pampille dorée et éventail en résine écaille de tortue largeur 3 cm, hauteur totale environ 7,3 cm, elles souligneront subtilement votre port de tête', NULL, 53, 0, 2, 3, 7, 6, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(205, 'Joséphine', 'Ecaille de tortue en résine de 3 cm et pièce en laiton, perle en pierre naturelle et crochet fermé compose ce modèle néo-rétro sophistiqué, hauteur d\'environ 6,5 cm, il reste léger aux oreilles', NULL, 42, 0, 2, 3, 7, 6, '', NULL, 1, 1),
(206, 'Green gold leaf', 'De véritables émeraudes pour ce ras-de-cou qui en comptabilise 18 (diamètre 2/3 mm), elles enserrent une jolie feuille de philodendron dorée 14 carats, sur perles Miyuki, autres composants en plaqué or 24 carats, longueur d\'environ de 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine (version argent Green Silver Leaf)', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(207, 'Green silver leaf', 'De véritables émeraudes vert intense  pour ce ras-de-cou qui en comptabilise 18 (diamètre 3/4 mm), elles enserrent une jolie feuille de philodendron plaqué argent, perles Miyuki et hématites, fermoir et chaîne d\'extension en argent, longueur d\'environ 37 à 42 cm, une touche tropicale mais combien chic à porter dans la jungle urbaine  (version dorée Green Gold Leaf)', NULL, 85, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(208, 'Green lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 16 émeraudes de couleur vive, diamètre 3 mm, entrecoupé de perles en hématite, perles Miyuki, autres composants en argent, longueur d\'environ 35,5 à 40,5 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(209, 'Square green', 'Elégant ras-de-cou en perles Miyuki brunes qui mettent en valeur un rang de 14 émeraudes (diamètre 3 mm), autres composants en plaqué or 24 carats, longueur environ de 38 à 42 cm, parfait pour les petites et grandes occasions pour mettre en valeur ses yeux', NULL, 82, 0, 2, 1, 8, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(210, 'Square green', 'Bracelet de 15 émeraudes de belle couleur vive, diamètre de 3/4 mm, encadrés par des perles Miyuki dorées argentées et en hématite, longueur de 15 à 17 cm, autres composants en argent', NULL, 72, 0, 2, 5, 9, 5, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(211, 'Baingan', 'Ce collier qui se porte un peu long marie la couleur violette de la fluorite (dimensions 18x14 mm) à la douceur gris bleu des 18 perles de labradorite facettées (diamètre 4 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(212, 'Dhahabi', 'Ce collier qui se porte un peu long met en valeur le gris teinté de violet de la fluorite (dimensions 18x14 mm) à celui des 18 perles de labradorite facettées (diamètre 3 mm), le doré des 14 perles carrées en laiton et de rocaille apporte une touche raffinée à ce modèle original, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(213, 'Cuichi', 'Ce collier porte les couleurs de l\'arc-en-ciel de la fluorite (dimensions 18x14 mm) et des perles de rocaille, sublimées par le gris bleu des 16 perles de labradorite facettées (diamètre 4 mm) et le doré des  16 perles carrées en laiton composant un modèle idéal pour l\'été, fermoir et chaînette plaqué or 24 carats, longueur environ de 48 à 52 cm, pièce unique', NULL, 75, 0, 2, 5, 9, 5, '', NULL, 1, 3),
(214, 'Luck', 'série composée d\'un pendentif de 3 grenats rhodolite (diamètre d\'environ 6 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur rose foncé qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm', NULL, 62, 0, 2, 1, 10, 7, '', NULL, 1, 4),
(215, 'Darjeeling', 'Nom magique pour un ras-de-cou qui ne l\'est pas moins, les perles Miyuki mates font ressortir le brillant de ces 15 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et des intercalaires en plaqué or 24 carats (comme les autres composants), longueur environ de 35 à 40,5 cm, laissez-vous tenter par l\'orient avec cette pièce originale. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(216, 'Red velvet lotus', 'Le délicat lotus en plaqué or 14 carats est inséré entre 14 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par des intercalaires en plaqué or 24 carats mats comme les perles Miyuki qui font ressortir leur éclat, autres composants en plaqué or 24 carats, longueur environ de 36 à 41 cm, ce ras-du-cou saura vous séduire par son harmonie. Bracelet assorti Rani', NULL, 74, 0, 2, 1, 10, 7, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(217, 'Rani', 'Bracelet composé de 12 magnifiques grenats rhodolite (diamètre d\'environ 3/4 mm) délicatement facetés et mis en valeur par une pampille dorée et des intercalaires en plaqué or 24 carats mats comme les autres composants, perles Miyuki, longueur environ de 16 à 19 cm. Ras-de-cou Darjeeling et Red velvet lotus assortis', NULL, 53, 0, 2, 2, 10, 7, '', NULL, 1, 1),
(218, 'Farah', 'Double plaisir pour ce magnifique collier qui se porte selon votre humeur en sautoir ou double ras-du-cou, il incarne l\'esprit bohême chic d\'Emma Pierre avec ses grenats rhodolites (4 mm de diamètre) réhaussées par des intercalaires en plaqué or 24 carats et par la couleur bronze des perles de rocaille, les pampilles apportent le côté mode à ce modèle', NULL, 86, 0, 2, 5, 10, 2, '', NULL, 1, 1),
(219, 'Amorgos', 'Hauteur d\'environ 58 cm pour ce sautoir en perles argentées qui font ressortir les différentes nuances  de celles en jade bleu et verres travaillé à la main, je l\'ai prénommé Amorgos, île des Cyclades où l\'on retrouve les couleurs employées, l\'outremer de la mer Egée et le blanc et bleu éclatants des habitations, pièce unique', NULL, 88, 0, 2, 4, 11, 8, '', NULL, 2, 1),
(220, 'Moon', 'Entièrement en argent, ces BO crochets ovales d\'une hauteur d\'environ 3,9 cm supportent un rang de 5 labradorites facettées brillant discrètement d\'une douce couleur gris bleu, une valeur sûre tout au long de l\'année', NULL, 49, 0, 2, 2, 12, 9, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 1),
(221, 'Feather ', 'Bracelet en perles Miyuki et rang de 11 labradorites agrémenté d\'une pampille argentée, diamètre environ 3 mm, longueur de 13 à 15 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet très fin', NULL, 38, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(222, 'Storm', 'Bracelet en perles Miyuki et rang de 9 labradorites agrémenté d\'une pampille argentée, diamètre 3-4 mm, longueur de 15,5 à 17,5 cm, fermoir et chaînette d\'extension en argent, qui soulignera par sa délicatesse un poignet moyen', NULL, 43, 0, 2, 2, 12, 9, 'modèle A : silver|modèle B : dark blue', NULL, 1, 1),
(223, 'Blue lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 14 magnifiques lapis-lazuli facetés, diamètre 3 mm, perles Miyuki, autres composants en argent, longueur d\'environ 35 à 39 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou très fin', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 1),
(224, 'Blue pearls', 'Ras-de-cou composé de 3 perles de lapis-lazuli, diamètre 6 mm, mises en valeur par des intercalaires plaqué or 24 carats, perles Miyuki, longueur d\'environ 36 à 40,5 cm, fermoir et chaînette d\'extension en argent, l\'alliance délicate argent/or en fait un bijou simple mais sophistiqué qui vous accompagnera longtemps', NULL, 65, 0, 2, 1, 13, 10, '', NULL, 1, 4),
(225, 'Blue pearls', 'Rang de 12 magnifiques lapis-lazuli facettés, diamètre 3 mm, perles Miyuki, autres composants en argent qu\'une petite pampille argentée souligne de façon impertinente', NULL, 49, 0, 2, 2, 13, 10, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 1),
(226, 'Kirsten', 'Ravissantes petites créoles plaqué or rose 24 carats, diamètre 1,2 cm agrémentées de lapis+lazuli (diamètre d\'environ8 mm), hauteur totale 2,6 cm, elles accompagneront toutes vos tenues', NULL, 50, 0, 2, 3, 13, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(227, 'Kendra', 'Allie les différentes tonalités de brun de l\'œil-de-tigre, ambre et perles ethniques aux perles de rocaille délicatement irisées, à porter en toutes saisons et personnalisable', NULL, 74, 0, 2, 4, 14, 11, '', NULL, 1, 1),
(228, 'Alexandra', 'Des perles Miuki dorées réchauffent le rose délicat d\'une opale et perles de quartz givré, autres composants en plaqué or 24 carats, longeur d\'environ 41 à 44 cms, vous serez séduite par son côté précieux ', NULL, 65, 0, 2, 1, 15, 12, '', NULL, 1, 1),
(229, 'Bali', 'Un ravissant ras-de-cou en perles d\'opale rose et 1 de quartz (diamètre 6 mm) sur perles Miyuki dorées, les autres composants en plaqué or 24 carats, longueur environ de 34 à 42 cm, vous apportera douceur et sérénité symbolisés par le lotus ', NULL, 65, 0, 2, 1, 15, 12, '', NULL, 1, 1),
(230, 'Mahina', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm) mais boostés par 12 perles d\'hématite gris foncé et des perles Miyuki bleu anthracite donnant un côté plus rock à ce modèle, fermoir et chaînette en argent, longueur environ de 48 à 52 cm, série très limitée', NULL, 85, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(231, 'Céleste', 'Ce collier qui se porte un peu long allie la couleur absolument exceptionnelle de cette opale (dimensions 17x13 mm) aux différentes nuances de bleu des 14 perles de larimar délicatement facettées (diamètre 4 cm), perles baroques d\'eau douce, fermoir et chaînette en plaqué or 24 carats, longueur environ de 48 à 52 cm, série très limitée', NULL, 105, 0, 2, 5, 16, 3, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 3),
(232, 'Babylone', 'BO crochets plaqué or 14 carats et laiton, pampilles dorées, perles Miyuki bleu cobalt, rocaille dorée et perle en cristal bleu, hauteur 5,5 cm, la touche orientale apportée par les différentes matières dorées met en valeur le bleu profond des perles', NULL, 53, 0, 2, 3, 17, 8, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(233, 'Bora-Bora black', 'BO crochets plaqué or rose 24 carats, perles baroques noires teintées (diamètre environ 1 cm) surmontées d\'un cristal brun, hauteur d\'environ 3,5 cm, l\'imperfection parfaite de ces perles apportera une touche glam à un classique', NULL, 58, 0, 2, 3, 18, 9, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone|NB : les perles naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 2),
(234, 'Pink star', 'BO crochets plaqué or rose 24 carats, perles de culture d\'eau douce couleur pêche (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche originale à l\'intemporalité des perles', NULL, 55, 0, 2, 3, 18, 12, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(235, 'Bora-Bora pink', 'BO crochets plaqué or rose 24 carats, perles baroques noires teintées (diamètre environ 1 cm) surmontées d\'un cristal rose soutenu, hauteur d\'environ 3,5 cm, l\'imperfection parfaite de ces perles apportera une touche glam à un classique', NULL, 58, 0, 2, 3, 18, 9, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone|NB : les perles naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 2),
(236, 'White star', 'BO crochets plaqué or rose 24 carats, perles de culture d\'eau douce blanche (diamètre 8 mm), hauteur d\'environ 4 cm, une étoile dorée rose donne une touche originale à l\'intemporalité des perles', NULL, 55, 0, 2, 3, 18, 13, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 1, 2),
(237, 'Manua', 'Les perles Miyuki bronze mettent particulièrement en valeur cette perle de nacre baroque d\'une rare couleur dorée, autres composants en plaqué or 24 carats, longueur de 40,5 à 45 cm, attention pièce unique !', NULL, 85, 0, 2, 1, 18, 14, '', NULL, 1, 2),
(238, 'Hina', 'Les perles Miyuki gris métal mettent particulièrement en valeur cette perle de nacre baroque avec des irisations aubergine, autres composants en argent, longueur de 36,5 à 41 cm, attention pièce unique !', NULL, 85, 0, 2, 1, 18, 9, '', NULL, 1, 2),
(239, 'Tahia', 'Les perles Miyuki gris foncé mettent particulièrement en valeur cette perle de nacre baroque couleur bleu et reflets aubergine, autres composants en plaqué or 24 carats, longueur de 41 à 45,5 cm, attention pièce unique !', NULL, 85, 0, 2, 1, 18, 9, '', NULL, 1, 2),
(240, 'Pink May Ling', 'Bracelet en perles Miyuki, perle en quartz rose ovale d\'environ 1 cm et 3 perles baroques d\'eau douce rosée, autres composants en plaqué or 24 carats, il allie le raffinement des perles à la modernité de la pierre et conviendra à tous types de poignets', NULL, 49, 0, 2, 2, 18, 12, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 2),
(241, 'White May Ling', 'Bracelet en perles Miyuki, perle en quartz rose ovale d\'environ 1 cm et 3 perles baroques d\'eau douce blanches, autres composants en argent et plaqué or 24 carats, il allie le raffinement des perles à la modernité de la pierre et conviendra à tous types de poignets', NULL, 49, 0, 2, 2, 18, 12, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 2),
(242, 'White May   ', 'Bracelet en perles Miyuki, perle en quartz rose rectangulaire d\'environ 1 cm et 3 perles baroques d\'eau douce blanches, autres composants en plaqué or 24 carats, il allie le raffinement des perles à la modernité de la pierre et conviendra à tous types de poignets', NULL, 49, 0, 2, 2, 18, 12, 'modèle A : longueur d\'environ 14,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 2),
(243, 'Paua', 'Sophistication pour ce sautoir qui allie le raffinement des perles de nacre à celles de jade vert et d\'abalone pour une hauteur d\'environ 57 cm, les perles de rocaille turquoise les mettent subtilement en valeur, il pourra être porté en toutes saisons comme sur la photo avec un pull blanc', NULL, 92, 0, 2, 4, 18, 2, '', NULL, 2, 1),
(244, 'Taori', 'Ce collier d\'une hauteur d\'environ 43 cm composé de perles de nacre et abalone, pierre dure et cristal pour les noires, soulignées par des perles de rocaille turquoise en font un bijou très facile à porter et qui ira avec beaucoup de vos tenues, été comme hiver', NULL, 85, 0, 2, 4, 18, 2, '', NULL, 2, 1),
(245, 'Alba', 'Les perles revisitées avec ce bracelet composé de 8 perles d\'eau douce baroques, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, le modèle proposé arbore une jolie perle travaillée en plaqué or 24 carats et d\'autres plus petites, comme le fermoir et la chaînette d\'extension, perles Miyuki, ras-de-cou assorti', NULL, 49, 0, 2, 2, 18, 13, 'modèle A : longueur d\'environ 15,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 1),
(246, 'Albane', 'Les perles revisitées avec ce bracelet composé de 8 perles d\'eau douce baroques entourant une plus grosse, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, autres perles, fermoir et la chaînette d\'extension en plaqué or 24 carats, perles Miyuki, ras-de-cou assorti', NULL, 47, 0, 2, 2, 18, 13, 'modèle A : longueur d\'environ 15,5 à 17 cm|modèle B : longueur d\'environ 16,5 à 18,5 cm', NULL, 1, 1),
(247, 'Alba', 'Les perles revisitées avec ce ras-de-cou composé de 14 perles d\'eau douce baroques, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, le modèle proposé arbore une jolie perle travaillée en plaqué or 24 carats et d\'autres plus petites, comme le fermoir et la chaînette d\'extension, perles Miyuki, bracelet assorti', NULL, 77, 0, 2, 1, 18, 13, 'modèle A : longueur d\'environ 36 à 41 cm|modèle B : longueur d\'environ 41 à 47 cm', NULL, 1, 1),
(248, 'Albane', 'Les perles revisitées avec ce ras-de-cou composé de 10 perles d\'eau douce baroques entourant une plus grosse, leur  imperfection apporte un côté beaucoup plus contemporain à ce classique qui se porte avec tout, autres perles, fermoir et la chaînette d\'extension en plaqué or 24 carats, perles Miyuki, bracelet assorti', NULL, 72, 0, 2, 1, 18, 13, 'modèle A : longueur d\'environ 36 à 41 cm|modèle B : longueur d\'environ 41 à 47 cm', NULL, 1, 1),
(249, 'Romilda', 'Ce collier unique porte le nom de mon arrière-grand-mère Romilda, qui signifie \"guerrier glorieux\" et je peux vous assurer qu\'elle le portait très bien ! Les perles de Murano d\'un bleu soutenu pailleté d\'or ont été chinées à Budapest et les noires en pierres dures', NULL, 75, 0, 2, 5, 19, 15, '', NULL, 1, 1),
(250, 'Bubble', 'Rien de plus facile d\'être de bonne humeur avec ce sautoir, ses différentes nuances de vert s\'accorde étonnamment avec beaucoup de tenues, hauteur de 55 cm, perles en verre et en plastique', NULL, 65, 0, 2, 4, 19, 9, '', NULL, 1, 1),
(251, 'Sofia', 'Voilà une création dont vous ne pourrez plus vous passez, avec ces délicates perles soufflées en verre et tourmaline, leurs multiples nuances de gris apporteront un chic infini à vos vêtements les plus simples, hauteur de 52 cm', NULL, 88, 0, 2, 4, 19, 9, '', NULL, 1, 1);
INSERT INTO `article` (`id_article`, `nom`, `description`, `longueur`, `prix`, `remise`, `stock`, `id_type`, `id_matiere`, `id_couleur`, `remarques`, `photos`, `id_categorie`, `id_collection`) VALUES
(252, 'Rosée du Matin', 'BO crochets, créoles et lotus en plaqué or 14 carats, diamètre 3 cm, hauteur d\'environ 5 cm, perle baroque d\'eau douce blanche accompagnant celles en cristal rose, ces BO vous apporteront une fraîcheur douce toute la journée', NULL, 42, 0, 2, 3, 20, 12, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(253, 'Eloise', 'Série Bridgerton ! Perles baroques d\'eau douce pour réactualiser le bracelet de perles traditionnel que pourrait porter Eloise, la jeune fille curieuse de la série, subtilement réhaussées par de jolis cristaux rose pâle et autres composants en plaqué or 24 carats, vous voilà transportée au coeur de la régence anglaise !', NULL, 69, 0, 2, 2, 20, 12, 'Modèle A : longueur d\'environ 14,5 à 17 cm|Modèle B : longueur d\'environ 16 à 19 cm', NULL, 1, 1),
(254, 'Zahri', 'Ce sautoir argenté, blanc et gris est composé de perles de nacre grise associées à celles en verre en provenance de Budapest, d\'une hauteur d\'environ 50 cm, il sublimera vos tenues noires ou blanches en apportant cette note chic et choc d\'une pièce unique', NULL, 88, 0, 2, 4, 1, 9, '', NULL, 2, 1),
(255, 'Caraïbes', 'BO crochets, créoles et philodendron plaqué or 14 carats, diamètre 4 cm, hauteur d\'environ 6 cm, anneau en émail bleu canard, une touche d\'exotisme qui s\'invite facilement en ville', NULL, 48, 0, 2, 3, 1, 8, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(256, 'Manaus', 'BO crochets & créoles plaqué or 14 carats, diamètre 4 cms,  pampille éventail en émail bleu canard, délicates plumes bleues et jaunes, perles en verre, hauteur totale environ 6,3 cm, vivez cet été au rythme de la samba avec ces créations originales et légères', NULL, 53, 0, 2, 3, 1, 16, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(257, 'Rio', 'BO crochets & créoles plaqué or 14 carats, diamètre 4 cms,  pampille éventail en émail bleu canard, délicates plumes bleues et jaunes, perles en verre, hauteur totale environ 6,3 cm, vivez cet été au rythme de la samba avec ces créations originales et légères', NULL, 53, 0, 2, 3, 1, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(258, 'Copacabana', 'BO crochets & créoles légères comme une plume, plaqué or 14 carats, de 4 cm de diamètre, hauteur d\'environ 6 cm, agrémentées d\'une pampille en émail rouge et de fines plumes fuchsia, perles de rocaille rouge et or, la gaîté de ces BO vous accompagnera jusqu\'à l\'automne !', NULL, 54, 0, 2, 3, 1, 17, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(259, 'Artemis', 'BO crochets, créoles en plaqué or 14 carats, diamètre 3 cm, hauteur d\'environ 5 cm, ces petites plumes mutines vous feront voler de vos propres ailes', NULL, 44, 0, 2, 3, 1, 1, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(260, 'Athéna', 'Les couleurs complémentaires de ces 5 quartz sont mises en valeur par des perles Miyuki dorées, autres composants en plaqué or 24 carats,  longeur d\'environ 41 à 44 cms, le quartz porté à même la peau rassure, détend, apaise les émotions fortes pour mieux les vivre et les accepter', NULL, 61, 0, 2, 1, 1, 18, '', NULL, 1, 1),
(261, 'Sekhmet', 'Les couleurs complémentaires de ces 3 quartz sont mises en valeur par des perles Miyuki dorées, perles et autres composants en plaqué or 24 carats,  longeur d\'environ 41 à 44 cms, le quartz porté à même la peau rassure, détend, apaise les émotions fortes pour mieux les vivre et les accepter', NULL, 61, 0, 2, 1, 1, 18, '', NULL, 1, 1),
(262, 'Arjumand', 'Délicat collier en véritables rubis (diamètre 4 mm) et perles Miyuki dorées, les autres composants en plaqué or 24 carats, longueur environ de 36 à 43 cm, le pendentif en filigrane golden rose met en valeur les différentes nuances des rubis, ce qui rend ce ras-de-cou tout simplement irrésistible', NULL, 89, 0, 2, 1, 1, 12, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(263, 'Square red', 'Elégant ras-de-cou en perles Miyuki dorées qui mettent en valeur un rang de 18 rubis (diamètre 4 mm) et perles en hématite couleur argent, les autres composants en argent, longueur environ de 39 à 45 cm, parfait pour les petites et grandes occasions', NULL, 92, 0, 2, 1, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(264, 'Red square lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 16 magnifiques rubis, diamètre 4 mm, entrecoupé de perles en hématite, perles Miyuki, autres composants en argent, longueur d\'environ 41 à 45 cm, l\'alliance de yin et de yang de ce modèle saura séduire une personnalité forte', NULL, 92, 0, 2, 1, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(265, 'Red lotus', 'Douceur du lotus plaqué argent, que vient réveiller un rang de 14 rubis rose foncé, diamètre 3/4 mm, perles Miyuki, autres composants en argent, longueur d\'environ 37,5 à 41,5 cm, ce ravissant ras-de-cou conviendra particulièrement à un cou fin', NULL, 85, 0, 2, 1, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(266, 'Family Red', 'Fin bracelet pour mini poignet, perles Miyuki dorées argentées encadrant un rang de 14 rubis, diamètre 2/3 mm, longueur de 13 à 15 cm, autres composants en argent', NULL, 63, 0, 2, 2, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(267, 'Square red', 'Bracelet de 12 rubis, diamètre de 4/5 mm, encadrés par des perles Miyuki dorées argentées et en hématite, longueur de 16 à 18 cm, autres composants en argent, convient pour poignet large', NULL, 72, 0, 2, 2, 1, 17, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(268, 'Daphne', 'Série Bridgerton ! J\'aurais bien vu ce double ras-de-cou orner le cou de Daphne, ces rangs de magnifiques rubis (diamètre d\'environ 3 mm) sublimés par des perles japonaises dorées mat mettraient particulièr, autres composants en plaqué or 24 caratsement en valeur sa délicatesse, ou pourquoi pas la vôtre ! Une petite pampille dorée apporte une touche impertinente à ce modèle intemporel , autres composants en plaqué or 24 carats, bracelet assorti', NULL, 93, 0, 2, 1, 1, 19, 'Modèle A (perles rubis de 3 mm) : longueur d\'environ 69 à 74 cm|Modèle B (perles rubis de 4 mm) : longueur d\'environ 16 à 19 cm', NULL, 1, 1),
(269, 'Daphne', 'Série Bridgerton ! J\'aurais bien vu ce double bracelet orner le poignet de Daphne, ces rangs de magnifiques rubis (diamètre d\'environ 3 mm) sublimés par des perles japonaises dorées mat mettraient particulièrement en valeur sa délicatesse, ou pourquoi pas la vôtre ! Une petite pampille dorée apporte une touche impertinente à ce modèle intemporel, autres composants en plaqué or 24 carats, ras-de-cou asdorti', NULL, 78, 0, 2, 2, 1, 19, 'Modèle A (perles rubis de 3 mm) : longueur d\'environ 14,5 à 17 cm|Modèle B (perles rubis de 4 mm) : longueur d\'environ 16 à 19 cm', NULL, 1, 1),
(270, 'Jahan', 'Une composition pleine d\'originalité pour ce collier de 16 saphirs (diamètre 5 mm) et perles Miyuki d\'un bleu cobalt qui souligne le camaieu de bleu, les autres composants en plaqué or 24 carats, longueur environ de 36,5 à 43 cm. Bracelet Juma assorti', NULL, 95, 0, 2, 1, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 4),
(271, 'Zen', '3 saphirs de différentes tailles apportent une zénitude à ce pendentif, suspendu à un cordon', NULL, 65, 0, 2, 1, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 4),
(272, 'Dawn gold leaf', 'Ce ras-de-cou vous comblera si vous recherchez un modèle très original autant par la couleur orangée des 24 saphirs, diamètre entre 2 et 3 mm, qu\'avec cette feuille de philodendron en plaqué or 14 carats, perles Miyuki ébène, autres composants en plaqué or 24 carats, longueur d\'environ 35 à 40 cm, conviendra à une ossature fine, série très limitée. Bracelet Family Dawn', NULL, 82, 0, 2, 1, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(273, 'Family sun', 'Ce ras-de-cou est épuré mais original avec cette rare couleur jaune de ces 20 saphirs, 3/4 mm de diamètre, réhaussés par des perles Miyuki brunes, autres composants en plaqué or 24 carats, longueur d\'environ 33,5 à 40 cm, ce bijou sublimera particulièrement une peau dorée/foncée. Bracelet Family Sun', NULL, 78, 0, 2, 1, 1, 16, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(274, 'Juma', 'Perles Miyuki bleu cobalt et sublimes saphirs bleu clair, diamètre de 4/5 mm, pour ce bracelet d\'une longueur de 16,5 à 19,5 cm agrémenté d\'une pampille dorée qui vient apporter une petite note fantaisiste, autres composants en plaqué or 24 carats. Collier assorti Jahan', NULL, 72, 0, 2, 2, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(275, 'Family Light blue', 'Fin bracelet pour mini poignet, perles Miyuki dorées argentées encadrant un rang de 14 saphirs bleu clair, diamètre 2/3 mm, longueur de 13 à 15 cm', NULL, 63, 0, 2, 2, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(276, 'Family Dark blue', 'Fin bracelet pour mini poignet, perles Miyuki dorées argentées encadrant un rang de 17 saphirs bleu foncé, diamètre 2 mm, longueur de 13 à 15 cm, autres composants en argent', NULL, 63, 0, 2, 2, 1, 8, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(277, 'Dawn', 'Fin bracelet en perles Miyuki dorées ébène encadrant un rang de 13 rares saphirs orangés, diamètre 2/3 mm, pampille dorée libre, longueur de 14 à 16,5 cm, autres composants en plaqué or 24 carats. Collier Dawn gold leaf', NULL, 63, 0, 2, 2, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(278, 'Sun', 'Fin bracelet en perles Miyuki dorées ébène encadrant un rang de 15 rares saphirs jaunes, diamètre 2 mm, pampille dorée libre, longueur de 14 à 16,5 cm, autres composants en plaqué or 24 carats. Collier Family Sun', NULL, 63, 0, 2, 2, 1, 16, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(279, 'Grape gold', 'série composée d\'un pendentif de 3 topazes impériales facettées (diamètre d\'environ 4 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur dorée qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm. ', NULL, 62, 0, 2, 1, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 4),
(280, 'Kirsty', 'Ravissantes petites créoles plaqué or rose 24 carats, diamètre 1,2 cm agrémentées de 3 topazes impériales facettées (diamètre d\'environ 4 mm), hauteur totale 2,6 cm, vous ne vous lasserez pas de leur couleur unique', NULL, 69, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(281, 'Grape pink', 'série composée d\'un pendentif de 3 tourmalines roses facettées (diamètre d\'environ 4,5 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur aubergine qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm. Pièce unique.', NULL, 62, 0, 2, 2, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(282, 'Grape pink pink', 'série composée d\'un pendentif de 3 tourmalines roses facettées (diamètre d\'environ 4,5 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur rose foncé qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm', NULL, 62, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(283, 'Grape green', 'série composée d\'un pendentif de 3 tourmalines vertes facettées (diamètre d\'environ 4,5 mm) suspendu à 2 fins cordons, l\'un en lurex argent, l\'autre couleur aubergine qui subliment les nuances des pierres, fermoir et chaînette d\'extension en argent, longueur environ de 37 à 41,5 cm. ', NULL, 62, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(284, 'Family black', 'Ce ras-de-cou est épuré et intemporel, un rang de 15 tourmalines noires d\'excellente qualité, 3/4 mm de diamètres magnifiées par des perles Miyuki argent doré, apportera une touche de sophistication à n\'importe quelle tenue et conviendra à tous les cous en toutes saisons, pas besoin de vous convaincre que c\'est le collier à s\'offrir ou offrir', NULL, 65, 0, 2, 2, 1, 1, '', NULL, 1, 1),
(285, 'Family black', 'Bracelet composé d\'un rang de 9 tourmalines noires d\'excellente qualité, 3/4 mm de diamètres magnifiées par des perles Miyuki argent doré, longueur d\'environ 14 à 16 cm, il apportera une touche de sophistication à n\'importe quelle tenue et conviendra à tous les poignets en toutes saisons, c\'est dire si c\'est le bracelet à s\'offrir ou offrir', NULL, 47, 0, 2, 3, 1, 12, '', NULL, 3, 1),
(286, 'Shéhérazade', 'BO crochets plaqué or rose 24 carats, une tourmaline (diamètre 4,5 mm) délicatement suspendue à un anneau finement ciselé et une pampille filigranne golden rose, hauteur d\'environ 4,6 cm, ces BO vous séduiront par leur charme poétique. Le modèle Gold est proposé avec une topaze impériale.', NULL, 71, 0, 2, 4, 1, 14, 'ref dark green : tourmalines vert foncé|ref green : tourmalines vertes|ref pink : tourmalines roses|ref gold : topazes impériales|NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison|NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 2, 1),
(287, 'Farah', 'Double plaisir pour ce magnifique collier qui se porte selon votre humeur en sautoir ou double ras-du-cou, il incarne l\'esprit bohême chic d\'Emma Pierre avec ses turquoises naturelles (4 mm de diamètre) réhaussées par des intercalaires en plaqué or 24 carats et par la couleur bronze des perles de rocaille, les pampilles apportent le côté mode à ce modèle', NULL, 86, 0, 2, 4, 1, 14, '', NULL, 2, 1),
(288, 'Darius', 'Ce ras-de-cou est composé de véritables pierres naturelles de turquoises (4 mm) que soulignent de fins intercalaires plaqué argent pour mieux faire ressortir le côté sombre et puissant des saphirs, accentué, une fois n\'est pas coutume, par des perles Miyuki noires, longueur d\'environ 45 à 50 cm, autres composants en argent, à porter assurément par une conquérante !', NULL, 95, 0, 2, 4, 1, 14, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 2, 1),
(289, 'Darius luxury', 'Ce ras-de-cou est composé de véritables pierres naturelles de turquoises (4 mm) que soulignent de fins intercalaires plaqué argent pour mieux faire ressortir le côté sombre et puissant des saphirs, sublimé par des perles facettées de tourmalines noires, longueur d\'environ 40 à 45 cm, autres composants en argent, à porter définitivement  par une conquérante ! Série  limitée', NULL, 115, 0, 2, 1, 1, 1, 'NB : les pierres naturelles étant par essence uniques, il peut y avoir une légère variation de couleur par rapport au modèle présenté, une photo de la création vous sera envoyée avant la livraison', NULL, 1, 1),
(290, 'Maral', 'La couleur de cette magnifique turquoise naturelle d\'1,5 cm convient parfaitement aux perles d\'hématites qui l\'entourent, 2 turquoise rondes et perles japonaise  viennent compléter ce ras-de-cou de 41 à 45 cm qui vous accompagnera même dans l\'eau, les autres composants sont étant en argent, bracelet assorti', NULL, 88, 0, 2, 2, 1, 1, '', NULL, 1, 1),
(291, 'Maral', 'La couleur de cette magnifique turquoise naturelle d\'1 cm convient parfaitement aux perles d\'hématites qui l\'entourent, 3 aigue-marines facettées et perles japonaise  viennent compléter ce bracelet de 14 à 17,5  cm qui vous accompagnera même dans l\'eau, les autres composants étant en argent. Ras-de-cou assorti', NULL, 72, 0, 2, 2, 1, 1, '', NULL, 1, 1),
(292, 'Sahar', 'Comment ne pas succomber à cette magnifique turquoise naturelle d\'1 cm, ses inclusions brunes s\'accordent aux perles Miyuki bronze et aux 10 aigue-marines facettées, longueur de 41,5 à 47 cm,les autres composants sont en plaqué or 24 carats', NULL, 92, 0, 2, 1, 1, 1, '', NULL, 1, 1),
(293, 'Kiana', 'Version plus design pour ce ras-de-cou qui arbore une turquoise naturelle d\'1 cm d\'une teinte plus subtile, 14 perles en plaqué or 24 carats et perles Miyuki brunes en font un bijou so chic ! Longueur de 40 à 44,5 cm, autres composants en plaqué or 24 carats. Bracelet assorti', NULL, 83, 0, 2, 1, 1, 1, '', NULL, 1, 1),
(294, 'Kiana', 'Version plus design pour ce bracelet qui arbore une turquoise naturelle d\'1 cm d\'une teinte plus subtile, 8 perles en plaqué or 24 carats et perles Miyuki brunes en font un bijou so chic ! Longueur de 16 à 19 cm, autres composants en plaqué or 24 carats. Ras-de-cou  assorti', NULL, 68, 0, 2, 2, 1, 1, '', NULL, 1, 1),
(295, 'Aurore', 'BO crochets, créoles et lotus en plaqué or 14 carats et perle en verre pêche, diamètre 3 cm, hauteur d\'environ 5 cm, cette version pink d\'Ara apporteront leur subtilité à tous les teints', NULL, 35, 0, 2, 3, 1, 12, 'NB : toutes les BO crochets sont vendues avec leur stoppeur en silicone', NULL, 3, 1),
(296, 'Daisy', 'Double rang de rocaille dorée pour ce sautoir d\'une hauteur d\'environ 52 cm avec des perles en verre et en résine grises très originales chinées à Budapest, le décalage des perles donne du peps à ce bijou dont vous ne pourrez plus vous passer, pièce unique', NULL, 82, 0, 2, 4, 1, 14, '', NULL, 2, 1),
(297, 'Angelina', 'Composition de perles soufflées en verre en provenance de Budapest et perles de rocaille dorée, avec une belle harmonie d\'or et de métal rose qui donne à ce sautoir d\'une hauteur d\'environ 54 cm une note surannée de la vieille Europe, pièce unique', NULL, 92, 0, 2, 4, 1, 14, '', NULL, 2, 1),
(298, 'Tiffany', 'Ecaille de tortue alliée à des perles de cristal et de verre sur rocaille dorée en double rangs, voici le sautoir néo-rétro parfait pour votre garde-robe 2020-2021, hauteur de 52 à 58 cm, fermoir et chaînette d\'extension en plaqué or 24 carats', NULL, 75, 0, 2, 4, 1, 14, '', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `categorie` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `categorie`) VALUES
(1, 'Précieuses'),
(2, 'Unique'),
(3, 'Impertinentes');

-- --------------------------------------------------------

--
-- Structure de la table `code_promo`
--

CREATE TABLE `code_promo` (
  `id_code_promo` varchar(50) NOT NULL,
  `remise` float NOT NULL
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
-- Structure de la table `collection`
--

CREATE TABLE `collection` (
  `id_collection` int(11) NOT NULL,
  `collection` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `collection`
--

INSERT INTO `collection` (`id_collection`, `collection`) VALUES
(1, 'Family'),
(2, 'Pearl'),
(3, 'Queen'),
(4, 'Trilogy');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_code_promo` varchar(50) DEFAULT NULL,
  `date_commande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_reglement` date DEFAULT NULL,
  `id_statut` int(11) NOT NULL,
  `id_adresse_livraison` int(11) NOT NULL,
  `id_adresse_facturation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_user`, `id_code_promo`, `date_commande`, `date_reglement`, `id_statut`, `id_adresse_livraison`, `id_adresse_facturation`) VALUES
(1, 17, '20SUR20', '2023-07-17 16:18:18', '2023-07-11', 5, 1, 1),
(2, 8, 'LOVEJS', '2023-07-17 16:18:18', '2023-07-16', 3, 7, 13),
(3, 20, NULL, '2023-07-17 16:20:59', NULL, 1, 12, 12),
(4, 6, 'JOYEUXANNIVMAXIME', '2023-07-17 16:20:59', '2023-07-17', 4, 9, 9);

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

CREATE TABLE `couleur` (
  `id_couleur` int(11) NOT NULL,
  `nom_couleur` varchar(100) NOT NULL,
  `code` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `couleur`
--

INSERT INTO `couleur` (`id_couleur`, `nom_couleur`, `code`) VALUES
(1, 'Amazonie', '#228B22'),
(2, 'Aqua azurra', '#7FFFD4'),
(3, 'Bleu lagon', '#7FFFD4'),
(4, 'Corail', '#FF7F50'),
(5, 'Rainbow', NULL),
(6, 'Terre', '#964B00'),
(7, 'Red velvet', '#B22222'),
(8, 'Ocean', '#000080'),
(9, 'Orage', '#708090'),
(10, 'Nuit étoilée', '#000080'),
(11, 'brun', '#964B00'),
(12, 'Rose doudou', '#FFC0CB'),
(13, 'Ivoire', '#FFFFF0'),
(14, 'Gold', '#FFD700'),
(15, 'bleu', '#0000FF'),
(16, 'Soleil', '#FFD700'),
(17, 'Rouge carmin', '#FF0038'),
(18, 'multi', NULL),
(19, 'Rose', '#FFC0CB'),
(20, 'Dark', '#000000');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id_matiere` int(11) NOT NULL,
  `nom_matiere` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `nom_matiere`) VALUES
(1, 'Amazonite'),
(2, 'Apatite'),
(3, 'Céramique'),
(4, 'Corail'),
(5, 'Cristal'),
(6, 'Cristal / Tensha'),
(7, 'Ecaille de tortue'),
(8, 'Emeraude'),
(9, 'Fluorite'),
(10, 'Grenat'),
(11, 'Jade'),
(12, 'Labradorite'),
(13, 'Lapis-Lazuli'),
(14, 'œil-de-tigre'),
(15, 'Opale & quartz rose'),
(16, 'Opale bleue'),
(17, 'Pampille / cristal'),
(18, 'Perle / nacre'),
(19, 'perles'),
(20, 'Perles / Cristal'),
(21, 'Perles / Verre'),
(22, 'Philo'),
(23, 'Plumes'),
(24, 'quartz'),
(25, 'Rubis'),
(26, 'Saphir'),
(27, 'Topaze impériale'),
(28, 'Tourmaline'),
(29, 'Tourmaline\nTopaze impériale'),
(30, 'Turquoise'),
(31, 'Verre');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_commande` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `statut_commande` (
  `id_statut` int(11) NOT NULL,
  `statut` varchar(50) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `type_article` (
  `id_type` int(11) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_article`
--

INSERT INTO `type_article` (`id_type`, `type`) VALUES
(1, 'ras-de-cou'),
(2, 'Bracelet'),
(3, 'BO'),
(4, 'Sautoir'),
(5, 'collier');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `genre` enum('h','f') NOT NULL,
  `tel` varchar(15) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_passe` varchar(150) NOT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(20, 'Farley', 'Zeph', 'h', '01 33 27 12 93', '2008-11-23', 'consectetuer@protonmail.org', 'GJY31PNN8UD', 13, 1),
(21, 'Perdrix', 'Olivier', 'h', '0000', '1988-06-22', 'olivierperdrix@live.fr', 'olivier', 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id_adresse`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_matiere` (`id_matiere`),
  ADD KEY `id_couleur` (`id_couleur`),
  ADD KEY `id_collection` (`id_collection`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `code_promo`
--
ALTER TABLE `code_promo`
  ADD PRIMARY KEY (`id_code_promo`);

--
-- Index pour la table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id_collection`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_code_promo` (`id_code_promo`),
  ADD KEY `id_adresse_livraison` (`id_adresse_livraison`),
  ADD KEY `id_adresse_facturation` (`id_adresse_facturation`),
  ADD KEY `id_statut` (`id_statut`);

--
-- Index pour la table `couleur`
--
ALTER TABLE `couleur`
  ADD PRIMARY KEY (`id_couleur`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id_matiere`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_commande`,`id_article`) USING BTREE,
  ADD KEY `id_article` (`id_article`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `statut_commande`
--
ALTER TABLE `statut_commande`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `type_article`
--
ALTER TABLE `type_article`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_adresse` (`id_adresse`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `collection`
--
ALTER TABLE `collection`
  MODIFY `id_collection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `couleur`
--
ALTER TABLE `couleur`
  MODIFY `id_couleur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id_matiere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `statut_commande`
--
ALTER TABLE `statut_commande`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_article`
--
ALTER TABLE `type_article`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `id_collection` FOREIGN KEY (`id_collection`) REFERENCES `collection` (`id_collection`),
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
  ADD CONSTRAINT `id_statut` FOREIGN KEY (`id_statut`) REFERENCES `statut_commande` (`id_statut`),
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
