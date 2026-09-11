-- PROGRAM 10:- Write a PL/SQL block to delete the record of an employee for a given EID.


SET SERVEROUTPUT ON;

CREATE TABLE EMP10
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP10 VALUES (101, 'RAHUL', 10, 'HR', 'Male', 25, 30000);
INSERT INTO EMP10 VALUES (102, 'AMIT', 20, 'SALES', 'Male', 28, 35000);
INSERT INTO EMP10 VALUES (103, 'NEHA', 10, 'HR', 'Female', 24, 32000);

COMMIT;

DECLARE
    id NUMBER;
BEGIN
    id := &EID;

    DELETE FROM EMP10
    WHERE EID = id;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Employee Deleted Successfully');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee Not Found');
    END IF;

    COMMIT;
END;
/