SET SERVEROUTPUT ON;

DECLARE
    -- Roll Number Seed calculation: employee_id = 100 + (roll_no MOD 7)
    -- Using Roll No. 21 (Patel Dev): 100 + (21 MOD 7) = 100 + 0 = 100
    v_valid_id      employees.employee_id%TYPE := 100 + MOD(21, 7);
    v_invalid_id    employees.employee_id%TYPE := 21; -- Test with roll_no (likely non-existent)
    
    -- Variables declared using %TYPE to dynamically match table column definitions
    v_fname         employees.first_name%TYPE;
    v_sal           employees.salary%TYPE;
BEGIN
    -- Test 1: Valid Employee ID
    DBMS_OUTPUT.PUT_LINE('--- TEST 1: Valid Employee ID (' || v_valid_id || ') ---');
    BEGIN
        SELECT first_name, salary 
        INTO v_fname, v_sal 
        FROM employees 
        WHERE employee_id = v_valid_id;
        
        DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs.' || v_sal || ' per month.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
    END;

    -- Test 2: Non-existent Employee ID
    DBMS_OUTPUT.PUT_LINE('--- TEST 2: Invalid Employee ID (' || v_invalid_id || ') ---');
    BEGIN
        SELECT first_name, salary 
        INTO v_fname, v_sal 
        FROM employees 
        WHERE employee_id = v_invalid_id;
        
        DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs.' || v_sal || ' per month.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
    END;
END;
/
'''output
--- TEST 1: Valid Employee ID (100) ---
Employee: Steven earns Rs.24000 per month.

--- TEST 2: Invalid Employee ID (21) ---
Employee not found — check the ID.

PL/SQL procedure successfully completed.'''