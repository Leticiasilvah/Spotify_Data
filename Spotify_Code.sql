/* The singer who was most popular in 2023 */

SELECT DISTINCT(artists_name),track_name,streams
FROM Spotify_2023_p1
WHERE released_year = 2023

UNION ALL

SELECT DISTINCT(artists_name),track_name,streams
FROM spotify_2023_p2
WHERE released_year = 2023


/* Here we can see the highest tracks released between 2020 and 2023. 2 Tables P1 and P2 =  Information*/

SELECT TOP 10 COUNT(p1.released_year) AS Number_of_releaded, p1.released_year,p1.artists_name
FROM Spotify_2023_p1 P1
WHERE p1.released_year > 2020
GROUP BY p1.artists_name, p1.released_year
ORDER BY Number_of_releaded DESC

SELECT top 10 COUNT(p2.released_year) AS Number_of_releaded, p2.released_year,p2.artists_name
  FROM Spotify_2023_p2 P2 
  WHERE P2.released_year > 2020
  GROUP BY p2.artists_name, p2.released_year
  ORDER BY Number_of_releaded DESC

-- We can see that SZA, The Weeknd, and Harry Styles are on the top 3 most released songs. 
-- Each singer has released more than 10 songs.
----------

/* I have been using subqueries to gain insight into both tables and find which tracks have the highest number of streams. 2020 TO 2023*/

SELECT artists_name,track_name,released_year,streams
FROM (
    SELECT TOP 10 P1.artists_name,P1.track_name,P1.released_year,P1.streams
    FROM Spotify_2023_p1 P1
    WHERE released_year > 2020
    ORDER BY P1.streams DESC
) AS P1
UNION ALL 

SELECT artists_name,track_name,released_year,streams
FROM (
    SELECT TOP 10 P2.artists_name,P2.track_name,P2.released_year,P2.streams
    FROM spotify_2023_p2 P2
    WHERE released_year > 2020
    ORDER BY P2.streams DESC
) AS P2


/* Now we are going to find out how many playlists the song is included in on Apple Music from 2020 to 2023. */ 

SELECT artists_name,track_name,in_apple_playlists,released_year
FROM (
     SELECT TOP 10 P1.artists_name,P1.track_name,P1.in_apple_playlists,p1.released_year
     FROM Spotify_2023_p1 AS P1
     WHERE P1.released_year > 2020
     ORDER BY in_apple_playlists DESC
) AS P1
UNION ALL 
SELECT artists_name,track_name,in_apple_playlists,released_year
FROM (
     SELECT TOP 10 P2.artists_name,P2.track_name, P2.in_apple_playlists,P2.released_year
     FROM spotify_2023_p2 AS P2 
     WHERE P2.released_year > 2020
     ORDER BY in_apple_playlists DESC
) AS P2

/* We will determine the number of playlists the song is included in on Deezer from 2020 to 2023. */

SELECT artists_name,track_name,in_deezer_playlists,released_year
FROM (
     SELECT TOP 10 P1.artists_name,P1.track_name,P1.in_deezer_playlists,p1.released_year
    FROM Spotify_2023_p1 AS P1
    WHERE released_year > 2020
    ORDER BY in_deezer_playlists DESC
) AS P1

UNION ALL

SELECT artists_name,track_name,in_deezer_playlists,released_year
FROM (
    SELECT TOP 10 P2.artists_name,P2.track_name,P2.in_deezer_playlists,P2.released_year
    FROM spotify_2023_p2 AS P2
    WHERE released_year > 2020
    ORDER BY in_deezer_playlists DESC
) AS P2

/* Same for Spotify, How many Playlists. */

SELECT artists_name,track_name,in_spotify_playlists,released_year
FROM (
    SELECT TOP 10 P1.artists_name,P1.track_name,P1.in_spotify_playlists,P1.released_year
    FROM Spotify_2023_p1 AS P1
    WHERE released_year > 2020
    ORDER BY in_spotify_playlists DESC
) AS P1
UNION ALL 
SELECT artists_name,track_name,in_spotify_playlists,released_year
FROM (
    SELECT TOP 10 P2.artists_name,P2.track_name, P2.in_spotify_playlists,P2.released_year
    FROM spotify_2023_p2 AS P2
    WHERE released_year > 2020
    ORDER BY in_spotify_playlists DESC
) AS P2

/* Here we can see the average beat per minute (BPM). */
SELECT AVG(bpm) Avg_Beats_per_Minute
FROM Spotify_2023_p2
WHERE released_year > 2020


/* Minor has a count of 238 and Major has a count of 235. */
SELECT COUNT(MODE) as Count_of_Mode, Mode
FROM Spotify_2023_p1 
WHERE mode = 'Minor'
GROUP by mode

UNION ALL 

SELECT COUNT(MODE), Mode
FROM spotify_2023_p2 
WHERE mode = 'Major'
GROUP by mode


