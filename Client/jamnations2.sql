-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 18 Juillet 2016 à 18:09
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `jamnations2`
--

-- --------------------------------------------------------

--
-- Structure de la table `administre`
--

CREATE TABLE IF NOT EXISTS `administre` (
  `id` int(11) NOT NULL,
  `id_Gamejam` int(11) NOT NULL,
  `id_ContenuSite` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Gamejam`,`id_ContenuSite`),
  KEY `FK_Administre_id_Gamejam` (`id_Gamejam`),
  KEY `FK_Administre_id_ContenuSite` (`id_ContenuSite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `a_lieu`
--

CREATE TABLE IF NOT EXISTS `a_lieu` (
  `id` int(11) NOT NULL,
  `id_Gamejam` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Gamejam`),
  KEY `FK_a_lieu_id_Gamejam` (`id_Gamejam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `a_lieu`
--

INSERT INTO `a_lieu` (`id`, `id_Gamejam`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `benevole`
--

CREATE TABLE IF NOT EXISTS `benevole` (
  `jourdisp_b` varchar(50) DEFAULT NULL,
  `heuredisp_debut` varchar(5) DEFAULT NULL,
  `heuredisp_fin` varchar(5) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `id_Gamejam` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Gamejam`),
  KEY `FK_benevole_id_Gamejam` (`id_Gamejam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_c` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commanditegamejam`
--

CREATE TABLE IF NOT EXISTS `commanditegamejam` (
  `id` int(11) NOT NULL,
  `id_Partenaire` int(11) NOT NULL,
  `CommanditairePrincipal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`,`id_Partenaire`),
  KEY `FK_commanditegamejam_id_Partenaire` (`id_Partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commanditegamejam`
--

INSERT INTO `commanditegamejam` (`id`, `id_Partenaire`, `CommanditairePrincipal`) VALUES
(1, 1, 0),
(1, 2, 1),
(1, 3, 0),
(1, 4, 0),
(2, 3, 0),
(2, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commanditesaison`
--

CREATE TABLE IF NOT EXISTS `commanditesaison` (
  `id` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_saison`),
  KEY `FK_commanditeSaison_id_saison` (`id_saison`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commanditesaison`
--

INSERT INTO `commanditesaison` (`id`, `id_saison`) VALUES
(1, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contenusite`
--

CREATE TABLE IF NOT EXISTS `contenusite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TexteAccueilFR` varchar(5000) DEFAULT NULL,
  `TexteAccueilEn` varchar(5000) DEFAULT NULL,
  `TitreAccueilFR` varchar(5000) DEFAULT NULL,
  `TitreAccueilEn` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `contenusite`
--

INSERT INTO `contenusite` (`id`, `TexteAccueilFR`, `TexteAccueilEn`, `TitreAccueilFR`, `TitreAccueilEn`) VALUES
(1, 'Jam Nations est une initiative de La Guilde des développeurs de jeux vidéo du Québec qui vise à regrouper, dans une ligue de type sportive, des étudiants et des développeurs de jeu professionnels ainsi qu’à organiser des événements récurrents avec des partenaires issus de différentes communautés (urbaines, sociales, communautaires, etc.)\n\nNotre mission: Unir les esprits, émanciper la créativité et faire rayonner les talents de l’industrie du jeu vidéo au grand public.\n\nNous pensons au-delà du jeu:\nLors des game jam, nos créateurs répondent à l’appel fait des organismes culturels, scientifiques ou entrepreneuriaux désirant élargir les horizons du jeu dans la société.\n\nNous sondons l’inexploré:\nCet appel à l’exploration se manifeste par un thème et un défi créatif issus de l’esprit des acteurs du milieu ciblé. Nos créateurs ont alors 48h pour créer un jeu répondant à cet appel.\n\nNous célébrons les créateurs:\nNous terminons l’année Jam Nations par un grand vernissage où tous sont invité à venir voir les jeux créés durant l’année, voter pour leurs favoris et faire la fête avec tous les créateurs de Jam Nations.\n\nL’objectif de Jam Nations est d’organiser plusieurs game jam dès l’automne 2016.szert', 'Jam Nations est une initiative de La Guilde des développeurs de jeux vidéo du Québec qui vise à regrouper, dans une ligue de type sportive, des étudiants et des développeurs de jeu professionnels ainsi qu’à organiser des événements récurrents avec des partenaires issus de différentes communautés (urbaines, sociales, communautaires, etc.)\r\n\r\nNotre mission: Unir les esprits, émanciper la créativité et faire rayonner les talents de l’industrie du jeu vidéo au grand public.\r\n\r\nNous pensons au-delà du jeu:\r\nLors des game jam, nos créateurs répondent à l’appel fait des organismes culturels, scientifiques ou entrepreneuriaux désirant élargir les horizons du jeu dans la société.\r\n\r\nNous sondons l’inexploré:\r\nCet appel à l’exploration se manifeste par un thème et un défi créatif issus de l’esprit des acteurs du milieu ciblé. Nos créateurs ont alors 48h pour créer un jeu répondant à cet appel.\r\n\r\nNous célébrons les créateurs:\r\nNous terminons l’année Jam Nations par un grand vernissage où tous sont invité à venir voir les jeux créés durant l’année, voter pour leurs favoris et faire la fête avec tous les créateurs de Jam Nations.\r\n\r\nL’objectif de Jam Nations est d’organiser plusieurs game jam dès l’automne 2016.', 'Pensons au-delà du jeu', 'Pensons au-delà du jeu'),
(3, 'sdadasd', 'test', 'test', 'estt');

-- --------------------------------------------------------

--
-- Structure de la table `cree`
--

CREATE TABLE IF NOT EXISTS `cree` (
  `id` int(11) NOT NULL,
  `id_Role` int(11) NOT NULL,
  `id_Jeu` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Role`,`id_Jeu`),
  KEY `FK_Cree_id_Role` (`id_Role`),
  KEY `FK_Cree_id_Jeu` (`id_Jeu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_e` varchar(50) NOT NULL,
  `adresse_e` varchar(50) DEFAULT NULL,
  `courriel_e` varchar(50) NOT NULL,
  `image_e` varchar(50) DEFAULT NULL,
  `telephone_e` varchar(20) NOT NULL,
  `institut_e` varchar(50) DEFAULT NULL,
  `points_e` smallint(6) DEFAULT NULL,
  `idetatprof` int(11) NOT NULL,
  `id_Liens` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`id`, `nom_e`, `adresse_e`, `courriel_e`, `image_e`, `telephone_e`, `institut_e`, `points_e`, `idetatprof`, `id_Liens`) VALUES
(1, 'Les cools', '5985 turenne montreal', 'cool@hotmail.com', 'Affordance_3000x3000-RGB-284x300.png', '55555555', '', 0, 1, 1),
(2, 'happy friend', '12 rue de la patatte', 'js', 'Barnaque_LOGO1-300x205.png', '55555555', '', 0, 1, 1),
(3, 'asd', 'asd', 'asd@asd', 'Carcajou_Large_Inverse_blanc-300x125.png', '222', '', 0, 1, 1),
(4, 'asd', 'as', 'asd@asd', 'illogika_horizontal_white_01-300x122.png', 'asd', '', 0, 2, 1),
(5, 'asddd', 'asdasd', 'asd@asd', 'Kitfox_logo-300x213.png', '2222', '', 0, 1, 1),
(6, 'jobbsd', 'oasdos', 'asd@asd', 'LAVWA-GAMES_logoNB-258x300.png', '333', '', 0, 1, 1),
(7, 'asda', 'asda', 'dd@as', 'logo_outerminds-150x150.png', 'asd', '', 0, 1, 1),
(8, 'ewq', 'qwqw', 'qweqw@hot', 'Logo-borealys-300x222.png', 'qwe', '', 0, 1, 1),
(9, 'Orphelins', NULL, 'info@jamnations.com', NULL, '5555555555', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `etatprof`
--

CREATE TABLE IF NOT EXISTS `etatprof` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `etatprof`
--

INSERT INTO `etatprof` (`id`, `etat`) VALUES
(1, 'professionnel'),
(2, 'etudiant');

-- --------------------------------------------------------

--
-- Structure de la table `font_partie`
--

CREATE TABLE IF NOT EXISTS `font_partie` (
  `id` int(11) NOT NULL,
  `id_Equipe` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Equipe`),
  KEY `FK_font_partie_id_Equipe` (`id_Equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `font_partie`
--

INSERT INTO `font_partie` (`id`, `id_Equipe`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(6, 9),
(7, 9);

-- --------------------------------------------------------

--
-- Structure de la table `gamejam`
--

CREATE TABLE IF NOT EXISTS `gamejam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrainte_g` varchar(50) DEFAULT NULL,
  `theme_g` varchar(50) DEFAULT NULL,
  `lieu` varchar(50) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `dateGamejam` varchar(1000) NOT NULL,
  `heure` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `gamejam`
--

INSERT INTO `gamejam` (`id`, `contrainte_g`, `theme_g`, `lieu`, `description`, `dateGamejam`, `heure`) VALUES
(1, 'Inserer une pyramide', 'Pharaons', 'UQAM', ' Cet événement aura lieu vers la mi-juin afin de dévoiler les gagnants des différentes catégories. Le public y sera invité et il pourra voter pour son coup de cœur pendant la soirée.', 'Du vendredi 3 juin au dimanche 5 juin 2016', 'Ouverture des portes à 16h et début du jam à 18h'),
(2, 'faire un chat', 'les chats', 'Bromont', 'il faut faire des chats car c''est jolie', 'le 08 Aout', 'de 22 heure a 5h00');

-- --------------------------------------------------------

--
-- Structure de la table `jeu`
--

CREATE TABLE IF NOT EXISTS `jeu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_j` varchar(50) NOT NULL,
  `lien_j` varchar(50) DEFAULT NULL,
  `id_Gamejam` int(11) NOT NULL,
  `id_Equipe` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Jeu_id_Gamejam` (`id_Gamejam`),
  KEY `FK_Jeu_id_Equipe` (`id_Equipe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `jeu`
--

INSERT INTO `jeu` (`id`, `nom_j`, `lien_j`, `id_Gamejam`, `id_Equipe`) VALUES
(1, 'Amour ou Patrie', 'https://itch.io/embed/70511', 1, 1),
(2, 'Bond of Life', 'https://itch.io/embed/70468', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `liens`
--

CREATE TABLE IF NOT EXISTS `liens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lien` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `liens`
--

INSERT INTO `liens` (`id`, `lien`) VALUES
(1, 'www.borealysgames.com/fr');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_m` varchar(50) NOT NULL,
  `prenom_m` varchar(50) NOT NULL,
  `courriel_m` varchar(50) NOT NULL,
  `image_m` varchar(50) DEFAULT NULL,
  `mp_membre` varchar(50) NOT NULL,
  `role_m` varchar(50) DEFAULT NULL,
  `description_m` varchar(50) DEFAULT NULL,
  `id_Liens` int(11) DEFAULT NULL,
  `id_etatprof` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courriel_m` (`courriel_m`),
  KEY `FK_Membre_id_Liens` (`id_Liens`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`id`, `nom_m`, `prenom_m`, `courriel_m`, `image_m`, `mp_membre`, `role_m`, `description_m`, `id_Liens`, `id_etatprof`) VALUES
(1, 'Johnny', 'Cash', 'cash@hotmail.com', 'Alexandre-LesKittaines.jpg', 'abc', NULL, NULL, NULL, 0),
(2, 'Bob', 'Dylan', 'caaaawewesh@hotmail.com', 'Alexis-SittingBulls.jpg', 'abc', NULL, NULL, NULL, 0),
(3, 'Yoko', 'Ono', 'cashs@hotmail.com', NULL, 'abc', NULL, NULL, NULL, 0),
(4, 'Jimi', 'Hendrix', 'cassh@hotmail.com', 'Alexandre-LesKittaines.jpg', 'abc', NULL, NULL, NULL, 0),
(5, 'Jonis', 'Joplin', 'cashfff@hotmail.com', 'Elaine-LesKittaines.jpg', 'abc', NULL, NULL, NULL, 0),
(6, 'Alanis', 'Morisette', 'cashgggg@hotmail.com', 'Alexandre-LesKittaines.jpg', 'abc', NULL, NULL, NULL, 0),
(7, 'Avril', 'Lavigne', 'caaaaaash@hotmail.com', 'Anthony-SittingBulls.jpg', 'abc', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_c` smallint(6) NOT NULL,
  `id_Membre` int(11) NOT NULL,
  `id_Jeu` int(11) NOT NULL,
  `id_Categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Note_id_Membre` (`id_Membre`),
  KEY `FK_Note_id_Jeu` (`id_Jeu`),
  KEY `FK_Note_id_Categorie` (`id_Categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

CREATE TABLE IF NOT EXISTS `partenaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_p` varchar(50) NOT NULL,
  `urlpartenaire` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `partenaire`
--

INSERT INTO `partenaire` (`id`, `nom_p`, `urlpartenaire`, `image`) VALUES
(1, 'asdasdwea', 'qeqeqwe', 'cossette-new-logo-300x56.png'),
(2, 'Cosette', 'www.cossette.com/', 'cossette-new-logo-300x56.png'),
(3, 'etst', 'as.com', 'QDS_logo-1-300x106.png'),
(4, 'fasfasf', 'asdasdasdasd', 'logo-imaklip-w-221x300.png'),
(5, 'testet', 'asasdas', 'QDS_logo-1-300x106.png'),
(6, 'UQAM', 'http://www.uqam.ca/', 'logo-imaklip-w-221x300.png');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_p` varchar(50) NOT NULL,
  `id_Gamejam` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pays_id_Gamejam` (`id_Gamejam`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`id`, `nom_p`, `id_Gamejam`) VALUES
(1, 'Montreal', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `saison`
--

CREATE TABLE IF NOT EXISTS `saison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datedebut_s` varchar(10) DEFAULT NULL,
  `datefin_s` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `saison`
--

INSERT INTO `saison` (`id`, `datedebut_s`, `datefin_s`) VALUES
(1, '01/01/2016', '08/07/2016'),
(2, '01/10/2016', '30/07/2017');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Design` int(11) DEFAULT NULL,
  `Programation` int(11) DEFAULT NULL,
  `Arts` int(11) DEFAULT NULL,
  `Son` int(11) DEFAULT NULL,
  `Animation` int(11) DEFAULT NULL,
  `id_Membre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Specialite_id_Membre` (`id_Membre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `specialite`
--

INSERT INTO `specialite` (`id`, `Design`, `Programation`, `Arts`, `Son`, `Animation`, `id_Membre`) VALUES
(1, 20, 30, 40, 99, 70, 1),
(2, 99, 80, 2, 0, 49, 2),
(3, 80, 60, 30, 80, 20, 4),
(4, 10, 25, 50, 75, 100, 3),
(5, 20, 50, 69, 32, 60, 5),
(6, 29, 50, 35, 70, 60, 6),
(7, 58, 70, 55, 99, 48, 7);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administre`
--
ALTER TABLE `administre`
  ADD CONSTRAINT `FK_Administre_id` FOREIGN KEY (`id`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_Administre_id_ContenuSite` FOREIGN KEY (`id_ContenuSite`) REFERENCES `contenusite` (`id`),
  ADD CONSTRAINT `FK_Administre_id_Gamejam` FOREIGN KEY (`id_Gamejam`) REFERENCES `gamejam` (`id`);

--
-- Contraintes pour la table `a_lieu`
--
ALTER TABLE `a_lieu`
  ADD CONSTRAINT `FK_a_lieu_id` FOREIGN KEY (`id`) REFERENCES `saison` (`id`),
  ADD CONSTRAINT `FK_a_lieu_id_Gamejam` FOREIGN KEY (`id_Gamejam`) REFERENCES `gamejam` (`id`);

--
-- Contraintes pour la table `benevole`
--
ALTER TABLE `benevole`
  ADD CONSTRAINT `FK_benevole_id` FOREIGN KEY (`id`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_benevole_id_Gamejam` FOREIGN KEY (`id_Gamejam`) REFERENCES `gamejam` (`id`);

--
-- Contraintes pour la table `commanditegamejam`
--
ALTER TABLE `commanditegamejam`
  ADD CONSTRAINT `FK_commanditegamejam_id` FOREIGN KEY (`id`) REFERENCES `gamejam` (`id`),
  ADD CONSTRAINT `FK_commanditegamejam_id_Partenaire` FOREIGN KEY (`id_Partenaire`) REFERENCES `partenaire` (`id`);

--
-- Contraintes pour la table `commanditesaison`
--
ALTER TABLE `commanditesaison`
  ADD CONSTRAINT `FK_commanditeSaison_id` FOREIGN KEY (`id`) REFERENCES `partenaire` (`id`),
  ADD CONSTRAINT `FK_commanditeSaison_id_saison` FOREIGN KEY (`id_saison`) REFERENCES `saison` (`id`);

--
-- Contraintes pour la table `cree`
--
ALTER TABLE `cree`
  ADD CONSTRAINT `FK_Cree_id` FOREIGN KEY (`id`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_Cree_id_Jeu` FOREIGN KEY (`id_Jeu`) REFERENCES `jeu` (`id`),
  ADD CONSTRAINT `FK_Cree_id_Role` FOREIGN KEY (`id_Role`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `font_partie`
--
ALTER TABLE `font_partie`
  ADD CONSTRAINT `FK_font_partie_id` FOREIGN KEY (`id`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_font_partie_id_Equipe` FOREIGN KEY (`id_Equipe`) REFERENCES `equipe` (`id`);

--
-- Contraintes pour la table `jeu`
--
ALTER TABLE `jeu`
  ADD CONSTRAINT `FK_Jeu_id_Equipe` FOREIGN KEY (`id_Equipe`) REFERENCES `equipe` (`id`),
  ADD CONSTRAINT `FK_Jeu_id_Gamejam` FOREIGN KEY (`id_Gamejam`) REFERENCES `gamejam` (`id`);

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `FK_Membre_id_Liens` FOREIGN KEY (`id_Liens`) REFERENCES `liens` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK_Note_id_Categorie` FOREIGN KEY (`id_Categorie`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_Note_id_Jeu` FOREIGN KEY (`id_Jeu`) REFERENCES `jeu` (`id`),
  ADD CONSTRAINT `FK_Note_id_Membre` FOREIGN KEY (`id_Membre`) REFERENCES `membre` (`id`);

--
-- Contraintes pour la table `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `FK_pays_id_Gamejam` FOREIGN KEY (`id_Gamejam`) REFERENCES `gamejam` (`id`);

--
-- Contraintes pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD CONSTRAINT `FK_Specialite_id_Membre` FOREIGN KEY (`id_Membre`) REFERENCES `membre` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
