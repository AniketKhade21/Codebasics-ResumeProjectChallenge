----------------------------------------------------------------------------
--//Top 5 candidates based on margin difference with runners in 2014 & 2019

--first find out runners in each year
//runners in 2014
with winners14 as (            
 select *, rank() over(partition by upc_name order by total_votes DESC) as rnk
 from results_14_upc
 order by upc_name)
 select * from winners14 where rnk=2;
 
 //runners in 2019
 with winners19 as (            
 select *, rank() over(partition by upc_name order by total_votes DESC) as rnk
 from results_19_upc
 order by upc_name)
 select * from winners19 where rnk=2;
 -------------------------------------------------
Top 5 candidates based on margin difference with runners in 2014
 solution : 
 select upc_name, w.candidate, w.party, w.total_votes,w.rnk, r.candidate, r.party, r.total_votes,r.rnk ,w.total_votes-r.total_votes as margin
 from winners_14 w
 join runners_14 r
 using(upc_name)
 order by margin desc
 limit 5;
 -----------------------------------------------
 
Top 5 candidates based on margin difference with runners in 2019
solution : 
 select upc_name, w.candidate, w.party, w.total_votes,w.rnk, r.candidate, r.party, r.total_votes,r.rnk ,w.total_votes-r.total_votes as margin
 from winners_19 w
 join runners_19 r
 using(upc_name)
 order by margin desc
 limit 5;