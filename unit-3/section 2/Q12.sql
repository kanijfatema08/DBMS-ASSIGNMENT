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
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title, stock
        FROM book
        WHERE category = 'Database'
        FOR UPDATE;

    v_old_stock book.stock%TYPE;
    v_new_stock book.stock%TYPE;

BEGIN
    FOR r IN c_book LOOP

        v_old_stock := r.stock;
        v_new_stock := r.stock + 10;

        UPDATE book
        SET stock = v_new_stock
        WHERE CURRENT OF c_book;

        DBMS_OUTPUT.PUT_LINE(
            r.title || ' - Old Stock: ' ||
            v_old_stock || ' - New Stock: ' ||
            v_new_stock
        );

    END LOOP;

    COMMIT;
END;
/
/*
***********************************************************************************
Output:

   BOOK_ID TITLE							CATEGORY		       PRICE	  STOCK     PUB_ID
---------- ------------------------------------------------------------ ------------------------- ---------- ---------- ----------
       101 Database System Concepts					Database			 850	     12 	30
       102 Let Us Learn PL/SQL						Database		       420.5	      4 	20
       103 Operating System Design					OS				 690	      8 	30
       104 Java Complete Reference					Programming			 975	     15 	30
       105 Python for Beginners 					Programming			 350	      3 	20
       106 Computer Networks						Networking			 780	      6 	10
       107 Data Structures in C 					Programming			 560	      2 	40
       108 Oracle SQL Handbook						Database			 640	      9 	10
       109 Software Engineering 					SE				 520	      7 	50
       110 Web Technology Basics					Web				 295	      1 	40
       111 Advanced DBMS						Database			1150	      5 	50

   BOOK_ID TITLE							CATEGORY		       PRICE	  STOCK     PUB_ID
---------- ------------------------------------------------------------ ------------------------- ---------- ---------- ----------
       112 Cloud Computing Essentials					Networking			 880	      4 	10
Database System Concepts - Old Stock: 12 - New Stock: 22
Let Us Learn PL/SQL - Old Stock: 4 - New Stock: 14
Oracle SQL Handbook - Old Stock: 9 - New Stock: 19
Advanced DBMS - Old Stock: 5 - New Stock: 15

***********************************************************************************
*/