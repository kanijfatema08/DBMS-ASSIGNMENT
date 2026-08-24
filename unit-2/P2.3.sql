SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 4;
    v_balance NUMBER := v_roll_no * 500 + 5000;
    v_choice NUMBER := 1;
    v_withdraw NUMBER := 500;
    v_txns NUMBER := 0;
    v_total_withdrawn NUMBER := 0;
    v_count NUMBER := 0;

BEGIN

    LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE('======== ATM RECEIPT ========');

        IF v_choice = 1 THEN

            IF v_withdraw <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be > 0');

            ELSIF MOD(v_withdraw,100) <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Amount must be multiple of 100');

            ELSIF v_withdraw > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal is 10000');

            ELSIF v_withdraw > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance');

            ELSE
                v_balance := v_balance - v_withdraw;
                v_txns := v_txns + 1;
                v_total_withdrawn := v_total_withdrawn + v_withdraw;

                DBMS_OUTPUT.PUT_LINE('Withdrawal : ' || v_withdraw);
                DBMS_OUTPUT.PUT_LINE('Balance    : ' || v_balance);
            END IF;

        END IF;

        DBMS_OUTPUT.PUT_LINE('----------------------------------');

        EXIT WHEN v_choice = 3 OR v_balance = 0 OR v_count = 4;

        v_withdraw := v_withdraw + 500;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('======== FINAL SUMMARY ========');
    DBMS_OUTPUT.PUT_LINE('Transactions Done : ' || v_txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn   : ' || v_total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance   : ' || v_balance);
    DBMS_OUTPUT.PUT_LINE('==============================');
END;
/

-- --------------------------------------------------------------------------------
-- Output:
-- ======== ATM RECEIPT ========
-- Withdrawal : 500
-- Balance    : 6500
-- ------------------------------------
-- ======== ATM RECEIPT ========
-- Withdrawal : 1000
-- Balance    : 5500
-- ------------------------------------
-- ======== ATM RECEIPT ========
-- Withdrawal : 1500
-- Balance    : 4000
-- ------------------------------------
-- ======== ATM RECEIPT ========
-- Withdrawal : 2000
-- Balance    : 2000
-- ------------------------------------
-- ======== FINAL SUMMARY ========
-- Transactions Done : 4
-- Total Withdrawn   : 5000
-- Closing Balance   : 2000
-- ==============================
-- -----------------------------------------------------------------------------