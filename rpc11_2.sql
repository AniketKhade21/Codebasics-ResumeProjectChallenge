------------------------------------------------------------------------
-------------------------------------------------------------------------
//Question 2 : Top 5 states of 2014 by voter turn out ratio

with CTE1 as(
select state_name, sum(total_votes) as sum_total_votes 
from results_14
group by state_name),
CTE2 as (
select state_name, round(sum(distinct(total_electors)),0) as total_electors
from results_14
group by state_name)
select state_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE2
join CTE1 using(state_name)
order by VTR DESC
LIMIT 5;
------------------------------------------------------------------------

//bottom 5 states of 2014 by voter turn out ratio

with CTE1 as(
select state_name, sum(total_votes) as sum_total_votes 
from results_14
group by state_name),
CTE2 as (
select state_name, round(sum(distinct(total_electors)),0) as total_electors
from results_14
group by state_name)
select state_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE2
join CTE1 using(state_name)
order by VTR ASC
LIMIT 5;
------------------------------------------------------------------------

//Top 5 states of 2019 by voter turn out ratio

with CTE1 as(
select state_name, sum(total_votes) as sum_total_votes 
from results_19
group by state_name),
CTE2 as (
select state_name, round(sum(distinct(total_electors)),0) as total_electors
from results_19
group by state_name)
select state_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE2
join CTE1 using(state_name)
order by VTR DESC
LIMIT 5;
--------------------------------------------------------------------------
//Bottom 5 states of 2019 by voter turn out ratio

with CTE1 as(
select state_name, sum(total_votes) as sum_total_votes 
from results_19
group by state_name),
CTE2 as (
select state_name, round(sum(distinct(total_electors)),0) as total_electors
from results_19
group by state_name)
select state_name, sum_total_votes, total_electors, round((sum_total_votes*100/total_electors),2) as VTR 
from CTE2
join CTE1 using(state_name)
order by VTR ASC
LIMIT 5;