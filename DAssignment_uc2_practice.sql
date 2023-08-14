--UC2 :  Write a complex query on 'transaction_loyalty' and 'transaction_loyalty_lineitem' to fetch User Id,
--	Total Spend, Total Bills, Total Visits, Last Transaction Date, First Transaction Date, First Transaction Store,
--  Last Transaction Store, Favourite Store and Total Qty Purchased for 'Customer Single View'.

--creating a view on 'transaction_loyalty' and 'transaction_loyalty_lineitem' tables

--1visit times
Select count(*) as total_visit from transaction_log_loyalty t
Inner Join transaction_log_loyalty_lineitem tl On tl.user_id=t.user_id
Where t.user_id=5

--2total spend
Select sum(t.amount - t.discount) as total_spend from transaction_log_loyalty t
Inner Join transaction_log_loyalty_lineitem tl On tl.user_id=t.user_id
Where t.user_id=13

--3total bill
Select sum(t.amount) as total_bill from transaction_log_loyalty t
Inner Join transaction_log_loyalty_lineitem tl On tl.user_id=t.user_id
Where t.user_id=13

--4first transaction date
select top 1 txn_date as first_transaction_date from transaction_log_loyalty where user_id=8 order by txn_date 
--5last transaction date
select top 1 txn_date as last_transaction_date from transaction_log_loyalty where user_id=8 order by txn_date desc

--6first transaction store
select top 1 store_name as first_transaction_store from transaction_log_loyalty where user_id=8 order by store_name

--7last transaction store
select top 1 store_name as last_transaction_store from transaction_log_loyalty where user_id=8 order by store_name desc

--8favorite store
select user_id, store_name as favorite_store from transaction_log_loyalty where visit_rank In (select max(visit_rank) from transaction_log_loyalty) group by user_id

--9 total qty purchase
Select sum(qty) as total_qty_purchase from transaction_log_loyalty_lineitem Where user_id=8


Select t.user_id,t.amount as total_spend,t.txn_date from transaction_log_loyalty t
Where t.user_id=50
union
Select sum(qty) as total_qty_purchase from transaction_log_loyalty_lineitem Where user_id=50


--==============================================
Select  count(*) as total_visits,sum(t.amount - t.discount) as total_spend, sum(t.amount) as total_bill from transaction_log_loyalty t
Where t.user_id=5


With CTEFavo As (select top 1 store_name as favorite_store from transaction_log_loyalty where user_id=92 order by visit_rank desc
)
select * from CTEFavo


--=================================
--visit times
Select count(*) as total_visit from transaction_log_loyalty t where t.user_id=8
Union
--total spend
Select sum(t.amount - t.discount) as total_spend from transaction_log_loyalty t where t.user_id=8

