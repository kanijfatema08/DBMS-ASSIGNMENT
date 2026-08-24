SET SERVEROUTPUT ON;
set linesize 300;

CREATE TABLE book (
    book_id NUMBER(5),
    title VARCHAR2(60) NOT NULL,
    category VARCHAR2(25),
    price NUMBER(8,2),
    stock NUMBER(4),
    pub_id NUMBER(4)
);
INSERT INTO book VALUES (101,'Database System Concepts','Database',850.00,12,30);
INSERT INTO book VALUES (102,'Let Us Learn PL/SQL','Database',420.50,4,20);
INSERT INTO book VALUES (103,'Operating System Design','OS',690.00,8,30);
INSERT INTO book VALUES (104,'Java Complete Reference','Programming',975.00,15,30);
INSERT INTO book VALUES (105,'Python for Beginners','Programming',350.00,3,20);
INSERT INTO book VALUES (106,'Computer Networks','Networking',780.00,6,10);
INSERT INTO book VALUES (107,'Data Structures in C','Programming',560.00,2,40);
INSERT INTO book VALUES (108,'Oracle SQL Handbook','Database',640.00,9,10);
INSERT INTO book VALUES (109,'Software Engineering','SE',520.00,7,50);
INSERT INTO book VALUES (110,'Web Technology Basics','Web',295.00,1,40);
INSERT INTO book VALUES (111,'Advanced DBMS','Database',1150.00,5,50);
INSERT INTO book VALUES (112,'Cloud Computing Essentials','Networking',880.00,4,10);

commit;
SELECT * from book;

DECLARE
    CURSOR c_book (p_cat VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE category = p_cat
        FOR UPDATE;

    v_old_price book.price%TYPE;
    v_new_price book.price%TYPE;

BEGIN
    FOR r IN c_book('&category') LOOP

        v_old_price := r.price;
        v_new_price := r.price * 1.10;

        UPDATE book
        SET price = v_new_price
        WHERE CURRENT OF c_book;

        DBMS_OUTPUT.PUT_LINE(
            r.title || ' - Old Price: ' ||
            v_old_price || ' - New Price: ' ||
            v_new_price
        );

    END LOOP;

    COMMIT;
END;
/