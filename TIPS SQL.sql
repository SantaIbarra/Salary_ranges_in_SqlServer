/* in SQL you can create tables that do not exist in your database*/
SELECT Name,
Id,
1 as new_table --- This is the syntax to create a new table that just contains a permanent value 
FROM TABLE

/* in sql you can perfomr oprations between columns */ 
SELECT Field_1 / field_2 AS product
FROM TABLE

/* in sql you can use conditions to alter a table and add values */
SELECT CASE
WHEN ingreso > 1000000 Then 'Minimun wage'
end as variable
FROM Table
GO

/* In SQL you can create subQueryes to retrieve elements without using a join */
SELECT field_1,
field_2
	(SELECT COUNT(field_3) FROM Table1 WHERE Table1.Id = Table2.Id)
FROM Table2

/* In SQL you can retrieve a column from within a select */
SELECT field_1,
field_2
FROM (SELECT count(field_1), field_2 FROM Table1 join table2 on table1.id = table2.id Where table2.field_2 > 3 
	group by field_2)
WHERE --- here u can add a where if its nedeed


/* You also can crate an autoincremental column with row_number() */
SELECT ROW_NUMBER() over (order by (select 1)) as New_id
FROM TABLE
/* another way to do this is  */
SELECT ROW_NUMBER() OVER (PARTITION BY Field_1 ORDER BY field_2) as New_id,
field_2,
field_3
FROM TABLE




/* CREDITS TO SPANISH CONTENT CREATOR hdeleon.net on youtube */