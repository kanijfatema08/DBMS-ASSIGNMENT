SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'Kanijfatema';
    v_marks NUMBER(5,2) := 420;
    v_percentage NUMBER(5,2);
    v_dob DATE := SYSDATE;
    v_passed BOOLEAN;
BEGIN
    v_percentage := ROUND((v_marks / 500) * 100, 2);

    IF v_percentage >= 40 THEN
        v_passed := TRUE;
    ELSE
        v_passed := FALSE;
    END IF;

    DBMS_OUTPUT.PUT_LINE( 'Name: ' || v_name ||' | Marks: ' || v_marks ||' | Percentage: ' || v_percentage);

    DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || TO_CHAR(v_dob, 'DD-MM-YYYY'));

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('FAIL');
    END IF;
END;
/

/*
--------------------------------------------------------------------
Output:

Name: Kanijfatema | Marks: 420 | Percentage: 84
Today's Date: 22-08-2026
PASS

PL/SQL procedure successfully completed.

-----------------------------------------------------------------------
*/
