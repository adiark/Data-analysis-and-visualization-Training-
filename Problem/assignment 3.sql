create database emp_details;
use emp_details;
alter table employee add primary key(Employee_ID);
alter table bonus add foreign key(Employee_ref_ID) references employee(Employee_ID);
alter table sh add foreign key(Employee_ref_ID) references employee(Employee_ID);
/*q1*/
select concat(fname,lname) as camel_case from employee ;

/*q2*/
select left(fname,3) from employee;
 
/*q3*/
SELECT employee.fname, employee.lname, bonus.bonus_amount
FROM employee
inner JOIN sh ON employee.employee_id = sh.employee_ref_id
left join bonus on employee.employee_id = bonus.employee_ref_id
where sh.Employee_position= "Sr. Manager";

/*q4*/

SELECT employee.*, sh.employee_position, bonus.bonus_amount
FROM employee
INNER JOIN sh ON employee.employee_ID = sh.employee_ref_ID
INNER JOIN bonus ON employee.employee_ID = bonus.employee_ref_ID
where employee.compensation = (select max(compensation) from employee);

/*q5*/
select * from employee 
inner join sh on employee.employee_id=sh.employee_ref_ID
order by employee.compensation limit 3;

/*q6*/
select *  from employee
inner join sh on employee.employee_id=sh.employee_ref_ID
group by employee.focusarea
order by employee.compensation desc;

/*q7*/
select employee.focusarea, count(*) as count
from employee
group by employee.focusarea;

/*q8*/
select max(compensation), lname
from employee
where employee.compensation not in (select max(compensation) from employee);

/*q9*/
SELECT *
FROM employee e1
INNER JOIN employee e2 ON e1.compensation = e2.compensation AND e1.fName <> e2.fName;

/*q10*/
select *  from employee
inner join sh on employee.employee_id=sh.employee_ref_ID
order by employee.focusarea desc;

