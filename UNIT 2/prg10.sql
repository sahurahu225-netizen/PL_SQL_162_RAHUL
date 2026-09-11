-- PROGRAM 10:- Perform UPDATE operation on EMPLOYEE table using Implicit Cursor.


SET SERVEROUTPUT ON;

CREATE TABLE EMPLOYEE20
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMPLOYEE20 VALUES (101, 'RAHUL', 10, 30000);
INSERT INTO EMPLOYEE20 VALUES (102, 'AMIT', 20, 35000);
INSERT INTO EMPLOYEE20 VALUES (103, 'NEHA', 10, 32000);

COMMIT;

DECLARE
    id NUMBER;
    new_salary NUMBER;
BEGIN
    id := &EID;
    new_salary := &new_salary;

    UPDATE EMPLOYEE20
    SET BasicSal = new_salary
    WHERE EID = id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee salary updated successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    END IF;

    COMMIT;
END;
/