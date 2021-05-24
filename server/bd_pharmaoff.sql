create database if not exists db_PharmaOff;
use db_PharmaOff;

#TABLETION
create table tb_pessoa(
id_pessoa int primary key auto_increment,
nme_pessoa varchar (10) default null,
email_pessoa varchar (50) not null,
pwd_pessoa varchar (500) not null
);

Create table tb_estabelecimento (
id_estabelecimento int primary key auto_increment,  
nme_estabelecimento varchar (100) default null,
rating_estabelecimento double not NULL,
endereço_estabelecimento varchar(50) not null,
img_estabelecimento varchar(500) default null,
sts_estabelecimento boolean not null    
);

CREATE TABLE ta_produto (
id_produto int primary key auto_increment,
nme_produto varchar(40) DEFAULT NULL,
preco_produto double not null,
preco_desconto_produto int,
desc_produto varchar(400) DEFAULT NULL,
img_produto varchar(40) DEFAULT NULL,
cod_estabelecimento int not null,
CONSTRAINT EstabelecimentoProduto FOREIGN KEY (cod_estabelecimento) REFERENCES tb_estabelecimento (id_estabelecimento)
);


create table ta_cupom(
id_cupom int primary key auto_increment,
nome_cupom  varchar(40) not null,
percent_cupom double not null,
dta_validade_cupom timestamp,
sts_ativo_cupom boolean,
cod_produto int,
cod_estabelecimento int not null,
constraint EstabelecimentoCupom foreign key (cod_estabelecimento) references tb_estabelecimento (id_estabelecimento),
constraint ProdutoCupom foreign key (cod_produto) references ta_produto (id_produto)
);


create table tb_listaDesejos(
id_listaDesejos int primary key auto_increment,
cod_pessoa int not null,    
CONSTRAINT ListaDesejosLista FOREIGN KEY (cod_pessoa) REFERENCES tb_pessoa (id_pessoa)	
);


create table ta_listaDesejos_produtos(
id_listaDesejos_produtos int primary key auto_increment,
cod_listadesejos int not null,
cod_produto int not null,    
CONSTRAINT listDesejos_produtos FOREIGN KEY (cod_produto) REFERENCES ta_produto (id_produto),	
CONSTRAINT ProdutoListaDesejos FOREIGN KEY (cod_listadesejos) REFERENCES tb_listaDesejos (id_listadesejos)	
);