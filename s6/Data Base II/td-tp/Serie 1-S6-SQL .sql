                                                               Tp-Base-De-Données
															         Serie 1 
-- Serie 1 : Exercice 1

-- 1 ) Créez la base de données COMMERCE

-- 2 ) Créez les tables : Client, Fournisseur, Produit et Commande .

CREATE TABLE Client (
NC NUMBER(4),
Nom VARCHAR2(30),
Prenom VARCHAR2(30),
DN DATE,
CP NUMBER(6),
Ville VARCHAR2(40),
CONSTRAINT PK_CLIENT PRIMARY KEY (NC)
);

CREATE TABLE Fournisseur (
NF NUMBER(4),
RaisonSoc VARCHAR2(30),
CONSTRAINT PK_FOURNISSEUR PRIMARY KEY (NF)
);

CREATE TABLE Produit (
NP NUMBER(4),
Desig VARCHAR2(30),
PU VARCHAR2(30),
NF NUMBER(4) Not NULL,
CONSTRAINT PK_PRODUIT PRIMARY KEY (NP),
CONSTRAINT PK_PRODUIT_NF FOREIGN KEY (NF) references FOURNISSEUR(NF) ,
CONSTRAINT CK_PRODUIT_PU CHECK(PU<30000)
);

CREATE TABLE Commande (
NC NUMBER(4),
NP NUMBER(4),
DateC DATE DEFAULT SYSDATE, 
Qte NUMBER(4) Not NULL,
CONSTRAINT PK_COMMANDE PRIMARY KEY (NC,NP,DateC),
CONSTRAINT FK_COMMANDE_NC FOREIGN KEY (NC) references CLIENT(NC) ,
CONSTRAINT FK_COMMANDE_NP FOREIGN KEY (NP) references produit(NP) ,
CONSTRAINT CK_COMMANDE_PU CHECK(Qte>0)
);

-- Insertion Des Tables .

INSERT INTO CLIENT values(1,'Amali','Samir','12-02-1978',123,'Rabat');
INSERT INTO CLIENT values(2,'Daoudi','Kamel','8-11-1985',124,'Rabat');
INSERT INTO CLIENT (NC,Nom,Prenom,CP,Ville) values(3,'Wardi','Ali',125,'Rabat');

INSERT INTO FOURNISSEUR values(1,'UBSK');
INSERT INTO FOURNISSEUR values(2,'Microchoix');
INSERT INTO FOURNISSEUR values(3,'HP');

INSERT INTO PRODUIT values(10,'imprimente',1100,1);
INSERT INTO PRODUIT values(20,'Portable',2245.225,3);

INSERT INTO Commande values(1,10,'02-12-2014',2);
INSERT INTO Commande values(3,20,'2-16-2014',4);
INSERT INTO Commande values(3,10,'2-22-2014',6);
INSERT INTO Commande (NC,NP,Qte) values(1,20,3);
INSERT INTO Commande values(1,20,'6-26-2014',5);

-- Serie 1 : Exercice 2

-- Creation Des Vues

create or replace view LNPClients (nomCli,PrenomCli) AS 
SELECT Nom,Prenom  From CLIENT ;

create or replace view NbCmdClients  AS 
SELECT NC ,count(*)
From Commande
Group by (NC) ;

create or replace view NbCmdClients  AS 
SELECT NC ,count(*) as nbCMD
From Commande
Group by (NC) ;

create or replace view ProdCom  AS 
SELECT P.NP ,Desig,PU,DateC,Qte  
From Commande C ,Produit P
where P.NP=C.NP ;

CREATE OR REPLACE VIEW Lfour as select distinct * from fournisseur ;
Insert into Lfour values(7,'Reper');

create or replace view CLIENT_RABAT AS
SELECT Nom , Prenom , Ville
from client
where Ville='Rabat' ;

create or replace view PRODUIT_1 (NP_1,NumFour_1,PrixUnit_1,Desig_1) AS
SELECT P.NP,P.NF,P.PU,P.Desig
from PRODUIT P ,Fournisseur F 
where P.NF=F.NF AND
RaisonSoc='HP';

-- Insertion De La vue

Insert into PRODUIT_1 values(50,3,500,'prod50');
Insert into PRODUIT_1 values(60,3,600,'prod60');
Insert into PRODUIT_1 values(70,2,700,'prod70'); 

-- Insertion De La vue Produit_1

delete from produit_1 where NP_1=50;
delete from produit_1 where NP_1=60;
delete from produit_1 where NP_1=70; 

-- Creation De La vue CLIENT_CMD

create or replace view CLIENT_CMD (NCLI, NOM,PRENOM, ADR, PHT, PTTC, DATEC)
as select CL.NC,NOM,PRENOM,VILLE,PU,PU*1.2,DATEC
from commande C , Client CL , PRODUIT P
where
CL.NC=C.NC AND
P.NP=C.NP;

-- Insertion De La vue CLIENT_CMD

Insert into CLIENT_CMD values(7,'MHIDI','BOUSSELHAM','kenitra',2022,2154,'10-01-2015'); 

-- Insertion De La vue CLIENT_NBCMD

create or replace view CLIENT_NBCMD (NCLI, NOM, PRENOM, ADR, NBRCMD)
as select NCLI, NOM, PRENOM, ADR, count(*) as NBRCMD
from CLIENT_CMD
Group by NCLI ;


