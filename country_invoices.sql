-- Provide a query that shows the # of invoices per country.

select BillingCountry, count(*) as NumberOfInvoices
from Invoice
group by BillingCountry