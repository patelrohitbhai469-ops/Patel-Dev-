DECLARE
    -- Anti-Plagiarism Seed Variables
    v_student_name CONSTANT VARCHAR2(50) := 'Patel Dev';
    v_roll_no       CONSTANT NUMBER       := 21;
    
    -- Item & Price Calculation (Roll Number Seeded)
    v_qty           CONSTANT NUMBER := MOD(v_roll_no, 5) + 2;   -- 3 items
    v_price         CONSTANT NUMBER := (v_roll_no * 100) + 400;  -- Rs. 2,500.00
    
    -- Tax Constants (9% CGST + 9% SGST = 18% Total GST)
    c_cgst_rate     CONSTANT NUMBER := 0.09;
    c_sgst_rate     CONSTANT NUMBER := 0.09;

    -- Procedure to process and print bill for any given coupon value
    PROCEDURE print_bill (
        p_coupon_pct NUMBER,
        p_run_label  VARCHAR2
    ) IS
        v_gross         NUMBER;
        v_disc_amount   NUMBER;
        v_taxable       NUMBER;
        v_cgst          NUMBER;
        v_sgst          NUMBER;
        v_net_total     NUMBER;
        v_rounded_total  NUMBER;
        v_coupon_status VARCHAR2(50);
    BEGIN
        -- 1. Calculations
        v_gross       := v_qty * v_price;
        v_disc_amount := v_gross * (NVL(p_coupon_pct, 0) / 100);
        v_taxable     := v_gross - v_disc_amount;
        v_cgst        := v_taxable * c_cgst_rate;
        v_sgst        := v_taxable * c_sgst_rate;
        v_net_total   := v_taxable + v_cgst + v_sgst;
        v_rounded_total := ROUND(v_net_total);

        -- 2. NVL2 Conditional Text
        v_coupon_status := NVL2(p_coupon_pct, 
                                'Coupon Applied: ' || p_coupon_pct || '%', 
                                'No Coupon Applied');

        -- 3. Print Formatted Bill Header & Details
        DBMS_OUTPUT.PUT_LINE('==================================================');
        DBMS_OUTPUT.PUT_LINE('           LJKU KIRANA STORE - INVOICE            ');
        DBMS_OUTPUT.PUT_LINE('==================================================');
        DBMS_OUTPUT.PUT_LINE('Student  : ' || v_student_name || ' (Roll #' || v_roll_no || ')');
        DBMS_OUTPUT.PUT_LINE('Run Mode : ' || p_run_label);
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Item Quantity   : ' || v_qty || ' units');
        DBMS_OUTPUT.PUT_LINE('Unit Price      : Rs.' || LTRIM(TO_CHAR(v_price, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('Gross Amount    : Rs.' || LTRIM(TO_CHAR(v_gross, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('Coupon Status   : ' || v_coupon_status);
        DBMS_OUTPUT.PUT_LINE('Discount Amount : Rs.' || LTRIM(TO_CHAR(v_disc_amount, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Taxable Value   : Rs.' || LTRIM(TO_CHAR(v_taxable, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('CGST (9%)       : Rs.' || LTRIM(TO_CHAR(v_cgst, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('SGST (9%)       : Rs.' || LTRIM(TO_CHAR(v_sgst, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Exact Total     : Rs.' || LTRIM(TO_CHAR(v_net_total, '99,99,999.00')));
        DBMS_OUTPUT.PUT_LINE('FINAL TOTAL     : Rs.' || LTRIM(TO_CHAR(v_rounded_total, '99,99,999')));
        DBMS_OUTPUT.PUT_LINE('==================================================' || CHR(10));
    END print_bill;

BEGIN
    -- RUN 1: Coupon is NULL (No Coupon)
    print_bill(NULL, 'RUN 1 (Coupon = NULL)');

    -- RUN 2: Coupon is 10%
    print_bill(10, 'RUN 2 (Coupon = 10%)');
END;
/

'''output
==================================================
           LJKU KIRANA STORE - INVOICE            
==================================================
Student  : Patel Dev (Roll #21)
Run Mode : RUN 1 (Coupon = NULL)
--------------------------------------------------
Item Quantity   : 3 units
Unit Price      : Rs.2,500.00
Gross Amount    : Rs.7,500.00
Coupon Status   : No Coupon Applied
Discount Amount : Rs.0.00
--------------------------------------------------
Taxable Value   : Rs.7,500.00
CGST (9%)       : Rs.675.00
SGST (9%)       : Rs.675.00
--------------------------------------------------
Exact Total     : Rs.8,850.00
FINAL TOTAL     : Rs.8,850
==================================================

==================================================
           LJKU KIRANA STORE - INVOICE            
==================================================
Student  : Patel Dev (Roll #21)
Run Mode : RUN 2 (Coupon = 10%)
--------------------------------------------------
Item Quantity   : 3 units
Unit Price      : Rs.2,500.00
Gross Amount    : Rs.7,500.00
Coupon Status   : Coupon Applied: 10%
Discount Amount : Rs.750.00
--------------------------------------------------
Taxable Value   : Rs.6,750.00
CGST (9%)       : Rs.607.50
SGST (9%)       : Rs.607.50
--------------------------------------------------
Exact Total     : Rs.7,965.00
FINAL TOTAL     : Rs.7,965
==================================================
'''