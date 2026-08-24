<<outer>>
DECLARE
    v_city  VARCHAR2(30) := 'Gujarat';
    v_num   NUMBER := 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----- OUTER BLOCK -----');
    DBMS_OUTPUT.PUT_LINE('v_city: ' || v_city);
    DBMS_OUTPUT.PUT_LINE('v_num : ' || v_num);

    <<middle>>
    DECLARE
        v_city  VARCHAR2(30) := 'Ahmedabad';  -- shadows outer
        v_num   NUMBER := 200;

    BEGIN
        DBMS_OUTPUT.PUT_LINE('----- MIDDLE BLOCK -----');
        DBMS_OUTPUT.PUT_LINE('v_city (middle): ' || v_city);
        DBMS_OUTPUT.PUT_LINE('v_num  (middle): ' || v_num);
        DBMS_OUTPUT.PUT_LINE('v_city (outer, accessed via label): ' || outer.v_city);
        DBMS_OUTPUT.PUT_LINE('v_num  (outer, accessed via label): ' || outer.v_num);

        <<inner>>
        DECLARE
            v_num  NUMBER := 300;

        BEGIN
            DBMS_OUTPUT.PUT_LINE('----- INNER BLOCK -----');
            DBMS_OUTPUT.PUT_LINE('v_city (from middle, visible here): ' || v_city);
            DBMS_OUTPUT.PUT_LINE('v_num  (inner): ' || v_num);
            DBMS_OUTPUT.PUT_LINE('v_num  (outer, accessed via label): ' || outer.v_num);
        END inner;
    END middle;

    DBMS_OUTPUT.PUT_LINE('----- BACK IN OUTER BLOCK -----');
    DBMS_OUTPUT.PUT_LINE('v_city (outer, still unchanged): ' || v_city);
    DBMS_OUTPUT.PUT_LINE('v_num  (outer, still unchanged): ' || v_num);
END outer;
/

-- ----------------------------------------------------------
-- Output:
-- ----- OUTER BLOCK -----
-- v_city: Gujarat
-- v_num : 100
-- ----- MIDDLE BLOCK -----
-- v_city (middle): Ahmedabad
-- v_num  (middle): 200
-- v_city (outer, accessed via label): Gujarat
-- v_num  (outer, accessed via label): 100
-- ----- INNER BLOCK -----
-- v_city (from middle, visible here): Ahmedabad
-- v_num  (inner): 300
-- v_num  (outer, accessed via label): 100
-- ----- BACK IN OUTER BLOCK -----
-- v_city (outer, still unchanged): Gujarat
-- v_num  (outer, still unchanged): 100

-- PL/SQL procedure successfully completed.
-- -------------------------------------------------------------

