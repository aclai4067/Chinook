-- What are the respective total sales for each of those years? (2009, 2011)

select year(Invoice.InvoiceDate) as InvoiceYear, sum(Invoice.Total) as TotalSales
from Invoice
where year(Invoice.InvoiceDate) in (2009, 2011)
group by year(Invoice.InvoiceDate)

