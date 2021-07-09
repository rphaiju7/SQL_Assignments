/*a. list name of analysts and salesman*/
select ename from emp where job = 'salesman'or job='analyst';

/*b. list details of employees who have joined before 30 sept 81.*/
select * from emp where HIREDATE <'1981-09-30'; 

/*c. list names of employee who are not managers*/
select ename from emp where  job !='Manager';

/*d. list names whose employees numbers are 7369,7521,7839,7934,7788*/
select ename from emp where EMPNO in ('7369','7521','7839','7934','7788');

/*e. list employees not belonging to department 30,40,10 */
select ename from emp where DEPTNO not in (30,40,10);

/*f. list employees who joined between 30 june and 31 dec 81*/
select ename from emp where hiredate between '1981-06-30' and '1981-12-31';

/*g. different designations of the company*/
select distinct job from emp ;

/*h. names of employees who are not eligible for commision*/
select ename from emp where comm  is null;

/*i. names and designation of employees who does not report to anybody*/
select ename, job from emp where mgr is null;

/*j. list employees not assigned to any department*/
select * from emp where deptno is null;

/*k. employees who are eligible for commission*/
select ename from emp where comm  is not null;

/* l. list employees whose name start or end with 's'*/
select * from emp where ename like "s%s";

/*m. list employees whose names have 'i' as the second character*/
select * from emp where ename like '_i%';

/*n. list the number of employees working with the company*/
select count(ename) from emp ;

/*o. list the num of designations available in the  emp table.*/
select  count(distinct job)  from emp;

/*p. list the total salaries paid to the employees*/
select sum(sal) from emp;

/*q. list the max min and avg salary in the company */
select max(sal), min(sal), avg(sal) from emp;
 
/*r. list max salary paid to salesman*/
select max(sal) from emp where JOB ='salesman';
