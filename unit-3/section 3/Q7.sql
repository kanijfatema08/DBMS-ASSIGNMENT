set linesize 300;
SET SERVEROUTPUT ON;
CREATE TABLE publisher (
    pub_id NUMBER(4),
    pub_name VARCHAR2(40) NOT NULL,
    city VARCHAR2(30),
    country VARCHAR2(30));
INSERT INTO publisher VALUES (10, 'Oxford Press', 'London', 'UK');
INSERT INTO publisher VALUES (20, 'Tech Bharat Pub', 'Pune', 'India');
INSERT INTO publisher VALUES (30, 'McGraw Hill', 'New York', 'USA');
INSERT INTO publisher VALUES (40, 'Vidya Prakashan', 'Ahmedabad', 'India');
INSERT INTO publisher VALUES (50, 'Pearson Global', 'Toronto', 'Canada');
 commit;
 SELECT * from publisher;
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
    CURSOR c_publisher IS
        SELECT pub_id, pub_name
        FROM publisher;

    CURSOR c_book (p_pub_id NUMBER) IS
        SELECT title, price
        FROM book
        WHERE pub_id = p_pub_id;

BEGIN
    FOR p IN c_publisher LOOP

        DBMS_OUTPUT.PUT_LINE(p.pub_name);

        FOR b IN c_book(p.pub_id) LOOP
            DBMS_OUTPUT.PUT_LINE(
                '   ' || b.title || ' - ' || b.price
            );
        END LOOP;

    END LOOP;
END;
/
/*
Output:

    PUB_ID PUB_NAME				    CITY			   COUNTRY
---------- ---------------------------------------- ------------------------------ ------------------------------
	10 Oxford Press 			    London			   UK
	20 Tech Bharat Pub			    Pune			   India
	30 McGraw Hill				    New York			   USA
	40 Vidya Prakashan			    Ahmedabad			   India
	50 Pearson Global			    Toronto			   Canada

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
Oxford Press
Computer Networks - 780
Oracle SQL Handbook - 640
Cloud Computing Essentials - 880
Tech Bharat Pub
Let Us Learn PL/SQL - 420.5
Python for Beginners - 350
McGraw Hill
Database System Concepts - 850
Operating System Design - 690
Java Complete Reference - 975
Vidya Prakashan
Data Structures in C - 560
Web Technology Basics - 295
Pearson Global
Software Engineering - 520
Advanced DBMS - 1150

*/