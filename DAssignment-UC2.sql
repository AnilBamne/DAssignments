--UC-2: Write a complex query on 'transaction_loyalty' and 'transaction_loyalty_lineitem' to fetch User Id,
--Total Spend, Total Bills, Total Visits, Last Transaction Date, First Transaction Date, First Transaction Store,
--Last Transaction Store, Favourite Store and Total Qty Purchased for 'Customer Single View'.
--Use 'transaction_loyalty' and 'transaction_loyalty_lineitem' table and Display above mentioned result
--set in UC2.	
	--Quary
	Select t.user_id as user_id, 
	count(*) as total_visit ,
	sum(t.amount - t.discount) as total_spend ,
	sum(t.amount) as total_bill ,
	max(t.txn_date) as first_transaction_date ,
	min(t.txn_date) as last_transaction_date,
	max(t.store_name) as first_transaction_store ,
	min(t.store_name) as first_transaction_store ,
	max(fs.store_name) as fav_store,
	sum(tl.qty) as total_quantity_purchase 
	
	from transaction_log_loyalty t
	Inner Join transaction_log_loyalty_lineitem tl on tl.user_id=t.user_id
	left join (select user_id,store_name from transaction_log_loyalty)fs on t.user_id=fs.user_id
	group by t.user_id
	order by t.user_id
-----------------------------------------------------------------------------------------------------------	
--View
	Create view CustomerSingleView
	As
	Select t.user_id as user_id, 
	count(*) as total_visit ,
	sum(t.amount - t.discount) as total_spend ,
	sum(t.amount) as total_bill ,
	max(t.txn_date) as first_transaction_date ,
	min(t.txn_date) as last_transaction_date,
	max(t.store_name) as first_transaction_store ,
	min(t.store_name) as last_transaction_store ,
	max(fs.store_name) as fav_store,
	sum(tl.qty) as total_quantity_purchase 
	
	from transaction_log_loyalty t
	Inner Join transaction_log_loyalty_lineitem tl on tl.user_id=t.user_id
	left join (select user_id,store_name from transaction_log_loyalty)fs on t.user_id=fs.user_id
	group by t.user_id
	Select * from CustomerSingleView


	-- query to save output in csv file
	--	sqlcmd -S <(MSSQLLocalDB> -d <DAssignments> -U <Anil> -P <123> -Q "SELECT * FROM CustomerSingleView" -s "," -o "C:\Users\HP\Desktop\DAssignments\SqlFiles\output.csv" -W

----------------------------------------------------------------------------------------------------------------------------

-- quary to save result into csv file

	--Declare @SqlCmd Nvarchar(MAX);
	--Set @SqlCmd=
	--'bcp " '+
	--'Select t.user_id as user_id,'+ 
	--'count(*) as total_visit ,'+
	--'sum(t.amount - t.discount) as total_spend ,'+
	--'sum(t.amount) as total_bill ,'+
	--'max(t.txn_date) as first_transaction_date ,'+
	--'min(t.txn_date) as last_transaction_date,'+
	--'max(t.store_name) as first_transaction_store ,'+
	--'min(t.store_name) as first_transaction_store ,'+
	--'max(fs.store_name) as fav_store,'+
	--'sum(tl.qty) as total_quantity_purchase'+ 
	--'from transaction_log_loyalty t'+
	--'Inner Join transaction_log_loyalty_lineitem tl on tl.user_id=t.user_id'+
	--'left join (select user_id,store_name from transaction_log_loyalty)fs on t.user_id=fs.user_id'+
	--'group by t.user_id'+
	--'order by t.user_id'+
	--'" ' +
	--   'queryout "C:\Users\HP\Desktop\DAssignments\SqlFiles\ResultFile.csv.xlsx" -c -T -S <(localdb)\MSSQLLocalDB>';

	--EXEC xp_cmdshell @SqlCmd;


	-------------------------------  Mogify config file   -----------------------------

--EXEC sp_configure 'show advanced options', 1
--GO
--RECONFIGURE
--GO
---- enable xp_cmdshell
--EXEC sp_configure 'xp_cmdshell', 1
--GO
--RECONFIGURE
--GO
---- hide advanced options
--EXEC sp_configure 'show advanced options', 0
--GO
--RECONFIGURE
--GO

------------------------------ -----------------
--bcp AdventureWorks.Sales.SalesOrderDetail out C:\ExportedData.csv -c -T -S localhost


