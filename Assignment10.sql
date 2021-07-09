select job, avg(sal) from emp
where deptno =20 group by job 
having avg(sal)>1000 order by job;