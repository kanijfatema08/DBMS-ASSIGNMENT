SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_member (p_letter VARCHAR2) IS
        SELECT member_id, member_name, course, semester
        FROM lib_member
        WHERE UPPER(member_name) LIKE UPPER(p_letter) || '%';

BEGIN
    FOR r IN c_member('&letter') LOOP
        DBMS_OUTPUT.PUT_LINE(
            r.member_id || ' - ' ||
            r.member_name || ' - ' ||
            r.course || ' - Sem ' ||
            r.semester
        );
    END LOOP;
END;
/