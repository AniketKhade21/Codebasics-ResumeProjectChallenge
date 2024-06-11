--------------------------------------------------------------------------
--//Q11 : Which constituencies have elected candidates whose party has less than 
         10% vote share at state lavel in 2019
Soln : 

SELECT state_name, party, pct_vs19, upc_name, candidate, total_votes, total_electors, rnk
FROM state_pct_vs19
join winners_19
using (state_name,party)
where pct_vs19<10
limit 1000000;