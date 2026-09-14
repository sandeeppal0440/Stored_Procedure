CREATE PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA' AS
BEGIN
	BEGIN TRY

		DECLARE @TotalCustomers INT, @AvgScore FLOAT

	--=========================================
		--STEP:-1	 Prepare & Cleanup Data
	--=========================================
		IF EXISTS (SELECT 1
					FROM Sales.Customers
					WHERE Score IS NULL AND Country = @Country)
		BEGIN
			PRINT('Updating NULL Scores to 0');
			UPDATE Sales.Customers
			SET Score = 0
			WHERE Score IS NULL AND Country = @Country
		END

		ELSE
		BEGIN
			PRINT('NO NULL scores found');
		END

		--=========================================
		--STEP:2	Generating Summary Report
		--=========================================
		--Calculate Total customers and Average Scores for specific country

		SELECT
			@TotalCustomers = COUNT(*),
			@AvgScore = AVG(Score)
		FROM Sales.Customers
		WHERE Country = @Country


		PRINT 'Total Customers from ' + @Country + ':' + CAST(@TotalCustomers AS NVARCHAR);
		PRINT 'Average Score from ' + @Country + ':' + CAST(@AvgScore AS NVARCHAR);

		--Calculate Total Numbers of Orders and Total Sales for specific country
		SELECT 
			COUNT(OrderID) TotalOrders,
			SUM(Sales) TotalSales,
			1/0							--Note:** The `1/0` statement is included only for learning and testing purposes. It should be removed from production code.
		FROM Sales.Orders o
		JOIN Sales.Customers c
		ON c.CustomerID = o.CustomerID
		WHERE c.Country = @Country
	END TRY

	BEGIN CATCH
	--==================
	--ERROR Handling
	--==================
		PRINT('An Error Occurred.')
		PRINT('Error Message ' + ERROR_MESSAGE())
		PRINT('Error Procedure ' + ERROR_PROCEDURE())
		PRINT('Error Number ' + CAST(ERROR_NUMBER() AS NVARCHAR))
		PRINT('Error Line ' + CAST(ERROR_LINE() AS NVARCHAR))
	END CATCH
END
GO

EXEC GetCustomerSummary; 
EXEC GetCustomerSummary @Country = 'Germany';