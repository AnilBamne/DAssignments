select * from transaction_log_loyalty where user_id=8
select * from transaction_log_loyalty_lineitem where user_id=8

--select count(distinct user_id) from transaction_log_loyalty where  visit_rank=4

--SELECT
--    CONVERT(DATE, tl.txn_date) AS visit_date,
--    COUNT(DISTINCT tl.user_id) AS total_customers_visited
--FROM
--    transaction_log_loyalty tl
--GROUP BY
--    CONVERT(DATE, tl.txn_date)
--ORDER BY
--    visit_date DESC;

select count(distinct transaction_log_loyalty.visit_rank),COUNT( transaction_log_loyalty.user_id) from transaction_log_loyalty
inner join transaction_log_loyalty_lineitem t on t.user_id=transaction_log_loyalty.user_id 
group by transaction_log_loyalty.txn_date order by transaction_log_loyalty.txn_date

--select count( t.user_id)as users,count(t.txn_date) as dates from transaction_log_loyalty t
--inner join transaction_log_loyalty_lineitem tl On tl.user_id=t.user_id
--where t.visit_rank =4

--select count(*) from transaction_log_loyalty group by visit_rank order by visit_rank desc
select count(distinct txn_date) from transaction_log_loyalty where visit_rank=1
