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
	/* Trabalhando com fun????es de data */
select curdate();
select now(); 
select date_format(curdate(), '%d/%m/%y') as data_atual;
select date_format(curdate(), '%Y/%M/%D') as data_atual;
select extract(day from curdate());
select date_add(now(), interval 20 year) as daqui_a_20_anos; /* second, minute, hour, day, month, year */
select date_add('1999-09-23 12:45:56', interval 30 minute);
select (datediff(curdate(), '1997-08-02')/365) as idade_aprox;
select period_diff('200001', '199501'); /* formato AnoM??s, retorna em M??s */
select dayofyear(curdate());
----------------------------------------------------------------
	/* Calculando a idade com base na data atual e data de nascimento */
	/* timestamp (marca temporal) in??cio ?? patir da meia-noite de 01/01/1970 (In??cio do calend??rio Linux) */
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
	/* Refactoring da data de inscri????o no curso e valor pago */
select * from aluno;
select * from aluno_curso;
alter table aluno_curso add Data_Inscri????o_Curso date;
alter table aluno_curso add Valor_Curso float(10,2);
	/* Cadastrar os dados manualmente demora muito, criar uma Query de update com uma subquery para recuperar os dados da tabela aluno automaticamente */
update aluno_curso
set
	Data_Inscri????o_Curso = (select data_inscricao_curso from aluno where id_aluno = 1),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 1) where fk_idaluno = 1;
update aluno_curso
set
	Data_Inscri????o_Curso = (select data_inscricao_curso from aluno where id_aluno = 2),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 2) where fk_idaluno = 2;
    update aluno_curso
set
	Data_Inscri????o_Curso = (select data_inscricao_curso from aluno where id_aluno = 3),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 3) where fk_idaluno = 3;
update aluno_curso
set
	Data_Inscri????o_Curso = (select data_inscricao_curso from aluno where id_aluno = 4),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 4) where fk_idaluno = 4;
update aluno_curso
set
	Data_Inscri????o_Curso = (select data_inscricao_curso from aluno where id_aluno = 5),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 5) where fk_idaluno = 5;
update aluno_curso
set
	Data_Inscri????o_Curso = (select data_inscricao_curso from aluno where id_aluno = 6),
    Valor_Curso = (select valor_curso from aluno where id_aluno = 6) where fk_idaluno = 6;
alter table aluno drop column Data_inscricao_curso;
alter table aluno drop column valor_curso;
--------------------------------------------------
	/* Default - Valores Padr??o */
select * from aluno;
alter table aluno modify column Ativo_S_N char(1) default 'S';
select * from aluno_curso;
alter table aluno_curso modify column Data_Inscri????o_curso date default current_timestamp;
----------------------------------------------------------------
	/* Primary Keys Simples e Compostas */
select * from aluno_curso;
desc aluno_curso;
alter table aluno_curso drop column id_Alunocurso; 
alter table aluno_curso add constraint pk_aluno_curso primary key (fk_idaluno, fk_idcurso, data_inscri????o_curso);
-------------------------------------------
	/* Criando a tabela "projeto_funcion??rio"  inserindo registros iniciais */
create table projeto_funcion??rio (
	c??digo_projeto int, matr??cula_funcion??rio int, nome_projeto varchar(50) not null, nome_funcion??rio varchar(50) not null, fun????o_funcion??rio varchar(50) not null, 
    telefone_funcion??rio varchar(20), data_cria????o_projeto datetime default current_timestamp, horas_estimadas int not null, horas_realizadas int);
    
alter table projeto_funcion??rio add constraint pk_projeto_funcion??rio primary key (c??digo_projeto, matr??cula_funcion??rio);

insert into projeto_funcion??rio 
	(c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas)
values
	(1, 100, 'Matr??cula Online', 'Bianca', 'Analista de Atendimento', 200);
insert into projeto_funcion??rio 
	(c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas)
values
	(1, 110, 'Matr??cula Online', 'Ant??nio', 'Estagi??rio de Atendimento', 500);
insert into projeto_funcion??rio 
	(c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas)
values
	(1, 120, 'Matr??cula Online', 'Angela', 'Analista Programador S??nior', 300);
insert into projeto_funcion??rio 
	(c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas)
values
	(2, 130, 'Economia de Papel', 'Laura', 'Analista de Qualidade', 200);
insert into projeto_funcion??rio 
	(c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas)
values
	(3, 140, 'Notas Online', 'Carl??o', 'Analista de Administrativo', 150);

select * from projeto_funcion??rio;
--------------------------------------------------------
	/* Analisando as anomalias de inser????o, atualiza????o e remo????o de registros */
select * from projeto_funcion??rio;

	/* Anomalias de inser????o (Redund??ncia de dados, dados inconsistentes) */
    
insert into projeto_funcion??rio 
	(c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas)
values
	(2, 150, 'Economia de Papel', 'Jo??o', 'Analista Financeiro', 50);

	/* Anomalias de exclus??o (Perda de registros importantes) */
    
delete from projeto_funcion??rio where c??digo_projeto = 3 and matr??cula_funcion??rio = '140';

	/* Anomalias na atualiza????o de registros (Informa????es Inconsistentes) */
    
update projeto_funcion??rio set nome_projeto = 'Inscri????o Online' where c??digo_projeto = 1 and matr??cula_funcion??rio = 110;
update projeto_funcion??rio set nome_projeto = 'Inscri????o Online' where c??digo_projeto = 1;

---------------------------------------------------------------------------------
	/* REGRAS DA 2FN */
--------------------------------------------------------------------------------
	/* 2FN - Testanto as depend??ncias funcionais e corrigindo anomalias */
select * from projeto_funcion??rio;
desc projeto_funcion??rio;
	/* atributos/colunas chave: c??digo_projeto, matr??cula funcion??rio. */
	/* atributos/colunas n??o chave: nome_projeto, nome_funcion??rio, fun????o_funcion??rio, telefone_funcion??rio, data_cria????o_projeto, horas_estimadas, horas_realizadas. */
---------------------------------------------------------------------------------
	/* Refactoring da tabela "projeto_funcion??rio" */
create table projeto
(idc??digo int auto_increment, constraint pk_projeto primary key (idc??digo),
data_cria????o datetime default current_timestamp,
nome varchar(50) not null);
desc projeto;

create table funcion??rio 
(idmatr??cula int auto_increment, constraint pk_funcion??rio primary key (idmatr??cula),
nome varchar(50) not null, fun????o varchar(50) not null, telefone varchar(20));
desc funcion??rio; 
alter table funcion??rio drop column telefone;
alter table funcion??rio add column telefone varchar(20);
	/* drop table funcion??rio */

create table projeto_funcion??rio2
(fk_idc??digo int,
fk_idmatr??cula int,
horas_estimadas int not null,
horas_realizadas int,
constraint pk_projeto_funcion??rio primary key (fk_idc??digo, fk_idmatr??cula)
);
desc projeto_funcion??rio2;
select * from projeto_funcion??rio2;

alter table projeto_funcion??rio2 add constraint foreign key (fk_idc??digo) references projeto(idc??digo);
alter table projeto_funcion??rio2 add constraint foreign key (fk_idmatr??cula) references funcion??rio(idmatr??cula);

select * from funcion??rio; /* idmatr??cula, nome, fun????o, telefone */

select * from projeto_funcion??rio;
insert into projeto_funcion??rio (c??digo_projeto, matr??cula_funcion??rio, nome_projeto, nome_funcion??rio, fun????o_funcion??rio, horas_estimadas) 
values (2, 100, 'Economia de Papel', 'Bianca', 'Analista de Atendimento', 150);

	/* Query para a migra????o dos dados dos funcion??rios */
    
insert into funcion??rio (idmatr??cula, nome, fun????o, telefone) 
select distinct matr??cula_funcion??rio, nome_funcion??rio, fun????o_funcion??rio, telefone_funcion??rio from projeto_funcion??rio;

	/* Query para a migra????o dos registros de projeto */

select * from projeto; /* idc??digo, data_cria????o, nome */
select * from projeto_funcion??rio; /* c??digo_projeto, nome_projeto, data_cria????o_projeto */
select distinct c??digo_projeto, nome_projeto, data_cria????o_projeto from projeto_funcion??rio;
select * from projeto_funcion??rio where c??digo_projeto = 2 order by data_cria????o_projeto limit 1;
update projeto_funcion??rio set data_cria????o_projeto = '2022-06-04 19:02:00' where c??digo_projeto = 2;

insert into projeto (idc??digo, data_cria????o, nome) select distinct c??digo_projeto, data_cria????o_projeto, nome_projeto from projeto_funcion??rio;

select * from funcion??rio;
select * from projeto;
desc projeto;
select * from projeto_funcion??rio2; /* fk_idc??digo, fk_idmatr??cula, horas_estimadas, horas_realizadas */
select * from projeto_funcion??rio; /* c??digo_projeto, matr??cula_funcion??rio, horas_estimadas, horas_realizadas */


insert into projeto_funcion??rio2 (fk_idc??digo, fk_idmatr??cula, horas_estimadas, horas_realizadas)
select c??digo_projeto, matr??cula_funcion??rio, horas_estimadas, horas_realizadas from projeto_funcion??rio;

drop table projeto_funcion??rio;
rename table projeto_funcion??rio2 to projeto_funcion??rio;
select * from projeto_funcion??rio;