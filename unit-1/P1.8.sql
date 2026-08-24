DECLARE
    v_name    VARCHAR2(50) := 'Kanijfatema Beni';
    v_roll    NUMBER := 4;
    v_dob     DATE := TO_DATE('08-MAY-2008', 'DD-MON-YYYY');

    v_upper   VARCHAR2(50);
    v_first   VARCHAR2(50);
    v_last    VARCHAR2(50);
    v_id      VARCHAR2(20);
    v_age     NUMBER;
BEGIN
    v_upper := UPPER(v_name);

    v_first := SUBSTR(v_upper, 1, INSTR(v_upper, ' ') - 1);
    v_last  := SUBSTR(v_upper, INSTR(v_upper, ' ') + 1);

    IF LENGTH(v_name) > 20 THEN
        v_last := SUBSTR(v_last, 1, 1) || '.';
    END IF;

    v_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll, 3, '0');

    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('LJ Institute of Computer Application', 40));
    DBMS_OUTPUT.PUT_LINE('========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Name', 15) || ': ' || v_upper);
    DBMS_OUTPUT.PUT_LINE(RPAD('First Name', 15) || ': ' || v_first);
    DBMS_OUTPUT.PUT_LINE(RPAD('Last Name', 15) || ': ' || v_last);
    DBMS_OUTPUT.PUT_LINE(RPAD('Student ID', 15) || ': ' || v_id);
    DBMS_OUTPUT.PUT_LINE(RPAD('DOB', 15) || ': ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Age', 15) || ': ' || v_age || ' years');
    DBMS_OUTPUT.PUT_LINE(RPAD('Roll No', 15) || ': ' || LPAD(v_roll, 3, '0'));
    DBMS_OUTPUT.PUT_LINE('========================================');
END;
/

-- -----------------------------------------------------------
-- Output:
-- ========================================
-- LJ Institute of Computer Application
-- ========================================
-- Name	       : KANIJFATEMA BENI
-- First Name     : KANIJFATEMA
-- Last Name      : BENI
-- Student ID     : LJICA2008004
-- DOB	       : 08-MAY-2008
-- Age	       : 18 years
-- Roll No        : 004
-- ========================================
-- --------------------------------------------------------------