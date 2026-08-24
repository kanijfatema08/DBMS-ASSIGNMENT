<<bank>>
DECLARE
    v_total  NUMBER := 0;
BEGIN
    <<branch>>
    DECLARE
        v_branch  VARCHAR2(30) := 'Ahmedabad';
        v_dep     NUMBER := 4000;
    BEGIN
        bank.v_total := bank.v_total + v_dep;

        <<counter>>
        DECLARE
            v_token  NUMBER := 1;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('LJ Bank | ' || v_branch || ' | Token ' || v_token);
        END counter;
    END branch;

    DBMS_OUTPUT.PUT_LINE('Bank Total Deposit: ' || bank.v_total);
END bank;
/

-- ---------------------------------------------------------------------
-- Output:
-- LJ Bank | Ahmedabad | Token 1
-- Bank Total Deposit: 4000

-- -------------------------------------------------------------------