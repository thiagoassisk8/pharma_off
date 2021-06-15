create database if not exists db_PharmaOff;
use db_PharmaOff;

#TABLETION
create table tb_usuario(
id_usuario SERIAL primary key not null,
nme_usuario varchar (50) ,
email_usuario varchar (80) not null,
pwd_usuario varchar (500) not null,
pwd_changed bigint  default null
);

create table tb_formulario(
	id_formulario serial primary key references tb_usuario(id_usuario),
	nme_formulario varchar (50),
	cel_formulario text,
	email_formulario varchar (100),
	msg_formulario varchar (500)
)



create table categoria(
	id_categoria serial primary key,
	categoria_produto varchar(100) not null,
		
);

Create table tb_estabelecimento (
id_estabelecimento SERIAL primary key not null,  
nme_estabelecimento varchar (100),
rating_estabelecimento double precision ,
endereço_estabelecimento varchar(50) ,
img_estabelecimento varchar(500) ,
sts_estabelecimento boolean
);


create table tb_estabelecimentoParceiro(
	id_estabelecimentoParceiro serial primary key REFERENCES tb_estabelecimento(id_estabelecimento),
	isparceiro boolean
);



create table ta_produto(
	id_produto serial primary key,
	nme_produto varchar(100) not null,
	preco_produto decimal(10,2) not null,
	preco_novoproduto decimal(10,2),
	desc_produto varchar(400) ,
	img_produto varchar(500) ,
	isfavourite bool,
	ispopular bool,
	cod_categoria integer not null references categoria(id_categoria),
	cod_estabelecimento integer not null references tb_estabelecimento(id_estabelecimento),
	onSale bool
);



create table ta_cupom(
id_cupom SERIAL primary key not null,
nme_cupom  varchar(40) ,
percent_cupom double precision ,
dta_validade_cupom timestamp,
sts_ativo_cupom boolean,
cod_produto int references ta_produto (id_produto),
cod_estabelecimento int references tb_estabelecimento (id_estabelecimento)
);

-- Lista de desejos das usuarios, cada usuario tem sua lista. 


-- Lista de desejos dos produtos, que estão linkados com as usuarios da outra lista.
create table ta_listaDesejos_produtos(
id_listaDesejos_produtos SERIAL primary key not null,
cod_usuario int  not null REFERENCES tb_usuario (id_usuario),
cod_produto int   not null REFERENCES ta_produto (id_produto),
qtd_produto integer ,
unique (cod_usuario,cod_produto)
);


CREATE TABLE senhatokenreset (
  id_token SERIAL  REFERENCES tb_usuario (id_usuario),
  nme_token TEXT ,
  expira_token BIGINT 
);
