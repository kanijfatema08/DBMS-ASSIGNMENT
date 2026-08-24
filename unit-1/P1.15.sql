set linesize 250;
CREATE TABLE employees (
    employee_id    NUMBER(6) PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25),
    job_id         VARCHAR2(10),
    salary         NUMBER(8,2),
    hire_date      DATE,
    department_id  NUMBER(4)
);


INSERT INTO employees VALUES (201, 'Kanij', 'Beni', 'HR_REP', 17000, TO_DATE('21-SEP-1989','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (202, 'saniya', 'Beni', 'HR_REP', 9000,  TO_DATE('13-JAN-1993','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (203, 'fatema', 'Beni', 'HR_MGR', 6500, TO_DATE('03-JAN-1990','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (204, 'rida', 'Beni', 'HR_REP', 6000,  TO_DATE('21-MAY-1991','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (205, 'zikra', 'Beni', 'HR_REP', 4800, TO_DATE('25-JUN-1997','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (301, 'riza', 'khanusiya', 'IT_PROG', 4800, TO_DATE('05-FEB-2006','DD-MON-YYYY'), 60);
INSERT INTO employees VALUES (302, 'jiya', 'khanusiya', 'IT_PROG', 4200, TO_DATE('07-FEB-2007','DD-MON-YYYY'), 60);

COMMIT;
SELECT * FROM employees;

DECLARE
    v_dept  NUMBER := 5;
    v_cnt   NUMBER;
    v_avg   NUMBER;
    v_max   NUMBER;
BEGIN
    SELECT COUNT(*), ROUND(AVG(salary),2), MAX(salary)
    INTO v_cnt, v_avg, v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('===== DEPARTMENT SUMMARY =====');
    DBMS_OUTPUT.PUT_LINE('Department ID  : ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Employee Count : ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('Average Salary : ' || v_avg);
    DBMS_OUTPUT.PUT_LINE('Maximum Salary : ' || v_max);
END;
/

-- -----------------------------------------------------------------------------------------------------------------------------
-- output:-

-- EMPLOYEE_ID FIRST_NAME		 LAST_NAME		   JOB_ID	  SALARY HIRE_DATE	    DEPARTMENT_ID
-- ----------- -------------------- ------------------------- ---------- ---------- ------------------ -------------
-- 	201 Kanij		 Beni			   HR_REP	   17000 21-SEP-89			5
-- 	202 saniya		 Beni			   HR_REP	    9000 13-JAN-93			5
-- 	203 fatema		 Beni			   HR_MGR	    6500 03-JAN-90			5
-- 	204 rida		 Beni			   HR_REP	    6000 21-MAY-91			5
-- 	205 zikra		 Beni			   HR_REP	    4800 25-JUN-97			5
-- 	301 riza		 khanusiya		   IT_PROG	    4800 05-FEB-06		       60
-- 	302 jiya		 khanusiya		   IT_PROG	    4200 07-FEB-07		       60


-- ===== DEPARTMENT SUMMARY =====
-- Department ID  : 5
-- Employee Count : 5
-- Average Salary : 8660
-- Maximum Salary : 17000

-- ------------------------------------------------------------------------------------------------------------------