-- MySQL Advanced Select Queries and Join

-- [SECTION] Advanced Selects
-- 1. Show only specific number of records
-- LIMIT keyword is used to specify the number of records to return.
SELECT * FROM songs LIMIT 5;

-- Combine LIMIT with WHERE clause
SELECT * FROM songs WHERE length >= 230 LIMIT 5;

-- 2. Exclude a record
-- The exclamation point (!) = NOT Condition/Operator

-- Exclude songs that belongs to 24k Magic
SELECT * FROM songs WHERE album_id != 11;

-- Excludes albums from Lady Gaga
SELECT * 
FROM songs 
WHERE album_id != 5 
AND album_id != 6
;

-- 3. Finding records using comparison operator
-- >, <, >=, <=
SELECT *
FROM songs
WHERE length > 330
;

-- 4. Getting records with multiple conditions
SELECT *
FROM songs
WHERE genre = "Pop" OR genre = "K-pop";

-- Shorthand method for multiple OR condition
SELECT * 
FROM songs 
WHERE genre IN ("Pop", "K-Pop");

-- Show records with a partial match.
-- LIKE keyword which is used in WHERE clause is used to search for a specific pattern in  a column
-- There are 2 wildcard operators used in conjunction with LIKE.
    -- "%" - represents zero, one, or multiple characters

-- Find values with a match at the start
SELECT *
FROM songs
WHERE song_name LIKE "th%";

-- Find values with a match at the end
SELECT * 
FROM songs
WHERE song_name LIKE "%ce";

-- Find values with a match at any position
SELECT * 
FROM songs
WHERE song_name LIKE "%th%";

-- Find values with a match of a specific length/pattern.
SELECT *
FROM songs
WHERE song_name LIKE "__rr_";

SELECT *
FROM albums
WHERE date_released LIKE "20__-0_-__";

-- Find values with a match at certain positions
SELECT *
FROM albums
WHERE album_title LIKE "_ur%";

SELECT *
FROM albums
WHERE album_title
LIKE "%_r%";

-- 6. Sorting records
-- ORDER BY keyword is used to sort the results to ascending (ASC) or descending (DESC) order.
-- Syntax:
    -- SELECT * FROM table_name ORDER BY column_name ASC/DESC
    -- Combine ORDER BY with WHERE clause
    -- SELECT * FROM table_name WHERE condition ORDER BY column_name ASC/DESC;
SELECT * 
FROM songs
ORDER BY song_name;

SELECT *
FROM songs
ORDER BY song_name ASC;

SELECT *
FROM songs
ORDER BY song_name DESC;

SELECT * 
FROM songs
WHERE album_id != 11
ORDER BY song_name ASC;

-- 7. Showing records with distinct values
-- DISTINCT keyword eliminates duplicates rows and displays a unique list of values.
    -- SELECT DISTINCT column_name FROM table_name;
SELECT DISTINCT genre FROM songs;

-- 8. Count the number of rows in the table.
SELECT COUNT(*) FROM songs;

SELECT COUNT(DISTINCT genre) FROM songs;

-- [SECTION] Table Joins
-- To retrieve data from multiple tables

-- Inner Join
-- Joining 2 tables:
-- Syntax:
    -- SELECT column_name FROM table1
        -- JOIN table2 ON table1.id = table2.foreign_key_column;

-- Combine artists and albums table
-- **Parent table always comes first
SELECT *
FROM artists
JOIN albums ON artists.id = albums.artist_id;

-- Using WHERE clause with Joined table.
SELECT *
FROM artists
    JOIN albums ON artists.id = albums.artist_id
    WHERE date_released <= 20151201;

-- Joining multiple tables
-- Syntax:
    -- SELECT column_name FROM table1
        -- JOIN table2 ON tabl1.id = table2.foreign_key_column
        -- JOIN table3 ON tabl2.id = table3.foreign_key_column

-- Combine Artists produces Albums containing Songs
SELECT *
FROM artists
    JOIN albums ON artists.id = albums.artist_id
    JOIN songs ON albums.id = songs.album_id;

-- Specify columns to be included in the result
SELECT name, album_title, song_name, length, genre
FROM artists
    JOIN albums ON artists.id = albums.artist_id
    JOIN songs ON albums.id = songs.album_id;

-- Provide alias for joining table.
-- Syntax: 
    -- SELECT column_name AS "Alias" FROM table;
SELECT name AS "Artist Name", album_title AS "Album", song_name AS "Song", length AS "Duration", genre AS "Genre"
FROM artists
    JOIN albums ON artists.id = albums.artist_id
    JOIN songs ON albums.id = songs.album_id;