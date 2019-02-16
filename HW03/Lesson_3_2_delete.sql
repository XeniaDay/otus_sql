--2. удалите 1 запись из Customers, которая была вами добавлена

delete from Sales.Customers 
where CustomerID in (select CustomerID from Sales.Customers 
where YEAR (AccountOpenedDate) = '2019'
order by CustomerID desc
offset 2 rows
fetch first 1 rows only) 