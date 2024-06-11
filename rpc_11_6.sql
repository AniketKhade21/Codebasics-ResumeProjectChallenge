---------------------------------------------------------------------
--// Percentage split of votes of parties between 2014 vs 2019 at national level

//Percentage split of votes of parties between 2014
with CTE14 as(
select party ,sum(total_votes) as vote_share 
from results_14
group by party
order by vote_share desc
)
select *, vote_share*100/sum(vote_share) over() as pct_vt_share 
from CTE14 
order by pct_vt_share desc;
------------------------------------------------------

//Percentage split of votes of parties between 2019
with CTE19 as(
select party ,sum(total_votes) as vote_share 
from results_19
group by party
order by vote_share desc
)
select *, vote_share*100/sum(vote_share) over() as pct_vt_share 
from CTE19 
order by pct_vt_share desc;
---------------------------------------------

Actual soln :
with CTE1 as(
with CTE14 as(
select party ,sum(total_votes) as vote_share 
from results_14
group by party
order by vote_share desc
)
select *, vote_share*100/sum(vote_share) over() as pct_vt_share_14
from CTE14 
order by pct_vt_share_14 desc),
CTE2 as(
with CTE19 as(
select party ,sum(total_votes) as vote_share 
from results_19
group by party
order by vote_share desc
)
select *, vote_share*100/sum(vote_share) over() as pct_vt_share_19 
from CTE19 
order by pct_vt_share_19 desc)
select * from CTE1
join CTE2 using(party);

