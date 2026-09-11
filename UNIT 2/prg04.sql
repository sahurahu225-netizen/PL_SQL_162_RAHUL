-- PROGRAM 4:- Display top 3 highest-paid employees using Cursor FOR Loop.


SET SERVEROUTPUT ON;

CREATE TABLE EMP14
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP14 VALUES (101, 'RAHUL', 10, 30000);
INSERT INTO EMP14 VALUES (102, 'AMIT', 20, 45000);
INSERT INTO EMP14 VALUES (103, 'NEHA', 10, 50000);
INSERT INTO EMP14 VALUES (104, 'RAJ', 30, 40000);
INSERT INTO EMP14 VALUES (105, 'PRIYA', 20, 55000);

COMMIT;

BEGIN
    FOR E IN
    (
        SELECT EName, BasicSal
        FROM
        (
            SELECT EName, BasicSal
            FROM EMP14
            ORDER BY BasicSal DESC
        )
        WHERE ROWNUM <= 3
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || E.EName ||
            '  Basic Salary: ' || E.BasicSal
        );
    END LOOP;
END;
/