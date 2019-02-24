-- 2. Отобразить все месяцы, где общая сумма продаж превысила 10 000 

SELECT minv
	,yinv 
	,SUM (Quantity * UnitPrice) sum_inv
FROM [WideWorldImporters].[Sales].[InvoiceLines]
INNER JOIN
(SELECT InvoiceID, MONTH (InvoiceDate) minv, YEAR (InvoiceDate) yinv FROM [Sales].[Invoices]) i on i.InvoiceID = [InvoiceLines].InvoiceID
group by yinv, minv
having SUM (Quantity * UnitPrice) > 10000
order by yinv, minv