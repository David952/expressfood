-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 20 avr. 2020 à 09:21
-- Version du serveur :  8.0.18
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

DROP TABLE IF EXISTS `dish`;
CREATE TABLE IF NOT EXISTS `dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price_excl_taxes` decimal(4,2) NOT NULL,
  `value_added_taxes` decimal(4,2) NOT NULL,
  `dish_of_the_day` tinyint(1) NOT NULL,
  `type_of_dish_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type_of_dish_idx` (`type_of_dish_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`id`, `name`, `price_excl_taxes`, `value_added_taxes`, `dish_of_the_day`, `type_of_dish_id`) VALUES
(1, 'Pâtes au saumon', '4.92', '0.05', 1, 1),
(2, 'Taboulé au poulet', '4.50', '0.05', 0, 1),
(3, 'Salade au jambon', '4.99', '0.05', 0, 1),
(4, 'Boeuf carottes', '5.58', '0.05', 0, 1),
(5, 'Curry de légumes', '4.17', '0.05', 0, 1),
(6, 'Blanquette de veau', '5.75', '0.05', 0, 1),
(7, 'Cassoulet', '5.83', '0.05', 0, 1),
(8, 'Brandade de morue', '5.00', '0.05', 0, 1),
(9, 'Salade au thon', '4.99', '0.05', 0, 1),
(10, 'Tartiflette', '6.25', '0.05', 1, 1),
(11, 'Tarte au citron', '4.08', '0.05', 0, 2),
(12, 'Gaufre sucrée', '3.50', '0.05', 0, 2),
(13, 'Brownies aux noix', '3.75', '0.05', 0, 2),
(14, 'Tarte tatin', '3.29', '0.05', 1, 2),
(15, 'Crêpe au chocolat', '4.30', '0.05', 0, 2),
(16, 'Salade de fruits', '3.25', '0.05', 0, 2),
(17, 'Riz au lait', '3.17', '0.05', 0, 2),
(18, 'Cookies moelleux', '3.54', '0.05', 1, 2),
(19, 'Pudding', '4.17', '0.05', 0, 2),
(20, 'Crumble aux poires', '3.67', '0.05', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `pickup_date` datetime(6) NOT NULL,
  `delivery_date` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `additional_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(50) NOT NULL,
  `client_id` int(11) NOT NULL,
  `delivery_man_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id_idx` (`client_id`),
  KEY `delivery_man_id_idx` (`delivery_man_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `order_number`, `creation_date`, `pickup_date`, `delivery_date`, `status`, `address`, `additional_address`, `zip_code`, `city`, `client_id`, `delivery_man_id`) VALUES
(1, '#ABC1', '2020-01-06 12:10:30.000000', '2020-01-06 12:19:14.000000', '2020-01-06 12:24:58.000000', 'Terminé', '25 Rue Duvivier', '2ème étage, Porte 8', '75007', 'Paris', 1, 8),
(2, '#ABC2', '2020-01-06 19:40:22.000000', '2020-01-06 19:45:48.000000', '2020-01-06 19:51:59.000000', 'Terminé', '22 Avenue Victoria', '1er étage, Porte 4', '75001', 'Paris', 2, 8),
(3, '#ABC3', '2020-01-07 13:30:51.000000', '2020-01-07 13:37:30.000000', '2020-01-07 13:41:11.000000', 'Terminé', '40 Rue de Poitou', '3ème étage, Porte 28', '75003', 'Paris', 3, 8),
(4, '#ABC4', '2020-01-07 20:30:01.000000', '2020-01-07 20:38:22.000000', '2020-01-07 20:45:41.000000', 'Terminé', '77 Rue de Lévis', '4ème étage, Porte 35', '75017', 'Paris', 4, 8),
(5, '#ABC5', '2020-01-08 12:54:59.000000', '2020-01-08 12:54:59.000000', '2020-01-08 12:54:59.000000', 'Terminé', '37 Rue de la Cléf', '4ème étage, Porte 30', '75005', 'Paris', 5, 8),
(6, '#ABC6', '2020-01-08 20:04:09.000000', '2020-01-08 20:11:21.000000', '2020-01-08 20:18:55.000000', 'Terminé', '96 Rue Georges Lardennois', '2ème étage, Porte 11', '75019', 'Paris', 6, 8),
(7, '#ABC7', '2020-01-08 20:25:34.000000', '2020-01-08 20:31:57.000000', '2020-01-08 20:38:05.000000', 'Terminé', '8 Square Lamarck', NULL, '75018', 'Paris', 7, 8);

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
CREATE TABLE IF NOT EXISTS `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `unit_price_excl_taxes` decimal(4,2) NOT NULL,
  `value_added_taxes` decimal(4,2) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id_idx` (`order_id`) USING BTREE,
  KEY `dish_id_idx` (`dish_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_line`
--

INSERT INTO `order_line` (`id`, `quantity`, `unit_price_excl_taxes`, `value_added_taxes`, `dish_id`, `order_id`) VALUES
(1, 1, '5.00', '0.05', 8, 1),
(2, 1, '4.17', '0.05', 19, 1),
(3, 1, '5.83', '0.05', 7, 2),
(4, 1, '3.50', '0.05', 12, 2),
(5, 1, '4.99', '0.05', 3, 3),
(6, 2, '7.50', '0.05', 13, 3),
(7, 1, '4.50', '0.05', 2, 4),
(8, 1, '3.67', '0.05', 20, 4),
(9, 1, '5.75', '0.05', 6, 5),
(10, 1, '4.17', '0.05', 19, 5),
(11, 1, '4.92', '0.05', 1, 6),
(12, 1, '3.29', '0.05', 14, 6),
(13, 1, '6.25', '0.05', 10, 7),
(14, 2, '7.08', '0.05', 18, 7);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dish_idx` (`dish_id`) USING BTREE,
  KEY `user_idx` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `quantity`, `dish_id`, `user_id`) VALUES
(1, 3, 1, 8),
(2, 2, 10, 8),
(3, 1, 14, 8),
(4, 4, 18, 8);

-- --------------------------------------------------------

--
-- Structure de la table `type_of_dish`
--

DROP TABLE IF EXISTS `type_of_dish`;
CREATE TABLE IF NOT EXISTS `type_of_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_of_dish`
--

INSERT INTO `type_of_dish` (`id`, `name`) VALUES
(1, 'Plat'),
(2, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `additional_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(50) NOT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `phone`, `address`, `additional_address`, `zip_code`, `city`, `latitude`, `longitude`, `availability`, `role`) VALUES
(1, 'Pierre', 'Monceau', '455e5c19b30f69398ccd8c7bd2efd4d1', '0612345678', '30 Rue de Lisbonne', NULL, '75008', 'Paris', NULL, NULL, NULL, 'Client'),
(2, 'Laura', 'Becker', '455e5c19b30f69398ccd8c7bd2efd4d1', '0655223348', '15 Cité Malesherbes', NULL, '75009', 'Paris', NULL, NULL, NULL, 'Client'),
(3, 'Mathieu', 'Descart', '455e5c19b30f69398ccd8c7bd2efd4d1', '0678663322', '23 Boulevard Murat', NULL, '75016', 'Paris', NULL, NULL, NULL, 'Client'),
(4, 'Eva', 'Pons', '455e5c19b30f69398ccd8c7bd2efd4d1', '0644896322', '6 Passage Rauch', NULL, '75011', 'Paris', NULL, NULL, NULL, 'Client'),
(5, 'Emile', 'Berthot', '455e5c19b30f69398ccd8c7bd2efd4d1', '0644791130', '139 Quai de Valmy', NULL, '75010', 'Paris', NULL, NULL, NULL, 'Client'),
(6, 'Océane', 'Tissier', '455e5c19b30f69398ccd8c7bd2efd4d1', '0610368875', '1 Place Albert Londres', NULL, '75013', 'Paris', NULL, NULL, NULL, 'Client'),
(7, 'Lucas', 'Rousseau', '455e5c19b30f69398ccd8c7bd2efd4d1', '0629701433', '8 Square Lamarck', NULL, '75018', 'Paris', NULL, NULL, NULL, 'Client'),
(8, 'Bruno', 'Durand', 'd41d8cd98f00b204e9800998ecf8427e', '0722154960', 'Place de la Concorde', NULL, '75008', 'Paris', '48.866166', '2.321063', 1, 'Livreur');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `fk_Dish_TypeOfDish1` FOREIGN KEY (`type_of_dish_id`) REFERENCES `type_of_dish` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_delivery_man_id` FOREIGN KEY (`delivery_man_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `fk_OrderLine_Dish1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `fk_OrderLine_Order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_Stock_Dish1` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `fk_Stock_User1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
