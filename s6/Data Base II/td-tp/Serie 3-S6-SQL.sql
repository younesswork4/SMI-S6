                                                              Tp-Base-De-Données
															        Serie3  
																	
-- Création De la Table Personne 
													
create table personne(
numper number primary key,
prenom varchar2(30) not null,
nom varchar2(30) ,
pere references personne(numper),
mere references personne(numper)
);		

-- Insertion De La Table Personne

insert into personne values(1,'Adam',null,null,null);
insert into personne values(16,'ET',null,null,null);
insert into personne values(2,'driss','Idrissi',1,16);
insert into personne values(3,'Amal','Idrissi',1,16);
insert into personne values(4,'Brahim','Amir',null,null);
insert into personne values(13,'Imane','Fassi',null,null);
insert into personne values(5,'Noura','Amir',4,3);
insert into personne values(12,'Sofia','Sofia',null,null);
insert into personne values(6,'Rachid','Salmi',null,null);
insert into personne values(7,'Belal','Salmi',6,12);
insert into personne values(8,'Hamid','Mahi',2,13);
insert into personne values(9,'Leila','Mahi',8,12);
insert into personne values(10,'Nadir','Amir',4,12);
insert into personne values(17,'Mouna','Essafi',null,null);
insert into personne values(11,'Khadija','Khaldi',10,17);
insert into personne values(15,'Soraya',null,3,13);
insert into personne values(19,'Nabila','Nolwen',null,null);
insert into personne values(20,'Bahija','Taji',8,19);
insert into personne values(21,'Farid','Lara',10,17);
insert into personne values(14,'Amina','Sharon',7,20);
insert into personne values(18,'Asmae','Elodie',7,13);							
								 
-- Serie 3 : Exercice 1

create or replace function puissance(b number,n number)return number is
begin
if(n=0)then return 1;
else
return b*puissance(b,n-1);
end if;
end;

select puissance(5,3) from dual;

-- Serie 3 : Exercice 2

create or replace function demiFreres(pers1 personne.numper%type,pers2 personne.numper%type)return boolean is
lineA personne%rowtype;
lineB personne%rowtype;
begin
select * into lineA  from personne where numper=pers1;
select * into lineB   from personne where numper=pers1;
return LineA.pere=LineB.pere OR LineA.mere=LineB.mere;
end;
declare
m boolean;
begin
m:=demiFreres(7,1);
if m=true then
dbms_output.put_line('True');
else
dbms_output.put_line('False');
end if;
end;

-- Serie 3 : Exercice 3

create or replace function cousins(pers1 personne.numper%type,pers2 personne.numper%type)return boolean is
lineA personne%rowtype;
lineB personne%rowtype;
begin
select * into lineA  from personne where numper=pers1;
select * into lineB   from personne where numper=pers1;
return 
Freres(lineA.pere,lineB.pere)
OR
Freres(lineA.pere,lineB.mere)
OR
Freres(lineA.mere,lineB.pere)
OR
Freres(lineA.mere,lineB.mere);
end;
declare
m boolean;
begin
m:=cousins(7,1);
if m=true then
dbms_output.put_line('True');
else
dbms_output.put_line('False');
end if;
end;

-- Serie 3 : Exercice 4

create or replace procedure pers_pere(p personne.numper%type)is

line  personne%rowtype;
nb number;

begin

select * into line from personne where numper=p;
dbms_output.put_line(line.nom);
select count(*) into nb 
from personne
where numper=line.pere;
if(nb=1)then
pers_pere(line.pere);
end if;
end;

-- Serie 3 : Exercice 5

create or replace procedure AfficheDescendance(numpersonne  personne.numper%type) is

cursor C is 
select * 
from personne
where pere=numpersonne or mere=numpersonne;

begin

 for ROW in C loop
  dbms_output.put_line(ROW.nom||''||ROW.prenom);
  AfficheDescendance(ROW.numper);
 end loop;
end;

-- Pour Tester La Procédure

begin

 AfficheDescendance(8);

end ;
/

-- Serie 3 : Exercice 6

create or replace procedure AfficheCommandeClients is

cursor Clients is 
select * 
from client ;

cursor CommandeCli(Numclient client.nc%type) is
select * 
from commande
where nc=Numclient;

begin

 for UnClient in Clients loop
    dbms_output.put_line(' Le Client Numéro '||UnClient.NC||' a Commandé :');
 for UneCommande in CommandeCli(UnClient.nc) loop
    dbms_output.put_line(' Le Produit '||UneCommande.NP||' , Avec une quantité de '||UneCommande.qte||' En '||UneCommande.DateC);
 end loop;
end loop;

end;

-- Pour Tester La Procédure

begin

 AfficheCommandeClients;

end ;
/

