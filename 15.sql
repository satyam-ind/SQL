-- Question 15: Which of the songs are recorded by multiple artists? Provide song and artist names.

SELECT track_name, artist_names
FROM spotify_tracks
WHERE artist_names LIKE '%,%';