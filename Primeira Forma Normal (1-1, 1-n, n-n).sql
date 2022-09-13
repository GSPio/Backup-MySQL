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
