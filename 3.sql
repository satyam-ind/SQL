-- Question 3: What are the genres of the songs with 96 popularity?
--Provide track name, popularity and genres.

SELECT track_name, popularity, genres
FROM spotify_tracks
WHERE popularity = 96;