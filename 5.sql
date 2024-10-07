-- Question 5: Retrieve the track names, release dates and
--tempo for songs with a tempo between 100 and 120 BPM.

SELECT track_name, release_date, tempo
FROM spotify_tracks
WHERE tempo BETWEEN 100 AND 120;