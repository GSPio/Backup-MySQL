use universidade_u;

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Guilherme Soares Pio', '24', 'M', 'Rua Silvado, 13. São Paulo, SP', '95952-5166', '1997-08-02', '3000.00', 'S'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Fernando', '24', 'M', 'Rua 1. São Paulo, SP', '11111-11111', '1997-04-05', '2700.00', 'N'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Douglas', '37', 'M', 'Rua 3. São Paulo, SP', '22222-2222', '1994-09-04', '3100.00', 'S'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Giulia', '26', 'F', 'Rua 4. São Paulo, SP', '33333-3333', '1998-03-04', '1900.00', 'N'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Marcela', '32', 'F', 'Rua 5. São Paulo, SP', '44444-4444', '1997-08-02', '2500.00', 'S'
);

select nome, idade, endereco, data_inscricao_curso, valor_curso from aluno where valor_curso > 2500.00 and idade > 30;

select * from aluno where sexo = 'F' and ativo_s_n = 'S';

select * from aluno where valor_curso like '2%';

select *from aluno order by nome asc, idade desc;

update aluno set nome = 'Mauro' where nome = 'Guilherme Soares Pio4';

select * from aluno;

delete from aluno;

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Guilherme Soares Pio', '24', 'M', 'Rua Silvado, 13. São Paulo, SP', '95952-5166', '1997-08-02', '3000.00', 'S'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Fernando', '24', 'M', 'Rua 1. São Paulo, SP', '11111-11111', '1997-04-05', '2700.00', 'N'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Douglas', '37', 'M', 'Rua 3. São Paulo, SP', '22222-2222', '1994-09-04', '3100.00', 'S'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Giulia', '26', 'F', 'Rua 4. São Paulo, SP', '33333-3333', '1998-03-04', '1900.00', 'N'
);

insert into aluno(
Nome, Idade, Sexo, Endereco, Telefone, Data_inscricao_curso, Valor_curso, Ativo_S_N)
values(
'Marcela', '32', 'F', 'Rua 5. São Paulo, SP', '44444-4444', '1997-08-02', '2500.00', 'S'
);

select * from aluno;