SET SERVEROUTPUT ON;
CREATE TABLE book_issue (
    issue_id NUMBER(6),
    book_id NUMBER(5),
    member_id NUMBER(5),
    issue_date DATE,
    return_date DATE
);

    INSERT INTO book_issue VALUES (5001,101,1,DATE '2026-06-01',DATE '2026-06-12');
    INSERT INTO book_issue VALUES (5002,104,2,DATE '2026-06-03',NULL);
    INSERT INTO book_issue VALUES (5003,102,3,DATE '2026-06-05',DATE '2026-06-30');
    INSERT INTO book_issue VALUES (5004,107,1,DATE '2026-06-10',NULL);
    INSERT INTO book_issue VALUES (5005,111,4,DATE '2026-06-11',DATE '2026-06-20');
    INSERT INTO book_issue VALUES (5006,103,5,DATE '2026-06-15',NULL);
    INSERT INTO book_issue VALUES (5007,108,2,DATE '2026-06-18',DATE '2026-07-15');
    INSERT INTO book_issue VALUES (5008,106,6,DATE '2026-07-01',NULL);
    INSERT INTO book_issue VALUES (5009,101,7,DATE '2026-07-04',DATE '2026-07-14');
    INSERT INTO book_issue VALUES (5010,112,8,DATE '2026-07-09',NULL);
    INSERT INTO book_issue VALUES (5011,105,3,DATE '2026-07-12',DATE '2026-07-19');
    INSERT INTO book_issue VALUES (5012,109,4,DATE '2026-07-20',NULL);
    
    COMMIT;
select * FROM book_issue;

DECLARE
    CURSOR c_issue (p_member_id NUMBER) IS
        SELECT b.title, bi.issue_date
        FROM book_issue bi
        JOIN book b
        ON bi.book_id = b.book_id
        JOIN lib_member m
        ON bi.member_id = m.member_id
        WHERE m.member_id = p_member_id;

BEGIN
    FOR r IN c_issue(&member_id) LOOP
        DBMS_OUTPUT.PUT_LINE(
            r.title || ' - ' ||
            TO_CHAR(r.issue_date, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/