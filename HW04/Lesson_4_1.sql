--1. Выберите сотрудников, которые являются продажниками, и еще не сделали ни одной продажи.
-- На основании таблиц [Application].[People] и [Sales].[Orders] я не нашла продажников, которые не сделали продаж. Каждый из них сделал более 7 тыс заказов.
-- Первые два варианта запросов показывают, что продажников с нулем продаж нет. 
-- В остальных трех вариантах запросов я вывожу количество продаж для каждого продажника, чтобы воочую убедиться, что у всех есть продажи.

-- Вариант 1 
SELECT [PersonID]
      ,[FullName]
      ,[IsSalesperson]
  FROM [Application].[People] t1
  where IsSalesperson = 1 and not exists (select [SalespersonPersonID] from [Sales].[Orders] t2 where t1.PersonID = t2.SalespersonPersonID)
;

-- Вариант 2
SELECT [PersonID]
      ,[FullName]
      ,[IsSalesperson]
FROM Application.People
WHERE (SELECT count(*)
	FROM Sales.Orders
	WHERE SalespersonPersonID = People.PersonID) = 0 and IsSalesperson = 1
;

-- Вариант 3
SELECT [PersonID]
      ,[FullName]
      ,[IsSalesperson]
	  ,(SELECT count (t2.OrderID) from [Sales].[Orders] t2
	  group by [SalespersonPersonID] 
	  having t1.PersonID = t2.SalespersonPersonID) count_orders
  FROM [Application].[People] t1
  where IsSalesperson = 1 
;

-- Вариант 4
select 
     [PersonID]
    ,[FullName]
    ,[IsSalesperson]
	,count_orders
	from
(SELECT [PersonID]
      ,[FullName]
      ,[IsSalesperson]
  FROM [Application].[People] t1
  where IsSalesperson = 1) pers
left join
(SELECT [SalespersonPersonID], count (OrderID) as count_orders
  FROM [Sales].[Orders]
group by [SalespersonPersonID]) ord on pers.[PersonID] = ord.[SalespersonPersonID]
;

-- Вариант 5 (с with)
with salesperson as 
(SELECT [PersonID]
      ,[FullName]
      ,[IsSalesperson]
  FROM [Application].[People] t1
  where IsSalesperson = 1)
,orders as
(SELECT [SalespersonPersonID], count (OrderID) as count_orders
  FROM [Sales].[Orders]
group by [SalespersonPersonID])
select [PersonID]
      ,[FullName]
      ,[IsSalesperson]
	  ,[count_orders]
	  from salesperson
	  left join
	  orders on salesperson.PersonID = orders.SalespersonPersonID
;