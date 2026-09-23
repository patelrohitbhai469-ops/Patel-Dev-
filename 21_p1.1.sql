SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(50) := 'Patel Dev';
    v_roll_no    NUMBER := 21;
    v_message    VARCHAR2(100);
    v_lucky_num  NUMBER;
BEGIN
    -- (a) Print name and roll number
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number: ' || v_roll_no);
    
    -- (b) Assign and print message
    v_message := 'Welcome to PL/SQL!';
    DBMS_OUTPUT.PUT_LINE(v_message);
    
    -- (c) Calculate roll_no MOD 7 + 1 and print lucky number
    v_lucky_num := MOD(v_roll_no, 7) + 1;
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky_num);
END;
/

''' output 
Name: Patel Dev
Roll Number: 21
Welcome to PL/SQL!
Lucky Number: 1

PL/SQL procedure successfully completed. '''