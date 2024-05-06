###
START TRANSACTION;
INSERT INTO eleves (NUM_ELEVE,NOM,PRENOM,DATE_NAISSANCE,POIDS,ANNEE,GENRE) VALUES (11,"eleve","1",'2000-5-18',79,2,"M");
SELECT * from eleves;
ROLLBACK;
SELECT * from eleves;

--Avec l'instruction ROLLBACK On modifie notre table mais on ne sauvegarde pas dans celle-ci les nouvelles valeurs


###
START TRANSACTION;
INSERT INTO eleves (NUM_ELEVE,NOM,PRENOM,DATE_NAISSANCE,POIDS,ANNEE,GENRE) VALUES (11,"eleve","1",'2000-5-18',79,2,"M");
SELECT * from eleves;
COMMIT;
SELECT * from eleves;

--Avec le commit on enregistre dans notre base de donné la nouvelle ligne ajouté 

-- On change de connexion et on fais :
SELECT * from eleves;
