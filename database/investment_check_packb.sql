create or replace PACKAGE BODY investment_check AS
    FUNCTION get_limits(check_limit number)
        RETURN check_table
        PIPELINED IS
        l_rec check_record;
    BEGIN
        FOR l_rec IN (
          select PERSON_ID, FIRST_NAME, LAST_NAME, 3*SAVINGS as INVESTMENT_LIMIT
          from PROSPECTS
          where 3*SAVINGS >= check_limit)
        LOOP
          PIPE ROW (l_rec);
        END LOOP;
        RETURN;
    END get_limits;
END;