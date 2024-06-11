//-------------------------------------------------------------------------------
--Question 4 : which constituencies have voted for different parties in 2 elections
               (list top 10 based on difference(2019-2014) in winner vote percentage
               in 2 elections)
//
with CTE_main as (
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
 select CTE14.state_name, CTE14.upc_name, CTE14.party as part14, CTE14.candidate as candidate14, CTE14.v_pct14, 
        CTE19.party as party19, CTE19.candidate as candidate19, CTE19.v_pct19
 from CTE14
 join CTE19 using (upc_name) 
 where CTE14.w_rank=1 and CTE19.w_rank=1 and CTE14.party!=CTE19.party
 order by CTE19.v_pct19 DESC
)
select *, v_pct19-v_pct14 as pct_diff from CTE_main
order by pct_diff desc
limit 10;