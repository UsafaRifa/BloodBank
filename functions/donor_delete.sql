clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
set linesize 1000;
select * from DONOR union select * from donor@rafi;
declare 

	id_to_delete number;
	myExp EXCEPTION;
	
begin
	
	id_to_delete := &id;
	
	delete from DONOR where DID = id_to_delete;
	delete from DONOR@rafi where DID = id_to_delete;
	IF id_to_delete < 0 THEN
		RAISE myExp;
	END IF;
	
	EXCEPTION
		WHEN myExp THEN
			DBMS_OUTPUT.PUT_LINE('ID Cannot be Negative!');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Others Errors!');
			
	
	
	
	
		
	
end;
/


create or replace trigger trigDeleteDonor
after delete on DONOR

declare
	
begin

	dbms_output.put_line('Donor Deleted!');
	
end;
/
select * from DONOR union select * from donor@rafi;
commit;