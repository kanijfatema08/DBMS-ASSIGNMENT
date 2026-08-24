SET SERVEROUTPUT ON;
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    salary NUMBER(10,2)
);

INSERT INTO employees VALUES (101, 'Kanijfatema', 17000);
INSERT INTO employees VALUES (102, 'Husain', 17000);
INSERT INTO employees VALUES (103, 'Saniya', 9000);
INSERT INTO employees VALUES (104, 'Sakib', 6000);
INSERT INTO employees VALUES (105, 'Noman', 4800);

COMMIT;

DECLARE
    v_fname employees.first_name%TYPE;
    v_sal employees.salary%TYPE;
    v_id NUMBER := 104;

BEGIN
    SELECT first_name, salary
    INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Employee ' || v_fname || ' earns Rs.' || v_sal || ' per month.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
END;
/
/*
---------------------------------------------------------------------
Output:
Employee Sakib earns Rs.6000 per month.

PL/SQL procedure successfully completed.
----------------------------------------------------------------------
*/