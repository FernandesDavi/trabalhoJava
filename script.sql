DELIMITER //
create database db_sistema;
use db_sistema;

create table Pessoa(
idPessoa int primary key auto_increment,
nome varchar(50),
cpf_cnpj varchar(14),
email varchar(100),
telefone varchar(14)
);

create table Loja(
idLoja int primary key auto_increment,
nome varchar(60) not null,
telefone varchar(60) not null,
email varchar(60) not null
);

create table pessoaLoja(
idPessoaLoja int primary key auto_increment,
idPessoa int,
idLoja int,
foreign key (idPessoa) references Pessoa(idPessoa),
foreign key (idLoja) references Loja(idLoja)
);

create table Cliente(
idCliente int primary key auto_increment,
fiador varchar(60) not null,
contatofiador varchar(14) not null
);

create table Usuario(
idUsuario int primary key auto_increment,
login varchar(60) not null,
senha varchar(60) not null,
idPessoa int,
foreign key (idPessoa) references  Pessoa(idPessoa)
);

create table Funcionario(
idFuncionario int primary key auto_increment,
nrocarteira varchar(20) not null,
salario double not null,
funcao varchar(20) not null,
idPessoa int,
foreign key (idPessoa) references Pessoa(idPessoa)
);

create table Fornecedor(
idFornecedor int primary key auto_increment,
cnpj varchar(20) not null,
ins_estadual varchar(11) not null,
idPessoa int,
foreign key (idPessoa) references Pessoa(idPessoa)

);

create table Produto(
idProduto int primary key auto_increment,
descricao varchar(60) not null,
marca varchar(60) not null,
valor varchar(60) not null,
unidadeMedida varchar(60) not null
);

create table Venda(
idVenda int primary key auto_increment,
valorTotal double not null,
dataVenda date not null,
idCliente int,
idFuncionario int,
foreign key (idCliente) references  Cliente(idCliente),
foreign key (idFuncionario) references  Funcionario(idFuncionario)

);

create table Compra(
idCompra int primary key auto_increment,
valorTotal double not null,
dataCompra date not null,
idFuncionario int,
idFornecedor int,
foreign key (idFuncionario) references  Funcionario(idFuncionario),
foreign key (idFornecedor) references  Fornecedor(idFornecedor)
);

create table itemCompra(
idItemCompra int primary key auto_increment,
idCompra int,
idProduto int,
foreign key (idProduto) references  Produto(idProduto),
foreign key (idCompra) references  Compra(idCompra),
quantidade double not null
);

create table itemVenda(
idItemVenda int primary key auto_increment,
idVenda int,
idProduto int,
foreign key (idVenda) references  Venda(idVenda),
foreign key (idProduto) references Produto(idProduto),
quantidade double not null
);
//
DELIMITER ;