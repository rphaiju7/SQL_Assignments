/*a. list the number of employees and average salary for employees in department 20*/
select count(ename), avg(sal) from emp where deptno =20;

/* b. list name, salary, and PF amount of all employees */
select ename, sal, (sal*10/100) as PF from emp ;

/*c. list name of employees who are more than 25 years old in the company*/
select ename,  TIMESTAMPDIFF(year, hiredate,curdate())as yearsworked from emp where  TIMESTAMPDIFF(year, hiredate,curdate())>25 ;

/*d. list employee details in the ascending order of their basic salary*/
select * from emp order by sal;

/*e. list the employee name and hire date in the descending order of hire date*/
select ename, hiredate from emp order by HIREDATE desc;

/*f. list employee name, salary, pf, hra , da, gross; order result in  ascending order  of gross. hra is 50% of salary and da is 30% of salary*/
select ename as EmployeeName, sal as Salary, (sal*10/100) as PF, (sal*50/100) as HRA, (sal*30/100) as DA, (sal-((sal*10/100)+ (sal*50/100)+(sal*30/100))) as Gross  from emp order by Gross;

/*g. list department numbers and num of employees in each department*/
select deptno, count(*) as noofemployees from emp group by DEPTNO;

/* h. list department num and salary payable in each department*/
select deptno, count(*) as noOFEmployees, sum(sal) as totalSalary from emp group by Deptno;

/*i. list job and no of employees in each job. The result should be in descending order of num of employees*/
select job, count(job) as jobs from emp group by job order by jobs desc;

/*j.  List the total salary, maximum and minimum salary and average salary of the employees jobwise.*/
select sal,job, count(job) as noOfPeople, sum(sal) as totalSalary, max(sal) as maxSalary, min(sal)as minSalary, avg(sal) as averageSalary from emp group by job;

/* k.  List the total salary, maximum and minimum salary and average salary of the employees, for department 20.*/
select sal,DEPTNO, count(deptno) as department, sum(sal) as totalSalary, max(sal) as maxSalary, min(sal)as minSalary, avg(sal) as averageSalary from emp where deptno=20 group by DEPTNO;

/*l. List the average salary of the employees job wise, for department 20 and display only those rows having an average salary > 1000*/
select job, avg(sal) as AverageSalary from emp where deptno='20' group by job having avg(sal)>1000  order by job ;
