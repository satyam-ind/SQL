-- Question 4: Which pop songs were recorded under the label Island Records? Provide track, album, artists and label.
SELECT track_name, album_name, artist_names, record_label
FROM spotify_tracks
WHERE genres LIKE '%pop%'
AND record_label = 'Island Records';

