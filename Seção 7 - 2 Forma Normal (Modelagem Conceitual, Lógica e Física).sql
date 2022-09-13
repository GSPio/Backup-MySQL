/* Adicionando - Editando a tabela de gastos */
use universidade_u;

create table gasto (
idgasto int auto_increment primary key,
ano int not null,
tipo enum('previsto', 'realizado') not null,
Jan float(10,2),
Fev float(10,2),
Mar float(10,2),
Abr float(10,2),
Mai float(10,2),
Jun float(10,2),
Jul float(10,2),
Ago float(10,2),
`Set` float(10,2),
`Out` float(10,2),
Nov float(10,2),
Dez float(10,2)
);

select * from gasto;
insert into gasto(ano, tipo, jan, fev, mar, abr, mai, jun, jul, ago, `set`, `out`, nov, dez)
values('2019', 'previsto', 18000, 17000, 19000, 20000, 17000, 18000, 18500, 18500, 1800, 17500, 18000, 17000);
insert into gasto(ano, tipo, jan)values('2019', 'realizado', 18353.20);
update gasto set fev = 17555.55 where idgasto = 2;
update gasto set mar = 19435.73 where idgasto = 2;
update gasto set abr = 22753.12 where idgasto = 2;
update gasto set mai = 16198.12 where idgasto = 2;
update gasto set jun = 17451.88 where idgasto = 2;
update gasto set jul = 18975.40 where idgasto = 2;
update gasto set ago = 19163.84 where idgasto = 2;
update gasto set `set` = 18132.56 where idgasto = 2;
update gasto set `out` = 17667.91 where idgasto = 2;
update gasto set nov = 17936.33 where idgasto = 2;
update gasto set dez = 17125.88 where idgasto = 2;

select (ceil(jan + fev + mar + abr + mai + jun + jul + ago+  `set` + `out` + nov + dez)/12) as media from gasto where idgasto='2';
----------------------------------------------------------
/* Criando indicadores de controle de gasto */
select * from gasto;
select idgasto from gasto where ano=2019 and tipo='realizado';
select idgasto from gasto where ano=2019 and tipo='previsto';

select
		((select jan from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select jan from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_jan,
		((select fev from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select fev from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_fev,
		((select mar from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select mar from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_mar,
    	((select abr from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select abr from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_abr,
    	((select mai from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select mai from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_mai,
    	((select jun from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select jun from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_jun,
    	((select jul from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select jul from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_jul,
    	((select ago from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select ago from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_ago,
    	((select `set` from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select `set` from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_set,
    	((select `out` from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select `out` from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_out,
    	((select nov from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select nov from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_nov,
    	((select dez from gasto where idgasto = (select idgasto from gasto where tipo = 'previsto')) -
    (select dez from gasto where idgasto = (select idgasto from gasto where tipo = 'realizado'))) as resultado_dez;
-----------------------------------------------------------
    /* Armazenamento da data de nascimento dos aluno */
alter table aluno add data_nascimento date;
select * from aluno;
update aluno set data_nascimento = '1997-09-12' where id_aluno = 1;
update aluno set data_nascimento = '1997-08-02' where id_aluno = 2;
update aluno set data_nascimento = '1985-12-01' where id_aluno = 3;
update aluno set data_nascimento = '1996-10-27' where id_aluno = 4;
update aluno set data_nascimento = '1990-04-15' where id_aluno = 5;
update aluno set data_nascimento = '1996-01-17' where id_aluno = 6;
-----------------------------------------------------------------
	/* Trabalhando com funções de data */
select curdate();
select now(); 
select date_format(curdate(), '%d/%m/%y') as data_atual;
select date_format(curdate(), '%Y/%M/%D') as data_atual;
select extract(day from curdate());
select date_add(now(), interval 20 year) as daqui_a_20_anos; /* second, minute, hour, day, month, year */
select date_add('1999-09-23 12:45:56', interval 30 minute);
select (datediff(curdate(), '1997-08-02')/365) as idade_aprox;
select period_diff('200001', '199501'); /* formato AnoMês, retorna em Mês */
select dayofyear(curdate());
----------------------------------------------------------------
	/* Calculando a idade com base na data atual e data de nascimento */
	/* timestamp (marca temporal) início à patir da meia-noite de 01/01/1970 (Início do calendário Linux) */
select timestampdiff(year, '1997-08-02', curdate()) as idade;
select * from aluno;
select data_nascimento, curdate() as data_atual, timestampdiff(year, data_nascimento, curdate()) as idade_atualizada from aluno;
alter table aluno drop idade;
desc aluno;
alter table aluno add idade varchar(3) after sexo;
update aluno set idade = (timestampdiff(year, data_nascimento, curdate())) where id_aluno = 1;
update aluno set idade = (timestampdiff(year, data_nascimento, curdate())) where id_aluno = 2;
update aluno set idade = (timestampdiff(year, data_nascimento, curdate())) where id_aluno = 3;
update aluno set idade = (timestampdiff(year, data_nascimento, curdate())) where id_aluno = 4;
update aluno set idade = (timestampdiff(year, data_nascimento, curdate())) where id_aluno = 5;
update aluno set idade = (timestampdiff(year, data_nascimento, curdate())) where id_aluno = 6;
---------------------------------------------------------
	/* Refactoring da data de inscrição no curso e valor pago */
select * from aluno;
select * from aluno_curso;
alter table aluno_curso add Data_Inscrição_Curso date;
alter table aluno_curso add Valor_Curso float(10,2);
	/* Cadastrar os dados manualmente demora muito, criar uma Query de update com uma subquery para recuperar os dados da tabela aluno automaticamente */
update aluno_curso
set
	Data_Inscrição_Curso = (select data_inscricao_curso from aluno where id_aluno = 1),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 1) where fk_idaluno = 1;
update aluno_curso
set
	Data_Inscrição_Curso = (select data_inscricao_curso from aluno where id_aluno = 2),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 2) where fk_idaluno = 2;
    update aluno_curso
set
	Data_Inscrição_Curso = (select data_inscricao_curso from aluno where id_aluno = 3),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 3) where fk_idaluno = 3;
update aluno_curso
set
	Data_Inscrição_Curso = (select data_inscricao_curso from aluno where id_aluno = 4),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 4) where fk_idaluno = 4;
update aluno_curso
set
	Data_Inscrição_Curso = (select data_inscricao_curso from aluno where id_aluno = 5),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 5) where fk_idaluno = 5;
update aluno_curso
set
	Data_Inscrição_Curso = (select data_inscricao_curso from aluno where id_aluno = 6),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 6) where fk_idaluno = 6;
alter table aluno drop column Data_inscricao_curso;
alter table aluno drop column valor_curso;
--------------------------------------------------
	/* Default - Valores Padrão */
select * from aluno;
alter table aluno modify column Ativo_S_N char(1) default 'S';
select * from aluno_curso;
alter table aluno_curso modify column Data_Inscrição_curso date default current_timestamp;
----------------------------------------------------------------
	/* Primary Keys Simples e Compostas */
select * from aluno_curso;
desc aluno_curso;
alter table aluno_curso drop column id_Alunocurso; 
alter table aluno_curso add constraint pk_aluno_curso primary key (fk_idaluno, fk_idcurso, data_inscrição_curso);
-------------------------------------------
	/* Criando a tabela "projeto_funcionário"  inserindo registros iniciais */
create table projeto_funcionário (
	código_projeto int, matrícula_funcionário int, nome_projeto varchar(50) not null, nome_funcionário varchar(50) not null, função_funcionário varchar(50) not null, 
    telefone_funcionário varchar(20), data_criação_projeto datetime default current_timestamp, horas_estimadas int not null, horas_realizadas int);
    
alter table projeto_funcionário add constraint pk_projeto_funcionário primary key (código_projeto, matrícula_funcionário);

insert into projeto_funcionário 
	(código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas)
values
	(1, 100, 'Matrícula Online', 'Bianca', 'Analista de Atendimento', 200);
insert into projeto_funcionário 
	(código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas)
values
	(1, 110, 'Matrícula Online', 'Antônio', 'Estagiário de Atendimento', 500);
insert into projeto_funcionário 
	(código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas)
values
	(1, 120, 'Matrícula Online', 'Angela', 'Analista Programador Sênior', 300);
insert into projeto_funcionário 
	(código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas)
values
	(2, 130, 'Economia de Papel', 'Laura', 'Analista de Qualidade', 200);
insert into projeto_funcionário 
	(código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas)
values
	(3, 140, 'Notas Online', 'Carlão', 'Analista de Administrativo', 150);

select * from projeto_funcionário;
--------------------------------------------------------
	/* Analisando as anomalias de inserção, atualização e remoção de registros */
select * from projeto_funcionário;

	/* Anomalias de inserção (Redundância de dados, dados inconsistentes) */
    
insert into projeto_funcionário 
	(código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas)
values
	(2, 150, 'Economia de Papel', 'João', 'Analista Financeiro', 50);

	/* Anomalias de exclusão (Perda de registros importantes) */
    
delete from projeto_funcionário where código_projeto = 3 and matrícula_funcionário = '140';

	/* Anomalias na atualização de registros (Informações Inconsistentes) */
    
update projeto_funcionário set nome_projeto = 'Inscrição Online' where código_projeto = 1 and matrícula_funcionário = 110;
update projeto_funcionário set nome_projeto = 'Inscrição Online' where código_projeto = 1;

---------------------------------------------------------------------------------
	/* REGRAS DA 2FN */
--------------------------------------------------------------------------------
	/* 2FN - Testanto as dependências funcionais e corrigindo anomalias */
select * from projeto_funcionário;
desc projeto_funcionário;
	/* atributos/colunas chave: código_projeto, matrícula funcionário. */
	/* atributos/colunas não chave: nome_projeto, nome_funcionário, função_funcionário, telefone_funcionário, data_criação_projeto, horas_estimadas, horas_realizadas. */
---------------------------------------------------------------------------------
	/* Refactoring da tabela "projeto_funcionário" */
create table projeto
(idcódigo int auto_increment, constraint pk_projeto primary key (idcódigo),
data_criação datetime default current_timestamp,
nome varchar(50) not null);
desc projeto;

create table funcionário 
(idmatrícula int auto_increment, constraint pk_funcionário primary key (idmatrícula),
nome varchar(50) not null, função varchar(50) not null, telefone varchar(20));
desc funcionário; 
alter table funcionário drop column telefone;
alter table funcionário add column telefone varchar(20);
	/* drop table funcionário */

create table projeto_funcionário2
(fk_idcódigo int,
fk_idmatrícula int,
horas_estimadas int not null,
horas_realizadas int,
constraint pk_projeto_funcionário primary key (fk_idcódigo, fk_idmatrícula)
);
desc projeto_funcionário2;
select * from projeto_funcionário2;

alter table projeto_funcionário2 add constraint foreign key (fk_idcódigo) references projeto(idcódigo);
alter table projeto_funcionário2 add constraint foreign key (fk_idmatrícula) references funcionário(idmatrícula);

select * from funcionário; /* idmatrícula, nome, função, telefone */

select * from projeto_funcionário;
insert into projeto_funcionário (código_projeto, matrícula_funcionário, nome_projeto, nome_funcionário, função_funcionário, horas_estimadas) 
values (2, 100, 'Economia de Papel', 'Bianca', 'Analista de Atendimento', 150);

	/* Query para a migração dos dados dos funcionários */
    
insert into funcionário (idmatrícula, nome, função, telefone) 
select distinct matrícula_funcionário, nome_funcionário, função_funcionário, telefone_funcionário from projeto_funcionário;

	/* Query para a migração dos registros de projeto */

select * from projeto; /* idcódigo, data_criação, nome */
select * from projeto_funcionário; /* código_projeto, nome_projeto, data_criação_projeto */
select distinct código_projeto, nome_projeto, data_criação_projeto from projeto_funcionário;
select * from projeto_funcionário where código_projeto = 2 order by data_criação_projeto limit 1;
update projeto_funcionário set data_criação_projeto = '2022-06-04 19:02:00' where código_projeto = 2;

insert into projeto (idcódigo, data_criação, nome) select distinct código_projeto, data_criação_projeto, nome_projeto from projeto_funcionário;

select * from funcionário;
select * from projeto;
desc projeto;
select * from projeto_funcionário2; /* fk_idcódigo, fk_idmatrícula, horas_estimadas, horas_realizadas */
select * from projeto_funcionário; /* código_projeto, matrícula_funcionário, horas_estimadas, horas_realizadas */


insert into projeto_funcionário2 (fk_idcódigo, fk_idmatrícula, horas_estimadas, horas_realizadas)
select código_projeto, matrícula_funcionário, horas_estimadas, horas_realizadas from projeto_funcionário;

drop table projeto_funcionário;
rename table projeto_funcionário2 to projeto_funcionário;
select * from projeto_funcionário;