-- Provide a query that shows all Invoices but includes the # of invoice line items

select Invoice.*, count(InvoiceLine.InvoiceLineId) as NumberOfLineItems
from Invoice
	join InvoiceLine
		on Invoice.InvoiceId = InvoiceLine.InvoiceId
group by Invoice.InvoiceId, Invoice.CustomerId, Invoice.InvoiceDate, Invoice.Total, Invoice.BillingAddress, Invoice.BillingCity, 
		 Invoice.BillingCountry, Invoice.BillingPostalCode, Invoice.BillingState

