---------------------------------------------------------------------
----------------------------------------------------------------------
//Question 1 :  top 5 constituencies of 2014 in terms of voter turn out ratio

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
select upc_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE1
join CTE2 using(upc_name)
order by VTR DESC
LIMIT 5;
--------------------------------------------------
bottom 5 constituencies of 2014 in terms of voter turn out ratio

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
select upc_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE1
join CTE2 using(upc_name)
order by VTR ASC
LIMIT 5;

-----------------------------------------------------------------------

//top 5 constituencies of 2019 in terms of voter turn out ratio

with CTE3 as (
select *, CONCAT(abbreviation, '-' ,pc_name) AS upc_name 
from results_19
join dim_states using (state_name)),
CTE1 as(
select upc_name, sum(total_votes) as sum_total_votes
from CTE3
group by upc_name),
CTE2 as (
select upc_name, round(avg(total_electors),0) as total_electors
from CTE3
group by upc_name)
select upc_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE1
join CTE2 using(upc_name)
order by VTR DESC
LIMIT 5;

-----------------------------------------------------------------------------
bottom 5 constituencies of 2019 in terms of voter turn out ratio

with CTE3 as (
select *, CONCAT(abbreviation, '-' ,pc_name) AS upc_name 
from results_19
join dim_states using (state_name)),
CTE1 as(
select upc_name, sum(total_votes) as sum_total_votes
from CTE3
group by upc_name),
CTE2 as (
select upc_name, round(avg(total_electors),0) as total_electors
from CTE3
group by upc_name)
select upc_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE1
join CTE2 using(upc_name)
order by VTR ASC
LIMIT 5;
