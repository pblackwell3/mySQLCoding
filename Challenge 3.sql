
-- Nested Query returns the Average for Each employee during each year
SELECT *

FROM 
    (SELECT 
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
        DATE(i.InvoiceDate) BETWEEN '2010-12-31' AND '2013-01-01'
        AND


    GROUP BY
        strftime('%Y',i.InvoiceDate), e.FirstName) as TABLE1

WHERE 
    CASE TABLE1.Year 
        WHEN '2011'
        

--Finds the Average Transaction Amount each Year 

-- (SELECT
--     strftime('%Y',InvoiceDate) as 'Year',
--     '$'||round(AVG(Total),2) as 'Average'
    
-- FROM
--     Invoice 

-- GROUP BY
--     strftime('%Y',InvoiceDate))

