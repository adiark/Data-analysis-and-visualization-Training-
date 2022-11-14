create database sales_details;
use sales_details;
create table seller(seller_id int unique not null, seller_name varchar(50) , seller_location varchar(50),
seller_comm float, primary key (seller_id));
insert into seller(seller_id,seller_name,seller_location,seller_comm) values(1,	"Jimmy"	,"New Delhi","0.11"),
(2,	"Nathan",	"Patiala",	"0.12"),
(5	,"Peter"	,"Ludhiana",	"0.16"),
(6	,"Maclagan"	,"Patiala","0.15"),
(3,	"Larry",""	,	"0.18"),
(7,	"Pamera"	,"Ranchi",	"0.19");

create table shopper(shopper_id int unique not null, shopper_name varchar(50), shopper_location varchar(50), shopper_value int, primary key(shopper_id));
insert into shopper(shopper_id, shopper_name, shopper_location, shopper_value)values 
(1002,	"Newton",	"New Delhi",	300),
(1005	,"Graham",	"Kashmir",	400),
(1001,	"Brendon","Ludhiana",0),
(1004,	"Farhaan",	"Patiala",	500),
(1007,	"Bradman",	"New Delhi",	400),
(1009,	"George",	"Bareily",	300),
(1008,	"Julie",	"Ludhiana",	500),
(1003,	"Jaspinder",	"Meerut",	400);
drop table orders;
create table orders(orders_id int unique not null, orders_amount float, orders_date date, shopper_id int  not null, seller_id int  not null,
primary key(orders_id),
foreign key (shopper_id)
references shopper(shopper_id) ,
foreign key (seller_id)
references seller(seller_id) );

insert into orders(orders_id, orders_amount, orders_date , shopper_id, seller_id)values
(201, "250.36",	'2017-10-15',	1005,	2),
(209,	"470.65",	'2017-12-19',	1001	,5),
(202,	"265.98",	"2017-7-5",	1002,	1),
(204,	"310.45"	,"2017-2-27",	1009,	3),
(207,	"1148.51",	"2017-9-1"	,1005,	2),
(205,"260"	,"2017-1-22",	1007,	1),
(208,	"6780","2017-3-15",	"1002",	1),
(210,	"150.27",	"2017-5-10",	"1004",	6),
(203,	"6400.98",	"2017-6-13",	"1009",	3),
(212,	"500.73",	"2017-8-2",	1008,	2),
(211,	"8005.6",	"2012-11-25",	1003,	7),
(213,	"740",	"2012-4-18",	1002,	1);

/*q1*/
select seller_name, shopper_name, seller_location as location from seller, shopper where seller_location=shopper_location; 

/*q2*/
select seller.seller_name , shopper.shopper_name , orders.orders_amount
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
where orders.orders_amount between 1000 and 7000;

/*q3*/
select distinct seller.seller_name , shopper.shopper_name 
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id);

/*q4*/
select distinct seller.seller_name , shopper.shopper_name 
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
where seller.seller_comm >=0.15 and seller.seller_comm < 0.18;

/*q5*/
select distinct seller.seller_name , shopper.shopper_name 
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
where seller.seller_comm >=0.159;

/*q6*/
select seller.*, shopper.*, orders.orders_id, orders.orders_amount, orders.orders_date
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
order by seller.seller_id ;

/*q7*/
select seller.*, shopper.*, orders.orders_id, orders.orders_amount, orders.orders_date
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
order by shopper.shopper_id ;

/*q8*/
select distinct seller.* , shopper.* 
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
where orders.orders_amount >1000 and month( orders.orders_date)>'3';

/*q9*/
select distinct seller.* , shopper.* 
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
order by (shopper.shopper_name);

/*q10*/
select distinct seller.* , shopper.* 
from ((orders
inner join seller on seller.seller_id = orders.seller_id)
inner join shopper on shopper.shopper_id= orders.shopper_id)
where shopper.shopper_value>400;




select * from orders;