-- 3. Вывести сумму продаж, дату первой продажи и количество проданного по месяцам, по товарам, продажи которых менее 50 ед в месяц.

SELECT minv
	  ,yinv 
	  ,MIN (InvoiceDate) 
	  ,SUM (Quantity * UnitPrice) sum_inv
	  ,StockItemID
	  ,COUNT (Quantity) countitem
FROM [WideWorldImporters].[Sales].[InvoiceLines]
INNER JOIN
	(SELECT InvoiceID
		,InvoiceDate
		,MONTH (InvoiceDate) minv
		,YEAR (InvoiceDate) yinv 
	FROM [Sales].[Invoices]) i on i.InvoiceID = [InvoiceLines].InvoiceID
group by yinv, minv, StockItemID
having COUNT (Quantity) < 50
order by yinv, minv, COUNT (Quantity)