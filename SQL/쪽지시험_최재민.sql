--����1��
SELECT employee_id, 
       last_name, 
       salary, 
       hire_date 
FROM   employees 
WHERE  salary NOT BETWEEN 5000 AND 1500; 

--����2��
SELECT employee_id, 
       first_name, 
       job_id, 
       hire_date 
FROM   employees 
WHERE  department_id = 50 
       AND job_id = 'ST_MAN' 
       AND hire_date = '04/07/18'; 

--����3��
SELECT *
FROM   employees 
WHERE  hire_date >= '2002/01/01' 
       AND job_id IN ( 'ST_MAN', 'ST_CLERK' ); 
       
-- ����4��      
SELECT *
FROM   employees 
WHERE  manager_id IS NULL; 

-- ����5��
SELECT *
FROM   employees 
WHERE  salary <= 10000 
       AND job_id IN ( 'PU_MAN', 'PU_CLERK' ); 
       
-- ����6��
SELECT last_name, 
       Length(last_name) 
FROM   employees 
WHERE  last_name LIKE 'J%' 
        OR last_name LIKE 'A%' 
        OR last_name LIKE 'M%'; 
        
-- ����7��
SELECT To_char(hire_date, 'YYYY'), 
       Count(employee_id) 
FROM   employees 
GROUP  BY To_char(hire_date, 'YYYY') 
ORDER  BY To_char(hire_date, 'YYYY'); 

-- ����8��
SELECT * 
FROM   employees 
WHERE  MOD(employee_id, 2) = 1 
ORDER  BY employee_id; 

-- ����9��
SELECT Next_day(Add_months(SYSDATE, 6), 6) "6������ �ݿ���" 
FROM   dual; 

-- ����10��
select employee_id, first_name, manager_id
from employees
where manager_id is null;

