-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce
create database if not exists ecommerce;
use ecommerce;

-- criar tabela cliente
create table client(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(45),
    CPF char(11) not null,
    Address varchar(60),
    constraint unique_cpf_client unique(CPF)
					);
alter table client auto_increment=1;

-- criar tabela produto
-- size dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool,
    category enum('Eletronico', 'vestimenta', 'brinquedo', 'alimento', 'moveis') not null,
    avaliation float default 0,
    size varchar(20)
					);

-- criar tabela pedido
create table orders (
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references client(idClient)
		on update cascade
					);
desc orders;

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
	location varchar(255),
    quantity int default 0
					);
                    
-- criar tabela fornecedor
create table supplier(
	idsupplier int auto_increment primary key,
	socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier_CNPJ unique (CNPJ)
					);
                    
desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int primary key,
	socialName varchar(255) not null,
    Abstractname varchar(255),
    location varchar(40),
    CNPJ char(15),
    CPF char(11),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
					);
-- criar tabela produtos/vendedor
create table productSeller(
	idPseller int,
    idPproduct int,
    Prodquantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
					);
-- criar tabela produto/pedido
create table producOrder(
	idPOproduct int,
    idPOorder int,
    POquantity int default 1,
    PoStatus enum('Disponivel', 'Sem estoque') default 'disponivel',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
					);
-- criar tabela local estoque
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_seller foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_product foreign key (idLstorage) references productStorage(idProdStorage)
					);
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
					);
                    
show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';
                    
