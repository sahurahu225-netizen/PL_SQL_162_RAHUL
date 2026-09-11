-- PROGRAM 6:- Insert Dept employees into EMP_BACKUP using Cursor and User-defined Exception.

SET SERVEROUTPUT ON;

CREATE TABLE EMP16
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER,
    BasicSal NUMBER
);

CREATE TABLE EMP_BACKUP16
(
    EID NUMBER,
    EName VARCHAR2(30),
    Deptno NUMBER,
    Deptname VARCHAR2(30),
    Gender VARCHAR2(10),
    Age NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP16 VALUES (101, 'RAHUL', 10, 'HR', 'Male', 25, 30000);
INSERT INTO EMP16 VALUES (102, 'AMIT', 20, 'SALES', 'Male', 28, 35000);
INSERT INTO EMP16 VALUES (103, 'NEHA', 10, 'HR', 'Female', 24, 32000);
INSERT INTO EMP16 VALUES (104, 'RAJ', 30, 'IT', 'Male', 30, 40000);

COMMIT;

DECLARE
    CURSOR C1(dno NUMBER) IS
        SELECT *
        FROM EMP16
        WHERE Deptno = dno;

    dept_no NUMBER;
    found NUMBER := 0;
    NO_DEPT_FOUND EXCEPTION;
BEGIN
    dept_no := &dept_no;

    FOR E IN C1(dept_no)
    LOOP
        found := 1;

        INSERT INTO EMP_BACKUP16
        VALUES
        (
            E.EID, E.EName, E.Deptno, E.Deptname,
            E.Gender, E.Age, E.BasicSal
        );
    END LOOP;

    IF found = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Records copied successfully for department ' || dept_no
    );

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No records found for department ' || dept_no
        );
END;
/