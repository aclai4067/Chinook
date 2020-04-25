-- Provide a query that shows the total number of tracks in each playlist. 
-- The Playlist name should be include on the resultant table.

select Playlist.[Name] as PlaylistName, count(*) as NumberOfTracks
from PlaylistTrack
	join Playlist
		on PlaylistTrack.PlaylistId = Playlist.PlaylistId
group by Playlist.[Name]
