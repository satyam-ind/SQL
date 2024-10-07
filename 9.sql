-- Question 9: I can't remember the name of a song. 
--It's by Sabrina Carpenter and contains the word please! Help me find the name.

SELECT track_name
FROM spotify_tracks
WHERE artist_names = 'Sabrina Carpenter' 
AND track_name LIKE '%please%';
