-- Question 6: Are any of these songs over 4 minutes long? Provide the track and artist names.

SELECT track_name, artist_names
FROM spotify_tracks
WHERE duration_ms > 240000;