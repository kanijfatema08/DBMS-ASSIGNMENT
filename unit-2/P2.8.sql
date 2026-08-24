SET SERVEROUTPUT ON;

DECLARE
    monthly_salary NUMBER := 50000;
    existing_emi NUMBER := 5000;
    loan_amount NUMBER := 1000000;
    annual_rate NUMBER := 12;
    tenure_months NUMBER := 60;

    r NUMBER;
    emi NUMBER;
    foir_limit NUMBER;
    approved_amount NUMBER;
    decision VARCHAR2(20);
BEGIN
    r := annual_rate / 12 / 100;

    foir_limit := monthly_salary * 0.40;

    approved_amount := loan_amount;

    emi := approved_amount * r * POWER(1+r,tenure_months) /
           (POWER(1+r,tenure_months)-1);

    WHILE emi + existing_emi > foir_limit LOOP
        approved_amount := approved_amount - 10000;

        emi := approved_amount * r * POWER(1+r,tenure_months) /
               (POWER(1+r,tenure_months)-1);
    END LOOP;

    decision :=
        CASE
            WHEN monthly_salary < 25000 THEN 'REJECTED'
            WHEN approved_amount = loan_amount THEN 'APPROVED'
            WHEN approved_amount > 0 THEN 'CONDITIONAL'
            ELSE 'REJECTED'
        END;

    DBMS_OUTPUT.PUT_LINE('======== LOAN EMI REPORT ========');
    DBMS_OUTPUT.PUT_LINE('Monthly Salary  : Rs.' || monthly_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI    : Rs.' || existing_emi);
    DBMS_OUTPUT.PUT_LINE('Loan Amount     : Rs.' || loan_amount);
    DBMS_OUTPUT.PUT_LINE('Calculated EMI  : Rs.' || ROUND(emi));
    DBMS_OUTPUT.PUT_LINE('FOIR Limit      : Rs.' || ROUND(foir_limit));
    DBMS_OUTPUT.PUT_LINE('Approved Amount : Rs.' || approved_amount);
    DBMS_OUTPUT.PUT_LINE('Decision        : ' || decision);
    DBMS_OUTPUT.PUT_LINE('Monthly Cost    : Rs.' || ROUND(existing_emi + emi));
    DBMS_OUTPUT.PUT_LINE('=================================');
END;
/

-- ---------------------------------------------------------------------------
-- Output:
-- ======== LOAN EMI REPORT ========
-- Monthly Salary	: Rs.50000
-- Existing EMI	: Rs.5000
-- Loan Amount	: Rs.1000000
-- Calculated EMI	: Rs.14904
-- FOIR Limit	: Rs.20000
-- Approved Amount : Rs.670000
-- Decision	: CONDITIONAL
-- Monthly Cost	: Rs.19904
-- =================================
-- ----------------------------------------------------------------------------
