SELECT YearNum, January, February, December
FROM 
(SELECT OrderQty, YEAR(DueDate) as YearNum, DATENAME(MONTH, DueDate) as MonthNm
    FROM Production.WorkOrder
	WHERE MONTH(DueDate) IN (1, 2, 12)
) AS SourceTable  
PIVOT
( 
	SUM(OrderQty)
	FOR MonthNm IN (January, February, December)
) AS PivotTable
ORDER BY YearNum
