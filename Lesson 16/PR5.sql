--1. Найти ProductSubcategoryID из Production.Product, где мин вес такого ProductSubcategoryID больше 150. 

SELECT ProductSubcategoryID
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING MIN(Weight) >150



SELECT *
FROM Production.Product

--2. Найти самый дорогой продукт (поле StandardCost) из Production.Product. (4 способа)

--1
SELECT TOP 1 WITH TIES Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC

--2
WITH temp AS
(
	SELECT Name, StandardCost
	FROM Production.Product
)
SELECT *
FROM temp
WHERE StandardCost=(select max(StandardCost) FROM temp)

--3
SELECT * 
FROM
(
SELECT Name, StandardCost,  ROW_NUMBER() OVER (ORDER BY StandardCost DESC) AS rn
FROM Production.Product
) max_sc
WHERE rn=1

--4
SELECT * 
FROM
(
SELECT Name, StandardCost, MAX(StandardCost) OVER () as max_sc
FROM Production.Product
GROUP BY Name, StandardCost
) max_sc
WHERE StandardCost=max_sc



--3. Найти клиентов, которые за последний год не совершили ни одного заказа (схема GROUP2)

SELECT FirstName, LastName
FROM Client C LEFT JOIN (
	SELECT ClientID
	FROM Orders O 
	WHERE DATEDIFF(day, OrderDate, GETDATE()) <365 ) T ON T.ClientID=C.ClientID
WHERE t.ClientID IS NULL



--4. Найти для каждого поставщика кол-во заказов за последние 5 лет.  (схема GROUP2)

--SELECT v.VendorID, 
--		FirstName, 
--		LastName,  
--		COUNT() OVER (PARTITION BY v.VendorID) as cnt
--FROM Orders o 
--JOIN Vendor v ON o.VendorID=v.VendorID
--WHERE DATEDIFF(day, OrderDate, GETDATE()) <365*5
--GROUP BY 


--5. 
--Users (
--    id bigint NOT NULL,
--    email varchar(255) NOT NULL
--);

--Notifications (
--    id bigint NOT NULL,
--    user_id bigint NOT NULL,
--    category varchar(100),
--    is_read boolean DEFAULT false
--);

--Найти список категорий для пользователя alex@gmail.com, в которых более 50 непрочитанных нотификаций