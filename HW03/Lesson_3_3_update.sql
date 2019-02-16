--3. изменить одну запись, из добавленных через UPDATE

update Sales.Customers set 
CustomerName = 'Cristine Rouch', 
PrimaryContactPersonID = 3250, 
PhoneNumber = '(555) 555-0101', 
FaxNumber = '(555) 555-0101'
OUTPUT 
inserted.CustomerName, 
inserted.PrimaryContactPersonID,
inserted.PhoneNumber,
inserted.FaxNumber,
deleted.CustomerName,
deleted.PrimaryContactPersonID,
deleted.PhoneNumber,
deleted.FaxNumber
where CustomerID in 
(select top 1 CustomerID from Sales.Customers
where year (ValidFrom) = '2019'
order by CustomerID)