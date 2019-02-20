--4. Выберите города (ид и название), в которые были доставлены товары, входящие в тройку самых дорогих товаров, а также Имя сотрудника, который осуществлял упаковку заказов

with invoice as
(select distinct CustomerID, PackedByPersonID from [Sales].[Invoices] si
where exists
(select InvoiceID from [Sales].[InvoiceLines] il
where UnitPrice >= 
(select UnitPrice from [Warehouse].[StockItems]
order by UnitPrice desc 
offset 2 rows fetch next 1 rows only) and si.InvoiceID = il.InvoiceID)),

city_id as
(select CustomerID, DeliveryCityID as CityId, CityName from [Sales].[Customers] sc
inner join
(select CityID, CityName from [Application].[Cities]) ac on sc.DeliveryCityID = ac.CityID
)


select inv.CustomerID, ap.FullName, cid.CityId, cid.CityName
from
invoice inv
inner join
(select PersonID, FullName, IsEmployee from [Application].[People]) ap on inv.PackedByPersonID = ap.PersonID
inner join
(select CustomerID, CityId , CityName from city_id) cid on inv.CustomerID = cid.CustomerID
order by CustomerID