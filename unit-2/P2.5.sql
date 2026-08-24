SET SERVEROUTPUT ON;

DECLARE
    v_roll_no NUMBER := 4;
    n NUMBER := 5 + MOD(v_roll_no,8);

    a NUMBER := 0;
    b NUMBER := 1;
    c NUMBER;
    i NUMBER := 1;

    fib NUMBER;
    d NUMBER;
    prime NUMBER;

    num NUMBER;
    p NUMBER;
    prime_count NUMBER := 0;

    x NUMBER := 48;
    y NUMBER := 18;
    r NUMBER;

    perfect_num NUMBER := 6;
    sum_div NUMBER := 0;
    div NUMBER := 1;
BEGIN
    -- Part A
    DBMS_OUTPUT.PUT_LINE('======== FIBONACCI ========');

    WHILE i <= n LOOP
        DBMS_OUTPUT.PUT_LINE(a);

        fib := a;
        c := a + b;
        a := b;
        b := c;

        i := i + 1;
    END LOOP;

    -- Part B
    d := 2;
    prime := 1;

    WHILE d * d <= fib LOOP
        IF MOD(fib,d) = 0 THEN
            prime := 0;
            EXIT;
        END IF;

        d := d + 1;
    END LOOP;

    IF fib < 2 THEN
        prime := 0;
    END IF;

    DBMS_OUTPUT.PUT_LINE('======== PRIME CHECK ========');

    IF prime = 1 THEN
        DBMS_OUTPUT.PUT_LINE(fib || ' is Prime');
    ELSE
        DBMS_OUTPUT.PUT_LINE(fib || ' is Not Prime');
    END IF;

    -- Part C
    DBMS_OUTPUT.PUT_LINE('======== PRIMES 1 TO 100 ========');

    num := 2;

    WHILE num <= 100 LOOP
        p := 2;
        prime := 1;

        WHILE p * p <= num LOOP
            IF MOD(num,p) = 0 THEN
                prime := 0;
                EXIT;
            END IF;

            p := p + 1;
        END LOOP;

        IF prime = 1 THEN
            DBMS_OUTPUT.PUT_LINE(num);
            prime_count := prime_count + 1;
        END IF;

        num := num + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Prime Count: ' || prime_count);

    -- Part D
    DBMS_OUTPUT.PUT_LINE('======== GCD ========');

    WHILE y <> 0 LOOP
        r := MOD(x,y);
        x := y;
        y := r;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('GCD: ' || x);

    -- Part E
    DBMS_OUTPUT.PUT_LINE('======== PERFECT NUMBER ========');

    WHILE div < perfect_num LOOP
        IF MOD(perfect_num,div) = 0 THEN
            sum_div := sum_div + div;
        END IF;

        div := div + 1;
    END LOOP;

    IF sum_div = perfect_num THEN
        DBMS_OUTPUT.PUT_LINE(perfect_num || ' is a Perfect Number');
    ELSE
        DBMS_OUTPUT.PUT_LINE(perfect_num || ' is Not a Perfect Number');
    END IF;
END;
/

-- ----------------------------------------------------------------------
-- Output:
-- ======== FIBONACCI ========
-- 0
-- 1
-- 1
-- 2
-- 3
-- 5
-- 8
-- 13
-- 21
-- ======== PRIME CHECK ========
-- 21 is Not Prime
-- ======== PRIMES 1 TO 100 ========
-- 2
-- 3
-- 5
-- 7
-- 11
-- 13
-- 17
-- 19
-- 23
-- 29
-- 31
-- 37
-- 41
-- 43
-- 47
-- 53
-- 59
-- 61
-- 67
-- 71
-- 73
-- 79
-- 83
-- 89
-- 97
-- Prime Count: 25
-- ======== GCD ========
-- GCD: 6
-- ======== PERFECT NUMBER ========
-- 6 is a Perfect Number


-- ---------------------------------------------------------------------------
