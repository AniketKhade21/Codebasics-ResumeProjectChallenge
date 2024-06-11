-- Secondary analysis 
// Q2 : Correlation between literacy % of a state & voter turnout%
---------
create table literacy2017
(
 state_ut varchar(50),
 literacy_pct decimal(5,2)
 )
 
 

Actual solution :

select s.state_name, state_vtr19, literacy_pct
from state_vtr19 s
left join literacy2017 l
on l.state_ut=s.state_name