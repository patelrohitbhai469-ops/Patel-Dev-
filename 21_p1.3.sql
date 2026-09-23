SET SERVEROUTPUT ON;

DECLARE
    -- Roll Number Seed calculation: base_price = roll_no * 500 + 1000
    v_roll_no     NUMBER := 21; -- Using Roll No. 21 (Patel Dev)
    v_base_price  NUMBER := (21 * 500) + 1000; -- 10500 + 1000 = 11500
    
    -- Part A: CONSTANT declarations and GST variables
    c_gst_rate    CONSTANT NUMBER := 18;
    v_cgst        NUMBER;
    v_sgst        NUMBER;
    v_total       NUMBER;
    
    -- Part B: NULL demonstration variables
    v_city        VARCHAR2(50) := NULL;
    v_display_city VARCHAR2(50);
    v_city_status VARCHAR2(50);
BEGIN
    -- Part A: Calculate GST Breakdown
    v_cgst  := v_base_price * (9 / 100);
    v_sgst  := v_base_price * (9 / 100);
    v_total := v_base_price + v_cgst + v_sgst;
    
    DBMS_OUTPUT.PUT_LINE('--- PART A: GST BREAKDOWN ---');
    DBMS_OUTPUT.PUT_LINE('Base Price  : Rs. ' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST (9%)   : Rs. ' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST (9%)   : Rs. ' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('Total Price : Rs. ' || v_total);
    DBMS_OUTPUT.PUT_LINE('');

    -- Part B: NVL vs NVL2 Demonstration
    DBMS_OUTPUT.PUT_LINE('--- PART B: NVL vs NVL2 ---');
    
    -- NVL replaces NULL with a default value
    v_display_city := NVL(v_city, 'Ahmedabad');
    DBMS_OUTPUT.PUT_LINE('NVL Result (Default city): ' || v_display_city);
    
    -- NVL2 evaluates: IF expr1 IS NOT NULL THEN expr2 ELSE expr3
    v_city_status := NVL2(v_city, 'City Known: ' || v_city, 'City Unknown');
    DBMS_OUTPUT.PUT_LINE('NVL2 Result: ' || v_city_status);
END;
/

''' output
--- PART A: GST BREAKDOWN ---
Base Price  : Rs. 11500
CGST (9%)   : Rs. 1035
SGST (9%)   : Rs. 1035
Total Price : Rs. 13570

--- PART B: NVL vs NVL2 ---
NVL Result (Default city): Ahmedabad
NVL2 Result: City Unknown

PL/SQL procedure successfully completed.'''