create or replace PACKAGE investment_check AS
    TYPE check_record IS RECORD(
       id NUMBER(6),
       first_name VARCHAR2(25),
       last_name VARCHAR2(25),
       investment_limit NUMBER);
    TYPE check_table IS TABLE OF check_record;
    FUNCTION get_limits(check_limit NUMBER)
        RETURN check_table
        PIPELINED;
END;