-- 1. Посчитать среднюю цену товара, общую сумму продажи по месяцам

SELECT minv
	  ,AVG (UnitPrice) avg_price
	  ,SUM (Quantity * UnitPrice) sum_inv
FROM [WideWorldImporters].[Sales].[InvoiceLines]
INNER JOIN
(SELECT InvoiceID, MONTH (InvoiceDate) minv FROM [Sales].[Invoices]) i on i.InvoiceID = [InvoiceLines].InvoiceID
group by minv
order by minv