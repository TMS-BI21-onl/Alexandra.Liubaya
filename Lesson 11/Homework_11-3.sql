--CREATE TABLE Function_Results
--(
--	Function_name nvarchar(20),
--	Function_count int
--);

DELETE FROM dbo.Function_Results;

SELECT * FROM Function_Results;
SELECT * FROM dbo.data_for_merge;

---------------Alex----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Alex

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Alex,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Alex, 1);

---------------Carlos----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Carlos 

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Carlos,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Carlos IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Carlos, 1);

---------------Charles----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Charles

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Charles,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Charles IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Charles, 1);

---------------Daniel----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Daniel

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Daniel,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Daniel IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Daniel, 1);

---------------Esteban----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Esteban

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Esteban,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Esteban IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Esteban, 1);

---------------Fred----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Fred

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Fred,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Fred IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Fred, 1);

---------------George----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.George

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.George,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.George IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.George, 1);

---------------Lando----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Lando

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Lando,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Lando IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Lando, 1);

---------------Lewis----------------

	MERGE Function_Results target
	USING dbo.data_for_merge source ON target.Function_name=source.Lewis

WHEN MATCHED 
	THEN UPDATE SET target.Function_name = source.Lewis,
					target.Function_count = target.Function_count+1
WHEN NOT MATCHED BY TARGET AND source.Lewis IS NOT NULL
	THEN INSERT (Function_name, Function_count)
	VALUES (source.Lewis, 1);