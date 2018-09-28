-- 명시적 NULL 입력 
-- data dictionary 조회 
select * from user_constraints;

INSERT INTO departments 
                  (department_id, 
                   department_name, 
                   manager_id, 
                   location_id) 
VALUES        (900, 
                   'KOSTA', 
                   NULL, 
                   NULL); 

select * from departments; 

-- 시퀀스를 이용한 부서번호 입력 
INSERT INTO departments (department_id,  department_name, manager_id, location_id) 
VALUES       (departments_seq.NEXTVAL, 'KOSTA', NULL, NULL); 

SELECT * 
FROM   user_sequences; 

SELECT * 
FROM   user_tables;


-- 묵시적 NULL 입력 
INSERT INTO departments (department_id, department_name) 
VALUES     (510,  'KOSTA1'); 

select * from departments;

create table dept
as select * 
from departments
where 0=1;

select * from dept;

insert into dept
select * 
from departments;

select * from dept;

-- UPDATE
UPDATE employees 
SET    salary = salary * 1.1 
WHERE  department_id = 30;

-- DELETE
DELETE FROM departments 
WHERE  department_name LIKE '%KOSTA%'; 


DELETE FROM emp 
WHERE  salary > (SELECT AVG(salary) 
                       FROM   employees); 


rollback;

select * from departments;

select * from employees; 

select * from user_constraints
where lower(table_name) = 'employees';

select * from user_sequences;
select * from employees;
desc employees;

insert into employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values
((employees_seq.nextval), 
'JaeMin', 
'Choi', 
'1234@naver.com', 
'010.1234.4567', 
sysdate, 
'IT_PROG', 
3700, 
0.5, 
146,
60);

-- DB 파일 반영(승인처리)
commit;

select * from employees;






