--문제1번
SELECT employee_id, 
       last_name, 
       salary, 
       hire_date 
FROM   employees 
WHERE  salary NOT BETWEEN 5000 AND 1500; 

--문제2번
SELECT employee_id, 
       first_name, 
       job_id, 
       hire_date 
FROM   employees 
WHERE  department_id = 50 
       AND job_id = 'ST_MAN' 
       AND hire_date = '04/07/18'; 

--문제3번
SELECT *
FROM   employees 
WHERE  hire_date >= '2002/01/01' 
       AND job_id IN ( 'ST_MAN', 'ST_CLERK' ); 
       
-- 문제4번      
SELECT *
FROM   employees 
WHERE  manager_id IS NULL; 

-- 문제5번
SELECT *
FROM   employees 
WHERE  salary <= 10000 
       AND job_id IN ( 'PU_MAN', 'PU_CLERK' ); 
       
-- 문제6번
SELECT last_name, 
       Length(last_name) 
FROM   employees 
WHERE  last_name LIKE 'J%' 
        OR last_name LIKE 'A%' 
        OR last_name LIKE 'M%'; 
        
-- 문제7번
SELECT To_char(hire_date, 'YYYY'), 
       Count(employee_id) 
FROM   employees 
GROUP  BY To_char(hire_date, 'YYYY') 
ORDER  BY To_char(hire_date, 'YYYY'); 

-- 문제8번
SELECT * 
FROM   employees 
WHERE  MOD(employee_id, 2) = 1 
ORDER  BY employee_id; 

-- 문제9번
SELECT to_char(Next_day(Add_months(SYSDATE, 6), 6), 'YYYY-MM-DD HH24:MI:SS DAY' )"6개월후 금요일" 
FROM   dual; 

-- 문제10번
SELECT employee_id, 
       first_name, 
       Decode(manager_id, NULL, '대빵', 
                          manager_id)"상사번호" 
FROM   employees; 

-- 문제11번
SELECT employee_id, 
       first_name, 
       Decode(MOD(employee_id, 3), 0, '영화배우팀', 
                                   1, '개그맨팀', 
                                   2, '가수팀') "팀 이름" 
FROM   employees; 

-- 문제12번
SELECT first_name, 
       last_name, 
       Lpad('(' 
            ||Trim(To_char(salary, '$999,999')) 
            ||')', salary / 1000 + Length(To_char(salary)) + 4, '*') 
FROM   employees; 







-- 문제13번
SELECT department_id, 
       Count(*) 
FROM   employees 
WHERE  hire_date BETWEEN '2002/03/01' AND '2003/02/01' 
GROUP  BY department_id 
ORDER  BY Count(*) DESC; 

-- 문제 14번 
SELECT job_id     "업무", 
       Avg(salary)"평균급여" 
FROM   employees 
GROUP  BY job_id 
HAVING Avg(salary) <= 10000 
ORDER  BY Avg(salary) DESC; 

-- 문제 15번 
select  
from employees
where to_char(hire_date, 'YYYY')='2004';