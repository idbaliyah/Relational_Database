	show databases;
	create database alta_online_shop;
	use alta_online_shop;

	-- create table users
	create table users (
		id int not null auto_increment primary key,
		name varchar(255) not null,
		address varchar(255) not null,
		status_user	enum('active','inactive'),
		gender enum('male','female','other'),
		created_at datetime default now(),
		updated_at datetime default now()
	);

	-- create table operators
	create table operators (
		id int not null auto_increment primary key,
		name varchar(255) not null,
		created_at datetime default now(),
		updated_at datetime default now()
	);

	-- create table product_type
	create table product_type (
		id int not null auto_increment primary key,
		name varchar(255) not null,
		created_at datetime default now(),
		updated_at datetime default now()
	);

	-- create table products
	create table products (
		id int not null auto_increment primary key,
		name varchar(255) not null,
		price int not null,
		product_type_id int not null,
		operators_id int not null,
		created_at datetime default now(),
		updated_at datetime default now(),
		foreign key (product_type_id) references product_type(id),
		foreign key (operators_id) references operators(id)
	);

	-- create table product_description
	create table product_description (
		id int not null auto_increment primary key,
		description mediumtext not null,
		products_id int not null,
		created_at datetime default now(),
		updated_at datetime default now(),
		foreign key (products_id) references products(id)
	);
alter table products_descripton add foreign key (operators_id) references operators(id);

	-- create table payment_method
	create table payment_method(
		id int not null auto_increment primary key,
		name enum('Virtual Account', 'Bank Transfer', 'E-Money') not null,
		created_at datetime default now(),
		updated_at datetime default now()
	);

	-- create table transaction
	create table transaction (
		id int not null auto_increment primary key,
		users_id int not null,
		payment_method_id int not null,
		status enum('PENDING', 'SUCCESS', 'FAILED'),
		created_at datetime default now(),
		updated_at datetime default now(),
		foreign key (users_id) references users(id),
		foreign key (payment_method_id) references payment_method(id)
	);

	-- create table transaction_detail
	create table transaction_detail (
		id int not null auto_increment primary key,
		products_id int not null,
		qty int not null,
		price int not null,
		transaction_id int not null,
		created_at datetime default now(),
		updated_at datetime default now(),
		foreign key (transaction_id) references transaction(id),
		foreign key (products_id) references products(id)
	);
    
	show tables;
	describe users;
	describe operators;
	describe product_type;
	describe products;
	describe product_description;
	describe payment_method;
	describe transaction;
	describe transaction_detail;

	-- 1.a insert 5 operator to table operators
	insert into operators (name) values 
	('Telkomsel'), 
	('Indosat'), 
	('Axis'), 
	('Three'), 
	('Smartfren');
	select * from operators;

	-- 1.b insert 3 operator_type
	insert into product_type (name) values ('Pulsa'), ('Kuota'), ('AddOn');
	select * from product_type;

	-- 1.c insert 2 product dengan product_type 1 operator id 3
	insert into products (name, price, product_type_id, operators_id) values
	('Pulsa 10k', 12000, 1, 3),
	('Pulsa 20k', 22000, 1, 3);
	select * from products;

	-- 1.d insert 3 product dengan product_type 2 operator id 1
	insert into products (name, price, product_type_id, operators_id) values
	('InternetMAX 35GB', 83000, 2, 1),
	('InternetMAX 51GB', 115000, 2, 1),
	('InternetMAX 70GB', 138000, 2, 1);
	select * from products;

	-- 1.e. insert 3 product dengan product_type 3 operator id 4
	insert into products (name, price, product_type_id, operators_id) values
	('AddOn 32GB', 75000, 3, 4),
	('AddOn 38GB', 85000, 3, 4),
	('AddOn 50GB', 135000, 3, 4);
	select * from products;

	-- 1.f insert products description on all product
	insert into product_description (description, products_id) values
	('Pulsa sebesar 10k dengan penambahan masa aktif',1),
	('Pulsa sebesar 20k dengan penambahan masa aktif',2),
	('Paket InternetMAX untuk akses internet dan kuota aplikasi sepuasnya di seluruh jaringan 2G/3G/4G/5G Telkomsel selama 30 Hari',3),
	('Paket InternetMAX untuk akses internet dan kuota aplikasi sepuasnya di seluruh jaringan 2G/3G/4G/5G Telkomsel selama 30 Hari',4),
	('Paket InternetMAX untuk akses internet dan kuota aplikasi sepuasnya di seluruh jaringan 2G/3G/4G/5G Telkomsel selama 30 Hari',5),
	('Penambahan kuota utama sebesar 32GB',6),
	('Penambahan kuota utama sebesar 38GB',7),
	('Penambahan kuota utama sebesar 50GB',8);
	select * from product_description;

	-- 1.g insert 3 payment_method
	insert into payment_method (name) values 
	('Virtual Account'), 
	('Bank Transfer'), 
	('E-Money');
	select * from payment_method;

	-- 1.h insert 5 user on table users
	insert into users (name, address, status_user, gender) values
	('Anton', 'Malang', 'active', 'male'),
	('Ani', 'Jakarta', 'active', 'female'),
	('Budi', 'Yogyakarta', 'active', 'male'),
	('Ica', 'Surabaya', 'active', 'female'),
	('Anisa', 'Malang', 'active', 'female');
	select * from users;

	-- 1.i insert 3 transactions
	insert into transaction (users_id, payment_method_id, status) values
	(1, 1, 'SUCCESS'),
	(1, 2, 'PENDING'),
	(1, 3, 'SUCCESS'),
	(2, 2, 'SUCCESS'),
	(2, 2, 'PENDING'),
	(2, 2, 'SUCCESS'),
	(3, 3, 'SUCCESS'),
	(3, 3, 'PENDING'),
	(3, 3, 'FAILED');
	select * from transaction;

	-- 1.j insert 3 transaction_detail
	insert into transaction_detail (products_id, qty, price, transaction_id) values
	(1, 1, 12000, 1),
	(2, 1, 22000, 2),
	(4, 2, 115000, 3),
	(6, 1, 75000, 4),
	(3, 1, 83000, 5),
	(4, 2, 115000, 6),
	(1, 1, 12000, 7),
	(2, 1, 22000, 8),
	(4, 2, 115000, 9);
select * from transaction_detail;

-- 2.a show user names by male gender
select name from users where gender = 'male';

-- 2.b show product id 3
select * from products where id=3;

-- 2.c show users data that created_at in the past 7 days and has a name containing the word 'a'
select * from users where name like '%a%' and created_at >= date_sub(now(),interval 7 day);

-- 2.d count of users with gender female
select count(*) from users where gender='female';

-- 2.e short users by ascending
select * from users order by name asc;

-- 2.f show 5 data transaction with product_id 3 
select * from transaction_detail where products_id=3 limit 5;

-- 3.a update data product id 1 with name product dummy
update products set name='product dummy' where id=1;

-- 3.b update qty 3 transaction detail product id 1
update transaction_detail set qty=3 where products_id=1;

-- 4.a delete data from tabel product with id 1
set FOREIGN_KEY_CHECKS = 0;
delete from products where id = 1;

-- 4.b delete data from tabel product with product type
set FOREIGN_KEY_CHECKS = 0;
delete from products where product_type_id = 1;

-- RELEASE_2 
-- 1. join transaction data user id 1 and user id 2
select * from transaction  join transaction_detail on 
transaction.id = transaction_detail.transaction_id
where transaction.users_id in (1, 2);

-- 2. show transaction price amount of user id 1
select SUM(transaction_detail.price * transaction_detail.qty) as total_transaction
from transaction join transaction_detail on transaction.id = transaction_detail.transaction_id
where transaction.users_id = 1;

-- 3. show transaction price amount of product type 2
select count(*) as total_transaction from transaction_detail td inner join 
products on td.products_id = products.id where products.product_type_id = 2;

-- 4 show all interconnected product table fields and product type table name fields.
select products.*, product_type.name as type from products left join 
product_type on products.product_type_id = product_type.id;

-- 5 show all transaction table fields, product table name fields and user table name fields.
select transaction.*, products.name as product_name , users.* from transaction left join
users on users.id = transaction.users_id left join transaction_detail on 
transaction_detail.transaction_id = transaction.id left join products on products.id = transaction_detail.transaction_id;

-- 8. show products data that never existed in the transaction_details table with sub-queries.
select transaction_detail.products_id as transaction_detail, products.* 
from transaction_detail right join products on transaction_detail.products_id = products.id 
where products.id in (select id from products where id !=2);