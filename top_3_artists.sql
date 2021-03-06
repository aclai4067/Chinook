-- Provide a query that shows the top 3 best selling artists

select Top(3) with ties Artist.ArtistId, Artist.[Name], sum(InvoiceLine.Quantity) as PurchaseCount
from InvoiceLine
	join Track
		on InvoiceLine.TrackId = Track.TrackId
	join Album
		on Track.AlbumId = Album.AlbumId
	join Artist
		on Album.ArtistId = Artist.ArtistId
group by Artist.ArtistId, Artist.[Name]
order by sum(InvoiceLine.Quantity) desc