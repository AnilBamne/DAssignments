--UC-4: For ‘ Drop Rate’, Create a Stored procedure and display as ‘Total Visit’ by the user to fetch the
--Total time customer visited the store.
--Use 'transaction_loyalty' and 'transaction_loyalty_lineitem' table and daily total visits by users.
Use DAssignments


Create Procedure spDropRate
As
Begin
	Begin Try
		Begin Tran
			select  visit_rank, count(user_id) occurences from transaction_log_loyalty
			group by visit_rank
			order by visit_rank
		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
	End Catch
End

Exec spDropRate