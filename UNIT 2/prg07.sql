-- PROGRAM 7:- Display records from CUSTOMER table using Explicit Cursor.

SET SERVEROUTPUT ON;

CREATE TABLE CUSTOMER17
(
    CID NUMBER PRIMARY KEY,
    CName VARCHAR2(30),
    City VARCHAR2(30),
    Phone VARCHAR2(15)
);

INSERT INTO CUSTOMER17 VALUES (1, 'RAHUL', 'AHMEDABAD', '9876543210');
INSERT INTO CUSTOMER17 VALUES (2, 'AMIT', 'GANDHIDHAM', '9876543211');
INSERT INTO CUSTOMER17 VALUES (3, 'NEHA', 'RAJKOT', '9876543212');

COMMIT;

DECLARE
    CURSOR C1 IS
        SELECT CID, CName, City, Phone
        FROM CUSTOMER17;

    id CUSTOMER17.CID%TYPE;
    nm CUSTOMER17.CName%TYPE;
    city CUSTOMER17.City%TYPE;
    phone CUSTOMER17.Phone%TYPE;
BEGIN
    OPEN C1;

    LOOP
        FETCH C1 INTO id, nm, city, phone;
        EXIT WHEN C1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            id || ' ' || nm || ' ' || city || ' ' || phone
        );
    END LOOP;

    CLOSE C1;
END;
/