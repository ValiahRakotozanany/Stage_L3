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

CREATE ROLE Proposition LOGIN PASSWORD 'Proposition';

create table Famille(
    id varchar(50) PRIMARY KEY ,
    NomFamille Varchar(100),
    email varchar(50),
    motdepasse varchar(50)
);


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

g-piece-ml-cuilleré
insert into unite(mesure) values('g'),('piece'),('ml'),('G cuilleré'),('P cuilleré');

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
  (nextval('seq_typeplat'), 'plats principaux', 1),
  (nextval('seq_typeplat'), 'entrée/apéritifs', 1),
  (nextval('seq_typeplat'), 'snacks', 1),
  (nextval('seq_typeplat'), 'résistance', 1),
  (nextval('seq_typeplat'), 'dessert', 1),
  (nextval('seq_typeplat'), 'petit déjeuner', 1),
  (nextval('seq_typeplat'), 'plats traditionnels', 1),
  (nextval('seq_typeplat'), 'soupe', 1),
  (nextval('seq_typeplat'), 'accompagnement', 1),
  (nextval('seq_typeplat'), 'plats de fête', 1),
  (nextval('seq_typeplat'), 'plats trad(Malagasy)', 1);

Create table Plat(
    id varchar(50) primary key , 
    NomPlats varchar(100),
    descri text 
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
    remarque text
);



create SEQUENCE seq_platfille;

create table PlatTyper(
    id VARCHAR(50) primary KEY,
    idPlat VARCHAR(50) REFERENCES Plat(id),
    idTypePlat VARCHAR(50) REFERENCES typeplat(id)
);

create SEQUENCE seq_plattyper;
----Intolérance 
create table etatmaladie(
    id serial primary key,
    etatlib varchar(20)
);
insert into etatmaladie(etatlib) values('Maladie'),('Intolerance'),('Autres conditions');


create table Maladie(
    id varchar(50) PRIMARY KEY ,
    Maladie varchar(100) ,
    etat int REFERENCES etatmaladie(id)
);
create SEQUENCE seq_maladie;-- maladie

-- ALTER TABLE maladie
-- ADD CONSTRAINT fk_etatmaladie
-- FOREIGN KEY (etat) REFERENCES Etatmaladie(id);


create table MaladieMembre(
    id varchar(50) PRIMARY key,
    idMaladie varchar(50) REFERENCES Maladie(id),
    idMembre varchar(50) REFERENCES Membre(id)
);

create SEQUENCE seq_maladiemembre;

create table IngredientMaladie(
    id varchar(50) PRIMARY key,
    idMaladie varchar(50) REFERENCES Maladie(id),
    idingredient varchar(50) REFERENCES ingredient(id),
    etat int 
);

create SEQUENCE seq_ingredientMaladie;

create table PlatMaladie(
    id varchar(50) PRIMARY key,
    idMaladie varchar(50) REFERENCES Maladie(id),
    idPlat varchar(50) REFERENCES Plat(id),
    etat int 
);
create SEQUENCE seq_platmaladie;

create table preferenceingredient(
    id varchar(50) PRIMARY key,
    idingredient varchar(50) REFERENCES ingredient(id),
    idMembre varchar(50) REFERENCES Membre(id)

);
create SEQUENCE seq_preferenceingredient;

create table preferenceplat(
    id varchar(50) PRIMARY key,
    idplat varchar(50) REFERENCES plat(id),
    idMembre varchar(50) REFERENCES Membre(id)
);

create SEQUENCE seq_preferenceplat; 

Create table intolerance(
    id varchar(50) PRIMARY key,
    intolerance varchar(50)
);

create SEQUENCE seq_intolerance;

create table IntoleranceIngredient(
    id varchar(50) PRIMARY key,
    idingredient varchar(50) REFERENCES ingredient(id),
    idintolerance VARCHAR(50) REFERENCES Intolerance(id)
);
create SEQUENCE seq_intoleranceingredient;

create table intoleranceMembre(
    id varchar(50) PRIMARY key,
    idMembre varchar(50) REFERENCES Membre(id),
    idintolerance VARCHAR(50) REFERENCES Intolerance(id)
);

create SEQUENCE seq_intolerancemembre;

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

-- insertion part ingredients :
-- Insérer des données d'ingrédients dans la table "ingredient"
INSERT INTO ingredient (id, nom, valeur, unite, prixAchat)
VALUES
  ('ing' || nextval('seq_ingredient'), 'blanc de poulet', 100, 1, 1800),
  ('ing' || nextval('seq_ingredient'), 'carotte', 100, 1, 1000),
  ('ing' || nextval('seq_ingredient'), 'Haricot vert', 100, 1, 1200),
  ('ing' || nextval('seq_ingredient'), 'Courgettes', 100, 1, 500),
  ('ing' || nextval('seq_ingredient'), 'œuf', 1, 2, 1000),
  ('ing' || nextval('seq_ingredient'), 'lait', 100, 3, 550),
  ('ing' || nextval('seq_ingredient'), 'salade', 50, 1, 500),
  ('ing' || nextval('seq_ingredient'), 'Tomate', 10, 1, 300),
  ('ing' || nextval('seq_ingredient'), 'Oignon', 10, 1, 300),
  ('ing' || nextval('seq_ingredient'), 'Ciboulette', 1, 2, 10),
  ('ing' || nextval('seq_ingredient'), 'Gingembre', 10, 1, 10),
  ('ing' || nextval('seq_ingredient'), 'Ail', 1, 5, 300),
  ('ing' || nextval('seq_ingredient'), 'Viande de porc', 100, 1, 1200),
  ('ing' || nextval('seq_ingredient'), 'echine', 100, 1, 1500),
  ('ing' || nextval('seq_ingredient'), 'riz blanc', 1, 2, 900),
  ('ing' || nextval('seq_ingredient'), 'riz rouge', 1, 2, 900),
  ('ing' || nextval('seq_ingredient'), 'pomme de terre', 1000, 1, 3000),
  ('ing' || nextval('seq_ingredient'), 'langue', 100, 1, 18000),
  ('ing' || nextval('seq_ingredient'), 'poivre vert', 1, 2, 10),
  ('ing' || nextval('seq_ingredient'), 'poivre noir', 10, 1, 30),
  ('ing' || nextval('seq_ingredient'), 'thym tige', 1, 2, 50),
  ('ing' || nextval('seq_ingredient'), 'pate', 100, 1, 800),
  ('ing' || nextval('seq_ingredient'), 'farine', 100, 1, 800),
  ('ing' || nextval('seq_ingredient'), 'salami', 100, 1, 3500),
  ('ing' || nextval('seq_ingredient'), 'mortadelle volaille', 100, 1, 3000),
  ('ing' || nextval('seq_ingredient'), 'mortadelle bœuf', 100, 1, 3000),
  ('ing' || nextval('seq_ingredient'), 'jambon', 100, 1, 2800),
  ('ing' || nextval('seq_ingredient'), 'pain français', 1, 2, 2500),
  ('ing' || nextval('seq_ingredient'), 'mayonnaise', 10, 1, 200),
  ('ing' || nextval('seq_ingredient'), 'ketchup', 10, 1, 200),
  ('ing' || nextval('seq_ingredient'), 'chili', 10, 1, 200),
  ('ing' || nextval('seq_ingredient'), 'piment vert', 1, 2, 200),
  ('ing' || nextval('seq_ingredient'), 'olive noir', 100, 1, 6000),
  ('ing' || nextval('seq_ingredient'), 'olive verte', 100, 1, 5000),
  ('ing' || nextval('seq_ingredient'), 'huile d olive', 100, 3, 2000),
  ('ing' || nextval('seq_ingredient'), 'huile d olive', 100, 3, 1200),
  ('ing' || nextval('seq_ingredient'), 'avocat', 1, 2, 800),
  ('ing' || nextval('seq_ingredient'), 'mangue', 1, 2, 500);


  --- insertions part de maladies : 


-- Insérer des données de maladie dans la table "Maladie"


INSERT INTO Maladie (id, Maladie, etat)
VALUES
  ('maladie' || nextval('seq_maladie'), 'Diabète de type 1',1),
  ('maladie' || nextval('seq_maladie'), 'Diabète de type 2', 1),
  ('maladie' || nextval('seq_maladie'), 'Hypertension (Pression arterielle élevée)', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladie cardiaque', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladie rénale', 1),
  ('maladie' || nextval('seq_maladie'), 'Intolérance au lactose', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance au gluten', 2),
  ('maladie' || nextval('seq_maladie'), 'Allergies alimentaires', 2),
  ('maladie' || nextval('seq_maladie'), 'Goutte', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladie de Crohn', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladie de la thyroïde', 1),
  ('maladie' || nextval('seq_maladie'), 'Cholestérol élevé', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladie hépatique (foie)', 1),
  ('maladie' || nextval('seq_maladie'), 'Asthme', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladie de l intestin irritable', 1),
  ('maladie' || nextval('seq_maladie'), 'Ostéoporose', 1),
  ('maladie' || nextval('seq_maladie'), 'Migraines', 1),
  ('maladie' || nextval('seq_maladie'), 'Syndrome de lintestin irritable (SII)', 1),
  ('maladie' || nextval('seq_maladie'), 'Allergies saisonnières', 2),
  ('maladie' || nextval('seq_maladie'), 'Maladie auto-immune (ex. lupus, polyarthrite rhumatoïde)', 1),
  ('maladie' || nextval('seq_maladie'), 'Anémie', 1),
  ('maladie' || nextval('seq_maladie'), 'Intolérance aux FODMAPs', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance aux histamines', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance à la caféine', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance aux sulfites', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance au fructose', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance à l histamine', 2),
  ('maladie' || nextval('seq_maladie'), 'Intolérance au galactose', 2),
  ('maladie' || nextval('seq_maladie'), 'Régimes pour prendre du poids', 3),
  ('maladie' || nextval('seq_maladie'), 'Régimes pour perdre du poids', 3),
  ('maladie' || nextval('seq_maladie'), 'Rhume', 1),
  ('maladie' || nextval('seq_maladie'), 'Dépression', 1),
  ('maladie' || nextval('seq_maladie'), 'Infections respiratoires aiguës (IRA)', 1),
  ('maladie' || nextval('seq_maladie'), 'Grippe', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladies infectieuses émergentes', 1),
  ('maladie' || nextval('seq_maladie'), 'Maladies cardiovasculaires', 1),
  ('maladie' || nextval('seq_maladie'), 'Épilepsie', 1),
  ('maladie' || nextval('seq_maladie'), 'Diarrhée', 1),
  ('maladie' || nextval('seq_maladie'), 'Ulcère gastrique', 1),
  ('maladie' || nextval('seq_maladie'), 'Reflux gastro-œsophagien (RGO)', 1),
  ('maladie' || nextval('seq_maladie'), 'Appendicite', 1),
  ('maladie' || nextval('seq_maladie'), 'Colite', 1),
  ('maladie' || nextval('seq_maladie'), 'Constipation chronique', 1),
  ('maladie' || nextval('seq_maladie'), 'Pancréatite', 1),
  ('maladie' || nextval('seq_maladie'), 'Tumeurs abdominales', 1),
  ('maladie' || nextval('seq_maladie'), 'Inflammation', 1),
  ('maladie' || nextval('seq_maladie'), 'Gastro-intestinales', 1),
  ('maladie' || nextval('seq_maladie'), 'Anxiété', 1),
  ('maladie' || nextval('seq_maladie'), 'Malabsorption', 1),
  ('maladie' || nextval('seq_maladie'), 'Fièvre', 1),
  ('maladie' || nextval('seq_maladie'), 'Paludisme', 1),
  ('maladie' || nextval('seq_maladie'), 'Hypothyroïdie', 1),
  ('maladie' || nextval('seq_maladie'), 'Hyperthyroïdie', 1),
  ('maladie' || nextval('seq_maladie'), 'Chute de cheveux', 3),
  ('maladie' || nextval('seq_maladie'), 'Digestion difficile', 3),
  ('maladie' || nextval('seq_maladie'), 'Hémorroïdes', 1),
  ('maladie' || nextval('seq_maladie'), 'Hépatite B', 1),
  ('maladie' || nextval('seq_maladie'), 'Pneumonie', 1),
  ('maladie' || nextval('seq_maladie'), 'Toux', 1),
  ('maladie' || nextval('seq_maladie'), 'Végétariens', 3),
  ('maladie' || nextval('seq_maladie'), 'Non-mangeurs de porc', 3);


-- ANTENNE.MENUDYNAMIQUE definition

CREATE TABLE "MENUDYNAMIQUE" 
   (	"ID" VARCHAR2(50), 
	"LIBELLE" VARCHAR2(50), 
	"ICONE" VARCHAR2(250), 
	"HREF" VARCHAR2(250), 
	"RANG" NUMBER, 
	"NIVEAU" NUMBER, 
	"ID_PERE" VARCHAR2(50), 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 720896 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

CREATE UNIQUE INDEX "SYS_C00428005" ON "ANTENNE"."MENUDYNAMIQUE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 131072 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;




  -- Insérer des données dans la table "Plat"
INSERT INTO Plat (id, NomPlats, descri)
VALUES
  ('plat' || nextval('seq_plat'), 'Mofo akondro', NULL),
  ('plat' || nextval('seq_plat'), 'Mofo anana', NULL),
  ('plat' || nextval('seq_plat'), 'Mofo baolina', NULL),
  ('plat' || nextval('seq_plat'), 'Pakopako', NULL),
  ('plat' || nextval('seq_plat'), 'Riz cantonais', NULL),
  ('plat' || nextval('seq_plat'), 'Riz Firt', NULL),
  ('plat' || nextval('seq_plat'), 'ailes de poulet caramelisé', NULL),
  ('plat' || nextval('seq_plat'), 'cuisse de poulet grillé', NULL),
  ('plat' || nextval('seq_plat'), 'Pistolet', NULL),
  ('plat' || nextval('seq_plat'), 'Poivron farci', NULL),
  ('plat' || nextval('seq_plat'), 'hena Omby ritra', NULL),
  ('plat' || nextval('seq_plat'), 'tripy sauce', NULL),
  ('plat' || nextval('seq_plat'), 'Tsaramaso sy Henakisoa', NULL),
  ('plat' || nextval('seq_plat'), 'Ravitoto sy Henakisoa', NULL),
  ('plat' || nextval('seq_plat'), 'Ravitoto sy HenaOmby', NULL),
  ('plat' || nextval('seq_plat'), 'Voanjobory sy Henakisoa', NULL),
  ('plat' || nextval('seq_plat'), 'Voanjobory sy HenaOmby', NULL),
  ('plat' || nextval('seq_plat'), 'Totokena sy Courgettes', NULL),
  ('plat' || nextval('seq_plat'), 'Voatavo sy voanjo', NULL),
  ('plat' || nextval('seq_plat'), 'Legioma saosy', NULL),
  ('plat' || nextval('seq_plat'), 'Saucisse Fumée sy Legioma', NULL),
  ('plat' || nextval('seq_plat'), 'Saucisse Porc sy Tsaramaso', NULL),
  ('plat' || nextval('seq_plat'), 'Saucisse Boeuf sy Tsaramaso', NULL),
  ('plat' || nextval('seq_plat'), 'Lasary Comcombre', NULL),
  ('plat' || nextval('seq_plat'), 'Lasary Karaoty', NULL),
  ('plat' || nextval('seq_plat'), 'Lasary Voatabia', NULL),
  ('plat' || nextval('seq_plat'), 'Lasary Laisoa', NULL),
  ('plat' || nextval('seq_plat'), 'Lasary Manga', NULL),
  ('plat' || nextval('seq_plat'), 'Macédoine', NULL),
  ('plat' || nextval('seq_plat'), 'Hors d œuvre', NULL);




-- Insérer des données dans la table "PlatTyper"
INSERT INTO PlatTyper (id, idPlat, idTypePlat)
VALUES
  ('plattyper' || nextval('seq_plattyper'), 'plat1', '5'),
  ('plattyper' || nextval('seq_plattyper'), 'plat1', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat2', '5'),
  ('plattyper' || nextval('seq_plattyper'), 'plat2', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat3', '5'),
  ('plattyper' || nextval('seq_plattyper'), 'plat3', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat3', '6'),
  ('plattyper' || nextval('seq_plattyper'), 'plat4', '5'),
  ('plattyper' || nextval('seq_plattyper'), 'plat5', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat5', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat6', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat6', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat7', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat7', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat7', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat8', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat8', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat9', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat9', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat10', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat10', '3'),
  ('plattyper' || nextval('seq_plattyper'), 'plat11', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat11', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat11', '4'),
  ('plattyper' || nextval('seq_plattyper'), 'plat12', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat12', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat13', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat13', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat14', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat14', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat15', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat15', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat16', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat16', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat17', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat17', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat18', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat18', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat19', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat19', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat20', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat20', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat21', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat21', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat21', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat22', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat22', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat22', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat23', '1'),
  ('plattyper' || nextval('seq_plattyper'), 'plat23', '11'),
  ('plattyper' || nextval('seq_plattyper'), 'plat23', '10'),
  ('plattyper' || nextval('seq_plattyper'), 'plat24', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat24', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat25', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat25', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat26', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat26', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat27', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat27', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat28', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat28', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat29', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat29', '9'),
  ('plattyper' || nextval('seq_plattyper'), 'plat30', '2'),
  ('plattyper' || nextval('seq_plattyper'), 'plat30', '10');
