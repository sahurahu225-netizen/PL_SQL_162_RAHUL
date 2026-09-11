/* 1:Write a PL/SQL block that explains the use of the 
ZERO_DIVIDE exception.*/

SET SERVEROUTPUT ON;

DECLARE
    v_dividend NUMBER := 100;
    v_divisor  NUMBER := 0;
    v_result   NUMBER;
BEGIN
    v_result := v_dividend / v_divisor;
    DBMS_OUTPUT.PUT_LINE('The result is: ' || v_result);

EXCEPTION
    
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is mathematically undefined.');
        DBMS_OUTPUT.PUT_LINE('System Message: ' || SQLERRM);
        v_result := NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/