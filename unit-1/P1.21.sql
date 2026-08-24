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


INSERT INTO employees VALUES (101, 'Kanij', 'Beni', 'HR_REP', 17000, TO_DATE('21-SEP-1989','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (102, 'saniya', 'Beni', 'HR_REP', 9000,  TO_DATE('13-JAN-1993','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (103, 'fatema', 'Beni', 'HR_MGR', 6500, TO_DATE('03-JAN-1990','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (104, 'rida', 'Beni', 'HR_REP', 6000,  TO_DATE('21-MAY-1991','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (105, 'zikra', 'Beni', 'HR_REP', 4800, TO_DATE('25-JUN-1997','DD-MON-YYYY'), 5);
INSERT INTO employees VALUES (106, 'riza', 'khanusiya', 'IT_PROG', 4800, TO_DATE('05-FEB-2006','DD-MON-YYYY'), 60);
INSERT INTO employees VALUES (107, 'jiya', 'khanusiya', 'IT_PROG', 4200, TO_DATE('07-FEB-2007','DD-MON-YYYY'), 60);

COMMIT;
SELECT * FROM employees;
DECLARE
    v_emp  employees%ROWTYPE;
    v_id   NUMBER := 104;
    v_da   NUMBER;
    v_hra  NUMBER;
    v_pf   NUMBER;
    v_net  NUMBER;
BEGIN
    SELECT * INTO v_emp FROM employees WHERE employee_id = v_id;

    v_da  := v_emp.salary * 0.40;
    v_hra := v_emp.salary * 0.20;
    v_pf  := v_emp.salary * 0.12;
    v_net := v_emp.salary + v_da + v_hra - v_pf;

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('LJ INSTITUTE - ' || TO_CHAR(SYSDATE,'Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE('Employee : ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID   : ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Basic Salary',20) || LPAD(TO_CHAR(v_emp.salary,'99,999.99'),20));
    DBMS_OUTPUT.PUT_LINE(RPAD('DA (40%)',20) || LPAD(TO_CHAR(v_da,'99,999.99'),20));
    DBMS_OUTPUT.PUT_LINE(RPAD('HRA (20%)',20) || LPAD(TO_CHAR(v_hra,'99,999.99'),20));
    DBMS_OUTPUT.PUT_LINE(RPAD('PF Deduction (12%)',20) || LPAD(TO_CHAR(-v_pf,'99,999.99'),20));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('NET PAY',20) || LPAD(TO_CHAR(v_net,'99,999.99'),20));
    DBMS_OUTPUT.PUT_LINE('========================================');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/

-- ------------------------------------------------------------
-- output:
-- EMPLOYEE_ID FIRST_NAME		 LAST_NAME		   JOB_ID	  SALARY HIRE_DATE	    DEPARTMENT_ID
-- ----------- -------------------- ------------------------- ---------- ---------- ------------------ -------------
-- 	101 Kanij		 Beni			   HR_REP	   17000 21-SEP-89			5
-- 	102 saniya		 Beni			   HR_REP	    9000 13-JAN-93			5
-- 	103 fatema		 Beni			   HR_MGR	    6500 03-JAN-90			5
-- 	104 rida		 Beni			   HR_REP	    6000 21-MAY-91			5
-- 	105 zikra		 Beni			   HR_REP	    4800 25-JUN-97			5
-- 	106 riza		 khanusiya		   IT_PROG	    4800 05-FEB-06		       60
-- 	107 jiya		 khanusiya		   IT_PROG	    4200 07-FEB-07		       60


-- ========================================
-- LJ INSTITUTE - August	 2026
-- ========================================
-- Employee : rida Beni
-- Job ID	 : HR_REP
-- ----------------------------------------
-- Basic Salary			6,000.00
-- DA (40%)			2,400.00
-- HRA (20%)			1,200.00
-- PF Deduction (12%)		 -720.00
-- ----------------------------------------
-- NET PAY 			8,880.00
-- ========================================
-- -------------------------------------------------------------