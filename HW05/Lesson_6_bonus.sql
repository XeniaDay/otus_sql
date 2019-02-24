-- Напишите запрос, который выбирает 10 клиентов, которые сделали больше 30 заказов и последний заказ был не позднее апреля 2016

SELECT top 10 [CustomerID]
	  ,count (OrderID)
      ,max (OrderDate)
FROM [WideWorldImporters].[Sales].[Orders]
GROUP BY [CustomerID]
HAVING count (OrderID) >= 30 and max (OrderDate) < '2016-05-01'