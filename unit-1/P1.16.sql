set linesize 250;
CREATE TABLE departments (
    department_id    NUMBER(4) PRIMARY KEY,
    department_name  VARCHAR2(30),
    location_id      NUMBER(4)
);

INSERT INTO departments VALUES (10, 'Administration', 1700);
INSERT INTO departments VALUES (20, 'Marketing', 1800);
INSERT INTO departments VALUES (30, 'Purchasing', 1700);
INSERT INTO departments VALUES (40, 'Human Resources', 2400);
INSERT INTO departments VALUES (50, 'Shipping', 1500);
INSERT INTO departments VALUES (60, 'IT', 1400);
INSERT INTO departments VALUES (70, 'Public Relations', 2700);
INSERT INTO departments VALUES (80, 'Sales', 2500);
INSERT INTO departments VALUES (90, 'Executive', 1700);

COMMIT;
Select * from departments;


DECLARE
    v_dname departments.department_name%TYPE;
    v_loc   departments.location_id%TYPE;
    v_id    NUMBER := 70;   -- ((roll_no+2) MOD 11 + 1) * 10 = ((4+2) MOD 11 + 1) * 10 = 70
BEGIN
    SELECT department_name, location_id
    INTO v_dname, v_loc
    FROM departments
    WHERE department_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Dept ' || v_id || ': ' || v_dname || ' at location ' || v_loc);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department not found.');
END;
/

-- -------------------------------------------------------------------------
-- Output:

-- DEPARTMENT_ID DEPARTMENT_NAME		     LOCATION_ID
-- ------------- ------------------------------ -----------
-- 	   10 Administration			    1700
-- 	   20 Marketing 			    1800
-- 	   30 Purchasing			    1700
-- 	   40 Human Resources			    2400
-- 	   50 Shipping				    1500
-- 	   60 IT				    1400
-- 	   70 Public Relations			    2700
-- 	   80 Sales				    2500
-- 	   90 Executive 			    1700

-- Dept 70: Public Relations at location 2700
-- ------------------------------------------------------------------
