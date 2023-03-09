SELECT s.salaries, r.salaryRange
INTO the new database
FROM your database
CROSS APPLY dbo.fnSalaryRange(250) r
WHERE s.salaries BETWEEN (r.lower * 1000000) AND (r.upper * 1000000)
