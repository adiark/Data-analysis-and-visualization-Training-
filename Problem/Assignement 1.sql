create database Employee_details; /*1. creating database*/
use Employee_details;		/* getting into databse*/
create table employee_jobs (ejob_id int , ejob_title varchar(50), 
min_salary int check(min_salary>5000), 
max_salary int check(max_salary<40000)); /*2. creating table*/
create table countries (c_id int unique, c_name varchar(50), primary key(c_id)); /*3. creating table */
create table employees( emp_id int unique, fname varchar(50), lname varchar(50), email_id varchar(50),mobile bigint, 
hdate date , j_id int , salary int , commission int, 
m_id int not null , dept_id int not null , primary key(emp_id),
foreign key(dept_id)
references employee_dept( dept_id) /*4. Creating table*/
);
create table employee_dept ( dept_id int not null , dept_name varchar(50) not null,
 m_id int not null default '9999', c_id int not null, primary key(dept_id),
 foreign key(c_id)
 references countries(c_id) /*5. creating table */
 );
 insert into employee_jobs(ejob_id,ejob_title,min_salary,max_salary)values(1,"K",6000,30000); 
 insert into employee_jobs(ejob_id,ejob_title,min_salary,max_salary)values(2,"K",6000,30000);
 insert into employee_jobs(ejob_id,ejob_title,min_salary,max_salary)values(3,"K",6000,35000);
 insert into countries(c_id,c_name)values(1, "Ind");		/*7. entring in countries*/
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(1,"a",22,1);	/*7. c_id present in country*/
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(1,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,10000,5000,22,1);

 insert into countries(c_id,c_name)values(2, "Ind");
 insert into countries(c_id,c_name)values(3, "NZ");
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(10,"a",22,2); /*6. entering department ids in the table*/
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(20,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(30,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(50,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(90,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(110,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(40,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(60,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(150,"a",22,2);
 insert into employee_dept(dept_id,dept_name,m_id,c_id)values(200,"a",22,2);
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(2,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,10000,5000,22,10);  /*6. entering the data in employees table*/
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(3,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,10000,5000,22,1);
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(4,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,10000,5000,342,10);
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(5,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,10000,5000,22,10);
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(6,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,9000,500,22,1);
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(8,"xyz","abc","xyz@gmail.com",9999999999,'2019-1-1',1,5000,50,22,110);
/*8. upadate email*/

set SQL_SAFE_UPDATES=0;
update employees set email_id="not available" where salary <10000 and commission <.2*salary;
/*8 finished*/

/*9 salary update*/
update employees set salary= (case
    when dept_id=110 then  1.15*salary
    when dept_id=150 then  1.25*salary
    when dept_id=200 then  1.22*salary
    end)
where salary <6500;
/*9. finished*/

/*10 start*/
alter table employees drop hdate; 
/*10 finished*/

/*11 start*/
alter table employee_jobs add primary key(ejob_id);
/*11 finished*/

/*12 start*/
select fname, lname from employees where dept_id!=110 and dept_id!=150 and dept_id!=200 and salary<20000 and commission <.2*salary;
/*12 finished*/

/*13 start*/
select distinct j_id from employees ;
/*13 finished*/

/*14 start*/
select emp_id, dept_id, salary, .15*salary as extra_earnings from employees;
/*14 finished*/

/*15 start*/

select * from employees where dept_id=10 or dept_id=20 or dept_id=50;
/*15 finished*/

/*16 start*/
alter table employees add hdate date;
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(9,"xyz","abc","xyz@gmail.com",9999999999,'2012-1-1',1,5000,50,22,110);
select * from employees where extract(year from hdate)>2010 and extract(year from hdate)<2015;
/*16 finished*/

/*17 start*/
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(10,"xyz","abc","xyz@gmail.com",9999999999,'2018-1-1',1,5000,50,22,110);
select * from employees where hdate >'2015-1-1' or salary <20000;
/*17 finished*/

/*18 start*/
insert into	employees(emp_id,fname,lname,email_id,mobile,hdate,j_id,salary,commission,m_id,dept_id)
values(11,"xyz","abc","xyz@gmail.com",9999999999,'2018-1-1',1,25000,6000,22,110);
select * from employees where salary between 20000 and 30000 and commission between .2*salary and .3*salary;

/*18 finished*/


select * from employees;




drop table employees
