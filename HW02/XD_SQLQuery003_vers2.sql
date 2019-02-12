--3. ������� � ��������� ������, � ������� ���� �������, ������� ��������, � �������� ��������� �������, 
--�������� ����� � ����� ����� ���� ��������� ���� - ������ ����� �� 4 ������, ���� ������ ������ ������ ���� ������, 
--� ����� ������ ����� 100$ ���� ���������� ������ ������ ����� 20. 
--�������� ������� ����� ������� � ������������ �������� ��������� ������ 1000 � ��������� ��������� 100 �������. 
--���������� ������ ���� �� ������ ��������, ����� ����, ���� �������. 

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