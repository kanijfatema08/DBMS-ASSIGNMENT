SET SERVEROUTPUT ON;
set linesize 300;
CREATE TABLE lib_member (
    member_id NUMBER(5),
    member_name VARCHAR2(40) NOT NULL,
    course VARCHAR2(20),
    semester NUMBER(1),
    join_date DATE,
    CONSTRAINT pk_member PRIMARY KEY (member_id)
);
INSERT INTO lib_member VALUES (1,'Riya Shah', 'MSc IT', 1, DATE '2026-01-10');
INSERT INTO lib_member VALUES (2,'Arjun Mehta', 'MSc IT', 3, DATE '2025-07-22');
INSERT INTO lib_member VALUES (3,'Neha Patel', 'MCA', 2, DATE '2026-02-05');
INSERT INTO lib_member VALUES (4,'Karan Joshi', 'MCA', 4, DATE '2025-06-15');
INSERT INTO lib_member VALUES (5,'Sneha Desai', 'BCA', 2, DATE '2026-03-01');
INSERT INTO lib_member VALUES (6,'Vivek Nair', 'MSc IT', 3, DATE '2025-12-11');
INSERT INTO lib_member VALUES (7,'Ananya Rao', 'BCA', 5, DATE '2026-01-28');
INSERT INTO lib_member VALUES (8,'Manav Trivedi','MCA', 2, DATE '2025-08-09');

commit;
SELECT * FROM lib_member;

DECLARE
    CURSOR c_member IS
        SELECT member_name, course, semester
        FROM lib_member;

    v_count NUMBER := 0;

BEGIN
    FOR r IN c_member LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            v_count || '. ' ||
            UPPER(r.member_name) || ' (' ||
            r.course || ' - Sem ' ||
            r.semester || ')'
        );
    END LOOP;
END;
/

-- ******************************************************************************************************
-- Output:

--  MEMBER_ID MEMBER_NAME				    COURSE		   SEMESTER JOIN_DATE
-- ---------- ---------------------------------------- -------------------- ---------- ------------------
-- 	 1 Riya Shah				    MSc IT			  1 10-JAN-26
-- 	 2 Arjun Mehta				    MSc IT			  3 22-JUL-25
-- 	 3 Neha Patel				    MCA 			  2 05-FEB-26
-- 	 4 Karan Joshi				    MCA 			  4 15-JUN-25
-- 	 5 Sneha Desai				    BCA 			  2 01-MAR-26
-- 	 6 Vivek Nair				    MSc IT			  3 11-DEC-25
-- 	 7 Ananya Rao				    BCA 			  5 28-JAN-26
-- 	 8 Manav Trivedi			    MCA 			  2 09-AUG-25
-- 1. RIYA SHAH (MSc IT - Sem 1)
-- 2. ARJUN MEHTA (MSc IT - Sem 3)
-- 3. NEHA PATEL (MCA - Sem 2)
-- 4. KARAN JOSHI (MCA - Sem 4)
-- 5. SNEHA DESAI (BCA - Sem 2)
-- 6. VIVEK NAIR (MSc IT - Sem 3)
-- 7. ANANYA RAO (BCA - Sem 5)
-- 8. MANAV TRIVEDI (MCA - Sem 2)

-- *************************************************************************************************************