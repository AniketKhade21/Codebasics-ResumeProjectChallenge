-- Secondary analysis 
// Q2 : Correlation between GDP of a state & voter turnout%
---------

// Voter turnout % for 2014
with CTE1 as (
select state_name,  sum(total_votes) as sum_total_votes
from results_14_upc
group by state_name),
CTE2 as (
select state_name,  sum(distinct(total_electors)) as sum_total_electors
from results_14_upc
group by state_name)
select * , sum_total_votes*100/sum_total_electors as state_vtr14
from CTE1
join CTE2 using (state_name)


// Voter turnout % for 2019
with CTE1 as (
select state_name,  sum(total_votes) as sum_total_votes
from results_19_upc
group by state_name),
CTE2 as (
select state_name,  sum(distinct(total_electors)) as sum_total_electors
from results_19_upc
group by state_name)
select * , sum_total_votes*100/sum_total_electors as state_vtr19
from CTE1
join CTE2 using (state_name)
-----------------------------------------

Actual solution :

select * 
from state_vtr19 s
left join state_gdp g
on s.state_name=g.state_UT 

