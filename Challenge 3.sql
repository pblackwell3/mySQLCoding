
-- Get a list of employees who exceeded the average transaction amount from sales they generated during 2011 and 2012.
-- Query looks for Employees that exceeded the Average Transaction Amount
-- Average Transaction Amount from 2011 = $17.51
SELECT 
        e.FirstName || ' ' || e.LastName as "Employee Name",
        strftime('%Y',i.InvoiceDate) as 'Year',
        AVG(i.Total) as 'Average'


FROM
    Invoice as i
INNER JOIN
    Customer as c
ON i.CustomerId = c.CustomerId
INNER JOIN
    Employee as e
ON 
    c.SupportRepId = e.EmployeeId

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2012-01-01'
    AND
    i.total > 17.51

GROUP BY
    e.FirstName


-- Average Transaction Amount from 2012 = $5.75

SELECT 
        e.FirstName || ' ' || e.LastName as "Employee Name",
        strftime('%Y',i.InvoiceDate) as 'Year',
        AVG(i.Total) as 'Average'


FROM
    Invoice as i
INNER JOIN
    Customer as c
ON i.CustomerId = c.CustomerId
INNER JOIN
    Employee as e
ON 
    c.SupportRepId = e.EmployeeId

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2011-12-31' AND '2013-01-01'
    AND
    i.total > 5.75


GROUP BY
    e.FirstName

-- Conclusion: Jane Peacock has a really high average sale in 2011

--Create a Commission Payout column that displays each employee’s commission based on 15% of the sales transaction amount.


SELECT 
    e.FirstName || ' ' || e.LastName as "Employee Name",
    round(sum(i.Total),2) as 'Total Transaction',
    round(sum(i.Total)*.15,2) as 'Commission'


FROM
    Invoice as i
INNER JOIN
    Customer as c
ON i.CustomerId = c.CustomerId
INNER JOIN
    Employee as e
ON 
    c.SupportRepId = e.EmployeeId

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01'

GROUP BY
    e.FirstName


-- Jane Made Highest Commission - Obviously

-- Investigating Jane's Customer Records 

SELECT 
    e.FirstName || ' ' || e.LastName as "Employee Name",
    c.FirstName || ' ' || c.LastName as "Customer Name",
    i.Total
FROM
    Invoice as i
INNER JOIN
    Customer as c
ON i.CustomerId = c.CustomerId
INNER JOIN
    Employee as e
ON 
    c.SupportRepId = e.EmployeeId

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01'
    AND
    e.FirstName = 'Jane'

-- John Doeein has a purchase of $1000.86
-- Look at John's customer record

SELECT *
FROM
    Invoice as i
INNER JOIN
    Customer as c
ON i.CustomerId = c.CustomerId
INNER JOIN
    Employee as e
ON 
    c.SupportRepId = e.EmployeeId

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01'
    AND
    e.FirstName = 'Jane'
    AND
    c.LastName = 'Doeein'

-- The customer does not have any address information and does not seem to be a real person - just a line item.