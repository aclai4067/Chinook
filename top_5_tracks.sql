-- Provide a query that shows the top 5 most purchased songs.

select Top 5 with ties InvoiceLine.TrackId, Track.[Name], sum(InvoiceLine.Quantity) as PurchaseCount
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
group by InvoiceLine.TrackId, Track.[Name], Track.Composer
order by sum(InvoiceLine.Quantity) desc