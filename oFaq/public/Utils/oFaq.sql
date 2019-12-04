-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 18 Septembre 2019 à 16:29
-- Version du serveur :  5.7.24-0ubuntu0.16.04.1
-- Version de PHP :  7.2.11-4+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `oFaq`
--

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `approve` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `answer`
--

INSERT INTO `answer` (`id`, `user_id`, `question_id`, `content`, `created_at`, `updated_at`, `visible`, `approve`) VALUES
(1, 33, 131, '123', '2019-09-15 17:38:42', NULL, 1, NULL),
(2, 33, 131, '321', '2019-09-15 17:38:47', NULL, 0, NULL),
(3, 33, 135, '987', '2019-09-15 17:39:11', NULL, 1, 1),
(4, 33, 135, 'ttt', '2019-09-16 12:03:22', NULL, 1, 1),
(5, 33, 137, 'd', '2019-09-16 17:46:34', NULL, 1, 1),
(6, 36, 137, 'carrément daccord avec toi !!', '2019-09-16 19:09:20', NULL, 1, NULL),
(7, 36, 135, '98 ?', '2019-09-16 19:11:25', NULL, 1, NULL),
(8, 36, 138, 'bla bla bla', '2019-09-16 20:27:25', NULL, 1, 1),
(9, 38, 140, 'c\'est pas trop mal', '2019-09-17 09:15:49', NULL, 1, NULL),
(10, 34, 137, 'Hello la team :)', '2019-09-17 09:28:11', NULL, 1, NULL),
(11, 40, 140, 'je préfère Nelmio/Alice', '2019-09-18 15:25:37', NULL, 1, NULL),
(12, 40, 141, 'test', '2019-09-18 15:26:59', NULL, 1, 1),
(13, 33, 141, 'OUIIIII :D', '2019-09-18 15:48:02', NULL, 1, NULL),
(14, 33, 142, 'etet', '2019-09-18 16:01:34', NULL, 1, 1),
(15, 34, 141, 'Bien suuuur !!!', '2019-09-18 16:13:04', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190910133523', '2019-09-10 13:35:29'),
('20190910133730', '2019-09-10 13:37:34'),
('20190910133902', '2019-09-10 13:39:05'),
('20190910133942', '2019-09-10 13:39:46'),
('20190910140249', '2019-09-10 14:02:54'),
('20190910140317', '2019-09-10 14:03:21'),
('20190910140343', '2019-09-10 14:03:48'),
('20190910143328', '2019-09-10 14:33:39'),
('20190910143501', '2019-09-10 14:35:05'),
('20190910144104', '2019-09-10 14:41:08'),
('20190910190611', '2019-09-10 19:06:17'),
('20190910191036', '2019-09-10 19:10:40'),
('20190911084004', '2019-09-11 08:40:10'),
('20190911164717', '2019-09-11 16:47:33'),
('20190911164850', '2019-09-11 16:48:55'),
('20190911211203', '2019-09-11 21:12:11'),
('20190911211233', '2019-09-11 21:12:36'),
('20190913133143', '2019-09-13 13:31:48'),
('20190913153708', '2019-09-13 15:37:13'),
('20190915114833', '2019-09-15 11:48:38'),
('20190915153131', '2019-09-15 15:31:36'),
('20190915162731', '2019-09-15 16:27:36'),
('20190917133104', '2019-09-17 13:31:11');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`, `visible`) VALUES
(122, 'un test ce matin', 'ok', 32, '2019-09-11 09:23:01', NULL, 0),
(124, 'ggg', 'ggg', 32, '2019-09-11 18:13:38', NULL, 1),
(126, 'Une question cuisine ??', 'Et pourquoi pas ?', 32, '2019-09-11 19:08:07', NULL, 1),
(127, 'Choix multiple ?', 'Ok', 32, '2019-09-11 19:08:00', NULL, 1),
(128, 'new questions ?', 'lorem ipsum :)', 34, '2019-09-12 09:15:01', NULL, 1),
(129, 'Essayons d\'ajouter un tag.', 'Est-ce que cela fonctionne?', 32, '2019-09-13 17:29:02', NULL, 1),
(130, 'Encore un test', 'Et pourquoi pas?', 32, '2019-09-13 17:37:34', NULL, 1),
(131, 'Oh ?', 'oif ijfzpoe ?', 32, '2019-09-15 14:33:59', NULL, 1),
(132, 'ikjthr', 'gzf', 32, '2019-09-15 14:36:10', NULL, 0),
(133, 'sss', 'sssss', 32, '2019-09-15 14:37:28', NULL, 1),
(134, 'test', 'est', 32, '2019-09-15 14:42:21', NULL, 1),
(135, '987654 ?', '987 ?', 33, '2019-09-15 17:39:06', NULL, 1),
(136, 'On teste les tags', 'Héhé', 33, '2019-09-16 15:01:11', NULL, 1),
(137, 'Utiliser BS ?', 'Yes !', 33, '2019-09-16 15:49:12', NULL, 1),
(138, 'comment on choisit son projet ??', 'je me tate.....', 36, '2019-09-16 20:27:10', NULL, 1),
(139, 'EasyBundle', 'Est-ce une bundle easy?', 33, '2019-09-17 01:16:19', NULL, 0),
(140, 'Faker', 'Qu\'en pensez vous?', 33, '2019-09-17 01:34:52', NULL, 0),
(141, 'Es ce qu\'on va tout déchirer en apo ?', 'bjezihfioezahfaezlkfheza', 40, '2019-09-18 15:26:44', NULL, 1),
(142, 'eeee', 'eee', 33, '2019-09-18 16:01:31', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `question_like`
--

CREATE TABLE `question_like` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `question_like`
--

INSERT INTO `question_like` (`id`, `question_id`, `user_id`) VALUES
(23, 134, 33),
(27, 140, 33),
(29, 139, 34),
(31, 134, 34),
(32, 139, 33),
(35, 124, 40),
(36, 140, 41);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(5, 'Autre'),
(7, 'Symfo'),
(8, 'Php'),
(9, 'Javascript'),
(10, 'bootstrap'),
(11, 'react'),
(12, 'react');

-- --------------------------------------------------------

--
-- Structure de la table `tag_question`
--

CREATE TABLE `tag_question` (
  `tag_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `tag_question`
--

INSERT INTO `tag_question` (`tag_id`, `question_id`) VALUES
(5, 135),
(5, 140),
(5, 142),
(7, 136),
(7, 138),
(7, 139),
(7, 140),
(7, 141),
(10, 137);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `roles`) VALUES
(32, 'Coralie', 'Blanco', 'coralie@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$XWWjB4fBgrTNJYLFe5yAeg$Hw0Dyt7Kr4+6Z9+xFFvqAVgwV9W884P6u+OOD3pwckg', '["ROLE_USER"]'),
(33, 'Coco', 'Co', 'coco1@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$dq/c77phuU1UqcAIylMQrw$PTNGKw3qSBgIYC+OdqUr8H+ndpBXGdwVIEV8VL7eKNQ', '["ROLE_ADMIN"]'),
(34, 'zine-eddine', 'yakhoui', 'yakhoui.z@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$DfEX1TSweE96zVfwAE+nDw$6DeQO71y7P85AaGPi3d9y+HJE+In7cTpJod5bZsBSM0', '["ROLE_MODERATEUR"]'),
(35, 'co', 'coco', 'coco2@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$e3NBtq0fDiYmOExtbDkuGg$4xcBhdgE35NmbpNIPUxRqOJ9jG/eKUFCzgv7sGnNltU', '["ROLE_MODERATEUR"]'),
(36, 'nico', 'chauviere', 'nico@nico.fr', '$argon2id$v=19$m=65536,t=4,p=1$1eeHghubCAGfwMA9+XoCSQ$UBq6o3hrHvofe+En+Ml+Blo1ZSYVatiuNQyWlKUau9I', '["ROLE_ADMIN"]'),
(37, 'nicolas', 'nicolas', 'nicolas@nicolas.fr', '$argon2id$v=19$m=65536,t=4,p=1$gWE+H4ehj5ojgbsKkSJgiA$BsBU4h6LeAKFX6CKN2VSAglsYZgRfeBNt3ApYUh3iN8', '["ROLE_USER"]'),
(38, 'emilie', 'b', 'emilie@orange.fr', '$argon2id$v=19$m=65536,t=4,p=1$jTk3VulLnS8zEG1RUHQCPg$slRYjJQFQCFI7qegRv6N1aUcmWtUhiZeB2NUM1yZge8', '["ROLE_ADMIN"]'),
(40, 'nicolas', 'chauvieretest', 'nicoc@nico.fr', '$argon2id$v=19$m=65536,t=4,p=1$jb7zoSqznmXd7gn8AQpV1Q$59R6Tup/Szf95f4Wgh6EEgdJPpqmuWDd//mF4DZm2ig', '["ROLE_USER"]'),
(41, 'nicolas', 'chauviere', 'nicoc2010@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$CWIxsC3uye2E87KlmniX4g$f2XYY5X8AyJr+kQSucJfJEc+bzPm0Ya4Is/BcGCVjyo', '["ROLE_ADMIN"]');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DADD4A25A76ED395` (`user_id`),
  ADD KEY `IDX_DADD4A251E27F6BF` (`question_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6F7494EA76ED395` (`user_id`);

--
-- Index pour la table `question_like`
--
ALTER TABLE `question_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F28DAD5C1E27F6BF` (`question_id`),
  ADD KEY `IDX_F28DAD5CA76ED395` (`user_id`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag_question`
--
ALTER TABLE `tag_question`
  ADD PRIMARY KEY (`question_id`,`tag_id`),
  ADD KEY `IDX_80C63295BAD26311` (`tag_id`),
  ADD KEY `IDX_80C632951E27F6BF` (`question_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT pour la table `question_like`
--
ALTER TABLE `question_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_DADD4A251E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FK_DADD4A25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `question_like`
--
ALTER TABLE `question_like`
  ADD CONSTRAINT `FK_F28DAD5C1E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FK_F28DAD5CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `tag_question`
--
ALTER TABLE `tag_question`
  ADD CONSTRAINT `FK_80C632951E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_80C63295BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
