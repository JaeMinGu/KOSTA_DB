select employee_id, last_name, salary, hire_date
from employees
where hire_date like '02%'; --02년도 입사자

--정렬
select employee_id, last_name, salary, hire_date
from employees
order by last_name asc, salary desc; 

--group by절
select department_id, count(department_id)
from employees
group by department_id
order by department_id asc;

select department_id, count(department_id)
from employees
group by department_id
having department_id is not null
order by department_id asc;

--서브쿼리(내부쿼리를 이용한 테이블 복사 
create table emp as 
 select *
 from employees; 
 
-- union
select * 
from employees
union
select * 
from emp;

--union all(중복되는 데이터도 그대로)
select * 
from employees
union all
select * 
from emp;

--intersect(교집합)
select * 
from employees
intersect
select * 
from emp;

--minus(차집합)
select * 
from employees
minus
select * 
from emp;




