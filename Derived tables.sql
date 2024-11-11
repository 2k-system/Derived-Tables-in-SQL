-- Display the oldest employee in the deptno 30.
select * from emp e
     where deptno = 30
     and hiredate = ( select min(hiredate)
     from emp
     where deptno = e.deptno);
    
  --   Display the records of employees who earn salary less than the average salary of job SALESMAN. The records of SALESMAN should be excluded from the report.
 select * from emp
     where sal < (select avg(sal)
     from emp
     where job in ('salesman'))
     and job <> 'Salesman';

-- 	Display the top earner’s records from the job CLERK.
select * from emp
     where sal = (select max(sal)
     from emp
     where job = 'clerk');

 -- Display the records of lowest earners who joined in the year 81.
select * from emp
     where ename in (select ename
     from emp
     where year(hiredate) in (1981))
     order by sal
     limit 1;
     
-- Display the records of employees who are earning above the average salary in their own deptno.
select * from emp e
     where sal > ( select avg(sal)
     from emp
     where deptno = e.deptno);

-- Display the name, hire date, and salary for all employees who have both the same salary and commission as Scott. 
-- Note: Do not display SCOTT in the result set.
select ename as 'Name',
     hiredate as 'Hiredate',
     sal as 'Salary'
     from emp
     where ename <> 'scott'
     and sal = (select sal
     from emp
     where ename in ('scott'))
     and comm <=> (select comm
     from emp
     where ename in ('scott'));

-- 	Display the department names of employees who have their salary greater than Martin’s salary
   select distinct(dname)
     from dept d
     join emp e
     on d.deptno = e.deptno
     where e.sal >(select sal
     from emp
     where ename in ('martin'));   
     
-- 	Display the department name and name of the employee that has the highest salary record.
   select d.dname, e.ename
     from dept d
     join emp e
     on d.deptno = e.deptno
     where sal = (select max(sal)
     from emp);  