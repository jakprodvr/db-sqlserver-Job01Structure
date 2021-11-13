
drop database  Job01Structure;

create database Job01Structure;

use Job01Structure;

create table Department(
dep_id int IDENTITY(1,1)  primary key,
dep_buildinglevel  int not null,
dep_name varchar(20) not null,
dep_manager  varchar(30) not null
)

create table Employees(
empl_id int IDENTITY(1,1),
dep_id int  not null,
emp_name varchar(30) not null,
emp_hiredate  date not null,
emp_salary  decimal(10,2) not null,

constraint FK_EmpDep 
foreign key (dep_id) 
references Department (dep_id)
on update cascade
on delete cascade
)
go

