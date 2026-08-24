DECLARE
    c_gst     CONSTANT NUMBER := 18;
    v_plan_name  VARCHAR2(30) := 'Jio Recharge Plan';
    v_plan    NUMBER := 199;
    v_gst     NUMBER;
    v_total   NUMBER;
BEGIN
    v_gst   := v_plan * c_gst/100;
    v_total := v_plan + v_gst;

    DBMS_OUTPUT.PUT_LINE('===== RECHARGE RECEIPT =====');
    DBMS_OUTPUT.PUT_LINE(RPAD('Plan Name:',15) || v_plan_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Price:',15) || TO_CHAR(v_plan,'99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('GST @18%:',15) || TO_CHAR(v_gst,'99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Total:',15) || TO_CHAR(v_total,'99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Valid Until:',15) || TO_CHAR(SYSDATE+28,'DD-MON-YYYY'));
END;
/

-- ------------------------------------------------------------------------------------
-- Output:
-- ===== RECHARGE RECEIPT =====
-- Plan Name:     Jio Recharge Plan
-- Base Price:	   199.00
-- GST @18%:	    35.82
-- Total:		   234.82
-- Valid Until:   19-SEP-2026
-- -------------------------------------------------------------------------------------