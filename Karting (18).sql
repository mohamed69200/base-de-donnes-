-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 01 mai 2024 à 06:18
-- Version du serveur :  10.5.23-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Karting`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL COMMENT ' Identifiant unique pour chaque administrateur.',
  `utilisateur` varchar(50) NOT NULL COMMENT 'Le nom d''utilisateur de l''administrateur pour la connexion. ',
  `MDP` varchar(255) NOT NULL COMMENT 'Le mot de passe de l''administrateur pour la connexion sécurisée'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID`, `utilisateur`, `MDP`) VALUES
(1, 'admin', 'sn');

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL COMMENT 'Identifiant unique pour chaque course dans la base de données.',
  `nom_course` varchar(255) DEFAULT NULL,
  `DateHeureCourse` datetime DEFAULT NULL COMMENT ' Date et heure de la course.',
  `Lieu` varchar(100) DEFAULT 'Sembat' COMMENT 'Lieu de la course.',
  `TypeCourse` varchar(50) DEFAULT NULL COMMENT 'Type de course (amateur, professionnel, etc.). ',
  `ConditionsMeteo` varchar(50) DEFAULT NULL COMMENT 'Conditions météorologiques au moment de la course.',
  `GagnantCourse` int(11) DEFAULT NULL COMMENT 'Pilote gagnant (référence à PiloteID dans la table Pilotes). ',
  `CommentairesCourse` text DEFAULT NULL COMMENT 'Commentaires sur la course.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`CourseID`, `nom_course`, `DateHeureCourse`, `Lieu`, `TypeCourse`, `ConditionsMeteo`, `GagnantCourse`, `CommentairesCourse`) VALUES
(24, 'test5', '2024-06-04 13:58:00', 'Sembat', 'Professionnel', NULL, NULL, NULL),
(20, 'test1', '2024-06-03 14:14:00', 'Sembat', 'Professionnel', NULL, 21, NULL),
(21, 'test2', '2024-06-03 14:15:00', 'Sembat', 'Professionnel', NULL, 23, NULL),
(22, 'test4', '2024-06-03 14:17:00', 'Sembat', 'Professionnel', NULL, 24, NULL),
(23, 'test3', '2024-06-03 14:17:00', 'Sembat', 'Professionnel', NULL, 21, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `entretiens`
--

CREATE TABLE `entretiens` (
  `EntretienID` int(11) NOT NULL COMMENT 'Identifie de manière unique chaque entretien dans la base de données.',
  `KartID` int(11) DEFAULT NULL COMMENT ' Clé étrangère liée à la table Karts, indique le kart concerné par l''entretien. ',
  `TypeEntretien` varchar(50) DEFAULT NULL COMMENT 'Indique le type d''intervention réalisé (e.g., "Rénovation moteur", "Vidange").',
  `DateEntretien` date DEFAULT NULL COMMENT 'Enregistre la date à laquelle l''intervention a eu lieu',
  `CoutEntretien` decimal(10,2) DEFAULT NULL COMMENT 'Coût total de l''entretien. ',
  `DescriptionTravaux` text DEFAULT NULL COMMENT 'Description détaillée des travaux effectués. '
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entretiens`
--

INSERT INTO `entretiens` (`EntretienID`, `KartID`, `TypeEntretien`, `DateEntretien`, `CoutEntretien`, `DescriptionTravaux`) VALUES
(39, 603, ' Réparation ', '2024-05-01', '50.00', ' Suspension '),
(35, 604, ' vidange ', '2024-05-01', '50.00', ' vidange '),
(36, 606, ' vidange ', '2024-05-01', '50.00', ' vidange '),
(37, 609, ' Réparation ', '2024-05-01', '100.00', ' moteur '),
(38, 611, ' vidange ', '2024-05-01', '50.00', ' vidange ');

-- --------------------------------------------------------

--
-- Structure de la table `karts`
--

CREATE TABLE `karts` (
  `KartID` int(11) NOT NULL COMMENT 'Identifiant unique du kart.',
  `CourseID` int(11) DEFAULT NULL COMMENT 'Référence à la course à laquelle le kart a participé (clé étrangère liée à Courses).',
  `MarqueModele` varchar(255) DEFAULT NULL COMMENT 'Modèle du kart. ',
  `AnneeFabrication` int(11) DEFAULT NULL COMMENT ' Année de fabrication du kart. ',
  `NumeroSerie` varchar(255) DEFAULT NULL COMMENT 'Numéro de série unique attribué à chaque kart. ',
  `DateAchat` date DEFAULT NULL COMMENT 'Date d''achat du kart. ',
  `DateUtilisation` datetime DEFAULT NULL COMMENT ' Date d''utilisation du kart. ',
  `Latitude` float DEFAULT NULL COMMENT 'Latitude du Kart (gps)',
  `Longitude` float DEFAULT NULL COMMENT 'Longitude du kart (gps)',
  `Statut` varchar(50) DEFAULT 'Disponible' COMMENT 'Statut actuel du kart (disponible, en réparation, en entretien). ',
  `TemperatureMoteur` decimal(5,2) DEFAULT NULL COMMENT 'Température du moteur du kart. ',
  `VitesseKart` decimal(10,2) DEFAULT NULL COMMENT 'Vitesse actuelle du kart. ',
  `ToursPiste` int(11) DEFAULT NULL COMMENT 'Nombre de tours effectués par le kart. ',
  `TempsTour` time DEFAULT NULL COMMENT 'Temps nécessaire pour accomplir un tour de piste. ',
  `DistanceObstacle` decimal(5,2) DEFAULT NULL COMMENT 'Distance à laquelle un obstacle est détecté. ',
  `CoteImpact` varchar(10) DEFAULT NULL COMMENT 'Côté impacté en cas de détection d''obstacle. ',
  `ImpactDetected` tinyint(1) DEFAULT NULL COMMENT ' Indique si un impact a été détecté.',
  `LapTime` time DEFAULT NULL COMMENT 'Chrono',
  `BoutonDemarrage` tinyint(1) DEFAULT 0 COMMENT 'Bouton pour démarrer le kart a distance'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `karts`
--

INSERT INTO `karts` (`KartID`, `CourseID`, `MarqueModele`, `AnneeFabrication`, `NumeroSerie`, `DateAchat`, `DateUtilisation`, `Latitude`, `Longitude`, `Statut`, `TemperatureMoteur`, `VitesseKart`, `ToursPiste`, `TempsTour`, `DistanceObstacle`, `CoteImpact`, `ImpactDetected`, `LapTime`, `BoutonDemarrage`) VALUES
(602, NULL, ' Tony Kart Racer 401A ', 2021, ' DRF456 ', '2022-02-02', '2022-04-03 10:34:30', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(603, NULL, 'Birel ART AM29', 2021, 'GHI789', '2021-03-01', '2021-03-02 00:00:00', 45.7172, 4.88262, 'En maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(604, NULL, 'CRG Road Rebel', 2020, 'JKL012', '2020-04-01', '2020-04-02 00:00:00', 45.7172, 4.88262, 'En maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(605, NULL, 'Exprit Noesis R', 2019, 'MNO345', '2019-05-01', '2019-05-02 00:00:00', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(606, NULL, 'Praga Dragon Evo', 2018, 'PQR678', '2018-06-01', '2018-06-02 00:00:00', 45.7172, 4.88262, 'En maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(607, NULL, 'Alpha Karting Series', 2017, 'STU901', '2017-07-01', '2017-07-02 00:00:00', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(608, NULL, 'Kosmic Mercury R', 2016, 'VWX234', '2016-08-01', '2016-08-02 00:00:00', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(609, NULL, 'Energy Corse Dragon Evo', 2015, 'YZA567', '2015-09-01', '2015-09-02 00:00:00', 45.7172, 4.88262, 'En maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(601, NULL, 'Sodi Kart SR4', 2023, 'ABC123', '2023-01-01', '2023-01-02 00:00:00', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(610, NULL, 'Top Kart Twister', 2014, 'BCD890', '2014-10-01', '2014-10-02 00:00:00', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(611, NULL, 'Parolin Rocky GP14', 2013, 'EFG123', '2013-11-01', '2013-11-02 00:00:00', 45.7172, 4.88262, 'En maintenance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(612, NULL, 'DR Racing Kart Dakar Evo', 2012, 'HIJ456', '2012-12-01', '2012-12-02 00:00:00', 45.7172, 4.88262, 'Disponible', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `ParticipationID` int(11) NOT NULL COMMENT 'Identifiant unique pour chaque participation dans la base de données.',
  `PiloteID` int(11) DEFAULT NULL COMMENT 'Référence au Pilote participant (clé étrangère liée à Pilotes). ',
  `KartID` int(11) DEFAULT NULL COMMENT 'Référence au kart participant (clé étrangère liée à Karts).',
  `CourseID` int(11) DEFAULT NULL COMMENT 'Référence à la Course à laquelle le pilote participe (clé étrangère liée à Courses). ',
  `PositionFinale` int(11) DEFAULT 0 COMMENT 'Position finale du pilote dans la course. ',
  `TempsCourse` time DEFAULT NULL COMMENT 'Temps pris par le pilote pour terminer la course.',
  `ToursEffectues` int(11) DEFAULT NULL COMMENT 'Nombre de tours effectués par le pilote. ',
  `Statut` varchar(50) DEFAULT NULL COMMENT 'Statut du participant'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`ParticipationID`, `PiloteID`, `KartID`, `CourseID`, `PositionFinale`, `TempsCourse`, `ToursEffectues`, `Statut`) VALUES
(40, 24, 606, 17, 0, NULL, NULL, 'Terminé'),
(37, 21, 602, 17, 0, NULL, NULL, 'Terminé'),
(38, 22, 603, 17, 0, NULL, NULL, 'Terminé'),
(39, 23, 604, 17, 0, NULL, NULL, 'Terminé'),
(45, 21, 602, 19, 0, '00:00:00', 2, 'Terminé'),
(46, 22, 605, 19, 0, '00:00:00', 1, 'Terminé'),
(47, 23, 607, 19, 0, '00:00:00', 2, 'Terminé'),
(48, 24, 608, 19, 0, '00:00:00', 2, 'Terminé'),
(56, 24, 608, 21, 0, NULL, NULL, 'Terminé'),
(55, 23, 607, 21, 0, NULL, NULL, 'Terminé'),
(54, 22, 605, 21, 0, NULL, NULL, 'Terminé'),
(53, 21, 602, 21, 0, NULL, NULL, 'Terminé'),
(57, 21, 602, 22, 0, NULL, NULL, 'Terminé'),
(58, 22, 605, 22, 0, NULL, NULL, 'Terminé'),
(59, 23, 607, 22, 0, NULL, NULL, 'Terminé'),
(60, 24, 608, 22, 0, NULL, NULL, 'Terminé'),
(61, 21, 602, 23, 0, NULL, NULL, 'Terminé'),
(62, 22, 605, 23, 0, NULL, NULL, 'Terminé'),
(63, 23, 607, 23, 0, NULL, NULL, 'Terminé'),
(64, 24, 608, 23, 0, NULL, NULL, 'Terminé'),
(65, 21, 602, 24, 0, NULL, NULL, 'En cours'),
(66, 22, 605, 24, 0, NULL, NULL, 'En cours'),
(67, 23, 607, 24, 0, NULL, NULL, 'En cours'),
(68, 24, 608, 24, 0, NULL, NULL, 'En cours'),
(69, 25, 612, 24, 0, NULL, NULL, 'En cours');

-- --------------------------------------------------------

--
-- Structure de la table `pilotes`
--

CREATE TABLE `pilotes` (
  `PiloteID` int(11) NOT NULL COMMENT 'Numéro unique attribué au pilote',
  `Nom` varchar(50) DEFAULT NULL COMMENT 'Enregistre le nom du pilote. ',
  `Prenom` varchar(50) DEFAULT NULL COMMENT 'Stocke le prénom du pilote.',
  `DateNaissance` date DEFAULT NULL COMMENT 'Date de naissance du pilote. ',
  `Adresse` varchar(100) DEFAULT NULL COMMENT ' Adresse du pilote.',
  `Telephone` varchar(15) DEFAULT NULL COMMENT 'Numéro de téléphone du pilote',
  `Email` varchar(50) DEFAULT NULL COMMENT 'Adresse e-mail du pilote. ',
  `BoutonDemarrage` tinyint(1) DEFAULT NULL COMMENT 'Indique si le bouton de démarrage est activé par le pilote. ',
  `BoutonArret` tinyint(1) DEFAULT NULL COMMENT 'Indique si le bouton d''arrêt est activé par le pilote. ',
  `AlarmeSonoreCote` varchar(10) DEFAULT NULL COMMENT ' Spécifie le côté pour lequel une alarme sonore doit être activée.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pilotes`
--

INSERT INTO `pilotes` (`PiloteID`, `Nom`, `Prenom`, `DateNaissance`, `Adresse`, `Telephone`, `Email`, `BoutonDemarrage`, `BoutonArret`, `AlarmeSonoreCote`) VALUES
(21, 'Martin', 'Lucas', '1992-04-15', '123 Rue de la République, 75001 Paris', '06 12 34 56 78', 'lucas.martin@example.com', NULL, NULL, NULL),
(22, 'Dupont', 'Emma', '1988-11-22', '45 Avenue des Champs-Élysées, 75008 Paris', '06 23 45 67 89', 'emma.dupont@example.com', NULL, NULL, NULL),
(23, 'Durand', 'Léa', '1995-07-09', '78 Rue de Rivoli, 75004 Paris', '06 34 56 78 90', 'lea.durand@example.com', NULL, NULL, NULL),
(24, 'Moreau', 'Hugo', '1990-02-03', '56 Boulevard Saint-Michel, 75005 Paris', '06 45 67 89 01', 'hugo.moreau@example.com', NULL, NULL, NULL),
(25, 'Lefebvre', 'Alice', '1985-09-17', '34 Rue de Rennes, 75006 Paris', '06 56 78 90 12', 'alice.lefebvre@example.com', NULL, NULL, NULL),
(26, 'Bernard', 'Jules', '1993-12-29', '12 Rue de la Paix, 75002 Paris', '06 67 89 01 23', 'jules.bernard@example.com', NULL, NULL, NULL),
(27, 'Petit', 'Clara', '1991-05-14', '90 Rue du Faubourg Saint-Honoré, 75008 Paris', '06 78 90 12 34', 'clara.petit@example.com', NULL, NULL, NULL),
(28, 'Richard', 'Thomas', '1987-08-23', '123 Boulevard Haussmann, 75008 Paris', '06 89 01 23 45', 'thomas.richard@example.com', NULL, NULL, NULL),
(29, 'Robert', 'Zoé', '1994-10-06', '45 Rue de Vaugirard, 75015 Paris', '06 90 12 34 56', 'zoe.robert@example.com', NULL, NULL, NULL),
(30, 'Dubois', 'Nathan', '1996-03-27', '67 Rue de la Convention, 75015 Paris', '06 01 23 45 67', 'nathan.dubois@example.com', NULL, NULL, NULL),
(31, 'Rousseau', 'Julie', '1990-06-19', '89 Rue de la Pompe, 75016 Paris', '06 12 34 56 78', 'julie.rousseau@example.com', NULL, NULL, NULL),
(32, 'Blanchard', 'Antoine', '1992-01-30', '23 Rue des Écoles, 75005 Paris', '06 23 45 67 89', 'antoine.blanchard@example.com', NULL, NULL, NULL),
(33, 'Antonin', 'mathis', '1999-06-19', '12 Rue de Vaugirard, 75015 Paris', '0102050684', 'thomas.mathis@example.com', NULL, NULL, NULL),
(34, 'Robert', 'Zoé', '2024-05-02', '45 Rue de Vaugirard, 75015 Paris', '06 90 12 34 56', 'zoe.robert@example.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `positions`
--

CREATE TABLE `positions` (
  `PositionID` int(11) NOT NULL,
  `Latitude` decimal(10,6) DEFAULT NULL,
  `Longitude` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `positions`
--

INSERT INTO `positions` (`PositionID`, `Latitude`, `Longitude`) VALUES
(1, '45.717232', '4.882623'),
(2, '45.717386', '4.882389'),
(3, '45.717515', '4.882159'),
(4, '45.717250', '4.881582'),
(5, '45.717188', '4.881464'),
(6, '45.717015', '4.881218'),
(7, '45.716910', '4.881020'),
(8, '45.716805', '4.880891'),
(9, '45.716727', '4.880730'),
(10, '45.716517', '4.880435'),
(11, '45.716315', '4.880124'),
(12, '45.715985', '4.879630'),
(13, '45.715637', '4.880096'),
(14, '45.715416', '4.880327'),
(15, '45.715255', '4.880601'),
(16, '45.715382', '4.880837'),
(17, '45.715562', '4.881105'),
(18, '45.715671', '4.881271'),
(19, '45.715764', '4.881405'),
(20, '45.715869', '4.881566'),
(21, '45.715989', '4.881706'),
(22, '45.716120', '4.882081'),
(23, '45.716360', '4.882409'),
(24, '45.716675', '4.882720'),
(25, '45.716787', '4.882848'),
(26, '45.716956', '4.882972'),
(27, '45.717087', '4.882816');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `fk_gagnant_course` (`GagnantCourse`);

--
-- Index pour la table `entretiens`
--
ALTER TABLE `entretiens`
  ADD PRIMARY KEY (`EntretienID`),
  ADD KEY `FK_KartID_entretiens` (`KartID`);

--
-- Index pour la table `karts`
--
ALTER TABLE `karts`
  ADD PRIMARY KEY (`KartID`),
  ADD KEY `fk_course` (`CourseID`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`ParticipationID`),
  ADD KEY `FK_PiloteID` (`PiloteID`),
  ADD KEY `FK_CourseID` (`CourseID`),
  ADD KEY `FK_KartID_Participation` (`KartID`);

--
-- Index pour la table `pilotes`
--
ALTER TABLE `pilotes`
  ADD PRIMARY KEY (`PiloteID`);

--
-- Index pour la table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`PositionID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT ' Identifiant unique pour chaque administrateur.', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque course dans la base de données.', AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `entretiens`
--
ALTER TABLE `entretiens`
  MODIFY `EntretienID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifie de manière unique chaque entretien dans la base de données.', AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `karts`
--
ALTER TABLE `karts`
  MODIFY `KartID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique du kart.', AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT pour la table `participation`
--
ALTER TABLE `participation`
  MODIFY `ParticipationID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque participation dans la base de données.', AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `pilotes`
--
ALTER TABLE `pilotes`
  MODIFY `PiloteID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique attribué au pilote', AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `positions`
--
ALTER TABLE `positions`
  MODIFY `PositionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
