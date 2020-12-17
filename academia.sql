create database academia;
use academia;

create table cliente(
    rg varchar(30) not null,
    nome varchar(30) not null,
    telefone varchar(30) not null,
    telefone2 varchar(30) ,
    estado varchar(30),
    cep varchar(30) not null, 
    bairro varchar(30) not null,
    cidade varchar(30) not null,
    rua varchar(30) not null,
    numero_casa varchar(30)not null,
    primary key (rg)
) default charset = utf8;

create table forma_pagamento(
	id_forma int auto_increment,
    forma varchar(30) not null,
    parcela int not null,
	primary key(id_forma)
    
) default charset = utf8;

create table contrato(
	id_contrato int auto_increment,
    id_forma int,
    rg varchar(30) not null,
    valor_total int not null,
    data_de_inicio date not null,
    data_de_termino date not null,
    primary key (id_contrato),
    foreign key (id_forma) references forma_pagamento(id_forma),
    foreign key (rg) references cliente(rg)
) default charset = utf8;

create table frequenta_frequentou_aula(
	rg varchar(30),
    id_contrato int ,
	foreign key (rg) references cliente(rg),
    foreign key (id_contrato) references contrato(id_contrato)
    
    
) default charset = utf8;

create table qualificacao(
	id_qualificacao int auto_increment,
    nome varchar(30),
    primary key (id_qualificacao)
) default charset = utf8;

create table professor(
	rg varchar(30) not null,
    id_qualificacao int not null,
    n_carteira_trabalho int not null,
    telefone varchar(30) not null,
    telefone2 varchar(30) ,
    estado varchar(30) not null,
    cep varchar(30) not null, 
    bairro varchar(30) not null,
    cidade varchar(30) not null,
    numero_casa varchar(30)not null,
    rua varchar(30) not null,
    salario double not null,
    nome varchar(30),
    
    primary key(rg),
    foreign key (id_qualificacao) references qualificacao(id_qualificacao)
) default charset = utf8;

create table modalidade_esportiva(
	id_modalidade int auto_increment,
    nome varchar(30) not null,
    aulas_previstas int ,
    primary key(id_modalidade)
    
) default charset = utf8;



create table apto_para_monitorar(
	rg varchar(30) not null,
    id_modalidade int not null,
    foreign key (rg) references professor(rg),
    foreign key (id_modalidade) references modalidade_esportiva(id_modalidade)
) default charset = utf8;



create table aula(
	id_aula int auto_increment,
    id_modalidade int not null,
    rg varchar(30) not null,
    inicio_aula time not null,
    duracao time not null,
    sala int not null,
    data_aula date not null,
    primary key(id_aula),
    foreign key (id_modalidade) references modalidade_esportiva(id_modalidade),
    foreign key(rg) references professor(rg)
    
) default charset = utf8;


