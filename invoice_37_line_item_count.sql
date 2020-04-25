-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

select count(*) as NumberOfLineItems
from InvoiceLine
where InvoiceId in (37)