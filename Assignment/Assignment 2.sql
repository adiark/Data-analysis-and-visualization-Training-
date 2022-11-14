create database main;
use main;
create table customer(id_customer int(11) not null, first_name varchar(45), last_name varchar(45), 
email varchar(45), password varchar(45), created_at datetime,
updated_at datetime, primary key(id_customer));
create table subscription(id_subscription int(11) not null, status varchar(45), 
created_at datetime , updated_at datetime, primary key(id_subscription),
 id_customer int(11), id_product int(11),
foreign key(id_product) references product(id_product), 
foreign key(id_customer) references customer(id_customer));
 


create table product_family(id_product_family int(11) not null, product_family_handle varchar(45) unique, primary key(id_product_family)); 

create table product(id_product int(11) not null , product_sku varchar(45) unique, 
number_of_recipes tinyint(1), number_of_meals tinyint(1), id_product_family int(11),primary key(id_product), 
foreign key(id_product_family) references product_family(id_product_family));

create table orders(id_order int(11) not null, order_number varchar(45), delivery_date date, 
purchase_price decimal(8,2), created_at datetime, updated_at datetime, 
id_product int(11), id_subscription int(11), 
foreign key(id_product) references product(id_product), 
foreign key(id_subscription) references subscription(id_subscription), primary key(id_order));

/*q1*/

select product.product_sku from subscription
left join product on subscription.id_product = product.id_product
left join customer on subscription.id_customer = customer.id_customer
where customer.email= 'cgerreltsf@census.gov' and subscription.status = 'active';

/*q2*/
select concat(first_name, " ", last_name) as Customer_Name from customer 
inner join subscription on customer.id_customer= subscription.id_customer
inner join product on subscription.id_product = product.id_product
inner join product_family on product.id_product_family= product_family.id_product_family
where product_family.product_family_handle='pfh_1' and subscription.status = 'active';

/*q3*/

select avg(x) from (
select count(subscription.id_subscription) as x from subscription  
inner join customer on subscription.id_customer = customer.id_customer
group by customer.id_customer) as s;

/*q4*/
select count(id_customer) as count from(
select customer.id_customer from subscription 
inner join orders on subscription.id_subscription= orders.id_subscription
inner join customer on subscription.id_customer= customer.id_customer 
group by customer.id_customer 
having count(orders.id_product)>1) as s;

/*q5*/
select count(id) from(
select distinct(id_customer) as id from(
select customer.id_customer from customer 
inner join subscription on customer.id_customer= subscription.id_customer 
inner join orders on subscription.id_subscription= orders.id_subscription
group by orders.id_subscription  
having count(orders.id_product)>1 and count(orders.id_subscription)>1) as s) as id;


select * from orders;