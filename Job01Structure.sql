
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

----------------------------------------
CREATE PROCEDURE spDep_InsertReg 

@dep_buildinglevel int ,
@dep_name varchar(20),
@dep_manager  varchar(30)

as

INSERT INTO [Department]
(
	  [dep_buildinglevel]
     ,[dep_name]
     ,[dep_manager]
)           
     VALUES
(
	   @dep_buildinglevel      
      ,@dep_name
      ,@dep_manager
)
GO
----------------------------------------

CREATE PROCEDURE sp_Emp_InsertReg 

@dep_id int ,
@emp_name varchar(30),
@emp_hiredate  date,
@emp_salary  decimal(10,2)

as

INSERT INTO [Employees]
(
	[dep_id],
     [emp_name],
     [emp_hiredate],
     [emp_salary]
    
)           
     VALUES
( 
     @dep_id,
     @emp_name,
     @emp_hiredate,
     @emp_salary	
)

GO
----------------------------------------


exec sp_Emp_InsertReg 
@dep_id=2,
@emp_name='Freddie Dole',
@emp_hiredate='2021/02/02',
@emp_salary=993.25


----------------------------------------


DROP TABLE [Job01Structure].[Department];

DROP TABLE [Department];

DROP TABLE Employees_copy02 

DROP TABLE [Employees];

SELECT *  FROM [Department];

SELECT *  FROM [Employees];


SELECT *  FROM [Employees_copy01];


delete from  [Department]
where dep_id > 50


delete from [Employees];


UPDATE [Employees]  
    SET emp_name = 'Rafael Rivas'  
    WHERE empl_id = 1 


--------------------------------------------------

--creating copy of a table--

DROP TABLE  Employees_copy01;

SELECT *
INTO Employees_copy01
FROM  Employees
WHERE 1 = 0;



INSERT INTO Employees_copy01 
    SELECT  * 
    FROM Employees;  


CREATE TABLE Employees_copy02 
( emp_name varchar(30) not null,
emp_hiredate  date not null,
);  
GO 

INSERT INTO  Employees_copy02  
    SELECT emp_name, emp_hiredate
    FROM Employees;
GO


--sql server list all tables
SELECT CAST(table_name as varchar)  FROM INFORMATION_SCHEMA.TABLES

--------------------------------------------------

