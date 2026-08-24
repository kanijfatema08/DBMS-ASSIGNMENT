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
 SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_publisher (p_country VARCHAR2) IS
        SELECT pub_name, city, country
        FROM publisher
        WHERE UPPER(country) = UPPER(p_country);

    v_found BOOLEAN := FALSE;

BEGIN
    FOR r IN c_publisher('&country') LOOP
        v_found := TRUE;

        DBMS_OUTPUT.PUT_LINE(
            r.pub_name || ' - ' ||
            r.city || ' - ' ||
            r.country
        );
    END LOOP;


    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE(
            'No publisher found in &country'
        );
    END IF;
END;
/