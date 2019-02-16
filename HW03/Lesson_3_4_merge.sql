-- 4. Написать MERGE, который вставит запись в клиенты, если ее там нет, и изменит если она уже есть

--- создаем таблицу, аналогичную [Sales].[Customers]
--- вставляем 5 строк из первой задачи
--- пишем Merge, т.к. некоторые записи мы удаляли, то недостающие Merge вставит еще раз

-- 1. Создаем таблицу, аналогичную [Sales].[Customers]
CREATE TABLE [Sales].[Customers2019] (
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[BillToCustomerID] [int] NOT NULL,
	[CustomerCategoryID] [int] NOT NULL,
	[BuyingGroupID] [int] NULL,
	[PrimaryContactPersonID] [int] NOT NULL,
	[AlternateContactPersonID] [int] NULL,
	[DeliveryMethodID] [int] NOT NULL,
	[DeliveryCityID] [int] NOT NULL,
	[PostalCityID] [int] NOT NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[AccountOpenedDate] [date] NOT NULL,
	[StandardDiscountPercentage] [decimal](18, 3) NOT NULL,
	[IsStatementSent] [bit] NOT NULL,
	[IsOnCreditHold] [bit] NOT NULL,
	[PaymentDays] [int] NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[FaxNumber] [nvarchar](20) NOT NULL,
	[DeliveryRun] [nvarchar](5) NULL,
	[RunPosition] [nvarchar](5) NULL,
	[WebsiteURL] [nvarchar](256) NOT NULL,
	[DeliveryAddressLine1] [nvarchar](60) NOT NULL,
	[DeliveryAddressLine2] [nvarchar](60) NULL,
	[DeliveryPostalCode] [nvarchar](10) NOT NULL,
	[DeliveryLocation] [geography] NULL,
	[PostalAddressLine1] [nvarchar](60) NOT NULL,
	[PostalAddressLine2] [nvarchar](60) NULL,
	[PostalPostalCode] [nvarchar](10) NOT NULL,
	[LastEditedBy] [int] NOT NULL
	)
;

--2. Вставляем 5 строк из первой задачи

INSERT INTO [Sales].[Customers2019]	
	
([CustomerID]			
,[CustomerName]			
,[BillToCustomerID]			
,[CustomerCategoryID]			
,[BuyingGroupID]			
,[PrimaryContactPersonID]			
,[AlternateContactPersonID]			
,[DeliveryMethodID]			
,[DeliveryCityID]			
,[PostalCityID]			
,[CreditLimit]			
,[AccountOpenedDate]			
,[StandardDiscountPercentage]			
,[IsStatementSent]			
,[IsOnCreditHold]			
,[PaymentDays]			
,[PhoneNumber]			
,[FaxNumber]			
,[DeliveryRun]			
,[RunPosition]			
,[WebsiteURL]			
,[DeliveryAddressLine1]			
,[DeliveryAddressLine2]			
,[DeliveryPostalCode]			
,[DeliveryLocation]			
,[PostalAddressLine1]			
,[PostalAddressLine2]			
,[PostalPostalCode]			
,[LastEditedBy])			

VALUES	

(
NEXT VALUE FOR Sequences.CustomerID
,'Cris Rouch'
,1061
,7
,NULL
,3258
,NULL
,3
,5192
,5192
,2940.00
,'01.01.2019'
,0.000
,0
,0
,7
,'(505) 555-0100'
,'(505) 555-0101'
,''
,''
,'http://www.microsoft.com/CrisRouch/'
,'Suite 9'
,'908 Nadar Lane'
,'90602'
,0xE6100000010C4D3338A517D44140D80E46EC13AF5AC0
,'PO Box 1954'
,'Gonzalesville'
,'90602'
,15
),		
(
Next value for Sequences.CustomerID
,'Alice Lee'
,1061
,3
,NULL
,3258
,NULL
,3
,33799
,33799
,2000.00
,'01.01.2019'
,0.000
,0
,0
,7
,'(209) 555-0100'
,'(209) 555-0101'
,''
,''
,'http://www.microsoft.com/AliceLee/'
,'Unit 7'
,'844 Magnusson Lane'
,'90676'
,0xE6100000010CE9915044D06E4440CA709758741D5EC0
,'PO Box 8565'
,'Blahoville'
,'90676'
,1
),	
(	
Next value for Sequences.CustomerID
,'Xue Nu Wang'
,1061
,5
,NULL
,3258
,NULL
,3
,18069
,18069
,2200.00
,'01.01.2019'
,0.000
,0
,0
,7
,'(605) 555-0100'
,'(605) 555-0101'
,''
,''
,'http://www.microsoft.com/XueNuWang/'
,'Shop 20'
,'498 Bagheri Lane'
,'90797'
,0xE6100000010CB2E20ADE46864640D37D4ADF352B58C0
,'PO Box 6490'
,'Linnaville'
,'90797'
,2
),	
(	
Next value for Sequences.CustomerID
,'Xiao Long'
,1061
,3
,NULL
,3258
,NULL
,3
,10194
,10194
,3300.00
,'01.01.2019'
,0.000
,0
,0
,7
,'(907) 555-0100'
,'(907) 555-0101'
,''
,''
,'http://www.microsoft.com/XiaoLong/'
,'Shop 16'
,'1071 Goransson Crescent'
,'90457'
,0xE6100000010CB4D771B2C3AC4D4079F0C97935AF63C0
,'PO Box 6237'
,'Shakibaville'
,'90457'
,1
),	
(	
Next value for Sequences.CustomerID
,'Yang Zhi'
,1061
,3
,NULL
,3258
,NULL
,3
,31685
,31685
,3000.00
,'01.01.2019'
,0.000
,0
,0
,7
,'(307) 555-0100'
,'(307) 555-0101'
,''
,''
,'http://www.microsoft.com/YangZhi/'
,'Suite 13'
,'808 Riutta Street'
,'90673'
,0xE6100000010CFEDDF1DC31E3444016855D143DC75AC0
,'PO Box 7197'
,'Nadarville'
,'90673'
,3
)
;	

--3. Пишем Merge, т.к. некоторые записи мы удаляли, то недостающие Merge вставит еще раз

MERGE [Sales].[Customers] AS old_cust 
	USING (SELECT * FROM [Sales].[Customers2019]) AS new_cust 
		ON
	 (new_cust.CustomerName = old_cust.CustomerName) 
	WHEN MATCHED 
		THEN UPDATE SET [StandardDiscountPercentage] = old_cust.[StandardDiscountPercentage] + 10.000,
						[CreditLimit] = old_cust.[CreditLimit] + 500.00
	WHEN NOT MATCHED 
		THEN INSERT 
		(CustomerID
		,CustomerName
		,BillToCustomerID
		,CustomerCategoryID
		,BuyingGroupID
		,PrimaryContactPersonID
		,AlternateContactPersonID
		,DeliveryMethodID
		,DeliveryCityID
		,PostalCityID
		,CreditLimit
		,AccountOpenedDate
		,StandardDiscountPercentage
		,IsStatementSent
		,IsOnCreditHold
		,PaymentDays
		,PhoneNumber
		,FaxNumber
		,DeliveryRun
		,RunPosition
		,WebsiteURL
		,DeliveryAddressLine1
		,DeliveryAddressLine2
		,DeliveryPostalCode
		,DeliveryLocation
		,PostalAddressLine1
		,PostalAddressLine2
		,PostalPostalCode
		,LastEditedBy
		) 

			VALUES 
			
		(new_cust.CustomerID
		,new_cust.CustomerName
		,new_cust.BillToCustomerID
		,new_cust.CustomerCategoryID
		,new_cust.BuyingGroupID
		,new_cust.PrimaryContactPersonID
		,new_cust.AlternateContactPersonID
		,new_cust.DeliveryMethodID
		,new_cust.DeliveryCityID
		,new_cust.PostalCityID
		,new_cust.CreditLimit
		,new_cust.AccountOpenedDate
		,new_cust.StandardDiscountPercentage
		,new_cust.IsStatementSent
		,new_cust.IsOnCreditHold
		,new_cust.PaymentDays
		,new_cust.PhoneNumber
		,new_cust.FaxNumber
		,new_cust.DeliveryRun
		,new_cust.RunPosition
		,new_cust.WebsiteURL
		,new_cust.DeliveryAddressLine1
		,new_cust.DeliveryAddressLine2
		,new_cust.DeliveryPostalCode
		,new_cust.DeliveryLocation
		,new_cust.PostalAddressLine1
		,new_cust.PostalAddressLine2
		,new_cust.PostalPostalCode
		,new_cust.LastEditedBy
) 
	OUTPUT deleted.*, $action, inserted.*;
