-- task 2a
SELECT  Name
	, CASE WHEN StandardCost = 0 OR StandardCost IS NULL THEN 'Not for sale'
	     WHEN StandardCost > 0 AND StandardCost < 100 THEN '<$100'
		 WHEN StandardCost >= 100 AND StandardCost < 500 THEN ' <$500'
	ELSE '>= $500'
	END as PriceRange
FROM Production.Product;


-- task 2b
SELECT  pv.ProductID
		, pv.BusinessEntityID
		, v.Name
FROM Purchasing.ProductVendor as pv
LEFT JOIN Purchasing.Vendor as v ON pv.BusinessEntityID = v.BusinessEntityID 
WHERE pv.StandardPrice > 10
	AND (v.Name LIKE '%X%' OR v.Name LIKE 'N%'); 


-- task 2c
SELECT v.Name
FROM Purchasing.Vendor as v
LEFT JOIN Purchasing.ProductVendor as pv ON pv.BusinessEntityID = v.BusinessEntityID
WHERE pv.BusinessEntityID IS NULL


-- task 3a
SELECT p.Name
	, p.StandardCost
FROM Production.Product as p
LEFT JOIN Production.ProductModel as pm ON p.ProductModelID = pm.ProductModelID
WHERE pm.Name LIKE 'LL%';


-- task 3b
SELECT t.Name
FROM
	(SELECT Name
	FROM Purchasing.Vendor
	UNION
	SELECT Name
	FROM Sales.Store) t
ORDER BY t.Name;


-- task 3c
SELECT p.Name
FROM Production.Product as p 
LEFT JOIN Sales.SpecialOfferProduct as sop ON p.ProductID = sop.ProductID
LEFT JOIN Sales.SpecialOffer as so ON so.SpecialOfferID = sop.SpecialOfferID
GROUP BY p.Name
HAVING COUNT(sop.SpecialOfferID) > 1;

