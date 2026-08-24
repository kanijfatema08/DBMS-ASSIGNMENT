SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 4;
    v_table NUMBER;
    v_height NUMBER;
BEGIN
    -- Part A
    v_table := MOD(v_roll_no,9) + 2;

    DBMS_OUTPUT.PUT_LINE('======== TABLE OF ' || v_table || ' ========');

    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(v_table || ' x ' || i || ' = ' || v_table*i);
    END LOOP;

    -- Part B
    DBMS_OUTPUT.PUT_LINE('======== TABLES 2 TO 5 ========');

    FOR n IN 2..5 LOOP
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(LPAD(n || ' x ' || i || ' = ' || n*i,15));
        END LOOP;
    END LOOP;

    -- Part C
    v_height := 5 + MOD(v_roll_no,5);

    DBMS_OUTPUT.PUT_LINE('======== STAR TRIANGLE ========');

    FOR i IN 1..v_height LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT('*');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

    -- Part D
    DBMS_OUTPUT.PUT_LINE('======== NUMBER PYRAMID ========');

    FOR i IN 1..6 LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT(j);
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

    -- Part E
    DBMS_OUTPUT.PUT_LINE('======== REVERSE TRIANGLE ========');

    FOR i IN REVERSE 1..v_height LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT('*');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
/

-- ---------------------------------------------------------------------------
-- Output:
-- ======== TABLE OF 6 ========
-- 6 x 1 = 6
-- 6 x 2 = 12
-- 6 x 3 = 18
-- 6 x 4 = 24
-- 6 x 5 = 30
-- 6 x 6 = 36
-- 6 x 7 = 42
-- 6 x 8 = 48
-- 6 x 9 = 54
-- 6 x 10 = 60
-- 6 x 11 = 66
-- 6 x 12 = 72
-- 6 x 13 = 78
-- 6 x 14 = 84
-- 6 x 15 = 90
-- 6 x 16 = 96
-- 6 x 17 = 102
-- 6 x 18 = 108
-- 6 x 19 = 114
-- 6 x 20 = 120
-- ======== TABLES 2 TO 5 ========
-- 2 x 1 = 2
-- 2 x 2 = 4
-- 2 x 3 = 6
-- 2 x 4 = 8
-- 2 x 5 = 10
-- 2 x 6 = 12
-- 2 x 7 = 14
-- 2 x 8 = 16
-- 2 x 9 = 18
-- 2 x 10 = 20
-- 3 x 1 = 3
-- 3 x 2 = 6
-- 3 x 3 = 9
-- 3 x 4 = 12
-- 3 x 5 = 15
-- 3 x 6 = 18
-- 3 x 7 = 21
-- 3 x 8 = 24
-- 3 x 9 = 27
-- 3 x 10 = 30
-- 4 x 1 = 4
-- 4 x 2 = 8
-- 4 x 3 = 12
-- 4 x 4 = 16
-- 4 x 5 = 20
-- 4 x 6 = 24
-- 4 x 7 = 28
-- 4 x 8 = 32
-- 4 x 9 = 36
-- 4 x 10 = 40
-- 5 x 1 = 5
-- 5 x 2 = 10
-- 5 x 3 = 15
-- 5 x 4 = 20
-- 5 x 5 = 25
-- 5 x 6 = 30
-- 5 x 7 = 35
-- 5 x 8 = 40
-- 5 x 9 = 45
-- 5 x 10 = 50
-- ======== STAR TRIANGLE ========
-- *
-- **
-- ***
-- ****
-- *****
-- ******
-- *******
-- ********
-- *********
-- ======== NUMBER PYRAMID ========
-- 1
-- 12
-- 123
-- 1234
-- 12345
-- 123456
-- ======== REVERSE TRIANGLE ========
-- *********
-- ********
-- *******
-- ******
-- *****
-- ****
-- ***
-- **
-- *
-- ---------------------------------------------------------------------
