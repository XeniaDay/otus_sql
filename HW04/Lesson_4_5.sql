--5. Объясните, что делает и оптимизируйте запрос

with Invoice27k as
(SELECT OrderID, II.InvoiceID, II.TotalSumm FROM [Sales].[Invoices]
INNER JOIN
(SELECT InvoiceLines.InvoiceId, 
SUM (Quantity * UnitPrice) AS TotalSumm
FROM Sales.InvoiceLines
GROUP BY InvoiceId
HAVING SUM (Quantity * UnitPrice) > 27000) ii ON Invoices.InvoiceID = II.InvoiceID)

SELECT InvoiceID,
InvoiceDate,
(SELECT People.FullName FROM [Application].[People] WHERE People.PersonID = SalespersonPersonID) AS SalesPersonName,
(SELECT TotalSumm FROM Invoice27k K WHERE K.InvoiceID = inv.InvoiceID) AS TotalSummByInvoice,
oid.TotalSummForPickedItems
FROM [Sales].[Invoices] inv
INNER JOIN
(SELECT OrderID, SUM (OrderLines.PickedQuantity * OrderLines.UnitPrice) AS TotalSummForPickedItems FROM [Sales].[OrderLines]
WHERE OrderID IN (SELECT OrderID FROM Invoice27k) AND PickingCompletedWhen IS NOT NULL
GROUP BY OrderID
) oid ON inv.OrderID = oid.OrderID
ORDER BY TotalSummByInvoice DESC

/*
Что делает запрос:
Запрос показывает те заказы, сумма которых превышает 27 тыс, выводит суммы заказанных и отгруженных товаров, выводит фио продавца и дату отгрузки.

Ход рассуждений на тему оптимизации:
Основным условием, сильно уменьшающим количество строк, является определение заказов на сумму более 27 тыс. 
В исходном запросе это условие появляется в самом конце, тогда, когда все требуемые преобразования уже сделаны на полных объемах таблиц.
Используя эту идею, я постаралась вынести это ограничение в самое начало, стараясь с его помощью ограничивать количество данных для преобразований.
Помимо самого отбора данных в группировке, в конструкцию WITH я добавила связующие поля для того, чтоы можно было анализировать как заказы, так и отгрузки.
К сожалению, я не придумала, каким образом можно избавиться от того, чтобы дважды читать таблицу [Sales].[Invoices], но я попыталась это чтение минимизировать.
Не совсем понимаю, как работает оператор WITH, а навыков чтения плана у меня недостаточно чтобы это понять. 
Создает ли WITH некую временную таблицу или каждый раз пересчитывае все заново?
Мне кажется, что это некая временная таблица, но не уверена. 
Тем не менее, мне удалось увеличить скорость работы запроса и, возможно, его читаемость.

Сравнительный план работы запросов выложен в файле Lesson_4_5_plan. Вверху новый вариант запроса, внизу старый.
*/