-- Secondary analysis 
// Q1 : Correlation between postal votes% & voter turnout%
---------

// Voter turnout % for 2014
with CTE3 as (
select *, CONCAT(abbreviation, '-' ,pc_name) AS upc_name 
from results_14
join dim_states using (state_name)),
CTE1 as(
select upc_name, sum(total_votes) as sum_total_votes
from CTE3
group by upc_name),
CTE2 as (
select upc_name, round(avg(total_electors),0) as total_electors
from CTE3
group by upc_name)
select upc_name, sum_total_votes, total_electors, 
       round((sum_total_votes*100/total_electors),2) as VTR14 
from CTE1
join CTE2 using(upc_name)


//postal votes% for 2014

with CTE3 as (
select *, CONCAT(abbreviation, '-' ,pc_name) AS upc_name 
from results_14
join dim_states using (state_name)),
CTE1 as(
select upc_name, sum(postal_votes) as sum_postal_votes
from CTE3
group by upc_name),
CTE2 as (
select upc_name, sum(total_votes) as total_votes
from CTE3
group by upc_name)
select upc_name, sum_postal_votes, total_votes,
       round((sum_postal_votes*100/total_votes),2) as postal_vpct14 
from CTE1
join CTE2 using(upc_name)
-------------------------------------------

select * from vtr14
join postal_v_pct14
using (upc_name)

select * from vtr19
join postal_v_pct19
using (upc_name)
