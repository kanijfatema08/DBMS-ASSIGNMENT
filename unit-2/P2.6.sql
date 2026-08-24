SET SERVEROUTPUT ON;

DECLARE
    food_total NUMBER := 350;
    distance NUMBER := 5;

    rain CHAR(1) := 'Y';
    late_night CHAR(1) := 'N';
    festival_day CHAR(1) := 'N';
    peak_hour CHAR(1) := 'N';
    first_order CHAR(1) := 'N';

    base_charge NUMBER;
    rain_charge NUMBER := 0;
    late_charge NUMBER := 0;
    festival_charge NUMBER := 0;
    peak_charge NUMBER := 0;
    discount NUMBER := 0;
    final_delivery NUMBER;
    grand_total NUMBER;
    
BEGIN

    IF distance < 3 THEN
        base_charge := 0;
    ELSIF distance <= 8 THEN
        base_charge := 29;
    ELSIF distance <= 15 THEN
        base_charge := 49;
    ELSE
        base_charge := 79;
    END IF;

    rain_charge :=
        CASE
            WHEN rain = 'Y' THEN base_charge * 0.20
            ELSE 0
        END;

    late_charge :=
        CASE
            WHEN late_night = 'Y' THEN base_charge * 0.15
            ELSE 0
        END;

    festival_charge :=
        CASE
            WHEN festival_day = 'Y' THEN base_charge * 0.10
            ELSE 0
        END;

    peak_charge :=
        CASE
            WHEN peak_hour = 'Y' THEN base_charge * 0.10
            ELSE 0
        END;

    final_delivery := base_charge + rain_charge + late_charge +
                      festival_charge + peak_charge;

    IF food_total > 499 THEN
        final_delivery := 0;
    ELSIF first_order = 'Y' THEN
        discount := final_delivery * 0.50;
        final_delivery := final_delivery - discount;
    END IF;

    grand_total := food_total + final_delivery;

    DBMS_OUTPUT.PUT_LINE('======== ZOMATO BILL ========');
    DBMS_OUTPUT.PUT_LINE('Food Total       : Rs.' || food_total);
    DBMS_OUTPUT.PUT_LINE('Base Charge      : Rs.' || ROUND(base_charge));
    DBMS_OUTPUT.PUT_LINE('Rain Surcharge   : Rs.' || ROUND(rain_charge));
    DBMS_OUTPUT.PUT_LINE('Late Night       : Rs.' || ROUND(late_charge));
    DBMS_OUTPUT.PUT_LINE('Festival         : Rs.' || ROUND(festival_charge));
    DBMS_OUTPUT.PUT_LINE('Peak Hour        : Rs.' || ROUND(peak_charge));
    DBMS_OUTPUT.PUT_LINE('Discount         : Rs.' || ROUND(discount));
    DBMS_OUTPUT.PUT_LINE('Final Delivery   : Rs.' || ROUND(final_delivery));
    DBMS_OUTPUT.PUT_LINE('Grand Total      : Rs.' || ROUND(grand_total));
    DBMS_OUTPUT.PUT_LINE('=============================');
END;
/

-- ---------------------------------------------------------------------
-- Output:
-- ======== ZOMATO BILL ========
-- Food Total	 : Rs.350
-- Base Charge	 : Rs.29
-- Rain Surcharge	 : Rs.6
-- Late Night	 : Rs.0
-- Festival	 : Rs.0
-- Peak Hour	 : Rs.0
-- Discount	 : Rs.0
-- Final Delivery	 : Rs.35
-- Grand Total	 : Rs.385
-- =============================
-- -------------------------------------------------------------------------------
