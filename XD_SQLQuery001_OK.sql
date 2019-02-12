--1. Все товары, в которых в название есть пометка urgent или название начинается с Animal

SELECT * FROM [WideWorldImporters].[Warehouse].[StockItems]
where StockItemName like '%urgent%'or StockItemName like 'Animal%'