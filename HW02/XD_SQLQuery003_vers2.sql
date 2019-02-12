--3. Продажи с названием месяца, в котором была продажа, номером квартала, к которому относится продажа, 
--включите также к какой трети года относится дата - каждая треть по 4 месяца, дата забора заказа должна быть задана, 
--с ценой товара более 100$ либо количество единиц товара более 20. 
--Добавьте вариант этого запроса с постраничной выборкой пропустив первую 1000 и отобразив следующие 100 записей. 
--Соритровка должна быть по номеру квартала, трети года, дате продажи. 


SELECT distinct s.[OrderID], 
[OrderDate], 
DATENAME(month, OrderDate) month_name, 
DATEPART(quarter, OrderDate) quarter_num, 
((MONTH(OrderDate)-1)/4 + 1) third_num 
FROM [WideWorldImporters].[Sales].[Orders] s 
inner join 
[WideWorldImporters].[Sales].[OrderLines] d on s.OrderID = d.OrderID 
where (Quantity > 20 or UnitPrice > 100) and ExpectedDeliveryDate is not null 
order by quarter_num, third_num, OrderDate, s.[OrderID] 
offset 1000 rows 
fetch first 100 rows only 
