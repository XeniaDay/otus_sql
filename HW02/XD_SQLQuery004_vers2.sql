--4. Заказы поставщикам, которые были исполнены за 2014й год с доставкой Road Freight или Post, 
--добавьте название поставщика, имя контактного лица принимавшего заказ

SELECT distinct [PurchaseOrderID], OrderDate, SupplierName, FullName, DeliveryMethodName 
FROM [WideWorldImporters].[Purchasing].[PurchaseOrders] po 
inner join 
[Application].[DeliveryMethods] dm on po.DeliveryMethodID = dm.DeliveryMethodID 
inner join 
[Purchasing].[Suppliers] sp on po.SupplierID = sp.SupplierID 
inner join 
[Application].[People] ap on po.ContactPersonID = ap.PersonID 
where DeliveryMethodName in ('Post', 'Road Freight') and DATEPART (year, OrderDate) = 2014 
order by PurchaseOrderID
