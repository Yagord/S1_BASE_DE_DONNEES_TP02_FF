CREATE TABLE Coureur (
numeroCoureur int,
nomCoureur varchar(45),
codeEquipe int,
codePays int
)
COMMENT 'Liste des coureurs inscrits', ENGINE InnoDB;

ALTER TABLE Coureur
ADD CONSTRAINT pk_coureur PRIMARY KEY (numeroCoureur);

CREATE TABLE Pays (
codePays int,
nomPays varchar(45),
CONSTRAINT pk_pays PRIMARY KEY (codePays)
)
COMMENT 'Liste des pays participants', ENGINE InnoDB;

CREATE TABLE Equipe (
codeEquipe int,
nomEquipe varchar(45),
directeurSportif varchar(45),
CONSTRAINT pk_equipe PRIMARY KEY (codeEquipe)
)
COMMENT 'Liste des équipes autorisées', ENGINE InnoDB;

CREATE TABLE Etape (
numeroEtape int,
dateEtape date,
villeDep varchar(45),
villeArr varchar(45),
nbKm real,
CONSTRAINT pk_etape PRIMARY KEY (numeroEtape)
)
COMMENT 'Liste des étapes', ENGINE InnoDB;

ALTER TABLE Coureur
ADD CONSTRAINT fk_coureur FOREIGN KEY (codeEquipe) REFERENCES Equipe(codeEquipe);

ALTER TABLE Coureur
ADD CONSTRAINT fk_coureur2 FOREIGN KEY (codePays) REFERENCES Pays(codePays);


CREATE TABLE Participer (
numeroCoureur int,
numeroEtape int,
tempsRealise time,
CONSTRAINT pk_participer PRIMARY KEY (numeroCoureur, numeroEtape)
)
COMMENT 'Liste des coureurs participants aux étapes', ENGINE InnoDB;

ALTER TABLE Participer
ADD CONSTRAINT fk_participer FOREIGN KEY (numeroCoureur) REFERENCES Coureur(numeroCoureur);

ALTER TABLE Participer
ADD CONSTRAINT fk_participer2 FOREIGN KEY (numeroEtape) REFERENCES Etape(numeroEtape);



CREATE TABLE tourdefrance.Dopage AS
SELECT*
FROM tourdefrance.Coureur;

ALTER TABLE Dopage
ADD COLUMN testDopage varchar(45) DEFAULT 'négatif';

RENAME TABLE Dopage TO ResultatMedical;




INSERT INTO Etape VALUES (1, '1997-04-06', 'ROUEN', 'FORGES-LES-EAUX', 192);
INSERT INTO Etape VALUES (2, '1997-07-07', 'ST-VALERY-EN-CAUX', 'VIRE', 262);
INSERT INTO Etape VALUES (3, '1997-07-08', 'VIRE', 'PLUMELEC ', 224);

INSERT INTO Coureur VALUES (8, 'ULLRICH Jan', 'TEL', 'ALL');
INSERT INTO Coureur VALUES (31, 'JALABERT Laurent', 'ONC', 'FRA');
INSERT INTO Coureur VALUES (61, 'ROMINGER Tony', 'COF', 'SUI');
INSERT INTO Coureur VALUES (91, 'BOARDMAN Chris', 'GAN', 'G-B');
INSERT INTO Coureur VALUES (114, 'CIPOLLINI Mario', 'CSO', 'ITA');
INSERT INTO Coureur VALUES (151, 'OLANO Abraham', 'BAN', 'ESP');

INSERT INTO Pays VALUES ('ALL', 'ALLEMAGNE');
INSERT INTO Pays VALUES ('AUT', 'AUTRICHE');
INSERT INTO Pays VALUES ('BEL', 'BELGIQUE');
INSERT INTO Pays VALUES ('DAN', 'DANEMARK');
INSERT INTO Pays VALUES ('ESP', 'ESPAGNE');
INSERT INTO Pays VALUES ('FRA', 'FRANCE');
INSERT INTO Pays VALUES ('G-B', 'GRANDE BRETAGNE');
INSERT INTO Pays VALUES ('ITA', 'ITALIE');
INSERT INTO Pays VALUES ('P-B', 'PAYS-BAS');
INSERT INTO Pays VALUES ('RUS', 'RUSSIE');
INSERT INTO Pays VALUES ('SUI', 'SUISSE');

INSERT INTO Equipe VALUES ('BAN', 'BANESTO', 'Eusebio UNZUE');
INSERT INTO Equipe VALUES ('COF', 'COFIDIS', 'Cyrille GUIMARD');
INSERT INTO Equipe VALUES ('CSO', 'CASINO', 'Vincent LAVENU');
INSERT INTO Equipe VALUES ('FDJ', 'LA FRANCAISE DES JEUX', 'Marc MADIOT');
INSERT INTO Equipe VALUES ('FES', 'FESTINA', 'Bruno ROUSSEL');
INSERT INTO Equipe VALUES ('GAN', 'GAN', 'Roger LEGEAY');
INSERT INTO Equipe VALUES ('ONC', 'O.N.C.E', 'Manolo SAIZ');
INSERT INTO Equipe VALUES ('TEL', 'TELEKOM', 'Walter GODEFROOT');

INSERT INTO Participer VALUES (8, 3, '04:54:33');
INSERT INTO Participer VALUES (8, 1, '04:48:21');
INSERT INTO Participer VALUES (8, 2, '06:27:47');
INSERT INTO Participer VALUES (31, 3, '04:54:33');
INSERT INTO Participer VALUES (31, 1, '04:48:21');
INSERT INTO Participer VALUES (31, 2, '06:27:47');
INSERT INTO Participer VALUES (61, 1, '04:48:24');
INSERT INTO Participer VALUES (61, 2, '06:27:47');
INSERT INTO Participer VALUES (91, 3, '04:54:33');
INSERT INTO Participer VALUES (91, 1, '04:48:19');
INSERT INTO Participer VALUES (91, 2, '06:27:47');
INSERT INTO Participer VALUES (114, 3, '04:54:44');
INSERT INTO Participer VALUES (114, 1, '04:48:09');
INSERT INTO Participer VALUES (114, 2, '06:27:47');
INSERT INTO Participer VALUES (151, 3, '04:54:33');
INSERT INTO Participer VALUES (151, 1, '04:48:29');
INSERT INTO Participer VALUES (151, 2, '06:27:47');


SELECT *
FROM Coureur;




SELECT COUNT(*) AS nbPays
FROM Pays;

SELECT MAX(tempsRealise) AS tempsMaximum
FROM Participer;

SELECT AVG(tempsRealise) AS tempsMoyen
FROM Participer;

SELECT MIN(tempsRealise) AS tempsMinimum
FROM Participer;

SELECT SUM(nbKm) AS longueurEtapes
FROM Etape;







