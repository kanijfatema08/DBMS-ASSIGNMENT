SET SERVEROUTPUT ON;

DECLARE
    attendance_pct NUMBER := 75;
    theory_marks NUMBER := 50;
    practical_marks NUMBER := 25;
    assignment_marks NUMBER := 8;

    total NUMBER;
    percentage NUMBER;
    grade VARCHAR2(5);
    result VARCHAR2(30);
    remark VARCHAR2(50);
    
BEGIN

    DBMS_OUTPUT.PUT_LINE('======== STUDENT RESULT ========');

    IF attendance_pct < 40 THEN
        result := 'DETAINED';
        remark := 'Low Attendance';

    ELSIF theory_marks < 28 THEN
        result := 'FAIL in Theory';
        remark := 'Improve Theory Marks';

    ELSIF practical_marks < 12 THEN
        result := 'FAIL in Practical';
        remark := 'Improve Practical Marks';

    ELSE
        total := theory_marks + practical_marks +
                 LEAST(assignment_marks,10);

        percentage := total / 110 * 100;

        grade :=
            CASE
                WHEN percentage >= 90 THEN 'A+'
                WHEN percentage >= 80 THEN 'A'
                WHEN percentage >= 70 THEN 'B'
                WHEN percentage >= 60 THEN 'C'
                WHEN percentage >= 50 THEN 'D'
                ELSE 'F'
            END;

        result := 'PASS';
        remark := 'Good Performance';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Attendance : ' || attendance_pct || '%');
    DBMS_OUTPUT.PUT_LINE('Theory     : ' || theory_marks);
    DBMS_OUTPUT.PUT_LINE('Practical  : ' || practical_marks);
    DBMS_OUTPUT.PUT_LINE('Assignment : ' || assignment_marks);

    IF total IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Total      : ' || total);
        DBMS_OUTPUT.PUT_LINE('Percentage : ' || ROUND(percentage,2));
        DBMS_OUTPUT.PUT_LINE('Grade      : ' || grade);
    END IF;

    DBMS_OUTPUT.PUT_LINE('Result     : ' || result);
    DBMS_OUTPUT.PUT_LINE('Remark     : ' || remark);
    DBMS_OUTPUT.PUT_LINE('================================');
END;
/

-- -----------------------------------------------------------------
-- Output:
-- ======== STUDENT RESULT ========
-- Attendance : 75%
-- Theory	   : 50
-- Practical  : 25
-- Assignment : 8
-- Total	   : 83
-- Percentage : 75.45
-- Grade	   : B
-- Result	   : PASS
-- Remark	   : Good Performance
-- ================================
-- -------------------------------------------------------------------------
