-- 2. Выберите товары с минимальной ценой (подзапросом), 2 варианта подзапроса. 
-- На редкость неоднозначное задание. Откуда выбрать? Почему товарЫ во множественном числе, если товар с минимальной ценой за штуку всего один?

-- Вариант 1
SELECT [OrderLineID]
      ,[OrderID]
      ,[StockItemID]
      ,[Description]
      ,[Quantity]
      ,[UnitPrice]
  FROM [Sales].[OrderLines] so
  where UnitPrice in (select min (UnitPrice) from Warehouse.StockItems ws)
;

-- Вариант 2
SELECT [OrderLineID]
      ,[OrderID]
      ,[StockItemID]
      ,[Description]
      ,[Quantity]
      ,[UnitPrice]
  FROM [Sales].[OrderLines] so
  where UnitPrice <= ALL (select min (UnitPrice) from Warehouse.StockItems ws)
;

-- Вариант 3
SELECT [OrderLineID]
      ,[OrderID]
      ,so.[StockItemID]
      ,[Description]
      ,[Quantity]
      ,[UnitPrice]
  FROM [Sales].[OrderLines] so
  inner join
  (select min (UnitPrice) min_price from Warehouse.StockItems) ws on so.UnitPrice = ws.min_price
;

-- Вариант 4 (с with)
with min_price as
(select min (UnitPrice) min_price from Warehouse.StockItems)

SELECT [OrderLineID]
      ,[OrderID]
      ,so.[StockItemID]
      ,[Description]
      ,[Quantity]
      ,[UnitPrice]
  FROM [Sales].[OrderLines] so
  inner join
  min_price on so.UnitPrice = min_price.min_price
;