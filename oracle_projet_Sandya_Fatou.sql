 ---------------------------------------------------------------
 --        Script Oracle.  
 ---------------------------------------------------------------


------------------------------------------------------------
-- Table: Utilisateur
------------------------------------------------------------
CREATE TABLE Utilisateur(
	numUtilisateur    NUMBER NOT NULL ,
	loginUtilisateur  VARCHAR2 (25)  ,
	mdpUtilisateur    VARCHAR2 (25)  ,
	numEnfant         NUMBER(10,0)   ,
	CONSTRAINT Utilisateur_Pk PRIMARY KEY (numUtilisateur)
);

------------------------------------------------------------
-- Table: Enfant
------------------------------------------------------------
CREATE TABLE Enfant(
	numEnfant        NUMBER NOT NULL ,
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
	numCompte       NUMBER NOT NULL ,
	numUtilisateur  NUMBER NOT NULL ,
	numEnfant       NUMBER NOT NULL ,
	soldeCompte     FLOAT   ,
	dateSolde       DATE   ,
	CONSTRAINT Compte_Pk PRIMARY KEY (numCompte)
);

------------------------------------------------------------
-- Table: Commande
------------------------------------------------------------
CREATE TABLE Commande(
	numCommande   NUMBER NOT NULL ,
	qteCommande   NUMBER(10,0)   ,
	numProduit    NUMBER NOT NULL ,
	numProduit_1  NUMBER(10,0)   ,
	CONSTRAINT Commande_Pk PRIMARY KEY (numCommande)
);

------------------------------------------------------------
-- Table: Produit
------------------------------------------------------------
CREATE TABLE Produit(
	numProduit        NUMBER NOT NULL ,
	nomProduit        VARCHAR2 (25)  ,
	qteProduitDispo   NUMBER(10,0)   ,
	prixVenteProduit  FLOAT   ,
	CONSTRAINT Produit_Pk PRIMARY KEY (numProduit)
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

CREATE SEQUENCE Seq_Utilisateur_numUtilisateur START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Enfant_numEnfant START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Compte_numCompte START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Compte_numUtilisateur START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Compte_numEnfant START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Commande_numCommande START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Commande_numProduit START WITH 1 INCREMENT BY 1 NOCYCLE;
CREATE SEQUENCE Seq_Produit_numProduit START WITH 1 INCREMENT BY 1 NOCYCLE;


CREATE OR REPLACE TRIGGER Utilisateur_numUtilisateur
	BEFORE INSERT ON Utilisateur 
  FOR EACH ROW 
	WHEN (NEW.numUtilisateur IS NULL) 
	BEGIN
		 select Seq_Utilisateur_numUtilisateur.NEXTVAL INTO :NEW.numUtilisateur from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Enfant_numEnfant
	BEFORE INSERT ON Enfant 
  FOR EACH ROW 
	WHEN (NEW.numEnfant IS NULL) 
	BEGIN
		 select Seq_Enfant_numEnfant.NEXTVAL INTO :NEW.numEnfant from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Compte_numCompte
	BEFORE INSERT ON Compte 
  FOR EACH ROW 
	WHEN (NEW.numCompte IS NULL) 
	BEGIN
		 select Seq_Compte_numCompte.NEXTVAL INTO :NEW.numCompte from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Compte_numUtilisateur
	BEFORE INSERT ON Compte 
  FOR EACH ROW 
	WHEN (NEW.numUtilisateur IS NULL) 
	BEGIN
		 select Seq_Compte_numUtilisateur.NEXTVAL INTO :NEW.numUtilisateur from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Compte_numEnfant
	BEFORE INSERT ON Compte 
  FOR EACH ROW 
	WHEN (NEW.numEnfant IS NULL) 
	BEGIN
		 select Seq_Compte_numEnfant.NEXTVAL INTO :NEW.numEnfant from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Commande_numCommande
	BEFORE INSERT ON Commande 
  FOR EACH ROW 
	WHEN (NEW.numCommande IS NULL) 
	BEGIN
		 select Seq_Commande_numCommande.NEXTVAL INTO :NEW.numCommande from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Commande_numProduit
	BEFORE INSERT ON Commande 
  FOR EACH ROW 
	WHEN (NEW.numProduit IS NULL) 
	BEGIN
		 select Seq_Commande_numProduit.NEXTVAL INTO :NEW.numProduit from DUAL; 
	END;
CREATE OR REPLACE TRIGGER Produit_numProduit
	BEFORE INSERT ON Produit 
  FOR EACH ROW 
	WHEN (NEW.numProduit IS NULL) 
	BEGIN
		 select Seq_Produit_numProduit.NEXTVAL INTO :NEW.numProduit from DUAL; 
	END;

