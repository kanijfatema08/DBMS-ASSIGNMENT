SET SERVEROUTPUT ON;
set linesize 300;
CREATE TABLE publisher (
    pub_id NUMBER(4),
    pub_name VARCHAR2(40) NOT NULL,
    city VARCHAR2(30),
    country VARCHAR2(30),
    CONSTRAINT pk_publisher PRIMARY KEY (pub_id)
);
INSERT INTO publisher VALUES (10, 'Oxford Press', 'London', 'UK');
INSERT INTO publisher VALUES (20, 'Tech Bharat Pub', 'Pune', 'India');
INSERT INTO publisher VALUES (30, 'McGraw Hill', 'New York', 'USA');
INSERT INTO publisher VALUES (40, 'Vidya Prakashan', 'Ahmedabad', 'India');
INSERT INTO publisher VALUES (50, 'Pearson Global', 'Toronto', 'Canada');

commit;
SELECT * FROM publisher;
DECLARE
    CURSOR c_publisher IS
        SELECT pub_name, city, country
        FROM publisher;

    r_publisher c_publisher%ROWTYPE;

BEGIN
    OPEN c_publisher;

    LOOP
        FETCH c_publisher INTO r_publisher;

        EXIT WHEN c_publisher%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            r_publisher.pub_name || ' - ' ||
            r_publisher.city || ' - ' ||
            r_publisher.country
        );
    END LOOP;

    CLOSE c_publisher;
END;
/

-- ----------------------------------------------------------------------------------------
-- Output:

--     PUB_ID PUB_NAME				    CITY			   COUNTRY
-- ---------- ---------------------------------------- ------------------------------ ------------------------------
-- 	10 Oxford Press 			    London			   UK
-- 	20 Tech Bharat Pub			    Pune			   India
-- 	30 McGraw Hill				    New York			   USA
-- 	40 Vidya Prakashan			    Ahmedabad			   India
-- 	50 Pearson Global			    Toronto			   Canada
-- Oxford Press - London - UK
-- Tech Bharat Pub - Pune - India
-- McGraw Hill - New York - USA
-- Vidya Prakashan - Ahmedabad - India
-- Pearson Global - Toronto - Canada

-- --------------------------------------------------------------------------------------------------------