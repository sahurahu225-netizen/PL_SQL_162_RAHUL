-- PROGRAM 9:- Write a PL/SQL block which displays all records of Male employees working in the HR Dept from the EMP table. 

SET SERVEROUTPUT ON;

CREATE TABLE EMP9
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP9 VALUES (101, 'RAHUL', 10, 'HR', 'Male', 25, 30000);
INSERT INTO EMP9 VALUES (102, 'AMIT', 20, 'SALES', 'Male', 28, 35000);
INSERT INTO EMP9 VALUES (103, 'NEHA', 10, 'HR', 'Female', 24, 32000);
INSERT INTO EMP9 VALUES (104, 'RAJ', 10, 'HR', 'Male', 30, 40000);

COMMIT;

DECLARE
    found NUMBER := 0;
BEGIN
    FOR e IN
    (
        SELECT *
        FROM EMP9
        WHERE Gender = 'Male'
        AND Deptname = 'HR'
    )
    LOOP
        found := 1;

        DBMS_OUTPUT.PUT_LINE(
            e.EID || ' ' ||
            e.EName || ' ' ||
            e.Deptno || ' ' ||
            e.Deptname || ' ' ||
            e.Gender || ' ' ||
            e.Age || ' ' ||
            e.BasicSal
        );
    END LOOP;

    IF found = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No Male Employee Found in HR Department');
    END IF;
END;
/