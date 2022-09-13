use universidade_u;
select * from aluno;
desc aluno;
alter table aluno modify column cpf varchar(14);
alter table aluno modify column cpf varchar (14) after endereco;
alter table aluno drop column email;
alter table aluno add email varchar(50) after cpf;
----------------------------------
update aluno set cpf = '123.123.123-12' where nome = 'Guilherme';
update aluno set cpf = '111.111.111-11' where nome = 'Fernando';
update aluno set cpf = '222.222.222-22' where nome = 'Douglas';
update aluno set cpf = '333.333.333-33' where nome = 'Giulia';
update aluno set cpf = '444.444.444-44' where nome = 'Marcela';
---------------------------------------
alter table aluno drop cpf;
alter table aluno add column cpf varchar(14);
alter table aluno modify cpf varchar(14) after endereco;
alter table aluno add ID_Aluno int primary key auto_increment;
---------------------------------
alter table aluno add logradouro varchar(50);
alter table aluno add numero varchar(10);
alter table aluno add complemento varchar(50);
alter table aluno add bairro varchar(50);
alter table aluno add cidade varchar(50);
alter table aluno add estado char(2);

update
	aluno
set
	logradouro = '5',
    numero = '500',
    complemento = '5A',
    bairro = 'Lauzane',
    cidade = 'São Paulo',
    estado = 'SP'
where
	ID_Aluno = 5;
alter table aluno drop endereco;
select * from aluno;
desc aluno;
-------------------------------------------------------
create table telefone(
	ID_Telefone int auto_increment primary key,
    numero varchar(20),
    tipo char(3)
);
select * from telefone;
insert into telefone (numero, tipo) values ('11111-1111', 'cel');
insert into telefone (numero, tipo) values ('22222-2222', 'cel');
insert into telefone (numero, tipo) values ('33333-3333', 'res');
insert into telefone (numero, tipo) values ('44444-4444', 'com');
insert into telefone (numero, tipo) values ('95952-5166', 'cel');
-----------------------------------------------------
select id_aluno, nome from aluno;
select * from telefone;
desc telefone;

alter table telefone add column fk_idaluno int;
alter table telefone add constraint fk_aluno_telefone foreign key(fk_idaluno) references aluno(id_aluno);
--------------------------------------------------------
use universidade_u;
select * from aluno;

CREATE TABLE Endereço (
    ID_Endereço int auto_increment PRIMARY KEY,
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    estado char(2),
    FK_IDaluno int
);
 

ALTER TABLE Endereço ADD CONSTRAINT FK_aluno_endereço
FOREIGN KEY (FK_IDaluno)
REFERENCES ALUNO (ID_Aluno);

insert into endereço (logradouro, numero, complemento, bairro, cidade, estado, fk_idaluno)
select logradouro, numero, complemento, bairro, cidade, estado, id_aluno from aluno;

alter table aluno drop column logradouro;
alter table aluno drop column numero;
alter table aluno drop column complemento;
alter table aluno drop column bairro;
alter table aluno drop column cidade;
alter table aluno drop column estado;

select * from endereço;
select * from endereço where fk_idaluno = 3;
------------------------------------------
use universidade_u;
CREATE TABLE Curso (
    ID_Curso int auto_increment PRIMARY KEY,
    Descrição varchar(50)
);
select * from curso;
insert into curso (descrição) values('Curso de Programação');
insert into curso (descrição) values('Curso de Engenharia');
insert into curso (descrição) values('Curso de Direito');
insert into curso (descrição) values('Curso de Administração');
--------------------------------------------------------
use universidade_u;
CREATE TABLE Aluno_Curso (
    ID_Alunocurso int auto_increment PRIMARY KEY,
    FK_IDAluno int,
    FK_IDCurso int
);
select * from curso;
select * from aluno_curso;
desc aluno_curso;
alter table aluno_curso add constraint fk_aluno_curso foreign key (fk_idaluno) references aluno(id_aluno);
alter table aluno_curso add constraint fk_curso_aluno foreign key (fk_idcurso) references curso(id_curso);
-----------------------------------------------------------------
use universidade_u;
select * from aluno;
select * from curso;
insert into aluno_curso (fk_idaluno, fk_idcurso) values (1, 3);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (1, 4);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (2, 1);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (2, 3);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (3, 1);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (3, 4);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (4, 2);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (5, 4);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (5, 2);
select * from aluno_curso;
------------------------------------------------------------
select * from telefone;
alter table telefone drop column tipo;
alter table telefone add tipo enum('res', 'com', 'cel');
update telefone set fk_idaluno = '1' where id_telefone =1;
update telefone set fk_idaluno = '2' where id_telefone =2;
update telefone set fk_idaluno = '3' where id_telefone =3;
update telefone set fk_idaluno = '4' where id_telefone =4;
update telefone set fk_idaluno = '5' where id_telefone =5;
update telefone set tipo = 'res' where id_telefone = 1;
update telefone set tipo = 'com' where id_telefone = 2;
update telefone set tipo = 'cel' where id_telefone = 3;
update telefone set tipo = 'cel' where id_telefone = 4;
update telefone set tipo = 'res' where id_telefone = 5;
------------------------------------------------------------
select * from telefone;
alter table telefone modify column numero varchar(20) not null;
alter table telefone modify column fk_idaluno int not null;
alter table telefone modify column tipo enum('res', 'com', 'cel') not null;
alter table endereço modify column logradouro varchar(100) not null;
alter table endereço modify column numero varchar(10) not null;
alter table endereço modify column bairro varchar(50) not null;
alter table endereço modify column cidade varchar(50) not null;
alter table endereço modify column estado char(2) not null;
desc endereço;
select * from endereço;
---------------------------------------------------------------
select * from aluno;
alter table aluno modify column cpf varchar(14) unique;
alter table aluno modify column email varchar(50) unique;
alter table aluno modify column telefone varchar(20) unique;
desc aluno;
insert into aluno (nome, idade, sexo, cpf, email, telefone, data_inscricao_curso, valor_curso, ativo_s_n)
	values('Rosana', '30', 'F', '111.111.111-11', 'rosana@teste.com', '11111-1111', '1997-04-05', 2700, 'N');
----------------------------------------------------------------------------
alter table endereço add constraint uc_endereço_fkidaluno unique (fk_IDaluno);
desc endereço;
select * from endereço;
-------------------------------------------------------------------------------
select * from aluno;
select count(*) from aluno;
select max(valor_curso) from aluno;
select avg(valor_curso) from aluno;
select sum(valor_curso) from aluno;
select sum(valor_curso) from aluno where idade < '26';
---------------------------------------------------------------------
select max(valor_curso) as maior_valor from aluno;
----------------------------------------------------
select 69.420;
select 69.420 as valor;
select ceil(69.420) as valor1;
select floor(69.420) as valor2;
select truncate(69.420, 2) as valor3;
select round(69.420) as valor4;
----------------------------------------------------
select * from aluno;
select sexo, avg(idade) as media_idade_sexo from aluno group by sexo;
---------------------------------------------------
use universidade_u;
select estado, count(*) as total from endereço group by estado order by estado asc;

---------------------------------------------------

use universidade_u;
select * from aluno;
update aluno set cpf = '626.557.788-39', email = 'fernando@teste.com', telefone = '98706-1277',
 data_inscricao_curso = '2020-01-01' where id_aluno = '1';
 update aluno set cpf = '999.714.008-71', email = 'guilherme@teste.com', telefone = '93629-8472',
 data_inscricao_curso = '2021-06-01' where id_aluno = '2';
 update aluno set cpf = '739.472.038-90', email = 'douglas@teste.com', telefone = '96326-9374',
 data_inscricao_curso = '2020-01-01' where id_aluno = '3';
 update aluno set cpf = '739.263.079-47', email = 'Giulia@teste.com', telefone = '9336-0807',
 data_inscricao_curso = '2021-06-01' where id_aluno = '4';
 update aluno set cpf = '445.464.091-37', email = 'Marcela@teste.com', telefone = '96574-3482',
 data_inscricao_curso = '2021-06-01' where id_aluno = '5';
 insert into aluno (nome, idade, sexo, cpf, email, telefone, data_inscricao_curso, valor_curso, ativo_s_n, id_aluno)
	values('Rosana', '26', 'F', '638.928.990-54', 'Rosana@teste.com', '90563-5534', '2021-01-01', 2700, 'N', '6');
select * from endereço;
update endereço set logradouro = 'Rua 1', numero = '47', complemento = null where fk_idaluno = '1';
update endereço set logradouro = 'Rua 2', numero = '121', complemento = '12' where fk_idaluno = '2';
update endereço set logradouro = 'Rua 3', numero = '780', complemento = null where fk_idaluno = '3';
update endereço set logradouro = 'Rua 4', numero = '673', complemento = '74' where fk_idaluno = '4';
update endereço set logradouro = 'Rua 5', numero = '1034', complemento = null where fk_idaluno = '5';
insert into endereço (ID_endereço, logradouro, numero, complemento, bairro, cidade, estado, fk_idaluno) 
values ('6', 'Rua 6', '770', null,  'Consolação', 'São Paulo', 'SP', '6');
select * from curso;
select * from telefone;
insert into telefone (ID_Telefone, numero, fk_idaluno, tipo) 
values ('6', '90567-4356', '6', 'cel');
update telefone set numero = '98706-1277' where fk_idaluno = '1';
update telefone set numero = '93629-8472' where fk_idaluno = '2';
update telefone set numero = '96326-9374' where fk_idaluno = '3';
update telefone set numero = '9336-0807' where fk_idaluno = '4';
update telefone set numero = '96574-3482' where fk_idaluno = '5';
update telefone set numero = '90563-5534' where fk_idaluno = '6';
delete from aluno_curso where id_alunocurso = '7';
delete from aluno_curso where id_alunocurso = '8';
delete from aluno_curso where id_alunocurso = '9';
select * from aluno_curso;
insert into aluno_curso (fk_idaluno, fk_idcurso) values (4, 2);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (5, 4);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (5, 2);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (6, 1);
insert into aluno_curso (fk_idaluno, fk_idcurso) values (6, 4);



