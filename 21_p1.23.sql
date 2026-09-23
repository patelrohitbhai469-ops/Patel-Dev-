DECLARE
    -- Student Name
    v_name  VARCHAR2(50) := 'Patel Dev';
    
    -- CONSTANT variable assigned upon declaration
    c_bonus_rate CONSTANT NUMBER := 0.10;
    
    -- Base salary calculation using Roll No: 21
    v_sal   NUMBER := (21 * 1000) + 20000; -- Evaluates to 41000
    
    -- Variables for query and bonus
    v_fname VARCHAR2(30);
    v_bonus NUMBER;
BEGIN
    -- Assignment using := operator
    v_bonus := v_sal * c_bonus_rate;

    -- SELECT statement with mandatory INTO clause
    SELECT first_name 
    INTO v_fname 
    FROM employees 
    WHERE employee_id = 100;

    -- Output Results
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          DEBUG CHALLENGE FIXED          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Fetched Mgr Name: ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('Base Salary     : Rs.' || LTRIM(TO_CHAR(v_sal, '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('Bonus (10%)     : Rs.' || LTRIM(TO_CHAR(v_bonus, '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

'''output
=========================================
          DEBUG CHALLENGE FIXED          
=========================================
Employee Name   : Patel Dev
Fetched Mgr Name: Steven
Base Salary     : Rs.41,000
Bonus (10%)     : Rs.4,100
=========================================
'''