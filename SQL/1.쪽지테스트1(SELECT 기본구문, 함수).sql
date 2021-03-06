▣ 오픈북 - 제한시간 40분(bangry313@naver.com 이메일 제출)

1. employees 테이블에서 급여가 5000이상 15000이하 사이에 포함되지 않는 사원의 사원번호(employee_id), 이름(last_name), 급여(salary), 입사일자(hire_date)를 조회하시오.

2. 부서번호(department_id) 50, 업무(job_id) 'ST_MAN', 입사일 2004-7-18일인 사원의 사원번호, 이름, 업무, 입사일을 조회하시오.

3. 2002년 이후 입사한 사원중에 재고('ST_MAN', 'ST_CLERK')업무를 담당하는 사원들의 모든 컬럼을 조회하시오.

4. 상사(manager_id)가 없는 사원의 모든 컬럼을 조회하시오.

5. 급여가 10000 미만인 사원중에서 배송('SH_CLERK')이나 구매('PU_MAN', 'PU_CLERK')업무를 담당하는 사원들의 모든 컬럼을 조회하시오.

6. 사원이름(last_name)이 J, A 또는 M으로 시작하는 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 조회하시오(단, last_name 오름차순에 따라 정렬).

7. 년도별 입사인원수를 조회하시오.

8. 사원번호(employee_id)가 홀수인 사원의 모든 정보를 조회하시오.

9.오늘부터 6개월 후 돌아오는 첫번째 금요일의 날짜를 출력하시오.
   (날짜 형식 예: 2002-06-05 15:23:10 금요일)

10.사원번호(employee_id), 사원명(first_name), 상사번호(manager_id)를 조회하되
   상사가 없는(NULL) 경우 상사번호를 '대빵'이라 출력하시오.

11.사원들을 3개축구팀으로 분류하기 위해 사번을 3으로 나누어
   나머지가 0이면 "영화배우팀"
   나머지가 1이면 "개그맨팀"
   나머지가 2이면 "가수팀"으로 분류하여 팀이름, 사원번호, 사원명을 출력하시오.

12.사원별 급여그래프를 아래와 같이 출력하시오.
   Steven King     *****($5,000) // $1000달러당 별 1개추가.
   Neena Kochhar   ***($3,000)--    .........
   XXXX XXXXX      *****************($17,000)

13.2002년 3월부터 2003년 2월 기간 동안 입사한 사원을 대상으로 부서별 인원수를 조회하시오.
   (결과는 인원수가 많은 순서대로 정렬하여 출력)

14.업무별 평균 급여를 계산하라. 단, 평균급여가 10000을 초과하는 경우는 제외하고 평균 급여에 대해 내림차순으로 정렬하시오.

15.2004년에 입사한 사원들의 목록으로부터 분기별 입사자의 수를 아래와 같이 출력하시오.(힌트: 포맷문자 Q 활용)
분기   사원수
---------------
1      3
2      1
3      2