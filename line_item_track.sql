-- Provide a query that includes the purchased track name with each invoice line item

select Track.Name as TrackName, InvoiceLine.*
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId