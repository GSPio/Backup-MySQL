					/* Desafio */

create database `desafio`;
use desafio;
drop database `desafio`;

/* Lógico_Desafio: */

/* Lógico_Desafio: */

CREATE TABLE Fichabasica (
    numcad int PRIMARY KEY,
    nomfun varchar(50),
    datadm date,
    fk_codcar int,
    fk_codccu int,
    fk_valsal float
);

CREATE TABLE Cargos (
    codcar int PRIMARY KEY,
    titred varchar(50)
);

CREATE TABLE Historicocargos (
    datalt date PRIMARY KEY,
    fk_numcad int,
    fk_codcar int
);

CREATE TABLE Centrodecustos (
    codccu int PRIMARY KEY,
    nomccu varchar(100)
);

CREATE TABLE Historicocentrodecustos (
    datalt date PRIMARY KEY,
    fk_codccu int,
    fk_numcad int
);

CREATE TABLE Historicosalarios (
    valsal float PRIMARY KEY,
    fk_numcad int,
    datalt date
);
 
ALTER TABLE Fichabasica ADD CONSTRAINT fk_cargos_fichabasica
    FOREIGN KEY (fk_codcar)
    REFERENCES Cargos (codcar);
 
ALTER TABLE Fichabasica ADD CONSTRAINT fk_centrodecustos_fichabasica
    FOREIGN KEY (fk_codccu)
    REFERENCES Centrodecustos (codccu);
 
 
/* Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`desafio`.`#sql-1048_2b`, CONSTRAINT `fk_historicosalario_fichabasica` FOREIGN KEY (`fk_valsal`) REFERENCES `historicosalarios` (`valsal`))
*/
ALTER TABLE Fichabasica ADD CONSTRAINT fk_historicosalario_fichabasica
    FOREIGN KEY (fk_valsal)
    REFERENCES Historicosalarios (valsal);
 
ALTER TABLE Historicocargos ADD CONSTRAINT fk_fichabasica_historicocargos
    FOREIGN KEY (fk_numcad)
    REFERENCES Fichabasica (numcad);
 
ALTER TABLE Historicocargos ADD CONSTRAINT fk_cargos_historicocargos
    FOREIGN KEY (fk_codcar)
    REFERENCES Cargos (codcar);
 
ALTER TABLE Historicocentrodecustos ADD CONSTRAINT fk_fichabasica_historicocentrocustos
    FOREIGN KEY (fk_numcad)
    REFERENCES Fichabasica (numcad);
 
ALTER TABLE Historicocentrodecustos ADD CONSTRAINT fk_centrodecustos_historicocentrocustos
    FOREIGN KEY (fk_codccu)
    REFERENCES Centrodecustos (codccu);
 
ALTER TABLE Historicosalarios ADD CONSTRAINT fk_historicosalario_fichabasica1
    FOREIGN KEY (fk_numcad)
    REFERENCES Fichabasica (numcad);
    
    

desc fichabasica;
select * from fichabasica;
/* drop table fichabasica; */

select * from cargos;
select * from centrodecustos;
select * from fichabasica;
select * from historicocargos;
select * from historicocentrodecustos;
select * from historicosalarios;
desc historicocargos;

/* 
Não consigo popular as colunas de históricos, pois elas tentam gerar primary keys (datalt) repetidas;
Por algum motivo a constraint para adicionar a foreign key fk_valsal não funciona;
Não achei uma maneira de adicionar as datas às tabelas, tive que remover os dados de hora, ou teria de usar varchar para as mesmas;
*/

