SET SERVEROUTPUT ON;

DECLARE
    -- Inputs using Roll No. 21 and May (Month 5) as birth month
    -- principal = roll_no * 1000 = 21 * 1000 = 21,000
    -- rate = birth_month * 0.5 + 4 = 5 * 0.5 + 4 = 6.5%
    v_principal    NUMBER := 21 * 1000;
    v_rate         NUMBER := (5 * 0.5) + 4;
    v_years        NUMBER := 3;

    -- Interest and Amount Variables
    v_si           NUMBER;
    v_ci           NUMBER;
    v_si_amount    NUMBER;
    v_ci_amount    NUMBER;
    v_diff         NUMBER;
    v_diff_pct     NUMBER;
BEGIN
    -- Calculations
    v_si        := (v_principal * v_rate * v_years) / 100;
    v_ci        := v_principal * (POWER(1 + (v_rate / 100), v_years)) - v_principal;
    v_si_amount := v_principal + v_si;
    v_ci_amount := v_principal + v_ci;
    
    v_diff      := v_ci - v_si;
    v_diff_pct  := (v_diff / v_si) * 100;

    -- Formatted Output
    DBMS_OUTPUT.PUT_LINE('====================================================');
    DBMS_OUTPUT.PUT_LINE('              BANK INTEREST CALCULATOR              ');
    DBMS_OUTPUT.PUT_LINE('====================================================');
    DBMS_OUTPUT.PUT_LINE('Principal Amount : Rs. ' || TO_CHAR(v_principal, '99,99,990.00'));
    DBMS_OUTPUT.PUT_LINE('Interest Rate    : ' || v_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Time Period      : ' || v_years || ' years');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Simple Interest  : Rs. ' || TO_CHAR(v_si, '99,99,990.00'));
    DBMS_OUTPUT.PUT_LINE('SI Final Amount  : Rs. ' || TO_CHAR(v_si_amount, '99,99,990.00'));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Compound Interest: Rs. ' || TO_CHAR(v_ci, '99,99,990.00'));
    DBMS_OUTPUT.PUT_LINE('CI Final Amount  : Rs. ' || TO_CHAR(v_ci_amount, '99,99,990.00'));
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('CI Extra Gain    : Rs. ' || TO_CHAR(v_diff, '99,99,990.00') || 
                         ' (' || TO_CHAR(v_diff_pct, '990.00') || '% more interest)');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');

    -- Recommendation logic
    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('====================================================');
END;
/

'''output
====================================================
              BANK INTEREST CALCULATOR              
====================================================
Principal Amount : Rs.      21,000.00
Interest Rate    : 6.5%
Time Period      : 3 years
----------------------------------------------------
Simple Interest  : Rs.       4,095.00
SI Final Amount  : Rs.      25,095.00
----------------------------------------------------
Compound Interest: Rs.       4,367.24
CI Final Amount  : Rs.      25,367.24
----------------------------------------------------
CI Extra Gain    : Rs.         272.24 (    6.65% more interest)
----------------------------------------------------
====================================================

PL/SQL procedure successfully completed.'''