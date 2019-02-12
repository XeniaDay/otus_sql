--5. 10 ��������� �� ���� ������ � ������ ������� � ������ ����������, ������� ������� �����.

SELECT top 10 sc.CustomerName, ap.FullName, [OrderDate] 
FROM [WideWorldImporters].[Sales].[Orders] od 
inner join 
[Sales].[Customers] sc on od.CustomerID = sc.CustomerID 
inner join 
[Application].[People] ap on od.SalespersonPersonID = ap.PersonID 
order by OrderDate desc