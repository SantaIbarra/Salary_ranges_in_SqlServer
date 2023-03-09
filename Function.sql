/* Creates a function based on what the minimun wage of {your country} is */

CREATE FUNCTION dbo.fnSalaryRange(@ranges INT)  /* The firts step declare the function with an integer as its parameter (@range) */
RETURNS @result TABLE (lower DECIMAL(10,1), upper DECIMAL(10,1), salaryRange VARCHAR(50)) 
AS
BEGIN
    DECLARE @sml INT = 1160000; -- The value of te minimun wage in colombia by the year 2023, can use your own minimun wage to adapt it
    DECLARE @rangeSize DECIMAL(10,1) = CAST(@sml AS DECIMAL(10,1)) / 11600000;
    DECLARE @lower  DECIMAL(10,1), @upper  DECIMAL(10,1);
	/* here it takes the value of the minimun wage and divite it by itself * 10 (1160000/ 11600000) to create a list that starts at 0.0 and its  iterate trough 25.0 
	adding 0.1 for every iteration */
    
    DECLARE @i INT = 0;
    WHILE @i < @ranges
    BEGIN
        SET @lower = @i * @rangeSize; --multiplies the variable i by rangesize variable to create the lower salary in the manner of 0.0 to 0.1 then 0.1 to 0.2 trough 24.9 to 25.0
        SET @upper = (@i + 1) * @rangeSize; -- does the same here it creates the upper range size
        INSERT INTO @result (lower, upper, salaryRange) --inserts the lower and upper to a column salaryrange
        VALUES (@lower, @upper, CONVERT(VARCHAR(100), @lower, 1) + ' a ' + CONVERT(VARCHAR(100), @upper, 1) + 'SML');
        SET @i += 1;

		/* then it set the values to adds 1 in every range depending in the number of ranges that you declare to the parameter, and concats 'a' and 'sml' these to values are colombian spanish expressions indicating
		the value of the minimun wage of colombia you can edit it at your convenience to elaborate further the function */
    END
    
    RETURN;
END;