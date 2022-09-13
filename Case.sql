create database case_fluxo;

use case_fluxo;

/* Lógico_1: */

CREATE TABLE cliente (
    id_cliente int auto_increment PRIMARY KEY,
    nome varchar(100),
    cpf varchar(14),
    cnpj varchar(18)


CREATE TABLE contas_receber (
    id_conta_receber int PRIMARY KEY auto_increment,
    valor float,
    data_entrada date,
    fk_id_cliente int
);

CREATE TABLE contas_pagar (
    id_conta_pagar int PRIMARY KEY auto_increment,
    valor float,
    data_saida date,
    fk_id_fornecedor int
);

CREATE TABLE forma_pagamento (
    id_parcelas int PRIMARY KEY auto_increment,
    tipo Enum('a vista', 'parcelado'),
    quantidade int,
    data_inicio date,
    dia_pagamento date,
    juros float default 0.01,
    fk_id_conta_receber int,
    fk_id_conta_pagar int
);

CREATE TABLE conta_bancaria (
    fk_id_conta_receber int,
    fk_id_conta_pagar int,
    saldo float,
    agencia varchar(50),
    conta varchar(50),
    banco varchar(50)
);

CREATE TABLE fornecedor (
    id_fornecedor int PRIMARY KEY auto_increment,
    nome varchar(100),
    cpf varchar(14),
    cnpj varchar(18)
);
 
ALTER TABLE contas_receber ADD CONSTRAINT fk_id_cliente
    FOREIGN KEY (fk_id_cliente)
    REFERENCES cliente(id_cliente);

ALTER TABLE contas_pagar ADD CONSTRAINT fk_id_fornecedor
    FOREIGN KEY (fk_id_fornecedor)
    REFERENCES fornecedor(id_fornecedor);

ALTER TABLE forma_pagamento ADD CONSTRAINT fk_id_conta_receber
    FOREIGN KEY (fk_id_conta_receber)
    REFERENCES contas_receber(id_conta_receber);
    
ALTER TABLE forma_pagamento ADD CONSTRAINT fk_id_conta_pagar
    FOREIGN KEY (fk_id_conta_pagar)
    REFERENCES contas_pagar(id_conta_pagar);
 
ALTER TABLE conta_bancaria ADD CONSTRAINT fk_id_conta_receber_banco
    FOREIGN KEY (fk_id_conta_receber)
    REFERENCES  contas_receber(id_conta_receber);
    
ALTER TABLE conta_bancaria ADD CONSTRAINT fk_id_conta_pagar_banco
    FOREIGN KEY (fk_id_conta_pagar)
    REFERENCES  contas_pagar(id_conta_pagar);
    
    
    insert into cliente(nome, cpf) values('claudio','111111111-11');
    
    select * from cliente;
    
    insert into contas_receber(valor, data_entrada, fk_id_cliente) values(350.50, '2022-06-07', 1);
    
    select * from cliente join contas_receber;
    
    insert into forma_pagamento(tipo, quantidade, data_inicio, dia_pagamento, fk_id_conta_receber) values('parcelado', 6, '2022-03-15', '2022-05-24', '1');
    
    select * from contas_pagar;
    
    insert into contas_pagar (valor, data_saida, fk_id_fornecedor) values(630.70, '2022-02-03', 1);
    
    select * from fornecedor;
    
    insert into fornecedor (nome, cnpj) values('Fornecedor 1', '1111111111');
    
    insert into conta_bancaria(agencia, conta,banco, saldo, fk_id_conta_receber, fk_id_conta_pagar) 
			values('001', '302', 'itau', 1500.50, 1, 1);
            
select * from conta_bancaria join contas_pagar;
select * from contas_receber;

------------------------------------

select * from conta_bancaria;
insert into conta_bancaria (fk_id_conta_receber, fk_id_conta_pagar, saldo, agencia, conta, banco) values (1, null, 400, 213-3, 2, 'Bradesco');
insert into conta_bancaria (fk_id_conta_receber, saldo, agencia, conta, banco) values (1, 400, 213-3, 4, 'Bradesco');
insert into conta_bancaria (fk_id_conta_pagar, saldo, agencia, conta, banco) values (1,500, 123-2, 2, 'banco');
select * from forma_pagamento;
desc forma_pagamento;
update forma_pagamento set fk_id_conta_pagar = 2 where id_parcelas = '3';

insert into forma_pagamento (tipo, quantidade, data_inicio, dia_pagamento, juros)
	values ('a vista', '1', '2022-05-12', '2022-06-07', null);
desc conta_bancaria;
insert into conta_bancaria (fk_id_conta_pagar, saldo, agencia, conta, banco) values (2, 500, 123-2, 2, 'banco'); /* Não tá indo pois o fk_id_conta_pagar não existe */
desc forma_pagamento;
insert into forma_pagamento (tipo, quantidade, data_inicio, dia_pagamento, juros, fk_id_conta_receber, fk_id_conta_pagar)
	values ('a vista', 1, '2022-05-04', '2022-05-04', 0, 1, null);
insert into forma_pagamento (tipo, quantidade, data_inicio, dia_pagamento, juros, fk_id_conta_receber, fk_id_conta_pagar)
	values ('a vista', 1, '2022-05-04', '2022-05-04', 0, null, 1);
desc conta_bancaria; desc forma_pagamento;
select * from contas_pagar;
desc contas_pagar;
select * from fornecedor;
desc fornecedor;
insert into fornecedor (nome, cpf, cnpj) values ('Mateus', '333.444.555-55', null);
insert into contas_pagar (valor, data_saida, fk_id_fornecedor) values (200, '2022-04-03', 1);
insert into forma_pagamento (tipo, quantidade, data_inicio, dia_pagamento, juros, fk_id_conta_receber, fk_id_conta_pagar)
	values ('a vista', 1, '2022-05-04', '2022-05-04', 0, null, 1);
    select * from forma_pagamento;
insert into forma_pagamento (tipo, quantidade, data_inicio, dia_pagamento, juros, fk_id_conta_receber, fk_id_conta_pagar)
	values ('a vista', 1, '2022-05-04', '2022-05-04', 0, null, 3);
select * from conta_bancaria;
insert into conta_bancaria (fk_id_conta_receber, fk_id_conta_pagar, saldo, agencia, conta, banco) values (null, 3, 300, 143-2, 4, 'Itaú');
-------------------------------------------------------
drop table conta_bancaria;
select * from conta_bancaria;
select * from fornecedor;
select * from cliente;
select * from contas_receber;
select * from contas_pagar;
update contas_pagar set id_conta_pagar = '3' where valor = 200;
desc contas_pagar;
select * from contas_receber;

select * from conta_bancaria;
alter table conta_bancaria add valor float after fk_id_conta_pagar;
	insert into conta_bancaria (fk_id_conta_receber, fk_id_conta_pagar, valor, saldo, agencia, conta, banco) values (1, null, 300, 0, '143-5', '3', 'Itaú');
	insert into conta_bancaria (fk_id_conta_receber, fk_id_conta_pagar, valor, saldo, agencia, conta, banco) values (null, 3, 500, 0, '143-5', '3', 'Itaú');
	insert into conta_bancaria (fk_id_conta_receber, fk_id_conta_pagar, valor, saldo, agencia, conta, banco) values (1, null, 700, 0, '143-3', '3', 'Itaú');
	insert into conta_bancaria (fk_id_conta_receber, fk_id_conta_pagar, valor, saldo, agencia, conta, banco) values (null, 3, 1200, 0, '143-6', '3', 'Itaú');

create procedure saldo_final (in fk_id_conta_receber int, in fk_id_conta_pagar int, in valor float, in saldo float, out saldo_final float)
	comment 'O Saldo final do dia é de: '
	begin
    
    
    create table parcelas(
        id_num_parcelas int primary key auto_increment,
        vlr float
    );
    delimiter $$
    create procedure proc_calculo_parcelas()
comment 'Exemplo de uso do while'
begin

    declare contador int default 1;
    declare valor_parcela float;
    declare valor_receber float;
    /*declare valor_pagar float;*/
    declare soma_receber int;


    set valor_receber = (select valor from contas_receber where id_conta_receber = 1);
    /*set valor_pagar = (select valor from contas_pagar where id_conta_pagar= 1);*/
    set  = (select quantidade from forma_pagamento where id_parcelas =1);

    set soma_receber = sum(vlr);

    while contador <= numero_parcelas do

    insert into parcelas(vlr) values(soma_receber);

    /*logica de parada do loop*/
    set contador = contador + 1;

end while;

end
$$
delimiter ;

select * from parcelas;


select sum(valor) from contas_receber;
    
    
drop procedure proc_calculo_parcelas;
   drop table parcelas;

drop database case_fluxo;

----------------------------------------------------------

create database case_caixa;

use case_caixa;

CREATE TABLE cliente (
    id_cliente int auto_increment PRIMARY KEY,
    nome varchar(100),
    cpf varchar(14),
    cnpj varchar(18)
);

CREATE TABLE pagamento (
    id_pagamento int PRIMARY KEY auto_increment,
    tipo Enum('a vista', 'parcelado'),
    data_inicio date,
    dia_pagamento date,
    fk_id_conta int
);

CREATE TABLE fornecedor (
    id_fornecedor int PRIMARY KEY auto_increment,
    nome varchar(100),
    cpf varchar(14),
    cnpj varchar(18)
);

CREATE TABLE conta_bancaria (
    id_conta_bancaria int PRIMARY KEY auto_increment,
    agencia varchar(50),
    conta varchar(30),
    banco varchar(50),
    saldo float,
    fk_id_conta int
);

CREATE TABLE conta (
    id_conta int PRIMARY KEY auto_increment,
    tipo Enum('receber','pagar'),
    valor float,
    data_conta date,
    fk_id_cliente int,
    fk_id_fornecedor int
);

CREATE TABLE atraso (
    id_atraso int PRIMARY KEY auto_increment,
    juros float,
    valor_atraso float,
    data_atraso date,
    multa float,
    fk_id_pagamento int
);

CREATE TABLE parcela (
    id_parcela int PRIMARY KEY auto_increment,
    valor_parcela float,
    quantidade int,
    fk_id_pagamento int
);

ALTER TABLE conta ADD CONSTRAINT fk_conta_cliente
    FOREIGN KEY (fk_id_cliente)
    REFERENCES cliente(id_cliente);
    
alter table conta add constraint fk_conta_fornecedor
	foreign key (fk_id_fornecedor)
    references fornecedor(id_fornecedor);

ALTER TABLE pagamento ADD CONSTRAINT fk_pagamento_conta
    FOREIGN KEY (fk_id_conta)
    REFERENCES conta(id_conta);
 
ALTER TABLE conta_bancaria ADD CONSTRAINT fk_conta_bancaria_conta
    FOREIGN KEY (fk_id_conta)
    REFERENCES conta(id_conta);
 
ALTER TABLE atraso ADD CONSTRAINT fk_atraso_pagamento
    FOREIGN KEY (fk_id_pagamento)
    REFERENCES  pagamento(id_pagamento);
 
ALTER TABLE parcela ADD CONSTRAINT fk_parcela_pagamento
    FOREIGN KEY (fk_id_pagamento)
    REFERENCES pagamento(id_pagamento);


select * from atraso, cliente, conta, conta_bancaria, fornecedor, pagamento, parcela;
desc parcela;

delimiter $$
create procedure proc_calculo_parcelas()
comment 'Exemplo de uso do while'
begin

    declare contador int default 1;
    declare valor_parcela float;
    declare valor_receber float;
    declare valor_pagar float;
    declare numero_parcelas int;


    set valor_receber = (select valor_parcela from parcela where id_parcela = 1);
	set valor_pagar = (select valor from conta where id_conta = 1);
    set numero_parcelas = (select quantidade from pagamento where id_parcela =1);

    set valor_parcela = ((valor_receber/numero_parcelas) + (valor_pagar/numero_parcelas));

    while contador <= numero_parcelas do

    insert into parcelas(vlr) values(valor_parcela);

    /*logica de parada do loop*/
    set contador = contador + 1;

end while;

end
$$
delimiter ;
drop procedure proc_calculo_parcelas;
call proc_calculo_parcelas();
show procedure status where Db = case_caixa;

desc pagamento;
create table parcelas(
        id_num_parcelas int primary key auto_increment,
        vlr float
    );

Function calculaAtraso();
    Dim diasAtraso, mesesAtraso

    diasAtraso = DateDiff("d", DataParcela, DataPagamento)
    mesesAtraso = DateDiff("m", DataParcela, DataPagamento)

    JurosDiario = ((ValorParcela * 2) / 100) * diasAtraso
    MesJurosMensal = ((ValorParcela * 2) / 100) * mesesAtraso
End Function;