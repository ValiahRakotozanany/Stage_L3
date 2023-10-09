blanc de poulet 100g
carotte 100g
Haricot vert 100g
Courgettes
oeuf
lait 100ml
Salade 100g
Tomate 100g
Oignon 100g
ciboulette 10g
gingembre 10g
Ail 10g
viande de boeuf 100g
echine 100g
viande de porc 100g
riz blanc 100g
riz rouge 100g
pomme de terre 100g
langue 100g
poivre vert piece 5g
poivre noir 2g
thym tige
pate 100g
farine 100g
salami 100g
mortadelle volaille 100g
mortadelle boeuf 100g
jambon 100g
pain français 100g
Mayonnaise 20g
Ketchup 20g
chili 20g
piment vert 5g
olive noir 1piece
olive verte 1piece
huile d olive 10ml
huile 10ml
avocat 100g
mangue piece
fraise 100g
pomme 1piece
yaourt nature piece non sucré 
yaourt nature piece sucré 
Glace 100g
pate à pizza pièce
Pate à crèpe pièce
Pate à gauffre pièce
vin blanc 100ml
vin rouge 100ml
paprika 10g
piment 10g
piment vert 1piece
chocolat 1piece



Tsaramaso 100g
Voanjobory 100g
Kabaro 100g
Anana 100g
Ananas 10g
Ravitoto 100g
Banane piece

Fromage 100g
Maïs 100g
Poisson 100g
Crevette 100g
Calmar 100g
Nouille 1piece
Poivron 1piece
Jumbo 10g
Persil 10g
Coriandre 10g
Crevette 100g
calmar 100g
citron 1piece 
Orange 1piece
Saucissse fumée 100g
Saucissse 100g
Saucisse crevette 100g
café 1sachet
Jus gazeuse 1piece gm
Jus gazeuse 1piece pm
yaourt nature 1piece 
chou 1piece
brocolis 1piece
pistache 10g
Foie de boeuf 100g
Coeur de Boeuf 100g
tripe 100g
Cervelle 100g
Jambon de boeuf 100g
Foie de poulet 100g
Creme lait 100ml







Autres conditions : Végétariens - abstèmes de porc ou non-mangeurs de porc

Ajout de plateforme d ingredient et proposition de plats venant de ces ingrédients


username : Proposition
Password : Proposition

--CREATE ROLE Proposition LOGIN PASSWORD 'Proposition';
CREATE USER Proposition IDENTIFIED BY Proposition;

create table Famille(
    id varchar(50) PRIMARY KEY ,
    NomFamille Varchar(100),
    email varchar(50),
    motdepasse varchar(50)
);


create table admin(
    id varchar(50) primary key ,
    email varchar(50),
    motdepasse varchar(50)
);
---APPPPJJJJJJJ

CREATE TABLE UTILISATEUR (
	REFUSER int,
	LOGINUSER VARCHAR(50) DEFAULT '-' ,
	PWDUSER VARCHAR(50) DEFAULT '-' ,
	NOMUSER VARCHAR(50) DEFAULT '-' ,
	ADRUSER VARCHAR(50) DEFAULT '-' ,
	TELUSER VARCHAR(50) DEFAULT '-' ,
	IDROLE VARCHAR(20),
	CONSTRAINT PK_UTILISATEUR PRIMARY KEY (REFUSER));


CREATE OR REPLACE  VIEW UTILISATEURVALIDE (REFUSER, LOGINUSER, PWDUSER, NOMUSER, ADRUSER,
 TELUSER, IDROLE) AS 
  SELECT REFUSER, LOGINUSER, PWDUSER,NOMUSER, ADRUSER, TELUSER,
          IDROLE
     FROM utilisateur


CREATE OR REPLACE  VIEW UTILISATEURvue (REFUSER, LOGINUSER, PWDUSER, NOMUSER, ADRUSER,
 TELUSER, IDROLE) AS 
  SELECT REFUSER, LOGINUSER, PWDUSER,NOMUSER, ADRUSER, TELUSER,
          IDROLE
     FROM utilisateur

CREATE TABLE ROLES (
	IDROLE VARCHAR(20),
	DESCROLE VARCHAR(50) DEFAULT '-' ,
	CONSTRAINT PK_ROLES PRIMARY KEY (IDROLE)
);


insert into roles values('1','Admin');

ALTER TABLE utilisateur
ADD CONSTRAINT fk_cle_etrangere
    FOREIGN KEY (IDROLE)
    REFERENCES roles (idrole);


CREATE UNIQUE INDEX PK_ROLES ON ALLOSAKAFOSYNC.ROLES (IDROLE);


CREATE TABLE PARAMCRYPT
   (	ID VARCHAR(250), 
	NIVEAU int ,
	CROISSANTE int,
	IDUTILISATEUR int REFERENCES utilisateur(refuser), 
	 CONSTRAINT PARAMCRYPT_PK PRIMARY KEY (ID));

insert into paramcrypt(id,niveau,croissante,IDUTILISATEUR) values('1',1,1,1);
-----AAAAAPPPPPPJJJJJJJ

insert into utilisateur(refuser,LOGINUSER,PWDUSER,nomuser) values(nextval('seq_user'),'Lulu','Lulu','Lulu');
create sequence seq_user;



create SEQUENCE seq_famille;

create table Membre(
    id varchar(50) PRIMARY KEY ,
    idFamille varchar(50) REFERENCES Famille(id),
    Nom varchar(50) ,
    prenom varchar(50),
    DateNaissance date
);

create SEQUENCE seq_membre;

create table unite(
    id serial PRIMARY KEY ,
    mesure varchar(50)
);

create sequence seq_unite;
g-piece-ml-cuilleré
insert into unite(id ,mesure) values(seq_unite.nextval,'g'),(seq_unite.nextval,'piece'),(seq_unite.nextval,'ml'),(seq_unite.nextval,'G cuilleré'),(seq_unite.nextval,'P cuilleré');

create SEQUENCE seq_unite;

create table ingredient(
    id varchar(50) PRIMARY key  ,
    nom varchar(100),
    prixAchat double precision,
    unite int REFERENCES unite(id),
    valeur double PRECISION,
    dateSaisonDebut date default null,
    dateSaisonFin date default null
);


create SEQUENCE seq_ingredient;--ing

create table categorie(
    id varchar(50) PRIMARY KEY ,
    categorie varchar(50)
);

create SEQUENCE seq_categorie;

Legume - viande - fruit - fourniture - boisson - autre

create table categorieingredient(
    id varchar(50) PRIMARY KEY ,
    idcategorie varchar(50) REFERENCES Categorie(id),
    idingredient varchar(50) REFERENCES ingredient(id),
    etat int 
);

alter table categorieingredient add column etat int ;
-- etat : 0 - a eviter ,  1 à prendre en préférance 


create SEQUENCE seq_categorieingredient;

create table typeplat(
    id varchar(50) primary key , 
    typeplat varchar(50),
    etat int 
);

create SEQUENCE seq_typeplat;

plats principaux - entrée/apéritifs - snacks - resistance - dessert - petit déjeuner - plats traditionnels - soupe - accompagnement - plats de fête - plats trad(Malagasy)


INSERT INTO typeplat (id, typeplat, etat) VALUES
  ((seq_typeplat.nextval), 'plats principaux', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'entrée/apéritifs', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'snacks', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'résistance', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'dessert', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'petit déjeuner', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'plats traditionnels', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'soupe', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'accompagnement', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'plats de fête', 1);
  INSERT INTO typeplat (id, typeplat, etat) VALUES((seq_typeplat.nextval), 'plats trad(Malagasy)', 1);

Create table Plat(
    id varchar(50) primary key , 
    NomPlats varchar(100),
    descri varchar2(250) 
);




create SEQUENCE seq_plat;

Create table Platphoto(
    id VARCHAR(50) PRIMARY key,
    idPlat VARCHAR(50) REFERENCES Plat(id),
    photo text 
);

create SEQUENCE seq_platphoto;

Create table Platfille(
    id VARCHAR(50) PRIMARY key,
    idPlat VARCHAR(50) REFERENCES Plat(id),
    idingredient varchar(50) REFERENCES ingredient(id),
    valeurAdulte double precision ,
    valeurEnfant double precision ,
    remarque varchar2(250)
);



create SEQUENCE seq_platfille;

create table PlatTyper(
    id VARCHAR(50) primary KEY,
    idPlat VARCHAR(50) REFERENCES Plat(id),
    idTypePlat VARCHAR(50) REFERENCES typeplat(id)
);

create SEQUENCE seq_plattyper;
drop SEQUENCE seq_etatM;
create SEQUENCE seq_etatM start with 1;
----Intolérance 
create table etatmaladie(
    id int,
    etatlib varchar(20),
    	 CONSTRAINT "pk" PRIMARY KEY (ID)

);

insert into etatmaladie values( (seq_etatM.nextval),'Maladie');
insert into etatmaladie values( (seq_etatM.nextval),'Intolerance');
insert into etatmaladie values( (seq_etatM.nextval),'Autres conditions');


create table Maladie(
    id varchar(50) PRIMARY KEY ,
    Maladie varchar(100) ,
    etat int REFERENCES etatmaladie(id)
);
create SEQUENCE seq_maladie start with 1;-- maladie

-- ALTER TABLE maladie
-- ADD CONSTRAINT fk_etatmaladie
-- FOREIGN KEY (etat) REFERENCES Etatmaladie(id);


create table MaladieMembre(
    id varchar(50) PRIMARY key,
    idMaladie varchar(50) REFERENCES Maladie(id),
    idMembre varchar(50) REFERENCES Membre(id)
);

create SEQUENCE seq_maladiemembre start with 1;

create table IngredientMaladie(
    id varchar(50) PRIMARY key,
    idMaladie varchar(50) REFERENCES Maladie(id),
    idingredient varchar(50) REFERENCES ingredient(id),
    etat int 
);

create SEQUENCE seq_ingredientMaladie start with 1;

create table PlatMaladie(
    id varchar(50) PRIMARY key,
    idMaladie varchar(50) REFERENCES Maladie(id),
    idPlat varchar(50) REFERENCES Plat(id),
    etat int 
);
create SEQUENCE seq_platmaladie start with 1;

create table preferenceingredient(
    id varchar(50) PRIMARY key,
    idingredient varchar(50) REFERENCES ingredient(id),
    idMembre varchar(50) REFERENCES Membre(id)

);
create SEQUENCE seq_preferenceingredient start with 1;

create table preferenceplat(
    id varchar(50) PRIMARY key,
    idplat varchar(50) REFERENCES plat(id),
    idMembre varchar(50) REFERENCES Membre(id)
);

create SEQUENCE seq_preferenceplat start with 1; 

Create table intolerance(
    id varchar(50) PRIMARY key,
    intolerance varchar(50)
);

create SEQUENCE seq_intolerance start with 1;

create table IntoleranceIngredient(
    id varchar(50) PRIMARY key,
    idingredient varchar(50) REFERENCES ingredient(id),
    idintolerance VARCHAR(50) REFERENCES Intolerance(id)
);
create SEQUENCE seq_intoleranceingredient start with 1;

create table intoleranceMembre(
    id varchar(50) PRIMARY key,
    idMembre varchar(50) REFERENCES Membre(id),
    idintolerance VARCHAR(50) REFERENCES Intolerance(id)
);

create SEQUENCE seq_intolerancemembre start with 1;

create table proposition (
    id varchar(50) primary key,
    idfamille varchar(50) famille(id)
    etat int 
);

create table propositionfille(
    id varchar(50) primary key,
    idProposition varchar(50) REFERENCES proposition(id),
    idPlat VARCHAR(50) REFERENCES plat(id),
    dateProposition date
);



create table ingredient_suggerer_maladie(
    
);

ALTER TABLE PROPOSITION.INGREDIENT MODIFY PRIXACHAT Number(10,2);
ALTER TABLE PROPOSITION.INGREDIENT MODIFY VALEUR Number(10,2);

-- insertion part ingredients :
-- Insérer des données d'ingrédients dans la table "ingredient"
INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES
  ('ing' || (seq_ingredient.nextval), 'blanc de poulet', 100, 1, 1800);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'carotte', 100, 1, 1000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Haricot vert', 100, 1, 1200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Courgettes', 100, 1, 500);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'œuf', 1, 2, 1000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'lait', 100, 3, 550);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'salade', 50, 1, 500);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Tomate', 10, 1, 300);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Oignon', 10, 1, 300);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Ciboulette', 1, 2, 10);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Gingembre', 10, 1, 10);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Ail', 1, 5, 300);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'Viande de porc', 100, 1, 1200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'echine', 100, 1, 1500);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'riz blanc', 1, 2, 900);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'riz rouge', 1, 2, 900);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'pomme de terre', 1000, 1, 3000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'langue', 100, 1, 18000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'poivre vert', 1, 2, 10);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'poivre noir', 10, 1, 30);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'thym tige', 1, 2, 50);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'pate', 100, 1, 800);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'farine', 100, 1, 800);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'salami', 100, 1, 3500);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'mortadelle volaille', 100, 1, 3000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'mortadelle bœuf', 100, 1, 3000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'jambon', 100, 1, 2800);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'pain français', 1, 2, 2500);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'mayonnaise', 10, 1, 200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'ketchup', 10, 1, 200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'chili', 10, 1, 200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'piment vert', 1, 2, 200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'olive noir', 100, 1, 6000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'olive verte', 100, 1, 5000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'huile d olive', 100, 3, 2000);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'huile d olive', 100, 3, 1200);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'avocat', 1, 2, 800);
  INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)VALUES('ing' || (seq_ingredient.nextval), 'mangue', 1, 2, 500);
  -- Insert t the ingredien.data in table using the seq_ingredient sequence
    INSERT INTO ingredient (id, nom, prixAchat, unite, valeur, dateSaisonDebut, dateSaisonFin)VALUES
    ('ing' ||(seq_ingredient.nextval), 'fraise', 500, 1, 100, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'pomme', 200, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'yaourt nature sans sucre', 1000, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'yaourt nature sucré', 1000, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'glace', 3500, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'pate à pizza', 3000, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'pate à crêpe', 2000, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'pate à gauffre', 2500, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'vin blanc', 25000, 3, 1000, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'vin rouge', 25000, 3, 1000, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'paprika', 10, 1, 10, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'piment', 10, 1, 10, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'chocolat', 800, 2, 1, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'tsaramaso', 1000, 1, 100, NULL, NULL);
    ('ing' ||(seq_ingredient.nextval), 'Voanjobory', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Kabaro', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Anana légume', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Ravitoto', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Banane', 100, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Ananas', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Maïs', 4000, 1, 150, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Poisson Capitaine', 15000, 1, 1000, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Poisson Merlan', 15000, 1, 1000, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Poisson tilapia', 15000, 1, 1000, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Crevette', 10000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Calmar', 5000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Citron', 500, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Fromage', 6000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Poivron', 200, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Nouille', 1000, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Spaghetti', 800, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Coriandre', 10, 1, 10, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Persil', 10, 1, 10, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Celeri', 10, 1, 10, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Orange', 700, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Jumbo', 300, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Jaba', 300, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Saucisse Fumée Porc', 2500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Saucisse Boeuf', 2000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Saucisse Porc', 2000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Saucisse crevette', 2500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Café', 500, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Jus gazeuse', 2000, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'chou', 2000, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'brocolis', 2000, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'chou fleur', 2000, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'melon', 1000, 2, 1, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'pistache', 50, 1, 10, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'foie de bœuf', 1500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'coeur de bœuf', 1500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'tripe noir', 1200, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'cervelle', 1200, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'jambon de porc', 3500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'foie gras', 30000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'creme liquide', 5000, 3, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'saucisson', 3500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'ail', 10, 1, 10, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'sucre', 1500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'sel', 500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'vinaigre blanc', 1000, 3, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'vinaigre rouge', 1000, 3, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'feuille de manioc hachée', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'Lait de coco', 5000, 3, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'chou', 500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'patsa', 1000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'tsatsiou', 5000, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'canard', 1500, 1, 100, NULL, NULL),
    ('ing' ||(seq_ingredient.nextval), 'chapelure', 1500, 2, 1, NULL, NULL),
    
    ('ing' ||nextval('seq_ingredient'), 'eau', 10, 3   , 10, NULL, NULL),
    ('ing' ||nextval('seq_ingredient'), 'cresson', 2000, 1   , 1000, NULL, NULL),
    ('ing' ||nextval('seq_ingredient'), 'levure', 1000, 2  , 1, NULL, NULL)
    ;

-- Continue adding more rows for the remaining data using the same pattern

 update ingredient set nom ='huile' where id = 'ing36';

  --- insertions part de maladies : 


-- Insérer des données de maladie dans la table "Maladie"


INSERT INTO Maladie (id, Maladie, etat)VALUES
  ('maladie' || (seq_maladie.nextval), 'Diabète de type 1',1);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Diabète de type 2', 1);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Hypertension (Pression arterielle élevée)', 1);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Maladie cardiaque', 1);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Maladie rénale', 1);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Intolérance au lactose', 2);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Intolérance au gluten', 2);
  INSERT INTO Maladie (id, Maladie, etat)VALUES('maladie' || (seq_maladie.nextval), 'Allergies alimentaires', 2);
  ('maladie' || (seq_maladie.nextval), 'Goutte', 1),
  ('maladie' || (seq_maladie.nextval), 'Maladie de Crohn', 1),
  ('maladie' || (seq_maladie.nextval), 'Maladie de la thyroïde', 1),
  ('maladie' || (seq_maladie.nextval), 'Cholestérol élevé', 1),
  ('maladie' || (seq_maladie.nextval), 'Maladie hépatique (foie)', 1),
  ('maladie' || (seq_maladie.nextval), 'Asthme', 1),
  ('maladie' || (seq_maladie.nextval), 'Maladie de l intestin irritable', 1),
  ('maladie' || (seq_maladie.nextval), 'Ostéoporose', 1),
  ('maladie' || (seq_maladie.nextval), 'Migraines', 1),
  ('maladie' || (seq_maladie.nextval), 'Syndrome de lintestin irritable (SII)', 1),
  ('maladie' || (seq_maladie.nextval), 'Allergies saisonnières', 2),
  ('maladie' || (seq_maladie.nextval), 'Maladie auto-immune (ex. lupus, polyarthrite rhumatoïde)', 1),
  ('maladie' || (seq_maladie.nextval), 'Anémie', 1),
  ('maladie' || (seq_maladie.nextval), 'Intolérance aux FODMAPs', 2),
  ('maladie' || (seq_maladie.nextval), 'Intolérance aux histamines', 2),
  ('maladie' || (seq_maladie.nextval), 'Intolérance à la caféine', 2),
  ('maladie' || (seq_maladie.nextval), 'Intolérance aux sulfites', 2),
  ('maladie' || (seq_maladie.nextval), 'Intolérance au fructose', 2),
  ('maladie' || (seq_maladie.nextval), 'Intolérance à l histamine', 2),
  ('maladie' || (seq_maladie.nextval), 'Intolérance au galactose', 2),
  ('maladie' || (seq_maladie.nextval), 'Régimes pour prendre du poids', 3),
  ('maladie' || (seq_maladie.nextval), 'Régimes pour perdre du poids', 3),
  ('maladie' || (seq_maladie.nextval), 'Rhume', 1),
  ('maladie' || (seq_maladie.nextval), 'Dépression', 1),
  ('maladie' || (seq_maladie.nextval), 'Infections respiratoires aiguës (IRA)', 1),
  ('maladie' || (seq_maladie.nextval), 'Grippe', 1),
  ('maladie' || (seq_maladie.nextval), 'Maladies infectieuses émergentes', 1),
  ('maladie' || (seq_maladie.nextval), 'Maladies cardiovasculaires', 1),
  ('maladie' || (seq_maladie.nextval), 'Épilepsie', 1),
  ('maladie' || (seq_maladie.nextval), 'Diarrhée', 1),
  ('maladie' || (seq_maladie.nextval), 'Ulcère gastrique', 1),
  ('maladie' || (seq_maladie.nextval), 'Reflux gastro-œsophagien (RGO)', 1),
  ('maladie' || (seq_maladie.nextval), 'Appendicite', 1),
  ('maladie' || (seq_maladie.nextval), 'Colite', 1),
  ('maladie' || (seq_maladie.nextval), 'Constipation chronique', 1),
  ('maladie' || (seq_maladie.nextval), 'Pancréatite', 1),
  ('maladie' || (seq_maladie.nextval), 'Tumeurs abdominales', 1),
  ('maladie' || (seq_maladie.nextval), 'Inflammation', 1),
  ('maladie' || (seq_maladie.nextval), 'Gastro-intestinales', 1),
  ('maladie' || (seq_maladie.nextval), 'Anxiété', 1),
  ('maladie' || (seq_maladie.nextval), 'Malabsorption', 1),
  ('maladie' || (seq_maladie.nextval), 'Fièvre', 1),
  ('maladie' || (seq_maladie.nextval), 'Paludisme', 1),
  ('maladie' || (seq_maladie.nextval), 'Hypothyroïdie', 1),
  ('maladie' || (seq_maladie.nextval), 'Hyperthyroïdie', 1),
  ('maladie' || (seq_maladie.nextval), 'Chute de cheveux', 3),
  ('maladie' || (seq_maladie.nextval), 'Digestion difficile', 3),
  ('maladie' || (seq_maladie.nextval), 'Hémorroïdes', 1),
  ('maladie' || (seq_maladie.nextval), 'Hépatite B', 1),
  ('maladie' || (seq_maladie.nextval), 'Pneumonie', 1),
  ('maladie' || (seq_maladie.nextval), 'Toux', 1),
  ('maladie' || (seq_maladie.nextval), 'Végétariens', 3),
  ('maladie' || (seq_maladie.nextval), 'Non-mangeurs de porc', 3);


-- ANTENNE.MENUDYNAMIQUE definition


CREATE TABLE menudynamique (
	id varchar(50) NOT NULL,
	libelle varchar(50) NULL,
	icone varchar(250) NULL,
	href varchar(250) NULL,
	rang int NULL,
	niveau int NULL,
	id_pere varchar(50) NULL,
	CONSTRAINT menudynamique_pkey PRIMARY KEY (id)
);

insert into menudynamique(id,libelle,icone,  rang, niveau) values('m1','Accueil','fa fa-list',1,1);


  -- Insérer des données dans la table "Plat"
INSERT INTO Plat (id, NomPlats, descri)VALUES
  ('plat' || (seq_plat.nextval), 'Mofo akondro', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Mofo anana', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Mofo baolina', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Pakopako', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Riz cantonais', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Riz Firt', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'ailes de poulet caramelisé', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'cuisse de poulet grillé', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Pistolet', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Poivron farci', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'hena Omby ritra', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'tripy sauce', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Tsaramaso sy Henakisoa', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Ravitoto sy Henakisoa', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Ravitoto sy HenaOmby', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Voanjobory sy Henakisoa', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Voanjobory sy HenaOmby', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Totokena sy Courgettes', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Voatavo sy voanjo', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Legioma saosy', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Saucisse Fumée sy Legioma', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Saucisse Porc sy Tsaramaso', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Saucisse Boeuf sy Tsaramaso', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Lasary Comcombre', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Lasary Karaoty', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Lasary Voatabia', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Lasary Laisoa', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Lasary Manga', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Macédoine', NULL);
  INSERT INTO Plat (id, NomPlats, descri)VALUES('plat' || (seq_plat.nextval), 'Hors d œuvre', NULL);
  
  




-- Insérer des données dans la table "PlatTyper"

  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat1', '5');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat1', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat2', '5');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat2', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat3', '5');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat3', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat3', '6');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat4', '5');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat5', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat5', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat6', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat6', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat7', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat7', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat7', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat8', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat8', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat9', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat9', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat10', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat10', '3');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat11', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat11', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat11', '4');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat12', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat12', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat13', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat13', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat14', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat14', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat15', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat15', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat16', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat16', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat17', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat17', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat18', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat18', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat19', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat19', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat20', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat20', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat21', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat21', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat21', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat22', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat22', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat22', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat23', '1');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat23', '11');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat23', '10');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat24', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat24', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat25', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat25', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat26', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat26', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat27', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat27', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat28', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat28', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat29', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat29', '9');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat30', '2');
  INSERT INTO PlatTyper (id, idPlat, idTypePlat)VALUES('plattyper' || (seq_plattyper.nextval), 'plat30', '10');
  