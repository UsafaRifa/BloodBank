
clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
select * from DONOR union select * from donor@rafi;

declare 

	p_id number := &previous_id;
	n_id number := &new_id;
	
begin

	update DONOR set DID = n_id where DID = p_id;
	update DONOR@rafi set DID = n_id where DID = p_id;
end;
/

create or replace trigger trigUpdateDonor
after update on DONOR

declare
	
begin

	dbms_output.put_line('Donor ID Updated!!');
	
end;
/
select * from DONOR union select * from donor@rafi;

commit;