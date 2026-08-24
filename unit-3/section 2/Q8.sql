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

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issue IS
        SELECT issue_id, book_id, issue_date
        FROM book_issue
        WHERE return_date IS NULL;

    v_count NUMBER := 0;

BEGIN
    FOR r IN c_issue LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'Issue ID: ' || r.issue_id ||
            ' - Book ID: ' || r.book_id ||
            ' - Issue Date: ' || r.issue_date
        );
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('All books returned');
    END IF;
END;
/
    
/*
***********************************************************************************
Output:

  ISSUE_ID    BOOK_ID  MEMBER_ID ISSUE_DATE	    RETURN_DATE
---------- ---------- ---------- ------------------ ------------------
      5001	  101	       1 01-JUN-26	    12-JUN-26
      5002	  104	       2 03-JUN-26
      5003	  102	       3 05-JUN-26	    30-JUN-26
      5004	  107	       1 10-JUN-26
      5005	  111	       4 11-JUN-26	    20-JUN-26
      5006	  103	       5 15-JUN-26
      5007	  108	       2 18-JUN-26	    15-JUL-26
      5008	  106	       6 01-JUL-26
      5009	  101	       7 04-JUL-26	    14-JUL-26
      5010	  112	       8 09-JUL-26
      5011	  105	       3 12-JUL-26	    19-JUL-26

  ISSUE_ID    BOOK_ID  MEMBER_ID ISSUE_DATE	    RETURN_DATE
---------- ---------- ---------- ------------------ ------------------
      5012	  109	       4 20-JUL-26
Issue ID: 5002 - Book ID: 104 - Issue Date: 03-JUN-26
Issue ID: 5004 - Book ID: 107 - Issue Date: 10-JUN-26
Issue ID: 5006 - Book ID: 103 - Issue Date: 15-JUN-26
Issue ID: 5008 - Book ID: 106 - Issue Date: 01-JUL-26
Issue ID: 5010 - Book ID: 112 - Issue Date: 09-JUL-26
Issue ID: 5012 - Book ID: 109 - Issue Date: 20-JUL-26
***********************************************************************************
*/