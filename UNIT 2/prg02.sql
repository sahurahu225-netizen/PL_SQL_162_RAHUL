-- PROGRAM 2:- Update Dept 20 salary by 5% using %ISOPEN, %NOTFOUND and Explicit Cursor.


SET SERVEROUTPUT ON;

CREATE TABLE EMP12
(
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(30),
    Deptno NUMBER,
    BasicSal NUMBER
);

CREATE TABLE EMP_UPDATE12
(
    EID NUMBER,
    EName VARCHAR2(30),
    OldSal NUMBER,
    NewSal NUMBER
);

INSERT INTO EMP12 VALUES (101, 'RAHUL', 10, 30000);
INSERT INTO EMP12 VALUES (102, 'AMIT', 20, 35000);
INSERT INTO EMP12 VALUES (103, 'NEHA', 20, 32000);
INSERT INTO EMP12 VALUES (104, 'RAJ', 30, 40000);

COMMIT;

-- Implicit Cursor

BEGIN
    UPDATE EMP12
    SET BasicSal = BasicSal * 1.05
    WHERE Deptno = 20;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Department 20 salaries increased by 5%.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employees found in department 20.');
    END IF;

    COMMIT;
END;
/

-- Explicit Cursor

DECLARE
    CURSOR C1 IS
        SELECT EID, EName, BasicSal
        FROM EMP12
        WHERE Deptno = 20;

    id EMP12.EID%TYPE;
    nm EMP12.EName%TYPE;
    sal EMP12.BasicSal%TYPE;
    new_sal EMP12.BasicSal%TYPE;
BEGIN
    OPEN C1;

    IF C1%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open.');
    END IF;

    LOOP
        FETCH C1 INTO id, nm, sal;

        EXIT WHEN C1%NOTFOUND;

        new_sal := sal * 1.05;

        INSERT INTO EMP_UPDATE12
        VALUES (id, nm, sal, new_sal);
    END LOOP;

    IF C1%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No more records found.');
    END IF;

    CLOSE C1;

    IF NOT C1%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is closed.');
    END IF;

    COMMIT;
END;
/