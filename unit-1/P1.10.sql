DECLARE
    v_c   NUMBER := 29;
    v_f   NUMBER;
    v_k   NUMBER;
    v_f2  NUMBER := 98.6;
    v_c2  NUMBER;
BEGIN
    v_f := ROUND(v_c * 9/5 + 32, 1);
    v_k := v_c + 273.15;
    v_c2 := (v_f2 - 32) * 5/9;

    DBMS_OUTPUT.PUT_LINE('Celsius    : ' || v_c);
    DBMS_OUTPUT.PUT_LINE('Fahrenheit : ' || v_f);
    DBMS_OUTPUT.PUT_LINE('Kelvin     : ' || v_k);
    DBMS_OUTPUT.PUT_LINE('Reverse check -> F=' || v_f2 || ' => C=' || ROUND(v_c2,1));
END;
/

-- -------------------------------------------------------------------------------------------------
-- Output:
-- Celsius    : 29
-- Fahrenheit : 84.2
-- Kelvin	   : 302.15
-- Reverse check -> F=98.6 => C=37

-- -----------------------------------------------------------------------------------------------------