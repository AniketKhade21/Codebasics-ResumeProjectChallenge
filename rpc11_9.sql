

---------------------------------------------------------------------
--//list top 5 constituencies for 2 major national parties where they 
have lost vote share in 2019 as compared to 2014

//Actual solution : part 1 for BJP

with CTE as (
select c14.upc_name, c14.party, c14.pct_vs14, c19.pct_vs19
from const_pct_vs14 c14
left join const_pct_vs19 c19
using (upc_name,party)
union
select c14.upc_name, c14.party, c14.pct_vs14, c19.pct_vs19
from const_pct_vs14 c14
right join const_pct_vs19 c19
using (upc_name,party)
limit 1000000)
select *, pct_vs14-pct_vs19 as pct_diff from CTE
where pct_vs14>pct_vs19 and party="BJP" 
order by pct_diff desc
limit 5 ;


//Actual solution : part 2 for INC

with CTE as (
select c14.upc_name, c14.party, c14.pct_vs14, c19.pct_vs19
from const_pct_vs14 c14
left join const_pct_vs19 c19
using (upc_name,party)
union
select c14.upc_name, c14.party, c14.pct_vs14, c19.pct_vs19
from const_pct_vs14 c14
right join const_pct_vs19 c19
using (upc_name,party)
limit 1000000)
select *, pct_vs14-pct_vs19 as pct_diff from CTE
where pct_vs14>pct_vs19 and party="INC" 
order by pct_diff desc
limit 5 ;
