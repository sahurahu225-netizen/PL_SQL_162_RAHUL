-- PROGRAM 3:- Display first 5 highest-paid employees using %ROWCOUNT and Explicit Cursor.


SET SERVEROUTPUT ON;

CREATE TABLE EMP13
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP13 VALUES (101, 'RAHUL', 10, 30000);
INSERT INTO EMP13 VALUES (102, 'AMIT', 20, 45000);
INSERT INTO EMP13 VALUES (103, 'NEHA', 10, 50000);
INSERT INTO EMP13 VALUES (104, 'RAJ', 30, 40000);
INSERT INTO EMP13 VALUES (105, 'PRIYA', 20, 55000);
INSERT INTO EMP13 VALUES (106, 'KARAN', 30, 48000);

COMMIT;

DECLARE
    CURSOR C1 IS
        SELECT EName, Deptno, BasicSal
        FROM
        (
            SELECT EName, Deptno, BasicSal
            FROM EMP13
            ORDER BY BasicSal DESC
        )
        WHERE ROWNUM <= 5;

    nm EMP13.EName%TYPE;
    dept EMP13.Deptno%TYPE;
    sal EMP13.BasicSal%TYPE;
BEGIN
    OPEN C1;

    LOOP
        FETCH C1 INTO nm, dept, sal;
        EXIT WHEN C1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            C1%ROWCOUNT || '. ' || nm ||
            ' Department: ' || dept ||
            ' Salary: ' || sal
        );
    END LOOP;

    CLOSE C1;
END;
/