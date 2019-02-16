--1. Довставлять в базу 5 записей используя insert в таблицу Customers или Suppliers

INSERT INTO [Sales].[Customers]	
	
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
