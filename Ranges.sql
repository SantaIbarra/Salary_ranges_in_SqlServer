ALTER TABLE Table_name
ADD salaryRange VARCHAR(50);

UPDATE Table_name.dbo.data_base
SET salaryRange = r.salaryRange
FROM Table_name.dbo.data_base s
CROSS APPLY dbo.fnSalaryRange(250) r
WHERE s.salaries BETWEEN (r.lower * 1000000) AND (r.upper * 1000000);

