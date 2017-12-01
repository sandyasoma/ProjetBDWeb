SET SERVEROUTPUT ON;
create or replace PROCEDURE ajouterProduit(numProduit PRODUIT.numProduit%TYPE,nomProduit PRODUIT.nomProduit%TYPE,
qteProduitDispo PRODUIT.qteProduitDispo%TYPE,prixVenteProduit PRODUIT.prixVenteProduit%TYPE) IS
BEGIN
INSERT INTO PRODUIT VALUES (numProduit,nomProduit,qteProduitDispo,prixVenteProduit);
END;
/
EXECUTE ajouterProduit(2,'caramel',11,7.5);
DROP PROCEDURE ajouterProduit;
CREATE OR REPLACE
PROCEDURE supprimerProduitP(numero PRODUIT.NUMPRODUIT%TYPE)IS
BEGIN
DELETE FROM PRODUIT WHERE PRODUIT.NUMPRODUIT=numero;
END;
/
EXECUTE supprimerProduitP(1);

CREATE OR REPLACE
PROCEDURE creerCompteEnfant(numEnfant ENFANT.NUMENFANT%TYPE,
nomEnfant ENFANT.NOMENFANT%TYPE,prenomEnfant ENFANT.PRENOMENFANT%TYPE,
dateNaissEnfant ENFANT.DATENAISSENFANT%TYPE,
mailEnfant ENFANT.MAILENFANT%TYPE,telEnfant ENFANT.TELENFANT,categorieEnfant ENFANT.CATEGORIEENFANT%TYPE,apportEnfant ENFANT.APPORTENFANT%TYPE,
consoEnfant ENFANT.CONSOENFANT%TYPE,numCompte COMPTE.NUMCOMPTE%TYPE,numCommande COMMANDE.NUMCOMMANDE%TYPE)IS
BEGIN
INSERT INTO ENFANT VALUES(numEnfant,nomEnfant,prenomEnfant,dateNaissEnfant,mailEnfant,telEnfant,categorieEnfant,apportEnfant,consoEnfant,numCompte,numCommande);
END;
/
EXECUTE creerCompteEnfant(2,'SOMA','mSurya','15/02/2000','dodor@gmail.com',0169218413,'moins de 12 ans',10.5,4.5,2,1);

CREATE OR REPLACE
PROCEDURE supprimerCompteEnfant(numEnfant ENFANT.NUMENFANT%TYPE)IS
BEGIN
DELETE FROM ENFANT WHERE NUMENFANT=numEnfant;
END;
/

EXECUTE supprimerCompteEnfant(2);

create or replace PROCEDURE ajouterParent(numUtilisateur UTILISATEUR.NUMUTILISATEUR%TYPE,loginUtilisateur UTILISATEUR.LOGINUTILISATEUR%TYPE,
mdpUtilisateur UTILISATEUR.MDPUTILISATEUR%TYPE,numEnfant UTILISATEUR.NUMENFANT%TYPE) IS
BEGIN
INSERT INTO PRODUIT VALUES (numUtilisateur,loginUtilisateur,mdpUtilisateur,numEnfant);
END;
/

EXECUTE ajouterParent(2, 'sandyan','triplebs',2);

create or replace PROCEDURE supprimerParent(numUtilisateur UTILISATEUR.NUMUTILISATEUR%TYPE)is
BEGIN
DELETE FROM UTILISATEUR WHERE NUMUTILISATEUR=numUtilisateur;
END;
/

EXECUTE supprimerParent(1);