--1. 'London'���� �ٹ��ϴ� ��� ����� �����ȣ(employee_id), ����̸�(last_name), �����̸�(job_title), �μ��̸�(department_name), �μ���ġ(city)�� ��ȸ�Ͻÿ�.
--  -���� ���̺� : employees, jobs, departments, locations
SELECT employee_id     "�����ȣ", 
       last_name       "����̸�", 
       job_title       "�����̸�", 
       department_name "�μ��̸�", 
       city            "�μ���ġ" 
FROM   employees 
       join departments USING(department_id) 
       join locations USING(location_id) 
       join jobs USING (job_id) 
WHERE  Lower(city) = 'london'; 

--2. ����̸�(last_name)�� 'A'�� ���Ե� ����� �̸�(last_name)�� �μ���(department_name)�� ��ȸ�Ͻÿ�.
SELECT last_name       "�̸�", 
       department_name "�μ���" 
FROM   employees 
       join departments USING (department_id) 
WHERE  last_name LIKE '%A%'; 

--3. �޿�(salary)�� 3000���� 5000 ������ ����� ��ȣ, �̸�, �޿�, �μ����� ��ȸ�϶�.
SELECT employee_id     "�����ȣ", 
       last_name       "�̸�", 
       salary          "�޿�", 
       department_name "�μ���" 
FROM   employees 
       join departments USING (department_id) 
WHERE  salary BETWEEN 3000 AND 5000 
ORDER  BY "�޿�"; 

--4. 'Accounting' �μ��� �ٹ��ϴ� ����� �̸��� �Ի����� ��ȸ�϶�.
--   - �Ի��� ��� ���� - 2007�� 05�� 21��(������)
SELECT last_name                                         "�̸�", 
       To_char(hire_date, 'YYYY|"��"MM|"��"DD|"��"(DAY)') "�Ի���" 
FROM   employees 
       join departments USING (department_id) 
WHERE  Lower(department_name) = 'accounting'; 

--5. 'Landry(last_name)'�� ���� �μ��� �ٹ��ϴ� ����� ��� ��� ������ ��ȸ�϶�.
--    (��. Landry�� ����)
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

--6. 'Lee(last_name)'���� �ʰ� �Ի��� ����� �̸��� �Ի��� ��ȸ�϶�.
SELECT last_name "�̸�", 
       hire_date "�Ի���" 
FROM   employees 
WHERE  hire_date > (SELECT hire_date 
                    FROM   employees 
                    WHERE  Lower(last_name) = 'lee'); 
                    
--7. 'Lee(last_name)'���� ���� �޿��� �޴� ����� �̸��� �޿��� ��ȸ�϶�.
SELECT last_name "�̸�", 
       salary    "�޿�" 
FROM   employees 
WHERE  salary > (SELECT salary 
                 FROM   employees 
                 WHERE  Lower(last_name) = 'lee') 
ORDER  BY salary ASC; 

--8. 50�� �μ��� ������ ���� �޿��� �޴� ����� �̸��� �޿��� ��ȸ�϶�.
SELECT last_name "�̸�", 
       salary    "�޿�" 
FROM   employees 
WHERE  salary IN (SELECT salary 
                  FROM   employees 
                         join departments USING (department_id) 
                  WHERE  department_id = '50') 
ORDER  BY "�̸�"; 

--9. ��� ����� ��ձ޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿��� ��ȸ�϶�.
SELECT employee_id "���", 
       last_name   "�̸�", 
       salary      "�޿�" 
FROM   employees 
WHERE  salary > (SELECT Avg(salary) 
                 FROM   employees) 
ORDER  BY "���"; 

--10.�̸�(last_name)��  'T'�� ���ԵǾ� �ִ� ����� ������ �μ��� �ٹ��ϴ� ����� ��ȣ, �̸��� ��ȸ�϶�.
SELECT employee_id "���", 
       last_name   "�̸�" 
FROM   employees 
WHERE  department_id IN (SELECT department_id 
                         FROM   employees 
                         WHERE  last_name LIKE '%T%') 
ORDER  BY "���"; 

--11.10�� �μ� �ִ�޿��ڿ� ������ �޿��� �޴� ����� ��ȣ, �̸�, �޿��� ��ȸ�϶�.
SELECT employee_id "���", 
       last_name   "�̸�", 
       salary      "�޿�" 
FROM   employees 
WHERE  salary = (SELECT Max(salary) 
                 FROM   employees 
                 WHERE  department_id = '10'); 
                 
--12. 10���μ��� �ٹ��ϴ� ����� �̸��� �μ��� ��ȸ�϶�.
SELECT last_name       "�̸�", 
       department_name "�μ���" 
FROM   employees 
       join departments USING(department_id) 
WHERE  department_id = '10'; 

--13. 'IT_PROG' ������ �ִ� �޿��ں��� ���� �޿��� �޴� ��� ����(�μ���ȣ, �����ȣ, �̸�, �޿�)�� ����϶�.
SELECT department_id "�μ���ȣ", 
       employee_id   "�����ȣ", 
       last_name     "�̸�", 
       salary        "�޿�" 
FROM   employees 
WHERE  salary > (SELECT Max(salary) 
                 FROM   employees 
                 WHERE  Upper(job_id) = 'IT_PROG'); 
                 
--14. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ��� �ٹ��ϴ� ��� ����� ��� ����(�����ȣ, �̸�, �޿�)�� ��ȸ�϶�.
SELECT employee_id "�����ȣ", 
       last_name   "�̸�", 
       salary      "�޿�" 
FROM   employees 
WHERE  salary > (SELECT Avg(salary) 
                 FROM   employees) 
       AND 
       department_id IN (SELECT department_id 
                             FROM   employees 
                             WHERE  last_name LIKE '%u%'); 


--15. ��ձ޿��� ���� ���� ������ȣ(job_id)�� ��ձ޿��� ����϶�
--    ��) ������ȣ  ��ձ޿�
--       -------------------
--        CLERK      2300    

SELECT job_id      "������ȣ", 
       Avg(salary) "��ձ޿�" 
FROM   employees 
GROUP  BY job_id 
HAVING Avg(salary) <= ALL (SELECT Avg(salary) 
                           FROM   employees 
                           GROUP  BY job_id); 

select job_id "������ȣ", sal "��ձ޿�"
from (select job_id, avg(salary) sal
from employees
group by job_id
order by sal
)
where rownum = 1;










                                    




