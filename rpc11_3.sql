-------------------------------------------------------------------------------
--Question 3 : which constituencies have elected the same party for two consecutive elections, 
               rank them by % of votes to that winning party in 2019 

//winners in 2014
with winners14 as (            
 select *, rank() over(partition by upc_name order by total_votes DESC) as rnk
 from results_14_upc
 order by upc_name)
 select * from winners14 where rnk<=1;
 
 //winners in 2019
 with winners19 as (            
 select *, rank() over(partition by upc_name order by total_votes DESC) as rnk
 from results_19_upc
 order by upc_name)
 select * from winners19 where rnk<=1;
 
 select upc_name, w14.candidate, w14.party , w19.candidate, w19.party
 from winners_14 w14
 join winners_19 w19
 using (upc_name)
 where w14.party=w19.party;
 ---
 select *, total_votes*100/sum(total_votes) over (partition by upc_name) as v_pct
 from results_14_upc
 order by upc_name
 ---------------------
Actual solution starts from below 

with CTE14 as(
 with CTE1 as (
 select *, total_votes*100/sum(total_votes) over (partition by upc_name) as v_pct14
 from results_14_upc
 order by upc_name)
 select *, rank() over(partition by upc_name order by v_pct14 desc) as w_rank from CTE1),
 CTE19 as(
 with CTE2 as (
 select *, total_votes*100/sum(total_votes) over (partition by upc_name) as v_pct19
 from results_19_upc
 order by upc_name)
 select *, rank() over(partition by upc_name order by v_pct19 desc) as w_rank from CTE2)
 select CTE14.state_name, CTE14.upc_name, CTE14.party, CTE14.candidate, CTE14.v_pct14, CTE19.candidate, CTE19.v_pct19
 from CTE14
 join CTE19 using (upc_name) 
 where CTE14.w_rank=1 and CTE19.w_rank=1 and CTE14.party=CTE19.party
 order by CTE19.v_pct19 DESC
 limit 10
 ;

--more tuning
with CTE14 as(
 with CTE1 as (
 select *, total_votes*100/sum(total_votes) over (partition by upc_name) as v_pct14
 from results_14_upc
 order by upc_name)
 select *, rank() over(partition by upc_name order by v_pct14 desc) as w_rank from CTE1),
 CTE19 as(
 with CTE2 as (
 select *, total_votes*100/sum(total_votes) over (partition by upc_name) as v_pct19
 from results_19_upc
 order by upc_name)
 select *, rank() over(partition by upc_name order by v_pct19 desc) as w_rank from CTE2)
 select CTE14.upc_name, CTE14.party, CTE14.candidate, CTE14.v_pct14, CTE19.candidate, CTE19.v_pct19
 from CTE14
 join CTE19 using (upc_name) 
 where CTE14.w_rank=1 and CTE19.w_rank=1 and CTE14.party=CTE19.party
 order by CTE19.v_pct19 DESC
 limit 10;