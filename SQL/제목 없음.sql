-- sys or system으로 접속해서 시노님 생성
select * 
from hr.employees;

CREATE SYNONYM emp_synonym
FOR hr.employees;

SELECT * FROM emp_synonym;

-- 시노님 삭제
DROP SYNONYM emp_synonym;
