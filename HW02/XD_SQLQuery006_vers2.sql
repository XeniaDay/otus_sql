--6. Все ид и имена клиентов и их контактные телефоны, которые покупали товар Chocolate frogs 250g

SELECT distinct so.[OrderID], [CustomerName], [PhoneNumber] 
FROM [WideWorldImporters].[Sales].[Orders] so 
inner join 
[Sales].[OrderLines] ol on so.OrderID = ol.OrderID 
inner join 
[Warehouse].[StockItems] si on ol.StockItemID = si.StockItemID 
inner join 
[Sales].[Customers] sc on so.CustomerID = sc.CustomerID 
where StockItemName = 'Chocolate frogs 250g'
