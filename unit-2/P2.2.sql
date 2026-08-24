SET SERVEROUTPUT ON;

DECLARE
    gross_salary NUMBER := 500000;
    taxable_income NUMBER;
    tax NUMBER;
    monthly_tds NUMBER;
    take_home NUMBER;

BEGIN

    taxable_income := gross_salary - 75000;

    tax :=
        CASE
            WHEN taxable_income <= 300000 THEN 0
            WHEN taxable_income <= 700000 THEN
                (taxable_income - 300000) * 0.05
            WHEN taxable_income <= 1000000 THEN
                20000 + (taxable_income - 700000) * 0.10
            WHEN taxable_income <= 1200000 THEN
                50000 + (taxable_income - 1000000) * 0.15
            WHEN taxable_income <= 1500000 THEN
                80000 + (taxable_income - 1200000) * 0.20
            ELSE
                140000 + (taxable_income - 1500000) * 0.30
        END;

    monthly_tds := tax / 12;
    take_home := gross_salary - tax;

    DBMS_OUTPUT.PUT_LINE('======== INCOME TAX REPORT ========');
    DBMS_OUTPUT.PUT_LINE('Gross Salary     : ' || gross_salary);
    DBMS_OUTPUT.PUT_LINE('Taxable Income   : ' || taxable_income);
    DBMS_OUTPUT.PUT_LINE('Total Tax        : ' || tax);
    DBMS_OUTPUT.PUT_LINE('Monthly TDS      : ' || ROUND(monthly_tds));
    DBMS_OUTPUT.PUT_LINE('Take Home Salary : ' || ROUND(take_home / 12));
    DBMS_OUTPUT.PUT_LINE('===================================');

    IF tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No tax this year - save more with PPF/ELSS!');
    END IF;
END;
/

-- ----------------------------------------------------------------------
-- Output:
-- ======== INCOME TAX REPORT ========
-- Gross Salary	 : 500000
-- Taxable Income	 : 425000
-- Total Tax	 : 6250
-- Monthly TDS	 : 521
-- Take Home Salary : 41146
-- ===================================
-- ----------------------------------------------------------------------