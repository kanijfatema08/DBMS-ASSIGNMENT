SET SERVEROUTPUT ON;

DECLARE
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Name: Kanijfatema');
    DBMS_OUTPUT.PUT_LINE('Roll No: 4');

    DBMS_OUTPUT.PUT_LINE(v_message);

    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || (4 MOD 7 + 1));
END;
/

/*
------------------------------------------------------
Output:
Name: Kanijfatema
Roll No: 4
Welcome to PL/SQL!
Lucky Number: 5

PL/SQL procedure successfully completed.
------------------------------------------------------
*/
