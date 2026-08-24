SET SERVEROUTPUT ON;

DECLARE
    c_gst_rate CONSTANT NUMBER := 18;
    base_price NUMBER;
    v_cgst NUMBER;
    v_total NUMBER;
    v_city VARCHAR2(50) := NULL;

BEGIN
    base_price := (4 * 500) + 1000;
    v_cgst := base_price * 9/100;
    v_total := base_price + v_cgst * 2;

    DBMS_OUTPUT.PUT_LINE('Base Price: ' || base_price);
    DBMS_OUTPUT.PUT_LINE('CGST: ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST: ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);

    DBMS_OUTPUT.PUT_LINE('NVL City: ' || NVL(v_city, 'Ahmedabad'));

    DBMS_OUTPUT.PUT_LINE(NVL2(v_city, 'City Known: ' || v_city, 'City Unknown'));
END;
/
/*
---------------------------------------------------
Output:
Base Price: 3000
CGST: 270
SGST: 270
Total: 3540
NVL City: Ahmedabad
City Unknown

PL/SQL procedure successfully completed.
------------------------------------------------------
*/