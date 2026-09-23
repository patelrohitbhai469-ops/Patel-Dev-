SET SERVEROUTPUT ON;

DECLARE
    -- Roll Number Seed calculation: employee_id = 100 + (roll_no MOD 9) + 1
    -- Using Roll No. 21 (Patel Dev): 100 + (21 MOD 9) + 1 = 100 + 3 + 1 = 104
    v_emp_id   employees.employee_id%TYPE := 100 + MOD(21, 9) + 1;
    
    -- %ROWTYPE variable to hold an entire row from the employees table
    v_emp      employees%ROWTYPE;
    v_exp_yrs  NUMBER;
BEGIN
    -- Fetch full employee row into v_emp
    SELECT * INTO v_emp 
    FROM employees 
    WHERE employee_id = v_emp_id;

    -- Calculate years of experience
    v_exp_yrs := TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12);

    -- Print Formatted Profile Card
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('           EMPLOYEE PROFILE CARD           ');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Name         : ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID       : ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('Dept ID      : ' || v_emp.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary       : ' || TO_CHAR(v_emp.salary, 'Rs.99,999'));
    DBMS_OUTPUT.PUT_LINE('Hire Date    : ' || TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Experience   : ' || v_exp_yrs || ' years');
    
    -- Display senior status if experience > 10 years
    IF v_exp_yrs > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Status       : Senior Employee');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Status       : Regular Employee');
    END IF;
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || v_emp_id || ' not found.');
END;
/
'''output
-------------------------------------------
           EMPLOYEE PROFILE CARD           
-------------------------------------------
Name         : Alexander Hunold
Job ID       : IT_PROG
Dept ID      : 60
Salary       : Rs. 9,000
Hire Date    : 03-JAN-2006
Experience   : 20 years
Status       : Senior Employee
-------------------------------------------

PL/SQL procedure successfully completed.'''