-- sys or system���� �����ؼ� �ó�� ����
select * 
from hr.employees;

CREATE SYNONYM emp_synonym
FOR hr.employees;

SELECT * FROM emp_synonym;

-- �ó�� ����
DROP SYNONYM emp_synonym;
