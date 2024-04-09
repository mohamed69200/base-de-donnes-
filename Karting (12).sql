-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 09 avr. 2024 à 13:16
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
  `Nom d'utilisateur` varchar(50) NOT NULL COMMENT 'Le nom d''utilisateur de l''administrateur pour la connexion. ',
  `Mot de passe` varchar(255) NOT NULL COMMENT 'Le mot de passe de l''administrateur pour la connexion sécurisée'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL COMMENT 'Identifiant unique pour chaque course dans la base de données.',
  `DateHeureCourse` datetime DEFAULT NULL COMMENT ' Date et heure de la course.',
  `Lieu` varchar(100) DEFAULT NULL COMMENT 'Lieu de la course.',
  `TypeCourse` varchar(50) DEFAULT NULL COMMENT 'Type de course (amateur, professionnel, etc.). ',
  `DistanceCourse` varchar(20) DEFAULT NULL COMMENT 'Distance de la course. ',
  `ConditionsMeteo` varchar(50) DEFAULT NULL COMMENT 'Conditions météorologiques au moment de la course.',
  `GagnantCourse` int(11) DEFAULT NULL COMMENT 'Pilote gagnant (référence à PiloteID dans la table Pilotes). ',
  `CommentairesCourse` text DEFAULT NULL COMMENT 'Commentaires sur la course.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`CourseID`, `DateHeureCourse`, `Lieu`, `TypeCourse`, `DistanceCourse`, `ConditionsMeteo`, `GagnantCourse`, `CommentairesCourse`) VALUES
(1, '2022-02-01 15:30:00', 'Circuit XYZ', 'Professionnel', '10.5', 'Ensoleillé', 1, 'Course rapide et compétitive.'),
(2, '2024-03-16 11:00:00', 'Circuit EFG', 'Amateur', '6.5', 'Ensoleillé', NULL, 'Belle journée de course'),
(3, '2024-03-18 13:45:00', 'Circuit HIJ', 'Professionnel', '12.3', 'Nuageux', NULL, 'Course intense sous des conditions difficiles'),
(5, '2024-04-20 18:06:00', 'lolo', 'course_libre', NULL, NULL, NULL, NULL),
(6, '2024-04-20 18:06:00', 'lolo', 'course_libre', NULL, NULL, NULL, NULL),
(7, '2024-04-20 18:06:00', 'lolo', 'course_libre', NULL, NULL, NULL, NULL),
(8, '2024-04-20 18:06:00', 'lolo', 'course_libre', NULL, NULL, NULL, NULL),
(9, '2024-04-12 16:43:00', 'lolo', 'course_libre', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `donneestempsreel`
--

CREATE TABLE `donneestempsreel` (
  `ID` int(11) NOT NULL COMMENT ' Identifiant unique pour chaque enregistrement de données en temps réel.',
  `KartID` int(11) DEFAULT NULL COMMENT 'Clé étrangère liée à la table Karts, indique le kart associé aux données. ',
  `Vitesse` decimal(10,2) DEFAULT NULL COMMENT 'La vitesse du kart à un moment donné.',
  `Temperature` decimal(5,2) DEFAULT NULL COMMENT 'La température du moteur du kart.',
  `Timestamp` datetime DEFAULT NULL COMMENT ' Indique le moment où les données ont été enregistrées.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `donneestempsreel`
--

INSERT INTO `donneestempsreel` (`ID`, `KartID`, `Vitesse`, `Temperature`, `Timestamp`) VALUES
(1, 2, '60.50', '75.20', '2024-03-14 14:30:00'),
(2, 3, '55.20', '72.80', '2024-03-14 14:31:00'),
(3, 4, '58.70', '70.50', '2024-03-14 14:32:00');

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
  `DescriptionTravaux` text DEFAULT NULL COMMENT 'Description détaillée des travaux effectués. ',
  `HeuresFonctionnement` int(11) DEFAULT NULL COMMENT 'heures de fonctionnement '
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entretiens`
--

INSERT INTO `entretiens` (`EntretienID`, `KartID`, `TypeEntretien`, `DateEntretien`, `CoutEntretien`, `DescriptionTravaux`, `HeuresFonctionnement`) VALUES
(1, 1, 'Réparation', '2022-03-10', '150.00', 'Remplacement du moteur et entretien général.', NULL),
(2, 2, 'Vidange', '2024-03-10', '50.00', 'Vidange et vérification générale', NULL),
(3, 3, 'Réparation', '2024-03-12', '120.00', 'Réparation du moteur', NULL),
(4, 4, 'reparation', '2024-04-04', '500.00', 'vidange ', NULL),
(8, 5, 'reparation', '2024-04-04', '500.00', 'vidange ', NULL);

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
  `Statut` varchar(50) DEFAULT NULL COMMENT 'Statut actuel du kart (disponible, en réparation, en entretien). ',
  `Latitude` decimal(10,8) DEFAULT NULL COMMENT 'Latitude réelle du kart. ',
  `Longitude` decimal(11,8) DEFAULT NULL COMMENT 'Longitude réelle du kart.',
  `DateUtilisation` datetime DEFAULT NULL COMMENT ' Date d''utilisation du kart. ',
  `TemperatureMoteur` decimal(5,2) DEFAULT NULL COMMENT 'Température du moteur du kart. ',
  `VitesseKart` decimal(10,2) DEFAULT NULL COMMENT 'Vitesse actuelle du kart. ',
  `ToursPiste` int(11) DEFAULT NULL COMMENT 'Nombre de tours effectués par le kart. ',
  `TempsTour` time DEFAULT NULL COMMENT 'Temps nécessaire pour accomplir un tour de piste. ',
  `DistanceObstacle` decimal(5,2) DEFAULT NULL COMMENT 'Distance à laquelle un obstacle est détecté. ',
  `CoteImpact` varchar(10) DEFAULT NULL COMMENT 'Côté impacté en cas de détection d''obstacle. ',
  `ImpactDetected` tinyint(1) DEFAULT NULL COMMENT ' Indique si un impact a été détecté.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `karts`
--

INSERT INTO `karts` (`KartID`, `CourseID`, `MarqueModele`, `AnneeFabrication`, `NumeroSerie`, `DateAchat`, `Statut`, `Latitude`, `Longitude`, `DateUtilisation`, `TemperatureMoteur`, `VitesseKart`, `ToursPiste`, `TempsTour`, `DistanceObstacle`, `CoteImpact`, `ImpactDetected`) VALUES
(2, NULL, 'speedracer', 2022, '12345', '2022-01-01', 'Disponible', '48.85660000', '2.35220000', '2024-02-05 13:29:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, 'SpeedRacer-Turbo3000', 2022, 'ABC123', '2022-01-15', 'Disponible', '48.85660000', '2.35220000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, 'FastCars-LightningX', 2021, 'XYZ789', '2021-11-28', 'En Réparation', '40.71280000', '-74.00600000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'RaceMasters-SpeedBlitz', 2020, 'DEF456', '2020-07-10', 'En Maintenance', '34.05220000', '-118.24370000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, 'SpeedRacer-Turbo3000', 2022, 'ABC123', '2022-01-15', 'Disponible', '48.85660000', '2.35220000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, NULL, 'FastCars-LightningX', 2021, 'XYZ789', '2021-11-28', 'En Réparation', '40.71280000', '-74.00600000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 'RaceMasters-SpeedBlitz', 2020, 'DEF456', '2020-07-10', 'En Maintenance', '34.05220000', '-118.24370000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, NULL, 'speedracer ', 2023, '654', '2024-04-09', 'dispo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, NULL, 'speedracer ', 2023, '654', '2024-04-09', 'dispo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `ParticipationID` int(11) NOT NULL COMMENT 'Identifiant unique pour chaque participation dans la base de données.',
  `PiloteID` int(11) DEFAULT NULL COMMENT 'Référence au Pilote participant (clé étrangère liée à Pilotes). ',
  `KartID` int(11) DEFAULT NULL COMMENT 'Référence au kart participant (clé étrangère liée à Karts).',
  `CourseID` int(11) DEFAULT NULL COMMENT 'Référence à la Course à laquelle le pilote participe (clé étrangère liée à Courses). ',
  `PositionFinale` int(11) DEFAULT NULL COMMENT 'Position finale du pilote dans la course. ',
  `TempsCourse` time DEFAULT NULL COMMENT 'Temps pris par le pilote pour terminer la course.',
  `ToursEffectues` int(11) DEFAULT NULL COMMENT 'Nombre de tours effectués par le pilote. ',
  `PointsGagnes` int(11) DEFAULT NULL COMMENT 'Points gagnés par le pilote dans la course.',
  `Statut` varchar(50) DEFAULT NULL COMMENT 'Statut du participant'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`ParticipationID`, `PiloteID`, `KartID`, `CourseID`, `PositionFinale`, `TempsCourse`, `ToursEffectues`, `PointsGagnes`, `Statut`) VALUES
(1, 1, NULL, 1, 2, '00:25:30', 15, 20, NULL),
(2, 2, 2, 2, 1, '00:20:45', 10, 25, NULL),
(3, 3, 3, 3, 2, '00:22:30', 11, 20, NULL),
(4, 1, 2, 2, 1, '00:20:45', 10, 25, 'Terminé');

-- --------------------------------------------------------

--
-- Structure de la table `pilotes`
--

CREATE TABLE `pilotes` (
  `PiloteID` int(11) NOT NULL COMMENT ' La clé primaire identifie de manière unique chaque pilote dans la base de données.',
  `Nom` varchar(50) DEFAULT NULL COMMENT 'Enregistre le nom du pilote. ',
  `Prenom` varchar(50) DEFAULT NULL COMMENT 'Stocke le prénom du pilote.',
  `DateNaissance` date DEFAULT NULL COMMENT 'Date de naissance du pilote. ',
  `Adresse` varchar(100) DEFAULT NULL COMMENT ' Adresse du pilote.',
  `Telephone` varchar(15) DEFAULT NULL COMMENT 'Numéro de téléphone du pilote',
  `Email` varchar(50) DEFAULT NULL COMMENT 'Adresse e-mail du pilote. ',
  `DateInscription` date DEFAULT NULL COMMENT 'Date d''inscription du pilote.',
  `BoutonDemarrage` tinyint(1) DEFAULT NULL COMMENT 'Indique si le bouton de démarrage est activé par le pilote. ',
  `BoutonArret` tinyint(1) DEFAULT NULL COMMENT 'Indique si le bouton d''arrêt est activé par le pilote. ',
  `AlarmeSonoreCote` varchar(10) DEFAULT NULL COMMENT ' Spécifie le côté pour lequel une alarme sonore doit être activée.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pilotes`
--

INSERT INTO `pilotes` (`PiloteID`, `Nom`, `Prenom`, `DateNaissance`, `Adresse`, `Telephone`, `Email`, `DateInscription`, `BoutonDemarrage`, `BoutonArret`, `AlarmeSonoreCote`) VALUES
(1, 'Doe', 'John', '1990-05-15', '123 Main St', '123-456-7890', 'john.doe@email.com', '2022-01-01', NULL, NULL, NULL),
(2, 'karchi', 'marouane', '2003-06-01', '16 rue lagranche', '0769305472', 'momo@gmail.com', '2024-03-06', NULL, NULL, NULL),
(3, 'Dupont', 'Jean', '1995-07-12', '123 Rue de la Paix', '0612345678', 'jean.dupont@example.com', '2024-03-14', NULL, NULL, NULL),
(4, 'Durand', 'Marie', '1998-04-25', '456 Avenue des Champs', '0698765432', 'marie.durand@example.com', '2024-03-14', NULL, NULL, NULL),
(5, 'Martin', 'Paul', '2000-11-03', '789 Boulevard Voltaire', '0687654321', 'paul.martin@example.com', '2024-03-15', NULL, NULL, NULL),
(6, 'amiri', 'mohamed', '2024-03-02', 'mohamed@gmail.com', '0102050684', 'erwan.leonard355@gmail.com', NULL, NULL, NULL, NULL),
(7, 'kharchi', 'marouane', '2024-04-13', 'marouane@gmail.com', '0102050684', 'erwan.leonard355@gmail.com', NULL, NULL, NULL, NULL),
(8, 'kharchi', 'marouane', '2024-04-13', 'marouane@gmail.com', '0102050684', 'erwan.leonard355@gmail.com', NULL, NULL, NULL, NULL),
(9, 'amiri', 'mohamed', '2024-04-17', 'mohamed@gmail.com', '0102050684', 'inkdragon.leodrann@gmail.com', NULL, NULL, NULL, NULL),
(10, 'amiri', 'mohamed', '2024-04-17', 'mohamed@gmail.com', '0102050684', 'inkdragon.leodrann@gmail.com', NULL, NULL, NULL, NULL),
(11, 'kharchi', 'mohamed', '2024-04-05', 'marouane@gmail.com', '0102050684', 'inkdragon.leodrann@gmail.com', NULL, NULL, NULL, NULL),
(12, 'amiri', 'mohamed', '2024-04-21', 'mohamed@gmail.com', '0102050684', 'inkdragon.leodrann@gmail.com', NULL, NULL, NULL, NULL),
(13, 'amiri', 'mohamed', '2024-04-13', 'mohamed@gmail.com', '0102050684', 'erwan.leonard355@gmail.com', NULL, NULL, NULL, NULL),
(14, 'kharchi', 'mohamed', '2024-04-21', 'marouane@gmail.com', '0102050684', 'inkdragon.leodrann@gmail.com', NULL, NULL, NULL, NULL);

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
-- Index pour la table `donneestempsreel`
--
ALTER TABLE `donneestempsreel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_KartID` (`KartID`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT ' Identifiant unique pour chaque administrateur.';

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque course dans la base de données.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `donneestempsreel`
--
ALTER TABLE `donneestempsreel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT ' Identifiant unique pour chaque enregistrement de données en temps réel.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `entretiens`
--
ALTER TABLE `entretiens`
  MODIFY `EntretienID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifie de manière unique chaque entretien dans la base de données.', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `karts`
--
ALTER TABLE `karts`
  MODIFY `KartID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique du kart.', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `participation`
--
ALTER TABLE `participation`
  MODIFY `ParticipationID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique pour chaque participation dans la base de données.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `pilotes`
--
ALTER TABLE `pilotes`
  MODIFY `PiloteID` int(11) NOT NULL AUTO_INCREMENT COMMENT ' La clé primaire identifie de manière unique chaque pilote dans la base de données.', AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
