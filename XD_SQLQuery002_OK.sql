--2. �����������, � ������� �� ���� ������� �� ������ ������ 
--(����� ������� ��� ��� ������ ����� ���������, ������ �������� ����� JOIN)

select sup.* from [WideWorldImporters].[Purchasing].[Suppliers] sup
left join
(SELECT distinct SupplierID
FROM [WideWorldImporters].[Purchasing].[PurchaseOrders]) pur on sup.SupplierID = pur.SupplierID
where pur.SupplierID is null
order by SupplierID