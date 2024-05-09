###
START TRANSACTION;
INSERT INTO eleves (NUM_ELEVE,NOM,PRENOM,DATE_NAISSANCE,POIDS,ANNEE,GENRE) VALUES (11,"eleve","1",'2000-5-18',79,2,"M");
SELECT * from eleves;
ROLLBACK;
SELECT * from eleves;

--Avec l'instruction ROLLBACK On modifie notre table mais on ne sauvegarde pas dans celle-ci les nouvelles valeurs


START TRANSACTION;
INSERT INTO eleves (NUM_ELEVE,NOM,PRENOM,DATE_NAISSANCE,POIDS,ANNEE,GENRE) VALUES (11,"eleve","1",'2000-5-18',79,2,"M");
SELECT * from eleves;
COMMIT;
SELECT * from eleves;

--Avec le commit on enregistre dans notre base de donné la nouvelle ligne ajouté 

-- On insere et on change de connexion 
START TRANSACTION;
INSERT INTO ELEVES (NUM_ELEVE, NOM, PRENOM, DATE_NAISSANCE, POIDS, ANNEE)
VALUES (11, 'Doe', 'John', '2006-05-15', 50, 1);
SELECT * from eleves where NUM_ELEVE = 11;
COMMIT;
-- On change de connexion et on fait :
SELECT * from eleves where NUM_ELEVE = 11;

--Et notre nouvel element n'apparait pas tant que l'on a pas commit 

-- On va verifier la lecture non répétable
-- Premiere connexion : 
START TRANSACTION;
-- Sélection de l'élève avant toute mise à jour
SELECT * FROM ELEVES WHERE NUM_ELEVE = 1;

-- Deuxieme connexion : 
-- Mise à jour de l'élève sélectionné 
UPDATE ELEVES SET ANNEE = 3 WHERE NUM_ELEVE = 1;
-- Premiere connexion : 
-- Sélection de l'élève apres mise à jour
SELECT * FROM ELEVES WHERE NUM_ELEVE = 1;



-- Lecture fantome !
-- Premiere connexion : 
START TRANSACTION;
SELECT COUNT(*) AS TotalEleves FROM ELEVES;

-- Deuxieme connexion : 
START TRANSACTION;
INSERT INTO ELEVES (NUM_ELEVE, NOM, PRENOM, DATE_NAISSANCE, POIDS, ANNEE, GENRE) 
VALUES (11, 'Nouveau', 'Eleve', '2006-01-01', 50, 1, 'M');
COMMIT;

-- Premiere connexion on reverifie 
SELECT COUNT(*) AS TotalEleves FROM ELEVES;


