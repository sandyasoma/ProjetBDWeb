drop table utilisateur;
drop table enfant;
drop table compte;
drop table est_compose_de;
drop table produit;
drop table commande;
drop table listecourse;
INSERT INTO listecourse VALUES(1, 34,20.24);
--Bon ordre pour ins�rer les valeurs (pour supprimer table ordre inverse)--
INSERT INTO COMMANDE values(1,4,1,2);
INSERT INTO PRODUIT VALUES (1,'jus',4,0.5);
INSERT INTO EST_COMPOSE_DE VALUES (4,1,2);
INSERT INTO COMPTE VALUES(1,1,'12/08/2016');
INSERT INTO COMPTE VALUES(2,1,'14/08/2016');
INSERT INTO ENFANT VALUES (1,'SOMA','Surya','14/02/2000','dodo@gmail.com',0169215413,'moins de 6 ans',10.5,4.5,1,1);
INSERT INTO ENFANT VALUES (2,'SOMA','mSurya','15/02/2000','dodor@gmail.com',0169218413,'moins de 12 ans',10.5,4.5,2,1);

INSERT INTO UTILISATEUR VALUES(1, 'sandya','triples',1);

