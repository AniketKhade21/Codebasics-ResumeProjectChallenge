//Which constituency voted the most for NOTA ?
--
--//for 2014--
select state_name, pc_name, candidate, party, total_votes, total_electors from results_14_upc where party="NOTA"
order by total_votes DESC limit 1;

--//for 2019--
select state_name, pc_name,candidate, party, total_votes, total_electors from results_19 where party="NOTA"
order by total_votes DESC limit 1;