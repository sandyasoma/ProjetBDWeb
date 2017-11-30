 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------


------------------------------------------------------------
-- Table: Utilisateur
------------------------------------------------------------
CREATE TABLE Utilisateur(
	numUtilisateur    NUMBER(10,0)  NOT NULL  ,
	loginUtilisateur  VARCHAR2 (25)  ,
	mdpUtilisateur    VARCHAR2 (25)  ,
	numEnfant         NUMBER(10,0)   ,
	CONSTRAINT Utilisateur_Pk PRIMARY KEY (numUtilisateur)
);

------------------------------------------------------------
-- Table: Enfant
------------------------------------------------------------
CREATE TABLE Enfant(
	numEnfant        NUMBER(10,0)  NOT NULL  ,
	nomEnfant        VARCHAR2 (25)  ,
	prenomEnfant     VARCHAR2 (25)  ,
	dateNaissEnfant  VARCHAR2 (25)  ,
	mailEnfant       VARCHAR2 (25)  ,
	telEnfant        NUMBER(10,0)   ,
	categorieEnfant  VARCHAR2 (25)  ,
	apportEnfant     FLOAT   ,
	consoEnfant      FLOAT   ,
	numCompte        NUMBER(10,0)   ,
	numCommande      NUMBER(10,0)   ,
	CONSTRAINT Enfant_Pk PRIMARY KEY (numEnfant)
);

------------------------------------------------------------
-- Table: Compte
------------------------------------------------------------
CREATE TABLE Compte(
	numCompte  NUMBER(10,0)  NOT NULL  ,
	numEnfant  NUMBER(10,0)  NOT NULL  ,
	dateSolde  DATE   ,
	CONSTRAINT Compte_Pk PRIMARY KEY (numCompte)
);

------------------------------------------------------------
-- Table: Commande
------------------------------------------------------------
CREATE TABLE Commande(
	numCommande   NUMBER(10,0)  NOT NULL  ,
	qteCommande   NUMBER(10,0)   ,
	numProduit    NUMBER(10,0)  NOT NULL  ,
	numProduit_1  NUMBER(10,0)   ,
	CONSTRAINT Commande_Pk PRIMARY KEY (numCommande)
);

------------------------------------------------------------
-- Table: Produit
------------------------------------------------------------
CREATE TABLE Produit(
	numProduit        NUMBER(10,0)  NOT NULL  ,
	nomProduit        VARCHAR2 (25)  ,
	qteProduitDispo   NUMBER(10,0)   ,
	prixVenteProduit  FLOAT   ,
	CONSTRAINT Produit_Pk PRIMARY KEY (numProduit)
);

------------------------------------------------------------
-- Table: ListeCourse
------------------------------------------------------------
CREATE TABLE ListeCourse(
	numListe            NUMBER(10,0)  NOT NULL  ,
	qteNecessaireListe  NUMBER(10,0)   ,
	montantGlobalListe  FLOAT   ,
	CONSTRAINT ListeCourse_Pk PRIMARY KEY (numListe)
);

------------------------------------------------------------
-- Table: est composé de
------------------------------------------------------------
CREATE TABLE est_compose_de(
	qteComposition  NUMBER(10,0)   ,
	numProduit      NUMBER(10,0)  NOT NULL  ,
	numProduit_1    NUMBER(10,0)  NOT NULL  ,
	CONSTRAINT est_compose_de_Pk PRIMARY KEY (numProduit,numProduit_1)
);




ALTER TABLE Utilisateur ADD FOREIGN KEY (numEnfant) REFERENCES Enfant(numEnfant);
ALTER TABLE Enfant ADD FOREIGN KEY (numCompte) REFERENCES Compte(numCompte);
ALTER TABLE Enfant ADD FOREIGN KEY (numCommande) REFERENCES Commande(numCommande);
ALTER TABLE Commande ADD FOREIGN KEY (numProduit_1) REFERENCES Produit(numProduit);
ALTER TABLE est_compose_de ADD FOREIGN KEY (numProduit) REFERENCES Produit(numProduit);
ALTER TABLE est_compose_de ADD FOREIGN KEY (numProduit_1) REFERENCES Produit(numProduit);



