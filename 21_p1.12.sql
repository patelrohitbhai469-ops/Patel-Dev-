DECLARE
    -- Anti-Plagiarism Seed Variables
    v_roll_no   NUMBER := 21;
    v_base_mark NUMBER := MOD(21, 30) + 60; -- Evaluates to 81
    
    -- Subject Marks (5th subject is NULL due to absence)
    v_m1 NUMBER := v_base_mark;
    v_m2 NUMBER := v_base_mark;
    v_m3 NUMBER := v_base_mark;
    v_m4 NUMBER := v_base_mark;
    v_m5 NUMBER := NULL; 
    
    -- Calculation Variables
    v_total    NUMBER;
    v_pct      NUMBER;
    v_passed   BOOLEAN;
    v_res_text VARCHAR2(10);
BEGIN
    -- Calculate total using NVL to treat NULL (absent) as 0
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    
    -- Calculate Percentage (out of 500)
    v_pct := ROUND((v_total / 500) * 100, 2);
    
    -- Evaluate BOOLEAN Condition
    v_passed := (v_pct >= 40);

    -- Convert BOOLEAN to text for output
    v_res_text := CASE WHEN v_passed THEN 'PASS' ELSE 'FAIL' END;

    -- Print Result Card
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('           ACADEMIC RESULT CARD          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : Patel Dev (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Subject 1    : ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2    : ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3    : ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4    : ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5    : ' || NVL(TO_CHAR(v_m5), 'ABSENT (0)'));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Marks  : ' || v_total || ' / 500');
    DBMS_OUTPUT.PUT_LINE('Percentage   : ' || v_pct || '%');
    DBMS_OUTPUT.PUT_LINE('Final Result : ' || v_res_text);
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

''' output 
=========================================
           ACADEMIC RESULT CARD          
=========================================
Student Name : Patel Dev (Roll No: 21)
-----------------------------------------
Subject 1    : 81
Subject 2    : 81
Subject 3    : 81
Subject 4    : 81
Subject 5    : ABSENT (0)
-----------------------------------------
Total Marks  : 324 / 500
Percentage   : 64.8%
Final Result : PASS
========================================= '''
