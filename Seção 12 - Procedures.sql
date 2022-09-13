					/* Procedures */

use universidade_y;
/*
delimiter $$
create procedure <nome_procedure> (<parâmetros>)
begin
	select preço from produto;
    instruções 1;
    instruções 2;
    instruções 3;
    lógica do procedimento;
end$$
delimiter ; 

call <nome_procedure> (<parâmetros>) */

delimiter $$
create procedure proc_oi()
begin
	select 'O Procedimento armazenado no banco de dados foi recuperado com sucesso!' as mensagem;
end
$$
delimiter ;

call proc_oi();
-----------------------------------
	/* Consultando, alterando e removendo procedures */
show procedure status where Db = 'universidade_y'; /* Retorna todas as procedures no sistema, ou em um banco de dados específico */
show create procedure proc_oi; /* Retorna todas as procedures criadas dentro de um certo banco de dados */
drop procedure universidade_y.proc_oi;
	delimiter $$
    create procedure proc_oi()
	begin
		select 'A Procedure foi alterada com sucesso!' as mensagem;
	end$$
    delimiter ;		/* De modo a modificar uma procedure envolvendo alteração no corpo da mesma, ela tem que ser dropada e criada novamente com a modificação desejada */
    call proc_oi;
-------------------------------------------------------
	/* Definindo Parâmetros de Entrada */
delimiter $$
create procedure proc_média_ponderada 
(
in nome varchar(50),
in p1 float(3,1),
in p2 float(3,1),
in p3 float(3,1),
in p4 float(3,1)
)
comment 'Efetua o cálculo de uma média ponderada: M=(((p1*2)+(p2*2)+(p3*3)+(p4*3))/(2+2+3+3))'
begin
select nome, round( (((p1*2)+(p2*2)+(p3*3)+(p4*3))/(2+2+3+3)), 2) as 'média_ponderada';
end$$
delimiter ;
/* drop procedure universidade_y.proc_média_ponderada; */
show procedure status where Db = 'universidade_y';
call proc_média_ponderada ('Jorge', 8, 7, 5, 9);
call proc_média_ponderada ('Mateus', 8, 8, 4, 7);
call proc_média_ponderada ('Angela', 8.5, 7.3, 4.2, 9.7);
-----------------------------------------------------------
	/* Alterando os pesos das notas no procedure */
delimiter $$
create procedure proc_média_ponderada_pesos
(
in nome varchar(50),
in p1 float(3,1),
in p2 float(3,1),
in p3 float(3,1),
in p4 float(3,1),
in w1 int,
in w2 int,
in w3 int,
in w4 int
)
comment 'Efetua o cálculo de uma média ponderada com pesos variáveis: M=(((p1*w1)+(p2*w2)+(p3*w3)+(p4*w4))/(w1+w2+w3+w4))'
begin
select nome, round( (((p1*w1)+(p2*w2)+(p3*w3)+(p4*w4))/(w1+w2+w3+w4)), 2) as 'média_ponderada';
end$$
delimiter ;
show procedure status where Db = 'universidade.y';
call proc_média_ponderada_pesos ('Jorge', 8, 7, 5, 9, 1, 1, 4, 4);
call proc_média_ponderada_pesos ('Wellington', 10, 7, 6.75, 8.25, 2, 3, 2, 3);
----------------------------------------------------------------
	/* Definindo os Parâmetros de Saída - Consultando o total de alunos e de professores */
delimiter $$
create procedure proc_resumo(out total_professores int, out total_alunos int)
comment 'Resumo do total de alunos e professores'
begin
	select count(*) into total_professores from professor;
    select count(*) into total_alunos from aluno;
end$$
delimiter ;

show procedure status where Db = 'universidade_y';
call proc_resumo (@x, @y);
select @x as professores, @y as alunos; /* Define a saída de @x como o total de professores, e @y como o total de alunos */
	/* No caso, @x e @y se comportam como variáveis a serem chamadas posteriormente conforme a necessidade. Variáveis (e Escopos) são o próximo tópico de estudo */
-----------------------------------------------------------------
					/* Variáveis e Escopos */
	
	/* Declarando variáveis do escopo da sessão */

set @x = 10; select @x;
set @y = 15; select @y;
set @nome = 'Jorge'; select @nome as nome;
set @resultado = @x + @y; select @resultado as 'soma x + y';