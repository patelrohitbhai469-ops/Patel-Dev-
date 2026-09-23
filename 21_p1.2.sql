SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50) := 'Patel Dev';
    v_marks      NUMBER(5,2)  := 415.50; -- Replace with your actual marks out of 500
    v_percentage NUMBER(5,2);
    v_dob        DATE         := TO_DATE('15-05-2004', 'DD-MM-YYYY'); -- Replace with your DOB
    v_passed     BOOLEAN;
BEGIN
    -- Calculate percentage rounded to 2 decimal places
    v_percentage := ROUND((v_marks / 500) * 100, 2);

    -- Set boolean flag (passing mark >= 40%)
    IF v_percentage >= 40 THEN
        v_passed := TRUE;
    ELSE
        v_passed := FALSE;
    END IF;

    -- Display details
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks || ' / 500');
    DBMS_OUTPUT.PUT_LINE(v_name || ' | Marks:' || v_marks || ' | %:' || v_percentage);
    DBMS_OUTPUT.PUT_LINE('DOB: ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));

    -- Print PASS or FAIL based on the BOOLEAN variable
    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Status: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Status: FAIL');
    END IF;
END;
/

''' output
Name: Patel Dev
Marks: 415.5 / 500
Patel Dev | Marks:415.5 | %:83.1
DOB: 15-MAY-2004
Today Date: 24-AUG-2026
Status: PASS

PL/SQL procedure successfully completed.'''