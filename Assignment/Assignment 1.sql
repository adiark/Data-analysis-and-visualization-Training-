create database worker_details;
use worker_details;
create table worker(worker_id int not null , first_name varchar(50), last_name varchar(50), salary int , joining_date datetime , department varchar(50), primary key(worker_id));
create table bonus(worker_ref_id int not null , bonus_date datetime, bonus_amount int  , foreign key(worker_ref_id) references	worker(worker_id));
create table title(worker_ref_id int not null , worker_title varchar(50), affected_from datetime , foreign key(worker_ref_id) references worker(worker_id));

/*q1*/
select concat(worker.first_name, " " ,worker.last_name) as Full_Name from worker
where salary between 50000 and 100000;

/*q2*/
select department ,count(worker_id) as Number_of_Employees from worker 
group by department
order by count(worker_id) desc;

/*q3*/

select * from worker
inner join title on worker.worker_id = title.worker_ref_id
where title.worker_title= 'Manager'; 

/*q4*/
select * from worker
limit 5;

/*q5*/
select first_name, Last_name from( select first_name, last_name, rank() over (order by salary desc) as c_rank
from worker) as wor 
where c_rank=5;

/*q6*/
select concat(first_name, " ", Last_name) as Full_Name from worker where salary in (
    select salary from worker
    group by salary having count(*) > 1
);

/*q7*/
select distinct department  from worker where department in (
    select department from worker
    group by department having count(*) < 5
);

/*q8*/
select department ,count(worker_id) as Number_of_Employees from worker 
group by department;

/*q9*/

SELECT first_name,Last_name,department, salary
FROM worker
WHERE salary IN
  (SELECT max(Salary) AS salary
   From worker
   GROUP BY department);

/*q10*/
SELECT Department, SUM(SALARY) 
FROM worker 
GROUP BY Department;

select * from title;