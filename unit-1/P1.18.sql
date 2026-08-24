SET DEFINE OFF;

DECLARE
    v_raw VARCHAR2(100) := 'kanij Beni';
    v_clean  VARCHAR2(100);
    v_first  VARCHAR2(50);
    v_last   VARCHAR2(50);
    v_email  VARCHAR2(100);
BEGIN
    v_clean := INITCAP(REPLACE(REPLACE(TRIM(v_raw),'  ',' '),'  ',' '));

    v_first := SUBSTR(v_clean,1,INSTR(v_clean,' ')-1);
    v_last  := SUBSTR(v_clean,INSTR(v_clean,' ')+1);

    v_email := LOWER(v_first||'.'||v_last||'@ljku.edu.in');

    DBMS_OUTPUT.PUT_LINE('Raw Name      : "' || v_raw || '"');
    DBMS_OUTPUT.PUT_LINE('Cleaned Name  : ' || v_clean);
    DBMS_OUTPUT.PUT_LINE('First Name    : ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Last Name     : ' || v_last);
    DBMS_OUTPUT.PUT_LINE('Email         : ' || v_email);
    DBMS_OUTPUT.PUT_LINE('Length before : ' || LENGTH(v_raw) || ', after: ' || LENGTH(v_clean));
END;
/

-- -----------------------------------------------------------
-- Output:
-- Raw Name      : "kanij Beni"
-- Cleaned Name  : Kanij Beni
-- First Name    : Kanij
-- Last Name     : Beni
-- Email	      : kanij.beni@ljku.edu.in
-- Length before : 10, after: 10
-- --------------------------------------------------------------