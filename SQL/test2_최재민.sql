--1. 'London'에서 근무하는 모든 사원의 사원번호(employee_id), 사원이름(last_name), 업무이름(job_title), 부서이름(department_name), 부서위치(city)를 조회하시오.
--  -관련 테이블 : employees, jobs, departments, locations
SELECT employee_id     "사원번호", 
       last_name       "사원이름", 
       job_title       "업무이름", 
       department_name "부서이름", 
       city            "부서위치" 
FROM   employees 
       join departments USING(department_id) 
       join locations USING(location_id) 
       join jobs USING (job_id) 
WHERE  Lower(city) = 'london'; 

--2. 사원이름(last_name)에 'A'가 포함된 사원의 이름(last_name)과 부서명(department_name)을 조회하시오.
SELECT last_name       "이름", 
       department_name "부서명" 
FROM   employees 
       join departments USING (department_id) 
WHERE  last_name LIKE '%A%'; 

--3. 급여(salary)가 3000에서 5000 사이인 사원의 번호, 이름, 급여, 부서명을 조회하라.
SELECT employee_id     "사원번호", 
       last_name       "이름", 
       salary          "급여", 
       department_name "부서명" 
FROM   employees 
       join departments USING (department_id) 
WHERE  salary BETWEEN 3000 AND 5000 
ORDER  BY "급여"; 

--4. 'Accounting' 부서에 근무하는 사원의 이름과 입사일을 조회하라.
--   - 입사일 출력 형식 - 2007년 05월 21일(월요일)
SELECT last_name                                         "이름", 
       To_char(hire_date, 'YYYY|"년"MM|"월"DD|"일"(DAY)') "입사일" 
FROM   employees 
       join departments USING (department_id) 
WHERE  Lower(department_name) = 'accounting'; 

--5. 'Landry(last_name)'와 동일 부서에 근무하는 사원의 모든 모든 정보를 조회하라.
--    (단. Landry은 제외)
SELECT employee_id, 
       first_name, 
       last_name, 
       email, 
       phone_number, 
       job_id, 
       salary, 
       commission_pct, 
       manager_id, 
       department_id 
FROM   employees 
WHERE  department_id = (SELECT department_id 
                        FROM   employees 
                               join departments USING(department_id) 
                        WHERE  Lower(last_name) = 'landry') 
       AND Lower(last_name) != 'landry' 
ORDER  BY last_name; 

--6. 'Lee(last_name)'보다 늦게 입사한 사원의 이름과 입사일 조회하라.
SELECT last_name "이름", 
       hire_date "입사일" 
FROM   employees 
WHERE  hire_date > (SELECT hire_date 
                    FROM   employees 
                    WHERE  Lower(last_name) = 'lee'); 
                    
--7. 'Lee(last_name)'보다 많은 급여를 받는 사원의 이름과 급여을 조회하라.
SELECT last_name "이름", 
       salary    "급여" 
FROM   employees 
WHERE  salary > (SELECT salary 
                 FROM   employees 
                 WHERE  Lower(last_name) = 'lee') 
ORDER  BY salary ASC; 

--8. 50번 부서의 사원들과 같은 급여를 받는 사원의 이름과 급여를 조회하라.
SELECT last_name "이름", 
       salary    "급여" 
FROM   employees 
WHERE  salary IN (SELECT salary 
                  FROM   employees 
                         join departments USING (department_id) 
                  WHERE  department_id = '50') 
ORDER  BY "이름"; 

--9. 모든 사원의 평균급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여를 조회하라.
SELECT employee_id "사번", 
       last_name   "이름", 
       salary      "급여" 
FROM   employees 
WHERE  salary > (SELECT Avg(salary) 
                 FROM   employees) 
ORDER  BY "사번"; 

--10.이름(last_name)에  'T'가 포함되어 있는 사원과 동일한 부서에 근무하는 사원의 번호, 이름을 조회하라.
SELECT employee_id "사번", 
       last_name   "이름" 
FROM   employees 
WHERE  department_id IN (SELECT department_id 
                         FROM   employees 
                         WHERE  last_name LIKE '%T%') 
ORDER  BY "사번"; 

--11.10번 부서 최대급여자와 동일한 급여를 받는 사원의 번호, 이름, 급여를 조회하라.
SELECT employee_id "사번", 
       last_name   "이름", 
       salary      "급여" 
FROM   employees 
WHERE  salary = (SELECT Max(salary) 
                 FROM   employees 
                 WHERE  department_id = '10'); 
                 
--12. 10번부서에 근무하는 사원의 이름과 부서명 조회하라.
SELECT last_name       "이름", 
       department_name "부서명" 
FROM   employees 
       join departments USING(department_id) 
WHERE  department_id = '10'; 

--13. 'IT_PROG' 업무의 최대 급여자보다 많은 급여를 받는 사원 정보(부서번호, 사원번호, 이름, 급여)를 출력하라.
SELECT department_id "부서번호", 
       employee_id   "사원번호", 
       last_name     "이름", 
       salary        "급여" 
FROM   employees 
WHERE  salary > (SELECT Max(salary) 
                 FROM   employees 
                 WHERE  Upper(job_id) = 'IT_PROG'); 
                 
--14. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에 근무하는 모든 사원의 사원 정보(사원번호, 이름, 급여)를 조회하라.
SELECT employee_id "사원번호", 
       last_name   "이름", 
       salary      "급여" 
FROM   employees 
WHERE  salary > (SELECT Avg(salary) 
                 FROM   employees) 
       AND 
       department_id IN (SELECT department_id 
                             FROM   employees 
                             WHERE  last_name LIKE '%u%'); 


--15. 평균급여가 가장 적은 업무번호(job_id)와 평균급여를 출력하라
--    예) 업무번호  평균급여
--       -------------------
--        CLERK      2300    

SELECT job_id      "업무번호", 
       Avg(salary) "평균급여" 
FROM   employees 
GROUP  BY job_id 
HAVING Avg(salary) <= ALL (SELECT Avg(salary) 
                           FROM   employees 
                           GROUP  BY job_id); 

select job_id "업무번호", sal "평균급여"
from (select job_id, avg(salary) sal
from employees
group by job_id
order by sal
)
where rownum = 1;










                                    




