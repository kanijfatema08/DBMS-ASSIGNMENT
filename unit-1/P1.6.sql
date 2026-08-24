DECLARE
    v_roll_no    NUMBER := 4;
    v_birth_mon  NUMBER := 5;   
    v_p          NUMBER;
    v_r          NUMBER;
    v_t          NUMBER := 3;
    v_si         NUMBER;
    v_ci         NUMBER;
    v_diff_pct   NUMBER;
BEGIN
    v_p := v_roll_no * 1000;
    v_r := v_birth_mon * 0.5 + 4;

    v_si := v_p * v_r * v_t / 100;
    v_ci := v_p * (POWER(1 + v_r/100, v_t)) - v_p;
    v_diff_pct := (v_ci - v_si) / v_si * 100;

    DBMS_OUTPUT.PUT_LINE('===== BANK INTEREST CALCULATOR =====');
    DBMS_OUTPUT.PUT_LINE('Principal        : Rs.' || TO_CHAR(v_p));
    DBMS_OUTPUT.PUT_LINE('Rate             : ' || v_r || '%');
    DBMS_OUTPUT.PUT_LINE('Years            : ' || v_t);
    DBMS_OUTPUT.PUT_LINE('Simple Interest  : Rs.' || TO_CHAR(v_si));
    DBMS_OUTPUT.PUT_LINE('Compound Interest: Rs.' || TO_CHAR(v_ci));
    DBMS_OUTPUT.PUT_LINE('SI Final Amount  : Rs.' || TO_CHAR(v_p + v_si));
    DBMS_OUTPUT.PUT_LINE('CI Final Amount  : Rs.' || TO_CHAR(v_p + v_ci));
    DBMS_OUTPUT.PUT_LINE('Difference (CI-SI): Rs.' || TO_CHAR(v_ci - v_si) || ' (' || TO_CHAR(v_diff_pct, '99.99') || '%)');

    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.');
    END IF;
END;
/

-- ------------------------------------------------------------------
-- Output:
-- ===== BANK INTEREST CALCULATOR =====
-- Principal	 : Rs.4000
-- Rate		 : 6.5%
-- Years		 : 3
-- Simple Interest  : Rs.780
-- Compound Interest: Rs.831.7985
-- SI Final Amount  : Rs.4780
-- CI Final Amount  : Rs.4831.7985
-- Difference (CI-SI): Rs.51.7985 (  6.64%)
-- ---------------------------------------------------------------------