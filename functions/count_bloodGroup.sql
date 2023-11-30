SET SERVEROUTPUT ON;
SET VERIFY OFF;
set pagesize 15;
set linesize 1000;
select * from DONOR union select * from Donor@rafi ;
CREATE OR REPLACE PACKAGE mypack AS
    function countBagNums(matchGrp in DONOR.Dbloodgroup%TYPE)
return number;

END mypack;
/

CREATE OR REPLACE PACKAGE BODY mypack AS
	function countBagNums(matchGrp in DONOR.Dbloodgroup%TYPE)
return number
is
  
  total_bags number;

begin
	
	select count(bagnumber) into total_bags from BLOOD_INVENTORY
	where DID in ( select DID from DONOR where Dbloodgroup = matchGrp);
	 
	return total_bags;

end countBagNums;
end mypack;
/

declare 

	count_bag DONOR.Dbloodgroup%TYPE := '&BloodGroup';
	res number;
	
begin

	res := mypack.countBagNums(count_bag);
	dbms_output.put_line('Total bags of blood group ' ||count_bag|| ' = '||res);
end;
/


commit;





