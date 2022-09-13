	/* Terceira Forma Normal */

use universidade_u;
create table disciplina (
iddisciplina int auto_increment, 
descrição varchar(50) not null, carga_horária int, código_professor int, nome_professor varchar(50), email_professor varchar(100),
fk_idcurso int,
constraint pk_iddisciplina primary key (iddisciplina));
alter table disciplina add constraint fk_curso_disciplina foreign key (fk_idcurso) references curso (id_curso);
desc disciplina;
desc curso;
--------------------------------------------------------------------
	/* Analisando as anomalias de inserção, atualização e remoção de registros */
select * from disciplina;
select * from curso;

insert into disciplina (descrição, carga_horária, código_professor, nome_professor, email_professor, fk_idcurso)
values ('Introdução a Programação', '30', '74', 'Jorge', 'jorge@teste.com', 1);
insert into disciplina (descrição, carga_horária, código_professor, nome_professor, email_professor, fk_idcurso)
values ('Programação Avançada', '45', '43', 'Daniela', 'daniela@teste.com', 1);
insert into disciplina (descrição, carga_horária, código_professor, nome_professor, email_professor, fk_idcurso)
values ('Modelagem SQL', '50', '72', 'Marcia', 'marcia@teste.com', 1);
	insert into disciplina (descrição, carga_horária, código_professor, nome_professor, email_professor, fk_idcurso)
	values ('Programação - Módulo Intermediário', '30', '74', 'Jorge', 'jorge@teste.com', 1);
update disciplina set email_professor = 'jorge2@teste.com' where iddisciplina = 4;

--------------------------------------------------------------
	/* 2FN - Testamos a dependência funcional total (campos não chave -> pk compostas)
	   3FN - Testamos a dependência transitiva (campos não chave -> campos não chave) */

	/* Refactoring da tabela 'disciplina' */
use universidade_u;

create table professor (idprofessor int auto_increment, nome_professor varchar(50) not null, email_professor varchar(50),
constraint pk_professor primary key (idprofessor));
desc professor;
select * from professor;
update disciplina set email_professor = 'jorge@teste.com' where código_professor = 74;
select código_professor, nome_professor, email_professor from disciplina;
	insert into professor (idprofessor, nome_professor, email_professor)
	select distinct código_professor, nome_professor, email_professor from disciplina;
select * from disciplina;
alter table disciplina drop column nome_professor;
alter table disciplina drop column email_professor;

alter table disciplina rename column código_professor to fk_idprofessor;
alter table disciplina add constraint fk_disciplina_professor foreign key (fk_idprofessor) references professor(idprofessor);
desc disciplina;

------------------------------------------------------
	/* Criação do Dicionário de Dados */
show tables;
show create table aluno;

CREATE TABLE `aluno` (
   `Nome` varchar(50) DEFAULT NULL,
   `Sexo` char(1) DEFAULT NULL,
   `idade` varchar(3) DEFAULT NULL,
   `cpf` varchar(14) DEFAULT NULL,
   `email` varchar(50) DEFAULT NULL,
   `telefone` varchar(20) DEFAULT NULL,
   `Ativo_S_N` char(1) DEFAULT 'S',
   `ID_Aluno` int NOT NULL AUTO_INCREMENT,
   `data_nascimento` date DEFAULT NULL,
   PRIMARY KEY (`ID_Aluno`),
   UNIQUE KEY `cpf` (`cpf`),
   UNIQUE KEY `email` (`email`),
   UNIQUE KEY `telefone` (`telefone`)
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
 
------------------------------------------------------
	/* Relacionamentos Unário, Binário, Ternário, etc... */

select * from funcionário;
alter table funcionário add column fk_idmatrícula_supervisor int;
alter table funcionário add constraint fk_funcionário_supervisor foreign key (fk_idmatrícula_supervisor) references funcionário (idmatrícula);
desc funcionário;
update funcionário set fk_idmatrícula_supervisor = 100 where idmatrícula = 110;

---------------------------------------------------
	/* Zerando os registros de uma tabela com a função Truncate */
select * from gasto;
-- delete para remover todos os registros
-- drop table / create table para recriar a tabela do 0
-- truncate table (mais indicada) tem a mesma função do delete, mas também reseta o auto_increment 
-----------------------------------------------------
	/* Ajustando o valor do auto_increment */
-- alter table telefone auto_increment = x -- Funciona como um select max +1 --
------------------------------------------------------
	/* Modificando a ordem de uma coluna na tabela */
select * from aluno;
desc aluno;
show create table aluno;

CREATE TABLE `aluno` (
   `Nome` varchar(50) DEFAULT NULL,
   `Sexo` char(1) DEFAULT NULL,
   `idade` varchar(3) DEFAULT NULL,
   `cpf` varchar(14) DEFAULT NULL,
   `email` varchar(50) DEFAULT NULL,
   `telefone` varchar(20) DEFAULT NULL,
   `Ativo_S_N` char(1) DEFAULT 'S',
   `ID_Aluno` int NOT NULL AUTO_INCREMENT,
   `data_nascimento` date DEFAULT NULL,
   PRIMARY KEY (`ID_Aluno`),
   UNIQUE KEY `cpf` (`cpf`),
   UNIQUE KEY `email` (`email`),
   UNIQUE KEY `telefone` (`telefone`)
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- alter table aluno modify >ddl_coluna< first; --
alter table aluno modify  `ID_Aluno` int NOT NULL AUTO_INCREMENT first;
alter table aluno modify `Ativo_S_N` char(1) DEFAULT 'S' after data_nascimento;
----------------------------------------------------------------
	/* Populando tabelas com massas de dados de testes com generatedata.com */
select * from professor;
desc professor;
