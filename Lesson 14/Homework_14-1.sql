-- 10 и более тренировок – 3 балла, 5-9 – 2 балла, меньше 5 – 1 балл


	WITH CNT_TR as 
	(
	SELECT vc.VisitDate
			, e.FirstName
			, e.LastName
			, CASE WHEN COUNT(vc.VisitClientID) >=10 THEN 3
				   WHEN COUNT(vc.VisitClientID) BETWEEN 5 AND 9 THEN 2
				ELSE 1
				END AS score
	FROM VisitClients vc
	JOIN VisitEmployees ve on ve.VisitEmployeeID = vc.VisitEmployeeID
	JOIN Employees e on e.EmployeeID = ve.EmployeeID
	GROUP BY vc.VisitDate
			, e.FirstName
			, e.LastName
	),

	TOP50 as
	(
	SELECT TOP 50 WITH TIES FirstName
			, LastName
			, SUM(score) as sum_score
	FROM CNT_TR
	GROUP BY FirstName
			, LastName
	ORDER BY sum_score DESC
	)


SELECT FirstName
		, LastName
		, sum_score
INTO [dbo].[TrainersRating]
FROM TOP50


