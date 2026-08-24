DECLARE
    v_m1 NUMBER := 64;
    v_m2 NUMBER := 64;
    v_m3 NUMBER := 64;
    v_m4 NUMBER := 64;
    v_m5 NUMBER := NULL;   -- absent
    v_total   NUMBER;
    v_pct     NUMBER;
    v_passed  BOOLEAN;
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    v_pct   := ROUND(v_total/500*100, 2);
    v_passed := (v_pct >= 40);

    -- Note: BOOLEAN cannot be passed directly to DBMS_OUTPUT.PUT_LINE,
    -- so we use CASE to convert it to text first.
    DBMS_OUTPUT.PUT_LINE('Total      : ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_pct || '%');
    DBMS_OUTPUT.PUT_LINE('Result     : ' || CASE WHEN v_passed THEN 'PASS' ELSE 'FAIL' END);
END;
/

-- -----------------------------------------------------------------
-- output:
-- Total	   : 256
-- Percentage : 51.2%
-- Result	   : PASS
-- ------------------------------------------------------------------