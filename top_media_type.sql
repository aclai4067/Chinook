-- Provide a query that shows the most purchased Media Type.

select Top(1) with ties MediaType.MediaTypeId, MediaType.[Name], sum(InvoiceLine.Quantity) as PurchaseCount
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
	join MediaType
		on Track.MediaTypeId = MediaType.MediaTypeId
group by MediaType.MediaTypeId, MediaType.[Name]
order by sum(InvoiceLine.Quantity) desc