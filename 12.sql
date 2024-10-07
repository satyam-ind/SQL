-- Question 12: Which of Billie Eilish's songs are in this Top 50 - Global playlist?

SELECT track_name
FROM spotify_tracks
WHERE artist_names LIKE '%Billie Eilish%';