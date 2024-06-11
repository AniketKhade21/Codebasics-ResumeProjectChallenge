---------------------------------------------------------------------
--//list top 5 constituencies for 2 major national parties where they 
have gained vote share in 2019 as compared to 2014

//Percentage split of votes of parties between 2014 constituency wise
with CTE1 as (
select  upc_name, party, sum(total_votes) as party_vote_share
from results_14_upc
group by upc_name, party
),
CTE2 as (
select upc_name, sum(party_vote_share) as total_state_votes
from CTE1
group by upc_name)
select  CTE1.upc_name, CTE1.party, party_vote_share*100/total_state_votes as pct_vs14
from CTE1
join CTE2 using (upc_name)
group by  upc_name, party
order by upc_name, party , pct_vs14 DESC;

//Percentage split of votes of parties between 2019 at state level
with CTE1 as (
select  upc_name, party, sum(total_votes) as party_vote_share
from results_19_upc
group by upc_name, party
),
CTE2 as (
select upc_name, sum(party_vote_share) as total_state_votes
from CTE1
group by upc_name)
select  CTE1.upc_name, CTE1.party, party_vote_share*100/total_state_votes as pct_vs19
from CTE1
join CTE2 using (upc_name)
group by  upc_name, party
order by upc_name, party , pct_vs19 DESC;

// creating views for constituency wise % vote_share using above 2 queries. now suing these 2 views below
------------------------
//Actual solution : part 1 for BJP

with CTE as (
select c14.upc_name, c14.party,c14.pct_vs14,c19.pct_vs19
from const_pct_vs14 c14
left join const_pct_vs19 c19
using (upc_name,party)
union
select c14.upc_name, c14.party,c14.pct_vs14,c19.pct_vs19
from const_pct_vs14 c14
right join const_pct_vs19 c19
using (upc_name,party)
limit 1000000)
select *, pct_vs19-pct_vs14 as pct_diff from CTE
where pct_vs19>pct_vs14 and party="BJP" 
order by pct_diff desc
limit 5 ;

//Actual solution : part 2 for INC

with CTE as (
select c14.upc_name, c14.party,c14.pct_vs14,c19.pct_vs19
from const_pct_vs14 c14
left join const_pct_vs19 c19
using (upc_name,party)
union
select c14.upc_name, c14.party,c14.pct_vs14,c19.pct_vs19
from const_pct_vs14 c14
right join const_pct_vs19 c19
using (upc_name,party)
limit 1000000)
select *, pct_vs19-pct_vs14 as pct_diff from CTE
where pct_vs19>pct_vs14 and party="INC" 
order by pct_diff desc
limit 5 ;



