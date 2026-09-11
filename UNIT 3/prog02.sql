/* 2: Write a PL/SQL block to accept a student name 
from a user if it exists, display his/her result from the 
RESULT table otherwise display appropriate message 
using exception handling. */

CREATE TABLE RESULT (
    student_id   NUMBER PRIMARY KEY,
    student_name VARCHAR2(100) NOT NULL,
    status       VARCHAR2(20) NOT NULL
);


INSERT INTO RESULT (student_id, student_name, status) VALUES (101, 'Alice Smith', 'Passed');
INSERT INTO RESULT (student_id, student_name, status) VALUES (102, 'Bob Jones', 'Failed');
INSERT INTO RESULT (student_id, student_name, status) VALUES (103, 'Charlie Brown', 'Passed');
INSERT INTO RESULT (student_id, student_name, status) VALUES (104, 'Alice Smith', 'Passed with Distinction');

COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_name    RESULT.student_name%TYPE := '&enter_student_name'; 
    v_result  RESULT.status%TYPE; -- Assumes a column like 'status' or 'grade' stores the result
BEGIN
    SELECT status 
    INTO v_result
    FROM RESULT
    WHERE UPPER(student_name) = UPPER(v_name);

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: The student "' || v_name || '" does not exist in the database.');
    
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error: Multiple students found with the name "' || v_name || '". Please use a unique identifier.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/