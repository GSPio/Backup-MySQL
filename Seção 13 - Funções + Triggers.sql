					/* Funções */
/*CREATE FUNCTION <func_nome>(<parâmetros>) RETURNS <dados a serem retornados>
begin
 [...]
end
-> Select <func_nome>(<parâmetros>) from <func_nome>(<parâmetros>);
Determinística: Não modificam dados, "função segura"
Não Determinística: Modifica dados, update/delete/insert
*/

use universidade_y;

delimiter $$
create function func_idade(data_nascimento date)
returns int
deterministic
comment 'Função que retorna a idade dos alunos com base na sua data de nascimento'
begin
	return timestampdiff (year, data_nascimento, curdate());
end
$$
delimiter ;
show function status where Db = 'universidade_y';
drop function func_idade;
select nome, data_nascimento from aluno;
select func_idade(data_nascimento) from aluno;

select * from gasto;

delimiter $$
create function func_saldo (saldo float)
returns float
deterministic
comment 'Função que retorna o saldo líquido'
begin
	return ((select saldo from gasto where idgasto='1')-(select saldo from gasto where idgasto='2'));
end
$$
delimiter ;
drop function func_saldo;
select * from gasto;
select func_saldo(saldo) from gasto;

---------------------------------------------
		/* Função não determinística */

	set global log_bin_trust_function_creators = 1; 
    /* Permite o usuário criar funções não determinísticas */

delimiter $$
create function func_qtde_disciplinas(p_idcurso int)
returns int
comment 'Serve para retornar a quantidade de disciplinas com base em um curso'
begin
	declare qtde_disciplinas int default 0;
	set qtde_disciplinas = (select count(*) as qtde_disciplinas from disciplina where fk_idcurso = p_idcurso);
	return qtde_disciplinas;
end
$$
delimiter ;

select * from disciplina;
select fk_idcurso, count(*) as qtde_disciplinas from disciplina group by fk_idcurso;
select func_qtde_disciplinas(3) as qtde_disciplinas;

select idcurso, descricao, func_qtde_disciplinas(idcurso) as qtde_disciplinas from curso;

delimiter $$
create function func_saldo_nd (saldo float)
returns float
comment 'Função que retorna o saldo líquido - Não Deterministica'
begin
	return ((select saldo from gasto where idgasto = '1') - (select saldo from gasto where idgasto = '2'));
end
$$
delimiter ;
drop function func_saldo_nd;
select * from gasto;
select func_saldo(saldo) from gasto;

--------------------------------------------------
					/* Triggers */

		/* Before Insert */
	
use universidade_y;

create table funcionario_log(
	idfuncionario_log int auto_increment,
    fk_idmatricula int,
    data_log datetime default current_timestamp,
    tipo_log char(2) not null,
    funcao_antiga varchar(50),
    funcao_nova varchar(50),
    telefone_antigo varchar(20),
    telefone_novo varchar(20),
    constraint pk_idfuncionario_log primary key(idfuncionario_log),
    constraint fk_funcionario_funcionario_log foreign key(fk_idmatricula) references funcionario(idmatricula)
);

select * from funcionario;
select * from funcionario_log;

delimiter $$
create trigger tr_before_insert_funcionario
before insert on funcionario
for each row
begin
	insert into funcionario_log(
		fk_idmatricula, tipo_log, funcao_antiga, funcao_nova,
		telefone_antigo, telefone_novo)
	values(null, 'BI', null, new.funcao, null, new.telefone);
end $$
delimiter ;

-- Checagem de dados - Alocação de dados da tabela new --		
insert into funcionario(nome, funcao, telefone) 
values('Alana', 'Assistente Administrativo', '11 99999-0000');
insert into funcionario(nome, funcao, telefone) 
values('Marcos', 'Supervisor', '11 99999-2222');
----------------------------------------------------------------
			/* Consultado, alterando e removendo Triggers */
show triggers; -- Mostra as triggers presentes no banco --
-- Instrução para recuperar as triggers existentes, e seus respectivos blocos de criação --
show create trigger universidade_y.tr_before_insert_funcionario; 
/*  CREATE TRIGGER `tr_before_insert_funcionario` 
    BEFORE INSERT ON `funcionario` 
    FOR EACH ROW 
    begin
 	insert into funcionario_log(
 		fk_idmatricula, tipo_log, funcao_antiga, funcao_nova,
 		telefone_antigo, telefone_novo)
 	values(null, 'BI', null, new.funcao, null, new.telefone);
	end */
    
    drop trigger universidade_y.tr_before_insert_funcionario;
    
delimiter $$
create trigger tr_before_insert_funcionario
before insert on funcionario
for each row
begin
	insert into funcionario_log(
		fk_idmatricula, tipo_log, funcao_antiga, funcao_nova,
		telefone_antigo, telefone_novo)
	values(null, 'BI', null, new.funcao, null, new.telefone);
end $$
delimiter ;
-------------------------------------------------------
		/* Trigger After Insert */

delimiter $$
create trigger tr_after_insert_funcionario
after insert on funcionario
for each row
begin
	insert into funcionario_log(
		fk_idmatricula, tipo_log, funcao_antiga, funcao_nova,
		telefone_antigo, telefone_novo)
	values(new.idmatricula, 'AI', null, new.funcao, null, new.telefone);
end $$
delimiter ;

insert into funcionario(nome, funcao, telefone) 
values('Elton', 'Auxiliar Contabil', '11 99999-4444');
select * from funcionario;
select * from funcionario_log;