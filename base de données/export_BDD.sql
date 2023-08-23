-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 18 oct. 2022 à 12:03
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `p4-expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `telephone` int(10) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `CP` int(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `mail`, `motDePasse`, `telephone`, `adresse`, `CP`, `ville`) VALUES
(1, 'Noël', 'Noémie', 'aurelieNoel@gmail.com', '15ab7b19e81db53f16f07df6028f923eff914806', 233461014, '97, rue des lieutemants Thomazo', 72000, 'LE MANS'),
(2, 'Carignan', 'Thibaut', 'ThibautCarignan@gmail.com', '104c2b7c045729c8f26c6a498317243b925cba91', 248658346, '73, Rue Frédéric Chopin', 72000, 'LE MANS'),
(3, 'Archambault', 'Philippe', 'PhilippeArchambault@gmail.com', 'f055b5fb920abe93e7ad7683cc480052bcf94c00', 226498930, '36, rue de Geneve', 72000, 'LE MANS'),
(4, 'Vernadeau', 'Maryse', 'MaryseVernadeau@gmail.com', '9265ca4a392cbcb1deb4ae17e326ecdc3decfe3b', 286595833, '67, boulevard Albin Durand', 72000, 'LE MANS'),
(5, 'Clavet', 'Valérie', 'ValerieClavet@gmail.com', '9ae31687db611cb19d9679bac49eaa5d0293e535', 270523742, '42, boulevard Bryas', 72000, 'LE MANS');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreation` datetime NOT NULL,
  `dateLivraison` datetime DEFAULT NULL,
  `prixTotalHT` double NOT NULL,
  `prixTotalTTC` double NOT NULL,
  `societeLivraison` varchar(255) DEFAULT NULL,
  `nomLivraison` varchar(255) DEFAULT NULL,
  `prenomLivraison` varchar(255) DEFAULT NULL,
  `mailLivraison` varchar(255) DEFAULT NULL,
  `telephoneLivraison` int(10) DEFAULT NULL,
  `adresseLivraison` varchar(255) DEFAULT NULL,
  `CPLivraison` int(5) DEFAULT NULL,
  `villeLivraison` varchar(255) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `statut_commande_id` int(11) NOT NULL,
  `livreur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_client_idx` (`client_id`),
  KEY `fk_commande_statut_commande1_idx` (`statut_commande_id`),
  KEY `fk_commande_utilisateur1_idx` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCreation`, `dateLivraison`, `prixTotalHT`, `prixTotalTTC`, `societeLivraison`, `nomLivraison`, `prenomLivraison`, `mailLivraison`, `telephoneLivraison`, `adresseLivraison`, `CPLivraison`, `villeLivraison`, `client_id`, `statut_commande_id`, `livreur_id`) VALUES
(1, '2022-10-04 12:12:23', '2022-10-04 12:29:34', 38, 40.09, NULL, 'Noël', 'Noémie', 'aurelieNoel@gmail.com', 233461014, '97, rue des lieutemants Thomazo', 72000, 'LE MANS', 1, 7, 4),
(2, '2022-10-04 12:43:21', NULL, 36, 37.98, NULL, 'Launay', 'Lucie', 'lucieLaunay@gmail.com', 283579160, '95, avenue Garcia', 72000, 'LE MANS', 2, 4, NULL),
(3, '2022-10-05 12:07:52', '2022-10-05 12:24:56', 19, 20.4, NULL, 'Noël', 'Noémie', 'aurelieNoel@gmail.com', 233461014, '97, rue des lieutemants Thomazo', 72000, 'LE MANS', 1, 7, 6),
(4, '2022-10-05 12:17:54', '2022-10-05 12:34:16', 38, 40.09, NULL, 'Vernadeau', 'Maryse', 'maryseVernadeau@gmail.com', 286595833, '67, boulevard Albin Durand', 72000, 'LE MANS', 4, 7, 5),
(5, '2022-10-05 12:23:45', NULL, 57, 60.13, NULL, 'Archambault', 'Philippe', 'PhilippeArchambault@gmail.com', 226498930, '36, rue de Geneve', 72000, 'LE MANS', 3, 5, NULL),
(6, '2022-10-05 12:42:50', NULL, 33, 34.81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande_plat`
--

DROP TABLE IF EXISTS `commande_plat`;
CREATE TABLE IF NOT EXISTS `commande_plat` (
  `quantite` int(11) NOT NULL,
  `prixUnitaireHT` double NOT NULL,
  `TVA` double NOT NULL,
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  KEY `fk_commande_plat_plat1_idx` (`plat_id`),
  KEY `fk_commande_plat_commande1` (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande_plat`
--

INSERT INTO `commande_plat` (`quantite`, `prixUnitaireHT`, `TVA`, `commande_id`, `plat_id`) VALUES
(2, 13, 5.5, 1, 2),
(2, 6, 5.5, 1, 4),
(3, 12, 5.5, 2, 1),
(1, 14, 5.5, 3, 5),
(1, 5, 5.5, 3, 7),
(1, 14, 5.5, 4, 5),
(1, 14, 5.5, 4, 6),
(2, 5, 5.5, 4, 8),
(3, 14, 5.5, 5, 5),
(2, 5, 5.5, 5, 7),
(1, 5, 5.5, 5, 8),
(1, 14, 5.5, 6, 6),
(11, 14, 5.5, 6, 5),
(1, 5, 5.5, 6, 7);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `longitude` float(10,6) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `statut_id` int(11) NOT NULL,
  PRIMARY KEY (`utilisateur_id`),
  KEY `fk_livreur_statut_livreur1_idx` (`statut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`longitude`, `latitude`, `utilisateur_id`, `statut_id`) VALUES
(123.169189, 46.666416, 4, 1),
(-8.275506, 52.262726, 5, 2),
(37.767391, 55.580761, 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `menu_jour`
--

DROP TABLE IF EXISTS `menu_jour`;
CREATE TABLE IF NOT EXISTS `menu_jour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `dateCreation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu_jour`
--

INSERT INTO `menu_jour` (`id`, `libelle`, `dateCreation`) VALUES
(1, 'Menu du 04/10', '2022-10-04 11:20:07'),
(2, 'Menu du 05/10', '2022-10-05 11:16:56');

-- --------------------------------------------------------

--
-- Structure de la table `menu_jour_plat`
--

DROP TABLE IF EXISTS `menu_jour_plat`;
CREATE TABLE IF NOT EXISTS `menu_jour_plat` (
  `quantite` int(11) NOT NULL,
  `menu_jour_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  PRIMARY KEY (`plat_id`,`menu_jour_id`),
  KEY `fk_menu_jour_plat_menu_jour1_idx` (`menu_jour_id`),
  KEY `fk_menu_jour_plat_plat1_idx` (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu_jour_plat`
--

INSERT INTO `menu_jour_plat` (`quantite`, `menu_jour_id`, `plat_id`) VALUES
(40, 1, 1),
(50, 1, 2),
(80, 1, 3),
(80, 1, 4),
(45, 2, 5),
(53, 2, 6),
(86, 2, 7),
(92, 2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `photoURL` varchar(255) DEFAULT NULL,
  `prixUnitaireHT` float NOT NULL,
  `TVA` float NOT NULL,
  `dateCreation` datetime NOT NULL,
  `type_plat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plat_type_plat1_idx` (`type_plat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `libelle`, `description`, `photoURL`, `prixUnitaireHT`, `TVA`, `dateCreation`, `type_plat_id`) VALUES
(1, 'Salade César', 'Salade, tomates, œufs, blanc de poulet, croûtons de pain, pommes de terre, parmesan, sauce César', NULL, 12, 5.5, '2022-07-03 11:06:29', 1),
(2, 'Burger Américain', 'Lard grillé, steak haché, comté, tomates, salade, oignons, cornichons, sauce burger', NULL, 13, 5.5, '2022-08-12 14:31:23', 1),
(3, 'Baba au rhum à l\'orange', 'Ganache montée chocolat blanc vanille, segments d’oranges', NULL, 6, 5.5, '2022-08-16 19:03:53', 2),
(4, 'Brioche perdue', 'Caramel beurre salé, glace vanille', NULL, 6, 5.5, '2022-07-13 11:15:08', 2),
(5, 'Pavé de Boeuf', '200gr à la plancha, frites maison, confit d\'échalotes', NULL, 14, 5.5, '2022-07-22 09:45:32', 1),
(6, 'Magret de Canard', 'accompagné d\'une purée de panais, carottes rôties et jus à l\'orange', NULL, 14, 5.5, '2022-08-16 09:04:08', 1),
(7, 'Tarte au citron', '', NULL, 5, 5.5, '2022-08-16 09:15:16', 1),
(8, 'Crème brûlée à la vanille', '', NULL, 5, 5.5, '2022-09-02 10:01:06', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role_utilisateur`
--

DROP TABLE IF EXISTS `role_utilisateur`;
CREATE TABLE IF NOT EXISTS `role_utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role_utilisateur`
--

INSERT INTO `role_utilisateur` (`id`, `role`) VALUES
(1, 'administrateur'),
(2, 'chef cuisinier'),
(3, 'livreur');

-- --------------------------------------------------------

--
-- Structure de la table `sac_livreur`
--

DROP TABLE IF EXISTS `sac_livreur`;
CREATE TABLE IF NOT EXISTS `sac_livreur` (
  `quantite` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  KEY `fk_sac_livreur_livreur1` (`livreur_id`),
  KEY `fk_sac_livreur_plat1` (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sac_livreur`
--

INSERT INTO `sac_livreur` (`quantite`, `date`, `livreur_id`, `plat_id`) VALUES
(5, '2022-10-05 11:35:14', 4, 5),
(2, '2022-10-05 11:35:14', 4, 6),
(3, '2022-10-05 11:35:14', 4, 7),
(6, '2022-10-05 11:35:14', 4, 8),
(4, '2022-10-05 11:37:45', 6, 5),
(6, '2022-10-05 11:37:45', 6, 6),
(2, '2022-10-05 11:37:45', 6, 7),
(1, '2022-10-05 11:37:45', 6, 8);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id`, `statut`) VALUES
(1, 'En cours'),
(2, 'En attente de paiement'),
(3, 'Paiement validé'),
(4, 'Paiement refusé'),
(5, 'En attente de livraison'),
(6, 'Livraison en cours'),
(7, 'Commande livrée');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

DROP TABLE IF EXISTS `statut_livreur`;
CREATE TABLE IF NOT EXISTS `statut_livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`id`, `statut`) VALUES
(1, 'Disponible'),
(2, 'En cours de livraison'),
(3, 'Ne travaille pas');

-- --------------------------------------------------------

--
-- Structure de la table `type_plat`
--

DROP TABLE IF EXISTS `type_plat`;
CREATE TABLE IF NOT EXISTS `type_plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_plat`
--

INSERT INTO `type_plat` (`id`, `type`) VALUES
(1, 'plat'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_utilisateur_role_utilisateur1_idx` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `mail`, `motDePasse`, `role_id`) VALUES
(1, 'Clément', 'Javier', 'JavierClement@gmail.com', 'f695ea9ba4b17adc6019cfca2d2d1a8d76898b0c', 1),
(2, 'Labossière', 'Romain', 'RomainLabossiere@gmail.com', '741540ed0e107a474a125778ac05a74a9960afca', 2),
(3, 'Riquier', 'Michèle', 'MicheleRiquier@gmail.com', 'f62b57f9ec7ca9fe141a7683ce8710fd30f794fa', 2),
(4, 'Lamare', 'Emmanuel', 'EmmanuelLamare@gmail.com', '31fe7d7076fb13ca773dc6fd259dfa57b1117a2e', 3),
(5, 'Gaulin', 'Édith', 'EdithGaulin@gmail.com', '6619a9f5cbb65b815c3a4c29c6642c676c3ff582', 3),
(6, 'Charbonneau', 'Guillaume', 'GuillaumeCharbonneau@gmail.com', 'e7534379e9fbc8f185f120445f6d06372d838269', 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_statut_commande1` FOREIGN KEY (`statut_commande_id`) REFERENCES `statut_commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_utilisateur1` FOREIGN KEY (`livreur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_plat`
--
ALTER TABLE `commande_plat`
  ADD CONSTRAINT `fk_commande_plat_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_plat_plat1` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_statut_livreur1` FOREIGN KEY (`statut_id`) REFERENCES `statut_livreur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livreur_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menu_jour_plat`
--
ALTER TABLE `menu_jour_plat`
  ADD CONSTRAINT `fk_menu_jour_plat_menu_jour1` FOREIGN KEY (`menu_jour_id`) REFERENCES `menu_jour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_jour_plat_plat1` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_plat_type_plat1` FOREIGN KEY (`type_plat_id`) REFERENCES `type_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `sac_livreur`
--
ALTER TABLE `sac_livreur`
  ADD CONSTRAINT `fk_sac_livreur_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sac_livreur_plat1` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_role_utilisateur1` FOREIGN KEY (`role_id`) REFERENCES `role_utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
