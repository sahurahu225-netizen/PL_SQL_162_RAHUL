-- PROGRAM 5:- Display employee-wise salary and department-wise total gross salary using Parameterized Cursor.

SET SERVEROUTPUT ON;

CREATE TABLE EMP15
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP15 VALUES (101, 'RAHUL', 10, 30000);
INSERT INTO EMP15 VALUES (102, 'AMIT', 10, 35000);
INSERT INTO EMP15 VALUES (103, 'NEHA', 20, 32000);
INSERT INTO EMP15 VALUES (104, 'RAJ', 20, 40000);
INSERT INTO EMP15 VALUES (105, 'PRIYA', 30, 45000);

COMMIT;

DECLARE
    CURSOR C1(dno NUMBER) IS
        SELECT EName, BasicSal
        FROM EMP15
        WHERE Deptno = dno;

    total_salary NUMBER;
BEGIN
    FOR D IN
    (
        SELECT DISTINCT Deptno
        FROM EMP15
        ORDER BY Deptno
    )
    LOOP
        total_salary := 0;

        DBMS_OUTPUT.PUT_LINE('Department: ' || D.Deptno);

        FOR E IN C1(D.Deptno)
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                E.EName || '  Basic Salary: ' || E.BasicSal
            );

            total_salary := total_salary + E.BasicSal;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE(
            'Department Total Gross Salary: ' || total_salary
        );
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END;
/