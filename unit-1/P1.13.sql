DECLARE
    v_amt   NUMBER := 1548;
    v_n500  NUMBER;
    v_n200  NUMBER;
    v_n100  NUMBER;
    v_rem   NUMBER;
BEGIN
    v_n500 := TRUNC(v_amt/500);
    v_rem  := MOD(v_amt,500);

    v_n200 := TRUNC(v_rem/200);
    v_rem  := MOD(v_rem,200);

    v_n100 := TRUNC(v_rem/100);
    v_rem  := MOD(v_rem,100);

    DBMS_OUTPUT.PUT_LINE('===== ATM NOTE BREAKUP =====');
    DBMS_OUTPUT.PUT_LINE('Amount        : Rs.' || v_amt);
    DBMS_OUTPUT.PUT_LINE('Rs.500 notes  : ' || v_n500);
    DBMS_OUTPUT.PUT_LINE('Rs.200 notes  : ' || v_n200);
    DBMS_OUTPUT.PUT_LINE('Rs.100 notes  : ' || v_n100);
    DBMS_OUTPUT.PUT_LINE('Undispensed   : Rs.' || v_rem);
END;
/

-- -------------------------------------------------------------------
-- Output:
-- ===== ATM NOTE BREAKUP =====
-- Amount	      : Rs.1548
-- Rs.500 notes  : 3
-- Rs.200 notes  : 0
-- Rs.100 notes  : 0
-- Undispensed   : Rs.48
-- -------------------------------------------------------------------