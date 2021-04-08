create or replace TRIGGER  "bi_HR_EVENTS" 
  before insert on "HR_EVENTS"              
  for each row 
begin  
  if :new."ID" is null then
    select "HR_EVENTS_SEQ".nextval into :new."ID" from sys.dual;
  end if;
end;
