DECLARE
    v_qty     NUMBER := 6;
    v_price   NUMBER := 800;
    v_coupon  NUMBER;
    v_gross   NUMBER;
    v_disc    NUMBER;
    v_total   NUMBER;
BEGIN
    v_gross := v_qty * v_price;

    -- BILL 1: no coupon (NULL)
    v_coupon := NULL;
    v_disc  := v_gross * NVL(v_coupon,0)/100;
    v_total := ROUND((v_gross - v_disc)*1.18);
    DBMS_OUTPUT.PUT_LINE('===== BILL 1 =====');
    DBMS_OUTPUT.PUT_LINE('Gross   : Rs.' || v_gross);
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon,'Coupon applied: '||v_coupon||'%','No coupon'));
    DBMS_OUTPUT.PUT_LINE('Taxable : Rs.' || (v_gross - v_disc));
    DBMS_OUTPUT.PUT_LINE('Final Total (incl. 9%CGST+9%SGST): Rs.' || v_total);

    -- BILL 2: coupon = 10%
    v_coupon := 10;
    v_disc  := v_gross * NVL(v_coupon,0)/100;
    v_total := ROUND((v_gross - v_disc)*1.18);
    DBMS_OUTPUT.PUT_LINE('===== BILL 2 =====');
    DBMS_OUTPUT.PUT_LINE('Gross   : Rs.' || v_gross);
    DBMS_OUTPUT.PUT_LINE(NVL2(v_coupon,'Coupon applied: '||v_coupon||'%','No coupon'));
    DBMS_OUTPUT.PUT_LINE('Taxable : Rs.' || (v_gross - v_disc));
    DBMS_OUTPUT.PUT_LINE('Final Total (incl. 9%CGST+9%SGST): Rs.' || v_total);
END;
/

-- -----------------------------------------------------------------------------------------------
-- output:

-- ===== BILL 1 =====
-- Gross	: Rs.4800
-- No coupon
-- Taxable : Rs.4800
-- Final Total (incl. 9%CGST+9%SGST): Rs.5664
-- ===== BILL 2 =====
-- Gross	: Rs.4800
-- Coupon applied: 10%
-- Taxable : Rs.4320
-- Final Total (incl. 9%CGST+9%SGST): Rs.5098
-- -------------------------------------------------------------------------------------------------------------