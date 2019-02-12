--2. Поставщиков, у которых не было сделано ни одного заказа 
--(потом покажем как это делать через подзапрос, сейчас сделайте через JOIN)

select sup.* from [WideWorldImporters].[Purchasing].[Suppliers] sup
left join
(SELECT distinct SupplierID
FROM [WideWorldImporters].[Purchasing].[PurchaseOrders]) pur on sup.SupplierID = pur.SupplierID
where pur.SupplierID is null
order by SupplierID
