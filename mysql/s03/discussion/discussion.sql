-- [SECTION] Inserting Records
INSERT INTO artists (name) VALUES ("Rivermaya");
INSERT INTO artists (name) VALUES ("Psy");

INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Psy 6", "2012-1-1", 2);
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Trip", "1996-1-1", 1);

INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Gangnam Style", 253, "K-pop", 1);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Kisapmata", 250, "OPM", 2);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Elesi", 234, "OPM", 2);

-- [SECTION] Selecting/Retrieving records
-- Display the song name and genre of all the songs.
SELECT song_name, genre FROM songs;

-- Display the song name of all songs.
SELECT * FROM songs;

-- Display the song name of all OPM songs.
SELECT song_name FROM songs WHERE genre="OPM";

-- We can use AND or OR keyword for multiple expressions in the WHERE clause
SELECT song_name, length FROM songs WHERE length > 240 AND genre = "OPM";


-- [SECTION] Updating Records
-- Update the length of Kisapmata to 250 seconds
-- Removing the WHERE clause will update all rows
UPDATE songs SET length = 250 WHERE song_name = "Kisapmata";

-- [SECTION] Deleting Records
-- Delete all OPM songs that are more than 2 minutes and 40 seconds
-- Removing the WHERE clause it will delete all rows
DELETE FROM songs WHERE genre = "OPM" AND length > 240;

-- [SECTION] Add New Records for Discussion Preparation

-- Add 5 artists, 2 albums each, 2 songs per album
    -- Taylor Swift
    -- Lady Gaga
    -- Justin Bieber
    -- Ariana Grande
    -- Bruno Mars

INSERT INTO artists (name) VALUES ("Taylor Swift");
INSERT INTO artists (name) VALUES ("Lady Gaga");
INSERT INTO artists (name) VALUES ("Justin Bieber");
INSERT INTO artists (name) VALUES ("Ariana Grande");
INSERT INTO artists (name) VALUES ("Bruno Mars");

-- Taylor Swift
-- Albums
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Fearless", "2008-1-1", 3);
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Red", "2012-1-1", 3);
-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Fearless", 246, "Pop rock", 3);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Love Story", 213, "Country Pop", 3);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("State of Grace", 259, "Rock, alternative rock, arena rock", 4);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Red", 204, "Country", 4);

-- Lady Gaga
-- Album
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("A Star is Born", "2018-10-5", 4);
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Born This Way", "2011-05-23", 4);
-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Black Eyes", 231, "Rock and Roll", 5);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Shallow", 201, "Country Rock, folk rock", 5);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Born This Way", 252, "Electropop", 6);


-- Justin Bieber
-- Album: Purpose, 2015-11-13
    -- Song: Sorry, 320, "Dancehall-poptropical Housemoombahton"
-- Album: Believe, 2012-06-15
    -- Song: Boyfriend, 252, "Pop"
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Purpose", "2015-11-13", 5);
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Believe", "2012-06-15", 5);
-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Sorry", 320, "Dancehall-poptropical Housemoombahton", 7);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Boyfriend", 252, "Pop", 8);


-- Ariana Grande
-- Album: Dangerous Woman, 2016-05-20
    -- Song: Into You, 405, "EDM House"
-- Album: Thank U, Next, 2019-02-08
    -- Song: Thank U, Next, 327, "Pop, R&B"
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Dangerous Woman", "2016-05-20", 6);
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Thank U, Next", "2019-02-08", 6);
-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Into You", 405, "EDM House", 9);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Thank U, Next", 327, "Pop, R&B", 10);


 -- Artist: Bruno Mars
-- Album: 24k Magic, 2016-11-18
    -- Song: 24k Magic, 346, "Funk, Disco, R&B"
-- Album: Earth to Mars,2011-02-07
    -- Song: Lost, 321, "Pop"
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("24K Magic", "2016-11-18", 7);
INSERT INTO albums (album_title, date_released, artist_id) VALUES ("Earth to Mars", "2011-02-07", 7);
-- Songs
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("24k Magic", 346, "Fun, Disco, R&B", 11);
INSERT INTO songs (song_name, length, genre, album_id) VALUES ("Lost", 321, "Pop", 12);
