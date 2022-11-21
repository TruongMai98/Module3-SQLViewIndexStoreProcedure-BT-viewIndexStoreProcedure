create database demo;

create table products(
	id int primary key,
    productCode int,
    productName varchar(50),
    productAmount float,
    productDescription varchar(50),
    productStatus boolean
);
alter table products
add productPrice float;


create unique index index_productCode 
on products(productCode);

explain select productname 
from `products` 
where productName like '%';

create index composite_index 
on products(productname, productprice);

create view view_product 
as
select 
	productCode, 
    productName, 
    productPrice, 
    productStatus
from `products`;

select * from view_product;

create or replace view view_product 
as
select 
	productCode, 
    productName, 
    productPrice, 
    productStatus
from `products`
where productCode = 6;

drop view view_product;

delimiter //
create procedure findAllInformation()
begin 
select * from `products`;
end //

create procedure test()
begin 
select * from `products`;
end //
delimiter ;

call findAllInformation();

drop procedure findAllInformation;

delimiter //
create procedure addNewProduct(
	idnew int, 
    productCodenew int, 
    productNamenew varchar(50),
    productAmoutnew float,
    productDescriptionnew varchar(50),
    productStatusnew boolean,
    productPricenew float)
begin 
insert into `products`
values (
	idnew,
    productCodenew, 
    productNamenew,
    productAmoutnew,
    productDescriptionnew,
    productStatusnew,
    productPricenew
    );
end //
delimiter ;

call addNewProduct(11, 11, 'cai ghe', 121212, 'khong co gi', 1, 213213);

select * from `products`;

delimiter //
create procedure updateProduct(
	idupdate int, 
    productCodenew int, 
    productNamenew varchar(50),
    productAmoutnew float,
    productDescriptionnew varchar(50),
    productStatusnew boolean,
    productPricenew float)
begin 
update `products`
set 
	id = idupdate,
    productCode = productCodenew, 
	productName = productNamenew,
    productAmount = productAmoutnew,
    productDescription = productDescriptionnew,
    productStatus =  productStatusnew,
    productPrice =  productPricenew
where 
	id = idupdate;
end //
delimiter ;
drop procedure updateProduct;
call updateProduct(11, 11, 'cai ghe', 121212, 'update', 1, 213213);

delimiter //
create procedure deleteProduct(idnew int)
begin 
delete from `products`
where id = idnew;
end //
delimiter ;
drop procedure deleteProduct;
call deleteProduct(11);