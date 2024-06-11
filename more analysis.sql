
select count(candidate) from results_14 where sex="F"
select count(candidate) from results_14 where sex="M"
select count(candidate) from results_19 where sex="M"
select count(candidate) from results_19 where sex="F"

select count(candidate) from results_19 where party="INC"

//duplicate pc_names
SELECT distinct(state_name), pc_name
FROM results_14
WHERE pc_name IN (
    SELECT pc_name
    FROM results_14
    GROUP BY pc_name
    HAVING COUNT(DISTINCT state_name) > 1
)
ORDER BY pc_name, state_name;