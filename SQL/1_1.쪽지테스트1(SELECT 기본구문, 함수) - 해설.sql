�� ���º� - ���ѽð� 40��(bangry313@naver.com �̸��� ����)

1. employees ���̺��� �޿��� 5000�̻� 15000���� ���̿� ���Ե��� �ʴ� ����� �����ȣ(employee_id), �̸�(last_name), �޿�(salary), �Ի�����(hire_date)�� ��ȸ�Ͻÿ�.
SELECT employee_id, 
       last_name, 
       salary, 
       hire_date 
FROM   employees 
WHERE  NOT( salary BETWEEN 5000 AND 15000 );


2. �μ���ȣ(department_id) 50, ����(job_id) 'ST_MAN', �Ի��� 2004-7-18���� ����� �����ȣ, �̸�, ����, �Ի����� ��ȸ�Ͻÿ�.
SELECT employee_id, 
       last_name, 
       job_id, 
       hire_date 
FROM   employees 
WHERE  department_id = 50 
       AND job_id = 'ST_MAN'
       AND TO_CHAR(hire_date, 'YYYY-MM-DD') = '2004-07-18'; 


3. 2002�� ���� �Ի��� ����߿� ���('ST_MAN', 'ST_CLERK')������ ����ϴ� ������� ��� �÷��� ��ȸ�Ͻÿ�.
SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id 
FROM   employees 
WHERE  hire_date >= TO_DATE('2002-01-01', 'YYYY-MM-DD') 
       AND job_id IN( 'ST_MAN', 'ST_CLERK' );
       
       
4. ���(manager_id)�� ���� ����� ��� �÷��� ��ȸ�Ͻÿ�.
SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id
FROM   employees 
WHERE  manager_id IS NULL; 


5. �޿��� 10000 �̸��� ����߿��� ���('SH_CLERK')�̳� ����('PU_MAN', 'PU_CLERK')������ ����ϴ� ������� ��� �÷��� ��ȸ�Ͻÿ�.
SELECT employee_id, first_name, last_name, email, phone_number, job_id, salary, commission_pct, manager_id, department_id 
FROM   employees 
WHERE  salary < 10000 
       AND job_id IN( 'SH_CLERK', 'PU_MAN', 'PU_CLERK' ); 
       
       
6. ����̸�(last_name)�� J, A �Ǵ� M���� �����ϴ� ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ��ȸ�Ͻÿ�(��, last_name ���������� ���� ����).
SELECT INITCAP(last_name) "�̸�", 
       LENGTH(last_name)  "����" 
FROM   employees 
WHERE  last_name LIKE 'J%' 
        OR last_name LIKE 'A%' 
        OR last_name LIKE 'M%' 
ORDER  BY last_name;


7. �⵵�� �Ի��ο����� ��ȸ�Ͻÿ�.
SELECT TO_CHAR(hire_date, 'YYYY') "�⵵", 
       COUNT(*)                   "�ο�" 
FROM   employees 
GROUP  BY TO_CHAR(hire_date, 'YYYY') ;
--ORDER  BY "�⵵" ASC; 


8. �����ȣ(employee_id)�� Ȧ���� ����� ��� ������ ��ȸ�Ͻÿ�.
SELECT * 
FROM   employees 
WHERE  MOD(employee_id, 2) = 1;


9.���ú��� 6���� �� ���ƿ��� ù��° �ݿ����� ��¥�� ����Ͻÿ�.(��¥ ���� ��: 2002-06-05 15:23:10 �ݿ���)
SELECT TO_CHAR(NEXT_DAY(ADD_MONTHS(SYSDATE, 6), 6), 'YYYY-MM-DD HH24:MI:SS DAY') 
FROM   dual; 


10.�����ȣ(employee_id), �����(first_name), ����ȣ(manager_id)�� ��ȸ�ϵ�
   ��簡 ����(NULL) ��� ����ȣ�� '�뻧'�̶� ����Ͻÿ�.
SELECT employee_id, 
       first_name, 
       NVL(TO_CHAR(manager_id), '�뻧') 
FROM   employees; 


11.������� 3���౸������ �з��ϱ� ���� ����� 3���� ������
   �������� 0�̸� "��ȭ�����"
   �������� 1�̸� "���׸���"
   �������� 2�̸� "������"���� �з��Ͽ� ���̸�, �����ȣ, ������� ����Ͻÿ�.
SELECT DECODE(MOD(employee_id, 3), 0, '��ȭ�����', 
                                   1, '���׸���', 
                                   2, '������') "���̸�",
       employee_id "�����ȣ", 
       first_name "�����"
FROM   employees 
ORDER  BY "���̸�"; 


12.����� �޿��׷����� �Ʒ��� ���� ����Ͻÿ�.
   Steven King     *****($5,000) // $1000�޷��� �� 1���߰�.
   Neena Kochhar   ***($3,000)--    .........
   XXXX XXXXX      *****************($17,000)
SELECT RPAD(first_name || ' ' || last_name, 20, ' ') "�̸�", 
       RPAD(' ', ( salary / 1000 ) + 1, '*')  || '(' || TO_CHAR(salary, '$99,999')|| ')' "�޿��׷���" 
FROM   employees 
ORDER  BY salary DESC;


13.2002�� 3������ 2003�� 2�� �Ⱓ ���� �Ի��� ����� ������� �μ��� �ο����� ��ȸ�Ͻÿ�.(����� �ο����� ���� ������� �����Ͽ� ���)
SELECT department_id, 
       COUNT(*) cnt 
FROM   employees 
WHERE  hire_date BETWEEN TO_DATE('2002-03', 'YYYY-MM') AND 
                         TO_DATE('2003-03', 'YYYY-MM') 
GROUP  BY department_id 
ORDER  BY cnt DESC; 


14.������ ��� �޿��� ����϶�. ��, ��ձ޿��� 10000�� �ʰ��ϴ� ���� �����ϰ� ��� �޿��� ���� ������������ �����Ͻÿ�.
SELECT job_id "������", 
       AVG(salary) "��ձ޿�" 
FROM   employees 
GROUP  BY job_id 
HAVING AVG(salary) <= 10000 
ORDER  BY "��ձ޿�";


15.2004�⿡ �Ի��� ������� ������κ��� �б⺰ �Ի����� ���� �Ʒ��� ���� ����Ͻÿ�.(��Ʈ: ���˹��� Q Ȱ��)
�б�   �����
---------------
1      3
2      1
3      2

SELECT TO_CHAR(hire_date, 'Q') "�б�", 
       COUNT(employee_id)      "�����" 
FROM   employees 
WHERE  TO_CHAR(hire_date, 'YYYY') = '2004' 
GROUP  BY TO_CHAR(hire_date, 'Q') 
ORDER  BY "�б�"; 