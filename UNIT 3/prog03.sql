/* 3: Write a PL/SQL block to accept employee name 
from a user if it exists, display his/her basic salary 
otherwise display appropriate message using 
exception handling. */

SET SERVEROUTPUT ON;

DECLARE
   
    v_name   EMPLOYEE20.emp_name%TYPE := '&enter_employee_name'; 
    v_salary EMPLOYEE20.basic_salary%TYPE; 
BEGIN
   
    SELECT basic_salary 
    INTO v_salary
    FROM EMPlOYEE20
    WHERE UPPER(emp_name) = UPPER(v_name);

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Basic Salary : ' || v_salary);

EXCEPTION
   
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: The employee "' || v_name || '" does not exist in the system.');
    
   WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Multiple employees found with the name "' || v_name || '". Please use a unique Employee ID.');

   WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/