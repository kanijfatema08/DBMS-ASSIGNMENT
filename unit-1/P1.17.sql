DECLARE
    v_p            NUMBER := 90000;
    v_annual_rate  NUMBER := 9;
    v_years        NUMBER := 5;
    v_r            NUMBER;
    v_n            NUMBER;
    v_emi          NUMBER;
    v_total_pay    NUMBER;
    v_total_int    NUMBER;
    v_int_pct      NUMBER;
BEGIN
    v_r := v_annual_rate/12/100;
    v_n := v_years*12;

    v_emi := ROUND(v_p * v_r * POWER(1+v_r,v_n) / (POWER(1+v_r,v_n) - 1), 2);
    v_total_pay := v_emi * v_n;
    v_total_int := v_total_pay - v_p;
    v_int_pct   := ROUND(v_total_int/v_total_pay*100,2);

    DBMS_OUTPUT.PUT_LINE('===== HOME LOAN EMI CALCULATOR =====');
    DBMS_OUTPUT.PUT_LINE('Principal      : Rs.' || TO_CHAR(v_p,'99,99,999'));
    DBMS_OUTPUT.PUT_LINE('Monthly EMI    : Rs.' || TO_CHAR(v_emi,'99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total Payment  : Rs.' || TO_CHAR(v_total_pay,'99,99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Total Interest : Rs.' || TO_CHAR(v_total_int,'99,99,999.99'));
    DBMS_OUTPUT.PUT_LINE('Interest = ' || v_int_pct || '% of total payment');
END;
/

-- ---------------------------------------------------------------------------------
-- Output:
-- ===== HOME LOAN EMI CALCULATOR =====
-- Principal      : Rs.	90,000
-- Monthly EMI    : Rs.  1,868.25
-- Total Payment  : Rs.  1,12,095.00
-- Total Interest : Rs.	22,095.00
-- Interest = 19.71% of total payment

-- ----------------------------------------------------------------------------------