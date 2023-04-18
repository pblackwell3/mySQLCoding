/* Understanding the relationship between the number of customer orders and the invoices */

/*Get a list of customers who made purchases between 2011 and 2012*/

/*SELECT  
    c.FirstName || ' ' || c.LastName as 'Customers Who Made a Purchase Between 2011 and 2012',
    i.InvoiceDate,
    i.InvoiceId,
    i.Total

    
FROM
    Invoice as i
INNER JOIN
    Customer as c
ON i.CustomerId = c.CustomerId

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01'*/
    
/*Get a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.*/

/*SELECT  
    c.FirstName || ' ' || c.LastName as 'Customers Who Made a Purchase Between 2011 and 2012',
    e.FirstName || ' ' || e.LastName as 'Employee Support',
    sum(i.Total)
 
    
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
    c.LastName*/


/*How many transactions are above the average transaction amount during the same time period?*/

--Gets the Average Amount
/*SELECT
    InvoiceId,
    Total

FROM 
    Invoice

WHERE
(SELECT 
    AVG(Total) as 'Average'
    
FROM
    Invoice 

WHERE 
    DATE(InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01') < Total*/


--After running this query, I noticed Invoice 413 has a total of 1000.86 which is interesting because it does not show
--on the Customer and Invoice Inner Join

-- What is the average transaction amount for each year that WSDA Music has been in business?

SELECT
    YEAR(InvoiceDate) as 'Year',
    AVG(Total) as 'Average'
    
FROM
    Invoice 

GROUP BY
    year(InvoiceDate)
