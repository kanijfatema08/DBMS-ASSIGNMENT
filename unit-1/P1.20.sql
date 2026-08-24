DECLARE
    v_roll   NUMBER := 4;
    v_pname  VARCHAR2(50) := 'Kanijfatema Beni';
    v_dob    DATE := TO_DATE('08-MAY-2008','DD-MON-YYYY');
    v_pnr    VARCHAR2(20);
    v_jdate  DATE;
    v_fare   NUMBER;
    v_age    NUMBER;
    v_final  NUMBER;
BEGIN
    v_pnr   := 'GJ' || TO_CHAR(SYSDATE,'YYMM') || LPAD(v_roll,4,'0');
    v_jdate := SYSDATE + (MOD(v_roll,30) + 1);
    v_fare  := v_roll*50 + 200;
    v_age   := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob)/12);

    IF v_age >= 60 THEN
        v_final := v_fare * 0.60;
    ELSE
        v_final := v_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE('============ IRCTC TICKET ============');
    DBMS_OUTPUT.PUT_LINE(RPAD('PNR:',16) || v_pnr);
    DBMS_OUTPUT.PUT_LINE(RPAD('Passenger:',16) || v_pname);
    DBMS_OUTPUT.PUT_LINE(RPAD('Age:',16) || v_age);
    DBMS_OUTPUT.PUT_LINE(RPAD('Journey Date:',16) || TO_CHAR(v_jdate,'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Fare:',16) || 'Rs.' || v_fare);
    DBMS_OUTPUT.PUT_LINE(RPAD('Final Fare:',16) || 'Rs.' || v_final);
    DBMS_OUTPUT.PUT_LINE('=======================================');
END;
/

-- -------------------------------------------------------------------
-- Output:
-- ============ IRCTC TICKET ============
-- PNR:		GJ26080004
-- Passenger:	Kanijfatema Beni
-- Age:		18
-- Journey Date:	Thursday , 27-AUG-2026
-- Base Fare:	Rs.400
-- Final Fare:	Rs.400
-- =======================================
-- ---------------------------------------------------------------------