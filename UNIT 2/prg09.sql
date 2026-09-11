-- PROGRAM 9:- Display records using Cursor with ORDER BY clause.


SET SERVEROUTPUT ON;

CREATE TABLE EMP19
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    BasicSal NUMBER
);

INSERT INTO EMP19 VALUES (101, 'RAHUL', 10, 30000);
INSERT INTO EMP19 VALUES (102, 'AMIT', 20, 45000);
INSERT INTO EMP19 VALUES (103, 'NEHA', 10, 35000);
INSERT INTO EMP19 VALUES (104, 'RAJ', 30, 40000);

COMMIT;

DECLARE
    CURSOR C1 IS
        SELECT EID, EName, Deptno, BasicSal
        FROM EMP19
        ORDER BY BasicSal DESC;

BEGIN
    FOR E IN C1
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            E.EID || ' ' ||
            E.EName || ' ' ||
            E.Deptno || ' ' ||
            E.BasicSal
        );
    END LOOP;
END;
/