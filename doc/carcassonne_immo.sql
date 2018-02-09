-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 09 Février 2018 à 10:13
-- Version du serveur :  5.7.21-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `carcassonne_immo`
--

-- --------------------------------------------------------

--
-- Structure de la table `adm_admin`
--

CREATE TABLE `adm_admin` (
  `adm_id` int(11) NOT NULL,
  `adm_prenom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `adm_nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `adm_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `adm_admin`
--

INSERT INTO `adm_admin` (`adm_id`, `adm_prenom`, `adm_nom`, `adm_telephone`) VALUES
(3, 'chris', 'juin', '0615151515');

-- --------------------------------------------------------

--
-- Structure de la table `ann_annonce`
--

CREATE TABLE `ann_annonce` (
  `ann_id` int(11) NOT NULL,
  `ann_titre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ann_nb_pieces` int(11) NOT NULL,
  `ann_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ann_prix` double NOT NULL,
  `ann_photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cli_id` int(11) DEFAULT NULL,
  `typ_id` int(11) DEFAULT NULL,
  `adm_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `ann_annonce`
--

INSERT INTO `ann_annonce` (`ann_id`, `ann_titre`, `ann_nb_pieces`, `ann_description`, `ann_prix`, `ann_photo`, `cli_id`, `typ_id`, `adm_id`) VALUES
(2, 'lorem', 6, 'lorem inpseu', 69.68, 'https://cdn2.nextinpact.com/images/bd/wide-linked-media/13177.jpg', NULL, NULL, NULL),
(3, 'Annonce Pierre-François', 3, 'taratata', 230, 'test.jpg', 1, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `cli_client`
--

CREATE TABLE `cli_client` (
  `cli_id` int(11) NOT NULL,
  `cli_prenom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cli_nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cli_telephone` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `cli_client`
--

INSERT INTO `cli_client` (`cli_id`, `cli_prenom`, `cli_nom`, `cli_telephone`) VALUES
(1, 'untel', 'intel', '0615151515');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(3, 'chris', 'chris', 'chris@chris.com', 'chris@chris.com', 1, NULL, '$2y$13$wL60SqDZDSVrdzIj7C/Mx..9hQ/Pvz7MbddWBbG4te2LfHavIYXri', '2018-02-02 15:37:02', NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}'),
(4, 'jean-ma', 'jean-ma', 'c.juin.cj@gmail.com', 'c.juin.cj@gmail.com', 1, NULL, '$2y$13$CeZt0sr.dgwnbqzHDe8QfeiUVB4D0.lLfxuPfcsRdpchIBTTEE42.', '2018-02-09 09:43:37', NULL, NULL, 'a:0:{}');

-- --------------------------------------------------------

--
-- Structure de la table `typ_type`
--

CREATE TABLE `typ_type` (
  `typ_id` int(11) NOT NULL,
  `typ_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `typ_type`
--

INSERT INTO `typ_type` (`typ_id`, `typ_type`) VALUES
(1, 'vente'),
(2, 'location');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adm_admin`
--
ALTER TABLE `adm_admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Index pour la table `ann_annonce`
--
ALTER TABLE `ann_annonce`
  ADD PRIMARY KEY (`ann_id`),
  ADD KEY `IDX_466D3B10BC4EE2B0` (`cli_id`),
  ADD KEY `IDX_466D3B10278CD074` (`typ_id`),
  ADD KEY `IDX_466D3B104E949F2D` (`adm_id`);

--
-- Index pour la table `cli_client`
--
ALTER TABLE `cli_client`
  ADD PRIMARY KEY (`cli_id`);

--
-- Index pour la table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Index pour la table `typ_type`
--
ALTER TABLE `typ_type`
  ADD PRIMARY KEY (`typ_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adm_admin`
--
ALTER TABLE `adm_admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `ann_annonce`
--
ALTER TABLE `ann_annonce`
  MODIFY `ann_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `cli_client`
--
ALTER TABLE `cli_client`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `typ_type`
--
ALTER TABLE `typ_type`
  MODIFY `typ_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ann_annonce`
--
ALTER TABLE `ann_annonce`
  ADD CONSTRAINT `FK_466D3B10278CD074` FOREIGN KEY (`typ_id`) REFERENCES `typ_type` (`typ_id`),
  ADD CONSTRAINT `FK_466D3B104E949F2D` FOREIGN KEY (`adm_id`) REFERENCES `adm_admin` (`adm_id`),
  ADD CONSTRAINT `FK_466D3B10BC4EE2B0` FOREIGN KEY (`cli_id`) REFERENCES `cli_client` (`cli_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
