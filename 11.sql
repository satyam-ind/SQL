-- Question 11: When a track or artist name contains an "!", 
--I think the song would have high energy or high danceability (over 50%). 
-- For which songs is this true? Provide track name, artist names, energy and danceability.

SELECT track_name, artist_names, energy, danceability
FROM spotify_tracks
WHERE (track_name LIKE '%!%' OR artist_names LIKE '%!%')
AND (energy > 0.5 OR danceability > 0.5);

