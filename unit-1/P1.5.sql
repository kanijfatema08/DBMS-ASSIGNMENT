SET linesize 250;
CREATE TABLE employees (
    employee_id    NUMBER(6) PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(25),
    job_id         VARCHAR2(10),
    salary         NUMBER(8,2),
    hire_date      DATE,
    department_id  NUMBER(4)
);

INSERT INTO employees VALUES (101, 'Kanij', 'Beni', 'AD_PRES', 24000, TO_DATE('17-JUN-1987','DD-MON-YYYY'), 90);
INSERT INTO employees VALUES (102, 'saniya', 'Beni', 'AD_VP', 17000, TO_DATE('13-JAN-1993','DD-MON-YYYY'), 90);
INSERT INTO employees VALUES (103, 'fatema', 'Beni', 'IT_PROG', 9000, TO_DATE('03-JAN-1990','DD-MON-YYYY'), 60);
INSERT INTO employees VALUES (104, 'Rida', 'Beni', 'IT_PROG', 6000, TO_DATE('21-MAY-1991','DD-MON-YYYY'), 60);
INSERT INTO employees VALUES (105, 'Zikra', 'Beni', 'IT_PROG', 4800, TO_DATE('25-JUN-1997','DD-MON-YYYY'), 60);

COMMIT;
SELECT * FROM employees;

DECLARE
    v_roll_no  NUMBER := 4;
    v_emp_id   NUMBER;
    v_emp      employees%ROWTYPE;
    v_yrs      NUMBER;
BEGIN
    v_emp_id := 100 + MOD(v_roll_no, 9) + 1;

    SELECT * INTO v_emp
    FROM employees
    WHERE employee_id = v_emp_id;

    v_yrs := TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12);

    DBMS_OUTPUT.PUT_LINE('===== EMPLOYEE PROFILE CARD =====');
    DBMS_OUTPUT.PUT_LINE('Name         : ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID       : ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_emp.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary:Rs.   : ' || TO_CHAR(v_emp.salary));
    DBMS_OUTPUT.PUT_LINE('Hire Date    : ' || TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Experience   : ' || v_yrs || ' years');

    IF v_yrs > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Status       : Senior Employee');
    END IF;

    DBMS_OUTPUT.PUT_LINE('==================================');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
END;
/

/*
---------------------------------------------------------
Output:

EMPLOYEE_ID FIRST_NAME		 LAST_NAME		   JOB_ID	  SALARY HIRE_DATE	    DEPARTMENT_ID
----------- -------------------- ------------------------- ---------- ---------- ------------------ -------------
	101 Kanij		 Beni			   AD_PRES	   24000 17-JUN-87		       90
	102 saniya		 Beni			   AD_VP	   17000 13-JAN-93		       90
	103 fatema		 Beni			   IT_PROG	    9000 03-JAN-90		       60
	104 Rida		 Beni			   IT_PROG	    6000 21-MAY-91		       60
	105 Zikra		 Beni			   IT_PROG	    4800 25-JUN-97		       60
===== EMPLOYEE PROFILE CARD =====
Name	     : Zikra Beni
Job ID	     : IT_PROG
Department ID: 60
Salary:Rs.   : 4800
Hire Date    : 25-JUN-1997
Experience   : 29 years
Status	     : Senior Employee
==================================
---------------------------------------------------------------
*/