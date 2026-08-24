SET SERVEROUTPUT ON;

DECLARE
    m1 NUMBER := 75;
    m2 NUMBER := 68;
    m3 NUMBER := 82;
    m4 NUMBER := 70;
    m5 NUMBER := 78;

    total NUMBER;
    percentage NUMBER;
    grade VARCHAR2(5);
    result VARCHAR2(30);
    
BEGIN

    total := m1 + m2 + m3 + m4 + m5;
    percentage := total / 5;

    IF m1 < 35 OR m2 < 35 OR m3 < 35 OR m4 < 35 OR m5 < 35 THEN
        result := 'DETAINED';
    ELSE
        IF percentage >= 75 THEN
            result := 'DISTINCTION';
        ELSIF percentage >= 60 THEN
            result := 'FIRST CLASS';
        ELSIF percentage >= 50 THEN
            result := 'SECOND CLASS';
        ELSE
            result := 'PASS';
        END IF;
    END IF;

    IF percentage >= 90 THEN
        grade := 'A+';
    ELSIF percentage >= 80 THEN
        grade := 'A';
    ELSIF percentage >= 70 THEN
        grade := 'B';
    ELSIF percentage >= 60 THEN
        grade := 'C';
    ELSIF percentage >= 50 THEN
        grade := 'D';
    ELSE
        grade := 'FAIL';
    END IF;

    DBMS_OUTPUT.PUT_LINE('======Report Card======');
    DBMS_OUTPUT.PUT_LINE('Subject 1: ' || m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2: ' || m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3: ' || m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4: ' || m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5: ' || m5);
    DBMS_OUTPUT.PUT_LINE('Total: ' || total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || percentage);
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
    DBMS_OUTPUT.PUT_LINE('========================');
END;
/
/*
-----------------------------------------------------------------------------
Output:
======Report Card======
Subject 1: 75
Subject 2: 68
Subject 3: 82
Subject 4: 70
Subject 5: 78
Total: 373
Percentage: 74.6
Grade: B
Result: FIRST CLASS
========================

-------------------------------------------------------------------------------
*/
