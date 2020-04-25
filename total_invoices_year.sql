-- How many Invoices were there in 2009 and 2011?

select count(*)
from Invoice
where InvoiceDate like '%2009%' OR InvoiceDate like '%2011%'

