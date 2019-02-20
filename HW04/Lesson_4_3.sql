--3. Выберите всех клиентов у которых было 5 максимальных оплат из [Sales].[CustomerTransactions] представьте 3 способа (в том числе с CTE)

-- Вариант 1
select distinct sc.CustomerID, CustomerName, PhoneNumber from Sales.Customers sc
inner join
(SELECT TOP (5) [CustomerID]
      ,[TransactionAmount]
  FROM [Sales].[CustomerTransactions]
  order by TransactionAmount desc) ct on sc.CustomerID = ct.CustomerID
;

-- Вариант 2
with max_5 as
(SELECT distinct [CustomerID] from
(SELECT TOP (5) [CustomerID]
      ,[TransactionAmount]
  FROM [Sales].[CustomerTransactions]
  order by TransactionAmount desc) r
)

select sc.CustomerID, CustomerName, PhoneNumber from Sales.Customers sc
inner join
 max_5 on sc.CustomerID = max_5.CustomerID
;


-- Вариант 3
with max_5 as
(SELECT distinct [CustomerID] from
(SELECT TOP (5) [CustomerID]
      ,[TransactionAmount]
  FROM [Sales].[CustomerTransactions]
  order by TransactionAmount desc) r
)

select sc.CustomerID, CustomerName, PhoneNumber from Sales.Customers sc
where sc.CustomerID in (select * from max_5)
;


-- Вариант 4
with max_5 as
(SELECT distinct [CustomerID] from [Sales].[CustomerTransactions]
where [TransactionAmount] >= 
(SELECT [TransactionAmount]
  FROM [Sales].[CustomerTransactions]
  order by TransactionAmount desc
  offset 4 rows fetch next 1 rows only
  )
)

select sc.CustomerID, CustomerName, PhoneNumber from Sales.Customers sc
where sc.CustomerID in (select * from max_5)
;


-- Вариант 5
with max_5 as
(SELECT distinct [CustomerID] from
(SELECT [CustomerID]
	  ,ROW_NUMBER () over (order by [TransactionAmount] desc) as max_A
      ,[TransactionAmount]
  FROM [Sales].[CustomerTransactions]) r
  where max_A between 1 and 5
)

select sc.CustomerID, CustomerName, PhoneNumber from Sales.Customers sc
where sc.CustomerID in (select * from max_5)
;