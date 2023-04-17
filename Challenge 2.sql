/* Understanding the relationship between the number of customer orders and the invoices */

SELECT  
    c.FirstName,
    c.LastName,
    i.InvoiceDate,
    i.InvoiceId,
    i.Total



    
FROM
    Invoice as i
INNER JOIN
    Customer as c

WHERE 
    DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01'
    