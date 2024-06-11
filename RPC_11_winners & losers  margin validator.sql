
//validator for gain
SELECT *, pct_vs19-pct_vs14 as diff
FROM const_pct_vs14
join const_pct_vs19
using (upc_name,party)
where upc_name= "TN-Karur"
order by diff desc;

//validator for loss
SELECT *, pct_vs14-pct_vs19 as diff
FROM const_pct_vs14
join const_pct_vs19
using (upc_name,party)
where upc_name= "MH-Sangli"
order by diff desc;