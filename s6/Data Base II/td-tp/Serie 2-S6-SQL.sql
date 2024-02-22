                                                              Tp-Base-De-Données
															        Serie 2 
-- Serie 2 : Exercice 1

DECLARE 
v_a int :=1;
v_b int :=2;
v_c int ;
BEGIN
DBMS_OUTPUT.PUT_LINE(v_a || ' ' || v_b) ;
v_c := v_a ;
v_a := v_b ;
v_b := v_c ;
DBMS_OUTPUT.PUT_LINE(v_a || ' ' || v_b) ;
END;/

-- Serie 2 : Exercice 2

-- Par La Fonction For

DECLARE 
v_var int   ;
v_i int   ;
BEGIN 
v_var:=10;
for v_i in 1..9 LOOP 
v_var:= (v_var*v_i) ;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_var) ;
END; /

-- Par La Fonction while

DECLARE 
v_var int   ;
v_i int   ;
BEGIN 
v_var:=10;
v_i:=1;
WHILE (v_i<=9) LOOP 
v_var:= (v_var*v_i) ;
v_i:=v_i+1;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_var) ;
END; /

-- Par La Fonction Loop

DECLARE 
v_var int   ;
v_i int   ;
BEGIN 
v_var:=10;
v_i:=1;
LOOP 
v_var:=(v_var*v_i) ;
v_i:=v_i+1;
exit when v_i=10 ;
END LOOP;
DBMS_OUTPUT.PUT_LINE(v_var) ;
END; /

-- Serie 2 : Exercice 3

-- Version Des Soustractions

DECLARE
a number :=48;
b number :=84;
amodb number;
begin
while b>0 loop
amod b:=a;
while amod b>=b  loop
amodb:=amodb-b;
end loop;
a:=b;
b:=amodb;
end loop;
dbms_output.put_line('le pgcd est : '||a);
END;/

-- Version De Modulo

DECLARE
v_a int :=48;
v_b int :=84;
v_c int;
v_pgcd int;
BEGIN
v_c  := mod(v_b , v_a );
while v_c!=0 loop
            v_pgcd  := mod(v_b , v_a );
    		v_b := v_a;
    		v_a := v_c;
    		v_c  := mod(v_b , v_a );
end loop ;
DBMS_OUTPUT.PUT_LINE(' Le PGCD est :'||v_pgcd);
END ; /


-- Serie 2 : Exercice 4

DECLARE
 TYPE numberTab IS VARRAY (50) OF int;
 v_tab numberTab ;
 v_i number ;
 v_temp number ;
BEGIN 
 v_tab := numberTab ( ) ;
 v_tab .EXTEND( 20 ) ;
 FOR v_i IN 1..20 LOOP
 v_tab ( v_i ) := v_i*v_i ;
 END LOOP;
 FOR v_i IN 1..10 LOOP
 v_temp :=  v_tab ( v_i ) ;
 v_tab ( v_i ) := v_tab ( 21 - v_i ) ;
 v_tab ( 21 - v_i ) := v_temp  ;
 END LOOP;
 FOR v_i IN 1..20 LOOP
 DBMS_OUTPUT.PUT_LINE(' Tab['||v_i||'] = '||v_tab ( v_i ) ) ;
 END LOOP;
 END; /
 
-- Serie 2 : Exercice 5

DECLARE 
TYPE Cli IS RECORD 
(
numcli client.NC%type, //numcli
nomcli client.Nom%type,
prenomcli client.Prenom%type,
DNcli client.DN%type,
CPcli client.CP%type,
Villecli client.Ville%type 
);
v_Cli  Cli;
BEGIN
select NC,Nom,Prenom,DN,CP,Ville 
into
v_Cli.numcli,v_Cli.nomcli,v_Cli.prenomcli,v_Cli.DNcli,v_Cli.CPcli,v_Cli.Villecli 
from Client
where DN='12-02-1978';
 DBMS_OUTPUT.PUT_LINE(' le Client '||v_Cli.numcli||' avec le Nom '||v_Cli.nomcli||' et le Prénom '||v_Cli.prenomcli ||' Né en '||v_Cli.DNcli||' à '|| v_Cli.Villecli||' avec Un code Postal '||v_Cli.CPcli) ;
END; /

-- Serie 2 : Exercice 6

-- Version Simple

declare 
v_p number;
v_q number;
function PRTTC return number is
begin
select pu,qte into v_p,v_q from produit p,commande c
where p.np=c.np and
 	desig='Portable' and
	nc=3;
return(v_p*v_q*1.2);
end;
begin
 DBMS_OUTPUT.PUT_LINE(' le Client 3 doit Payé '||PRTTC);
end; /

-- Version De Curseur

declare 
v_pr number;
v_qt  number;
v_ttc  number;
cursor PT is 
select nc,pu,qte from produit p,commande c
where p.np=c.np and
 	desig='Portable';
tuple PT%rowtype;
procedure PRTTC is
begin
for tuple in PT loop
v_pr:=tuple.PU;
v_qt:=tuple.qte;
v_ttc:=v_pr*v_qt*1.2;
 DBMS_OUTPUT.PUT_LINE(' le Client '||tuple.nc||' a comandé '||v_qt||'Portable , Le Prix TTC est'||v_ttc);
end loop;
end;
begin
PRTTC;
end; /
