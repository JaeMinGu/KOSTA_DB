/* ������(sequence) ���� */
-- �׽�Ʈ�� ���� ���̺� ����
CREATE TABLE list(
    no   NUMBER CONSTRAINT list_no_pk PRIMARY KEY,
    name VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE list_seq;
    --START WITH 1
    --INCREMENT BY 1
    --NOMAXVALUE
    --NOCYCLE
    --CACHE 20;

SELECT list_seq.CURRVAL,  list_seq.NEXTVAL
FROM dual;


INSERT INTO list
VALUES((select max(no)+1 from list), '�����');

rollback;
COMMIT;

SELECT * FROM list;

-- ������ ����
ALTER SEQUENCE list_seq
	INCREMENT  BY 2;
	

-- ������ ����
DROP SEQUENCE  list_seq;

select * from departments;

-- ��ųʸ� ������ ��ȸ
SELECT *  FROM user_sequences;

-- ���޺� �� ����
CREATE OR REPLACE VIEW employees_sajang_view
	AS 
      SELECT *
      FROM EMPLOYEES;

CREATE OR REPLACE VIEW employees_bujang_view
	AS 
      SELECT employee_id, first_name, salary
      FROM EMPLOYEES;


SELECT *
FROM employees_sajang_view;

SELECT *
FROM employees_bujang_view;

-- ������ SQL ������ ���� �� ����
CREATE OR REPLACE VIEW employees_by_departments
AS
SELECT e.first_name, d.department_name
FROM employees e 
                          JOIN (SELECT department_id, department_name
                                 FROM departments
                                 WHERE department_id = 30) d
ON e.department_id = d.department_id;

select * from employees_by_departments;


-- ��ųʸ��κ��� �� ��ȸ
SELECT * FROM user_views;

SELECT * FROM EMP_DETAILS_VIEW;

-- �ε������� ����ϴ� �����÷� ��ȸ
SELECT rowid, rownum, employee_id, first_name
FROM employees;

-- ����� ���� �ε��� ����
CREATE INDEX emp_salary_idx
ON employees(salary);

SELECT *
FROM employees
WHERE salary >= 12000
order by salary asc;

-- ��ųʸ��κ��� �ε��� ��ȸ
SELECT *
FROM user_indexes
WHERE table_name = 'EMPLOYEES';

SELECT *
FROM user_ind_columns
WHERE table_name = 'EMPLOYEES';

-- �ڵ� �ε��� ���
select *
from employees
where last_name = 'James';

create table emp1
as
select * 
from employees;

insert into emp1
select *
from emp1;

commit; 

select * 
from emp1
where employee_id = 108;

CREATE INDEX emp_id_idx
ON emp1(employee_id);




