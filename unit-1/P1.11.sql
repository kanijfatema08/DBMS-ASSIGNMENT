DECLARE
    v_n NUMBER := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Today : ' || TO_CHAR(SYSDATE,'Day, DD "th" Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('Date after N months : ' || TO_CHAR(ADD_MONTHS(SYSDATE, v_n), 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Last day of month: ' || TO_CHAR(LAST_DAY(SYSDATE), 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Next Monday : ' || TO_CHAR(NEXT_DAY(SYSDATE,'MONDAY'), 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Days left in month: ' || TRUNC(LAST_DAY(SYSDATE) - SYSDATE) || ' days left');
END;
/

-- ----------------------------------------------------------------------------------------------
-- Output:
-- Today : Saturday , 22 th August    2026
-- Date after N months : 22-JAN-2027
-- Last day of month: 31-AUG-2026
-- Next Monday : 24-AUG-2026
-- Days left in month: 9 days left

-- ----------------------------------------------------------------------------------------------------