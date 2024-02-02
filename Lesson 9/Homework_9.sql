--People. Поля: ID, FirstName, LastName,  ID_Father, ID_Mother

SELECT 
	CONCAT(p.LastName, ' ', LEFT(p.FirstName,1), '.', LEFT(pf.FirstName,1), '.') as Son
	, CONCAT(pf.LastName, ' ', LEFT(pf.FirstName,1), '.', LEFT(pg.FirstName,1), '.') as Father
FROM People p
JOIN People pf on p.ID_Father = pf.ID
JOIN People pg on pf.ID_Father = pg.ID
WHERE p.FirstName = 'Дмитрий'

