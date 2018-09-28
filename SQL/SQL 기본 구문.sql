select employee_id, last_name, salary, hire_date
from employees
where hire_date like '02%'; --02�⵵ �Ի���

--����
select employee_id, last_name, salary, hire_date
from employees
order by last_name asc, salary desc; 

--group by��
select department_id, count(department_id)
from employees
group by department_id
order by department_id asc;

select department_id, count(department_id)
from employees
group by department_id
having department_id is not null
order by department_id asc;

--��������(���������� �̿��� ���̺� ���� 
create table emp as 
 select *
 from employees; 
 
-- union
select * 
from employees
union
select * 
from emp;

--union all(�ߺ��Ǵ� �����͵� �״��)
select * 
from employees
union all
select * 
from emp;

--intersect(������)
select * 
from employees
intersect
select * 
from emp;

--minus(������)
select * 
from employees
minus
select * 
from emp;




