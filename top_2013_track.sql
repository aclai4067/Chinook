-- Provide a query that shows the most purchased track of 2013.

select Top 1 with ties InvoiceLine.TrackId, Track.[Name], sum(InvoiceLine.Quantity) as PurchaseCount2013
from Invoice
	join InvoiceLine
		on Invoice.InvoiceId = InvoiceLine.InvoiceId
	join Track
		on InvoiceLine.TrackId = Track.TrackId
where Invoice.InvoiceDate between '2013-01-01' and '2014-01-01'
group by InvoiceLine.TrackId, Track.[Name], Track.Composer
order by sum(InvoiceLine.Quantity) desc

