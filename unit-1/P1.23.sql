SET SERVEROUTPUT ON;

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    salary NUMBER
);

INSERT INTO employees VALUES (100, 'Kanij', 17000);
INSERT INTO employees VALUES (101, 'Saniya', 15000);
INSERT INTO employees VALUES (102, 'Jiya', 12000);
INSERT INTO employees VALUES (103, 'Seza', 14000);
INSERT INTO employees VALUES (104, 'Aani', 16000);

DECLARE
    v_name VARCHAR2(50) := 'Kanij';
    v_fname VARCHAR2(50);

    c_bonus_rate CONSTANT NUMBER := 0.1;

    v_sal NUMBER := 4 * 1000 + 20000;
    v_bonus NUMBER;
BEGIN
    v_bonus := v_sal * c_bonus_rate;

    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 101;

    DBMS_OUTPUT.PUT_LINE('======== BONUS REPORT ========');
    DBMS_OUTPUT.PUT_LINE('Name  : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Bonus : ' || v_bonus);
    DBMS_OUTPUT.PUT_LINE('==============================');
END;
/
-- ------------------------------------------------------------------
-- Output:
-- ======== BONUS REPORT ========
-- Name  : Kanij
-- Salary: 24000
-- Bonus : 2400
-- ==============================
-- -------------------------------------------------------------------