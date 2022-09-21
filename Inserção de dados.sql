use ecommerce;

show tables;
-- idclient, fname, Minit, Lname, CPF, Address
insert into Client (Fname,Minit, Lname, CPF)
		values('Maria', 'M', 'Silva', '89392893293'),
			  ('Joao', 'J', 'Josue', '15425635495'),
              ('Carlos', 'C', 'Carinha', '54789866632');
              
insert into product (Pname, classification_kids, category, avaliation, size) values
			  ('Fone', false,'Eletronico', '4',  null),
              ('Barbie', true, 'Brinquedo', '3', null),
              ('carters', true, 'Vestimenta', '5', null);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentcash) values
			  (1, default, 'compra via aplicativo', null),
              (2, default,'compra via aplicativo', 50),
              (3, 'confirmado', null, null);
              
insert into productOrder(idPOproduct, idPoorder, poQuantity, poStatus) values
			  (1,5,2,null),
              (2,5,1,null),
              (3,6,1,null);

insert into productStorage (storageLocation,wuantity) values
			  ('Rio de janeiro', 1000),
              ('Sao paulo', 2929),
              ('sao paulo',  98);
              
insert into storageLocation (idproduct, idLstorage, location) values
			  (1,'RJ'),
              (2,3,'SP');
              
insert into supplier (SocialName, CNPJ, contact) values
			  ('Almeira e filho', 9989289311, '2193829899'),
              ('Haiahia', 9289993899, '41888877773');
              
insert into productSupplier (idSupplier, idPsProduct, quantity) values
			  (1,1,500),
              (1,2,400);
              
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
			  ('tech eletronic', null, 55566655996, null, 'Rio de janeiro','1025545563'),
              ('botique eia', null, null, 52214563, 'Sao paulo', 5545555485);
              
insert into productSeller (idPseller, idPproduct, prodQuantity) values
			  (1,6,90),
              (2,7,10);
              
              
