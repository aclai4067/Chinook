-- What are the respective total sales for each of those years? (2009, 2011)

select sum(Invoice.Total) as TotalSales2009
from Invoice
where InvoiceDate like '%2009%'

select sum(Invoice.Total) as TotalSales2011
from Invoice
where InvoiceDate like '%2011%'
