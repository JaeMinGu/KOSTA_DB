�� ���º� - ���ѽð� 60��(bangry313@naver.com �̸��� ����)

1. 'London'���� �ٹ��ϴ� ��� ����� �����ȣ(employee_id), ����̸�(last_name), �����̸�(job_title), �μ��̸�(department_name), �μ���ġ(city)�� ��ȸ�Ͻÿ�.
  -���� ���̺� : employees, jobs, departments, locations
SELECT e.employee_id id, 
       e.first_name name,
       j.job_title,
       d.department_name dname, 
       l.city city
FROM   employees e 
       JOIN jobs j 
         ON e.job_id = j.job_id 
       JOIN departments d 
         ON e.department_id = d.department_id 
       JOIN locations l 
         ON d.location_id = l.location_id 
WHERE  LOWER(l.city) = 'london'; 


2. ����̸�(last_name)�� 'A'�� ���Ե� ����� �̸�(last_name)�� �μ���(department_name)�� ��ȸ�Ͻÿ�.
SELECT e.last_name, 
       d.department_name 
FROM   employees e 
       JOIN departments d 
         ON e.department_id = d.department_id 
WHERE  e.last_name LIKE '%A%';


3. �޿�(salary)�� 3000���� 5000 ������ ����� ��ȣ, �̸�, �޿�, �μ����� ��ȸ�϶�.
SELECT e.employee_id, 
       e.first_name, 
       e.salary, 
       d.department_name 
FROM   employees e 
       JOIN departments d 
         ON e.department_id = d.department_id 
WHERE  e.salary BETWEEN 3000 AND 5000; 


4. 'Accounting' �μ��� �ٹ��ϴ� ����� �̸��� �Ի����� ��ȸ�϶�.
   - �Ի��� ��� ���� - 2007�� 05�� 21��(������)
SELECT e.first_name, 
       TO_CHAR(e.hire_date, 'YYYY"��" MM"��" DD"��"(DAY)') 
FROM   employees e 
       JOIN departments d 
         ON e.department_id = d.department_id 
WHERE  UPPER(d.department_name) = 'ACCOUNTING';


5. 'Landry(last_name)'�� ���� �μ��� �ٹ��ϴ� ����� ��� ��� ������ ��ȸ�϶�.(��. Landry�� ����)
SELECT * 
FROM   employees 
WHERE  department_id IN (SELECT department_id 
                         FROM   employees 
                         WHERE  last_name = 'Landry') 
       AND last_name != 'Landry';       


6. 'Lee(last_name)'���� �ʰ� �Ի��� ����� �̸��� �Ի��� ��ȸ�϶�.
SELECT first_name, 
       hire_date 
FROM   employees 
WHERE  hire_date > (SELECT hire_date 
                    FROM   employees 
                    WHERE  last_name = 'Lee'); 
                    

7. 'Lee(last_name)'���� ���� �޿��� �޴� ����� �̸��� �޿��� ��ȸ�϶�.
SELECT first_name, 
       salary 
FROM   employees 
WHERE  salary > (SELECT salary 
                 FROM   employees 
                 WHERE  last_name = 'Lee');
                 

8. 50�� �μ��� ������ ���� �޿��� �޴� ����� �̸��� �޿��� ��ȸ�϶�.
SELECT first_name, 
       salary 
FROM   employees 
WHERE  salary IN (SELECT salary 
                  FROM   employees 
                  WHERE  department_id = 50);                  


9. ��� ����� ��ձ޿����� ���� �޿��� �޴� ������� ���, �̸�, �޿��� ��ȸ�϶�.
SELECT employee_id, 
       first_name, 
       salary 
FROM   employees 
WHERE  salary > (SELECT AVG(salary) 
                 FROM   employees); 
                 

10.�̸�(last_name)��  'T'�� ���ԵǾ� �ִ� ����� ������ �μ��� �ٹ��ϴ� ����� ��ȣ, �̸��� ��ȸ�϶�.
SELECT department_id, 
       first_name 
FROM   employees 
WHERE  department_id IN (SELECT department_id 
                         FROM   employees 
                         WHERE  last_name LIKE '%T%'); 
                         

11.10�� �μ� �ִ�޿��ڿ� ������ �޿��� �޴� ����� ��ȣ, �̸�, �޿��� ��ȸ�϶�.
SELECT employee_id, 
       first_name, 
       salary 
FROM   employees 
WHERE  salary = (SELECT MAX(salary) 
                 FROM   employees 
                 WHERE  department_id = 10); 
                 

12. 10���μ��� �ٹ��ϴ� ����� �̸��� �μ��� ��ȸ�϶�.
SELECT e.first_name, 
       d.department_name 
FROM   employees e 
       JOIN departments d 
         ON e.department_id = d.department_id 
WHERE  e.department_id = 10; 


13. 'IT_PROG' ������ �ִ� �޿��ں��� ���� �޿��� �޴� ��� ����(�μ���ȣ, �����ȣ, �̸�, �޿�)�� ����϶�.
SELECT department_id, 
       employee_id, 
       first_name, 
       salary 
FROM   employees 
WHERE  salary > (SELECT MAX(salary) 
                 FROM   employees 
                 WHERE  UPPER(job_id) = 'IT_PROG');
                 

14. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ��� �ٹ��ϴ� ��� ����� ��� ����(�����ȣ, �̸�, �޿�)�� ��ȸ�϶�.
SELECT employee_id, 
       last_name, 
       salary 
FROM   employees 
WHERE  department_id IN (SELECT department_id 
                         FROM   employees 
                         WHERE  last_name LIKE '%u%') 
       AND salary > (SELECT AVG(salary) 
                     FROM   employees); 

15. ��ձ޿��� ���� ���� ������ȣ(job_id)�� ��ձ޿��� ����϶�
    ��) ������ȣ  ��ձ޿�
       -------------------
        CLERK      2300    

SELECT job_id      "������ȣ", 
       avg(salary) "��ձ޿�" 
FROM   employees 
GROUP  BY job_id 
HAVING AVG(salary) = (SELECT MIN(AVG(salary)) 
                      FROM   employees 
                      GROUP  BY job_id);


SELECT ������ȣ, ��ձ޿�
FROM (SELECT job_id "������ȣ", AVG(salary) "��ձ޿�"
      FROM employees
      GROUP BY job_id
      ORDER BY AVG(salary) ASC)
WHERE ROWNUM = 1;
