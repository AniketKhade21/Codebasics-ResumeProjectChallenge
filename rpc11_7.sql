---------------------------------------------------------------------
--// Percentage split of votes of parties between 2014 vs 2019 at state level
-------------------------------------------------------------------------------------

//Percentage split of votes of parties between 2014 at state level
with CTE1 as (
select state_name, party , sum(total_votes) as party_vote_share
from results_14_upc
group by state_name, party
),
CTE2 as (
select state_name, sum(party_vote_share) as total_state_votes
from CTE1
group by state_name)
select CTE1.state_name, CTE1.party, party_vote_share*100/total_state_votes as pct_vs14
from CTE1
join CTE2 using (state_name)
group by state_name, party
order by state_name, pct_vs14 DESC;


//Percentage split of votes of parties between 2019 at state level
with CTE1 as (
select state_name, party , sum(total_votes) as party_vote_share
from results_19_upc
group by state_name, party
),
CTE2 as (
select state_name, sum(party_vote_share) as total_state_votes
from CTE1
group by state_name)
select CTE1.state_name, CTE1.party, party_vote_share*100/total_state_votes as pct_vs19
from CTE1
join CTE2 using (state_name)
group by state_name, party
order by state_name, pct_vs19 DESC;

// created views for statewise % vote_share using above 2 queries. then merged 2 views as below

actual solution : 
SELECT * FROM state_pct_vs14
left join state_pct_vs19 using (state_name,party)
union
SELECT * FROM state_pct_vs14
right join state_pct_vs19 using (state_name,party);