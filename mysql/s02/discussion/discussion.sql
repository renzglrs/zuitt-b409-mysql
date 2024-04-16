-- SQL Queries are case insensitive, but to easily identify the queries we usually use UPPERCASE.
-- Make sure semi-colons (;) are added at the end of the sql syntax

--Lists down the databases inside the DBMS.
SHOW DATABASES;

-- Created a database.
CREATE DATABASE music_db;

-- Note: Naming convention in SQL Database and table uses snake case.

-- Remove a specific database.
DROP DATABASE music_db;

-- Select a databse.
USE music_db;

-- Create tables.
-- Table columns have the following format:
    -- [column_name] [data_type] [other_options]
    -- id INT NOT NULL AUTO_INCREMENT: "integer value that cannot be null (it should be required) and it will increment when a user is created"
    -- VARCHAR(50) - variable character. 50 is the character limit
    -- PRIMARY KEY(id) - unique identifier of the record (row in relational table)

CREATE TABLE my_table (
    id INT NOT NULL AUTO_INCREMENT,
    column_one VARCHAR(50) NOT NULL,
    column_two INT NOT NULL,
    column_three VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    contact_number INT NOT NULL,
    email VARCHAR(50),
    address VARCHAR(50),
    PRIMARY KEY (id)
);

-- Show all tables under the used database.
SHOW TABLES;

-- Delete a table
DROP TABLE my_table;

CREATE TABLE artists (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- To show table info/structure via terminal
DESCRIBE users;
DESCRIBE artists;

-- ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- To change the table name.
ALTER TABLE users RENAME TO users_table;

-- To change/modify table column data type and options.
ALTER TABLE users MODIFY email VARCHAR(50) NOT NULL;

-- To add a column in existing table
ALTER TABLE users ADD birth_date DATE NULL AFTER fullname;

-- To delete a column in existing table
ALTER TABLE users DROP COLUMN birth_date;

-- To change column name
ALTER TABLE users CHANGE COLUMN fullname full_name VARCHAR(50);

-- Tables with foreign keys;
-- Applying constraints in a table
-- Syntax:
    -- CONSTRAINT foreign_key_name
        -- FOREIGN KEY (column_name) REFERENCES table_name(id)
        -- ON UPDATE ACTION
        -- ON DELETE RESTRICT

-- When to create a constraint (foreign key)?
    -- "One-to-many", "foreign key" column is added in the "many" entity/table
    -- "One-to-one", "primary key" of the parent row is added as "foreign key" of tge child row
    -- "Many-to-many" linking table is created to contain the "foreign key" for both tables/entities
-- CONSTRAINT: use to specify the rules for the data table, but this is optional, but we use this to identify the FOREIGN KEY.
-- FOREIGN KEY: is used to prevent actions that will destroy links between tables.
-- REFERENCES: is a field that referes to the primary key of another table.
-- ON UPDATE CASCADE: If the parent row is changed, the child row will also reflect the change.
-- ON DELETE RESTRICT: You can't delete a given parent row if a child row exist that is referenced to the value for that parent row.
CREATE TABLE albums (
    id INT NOT NULL AUTO_INCREMENT,
    album_title VARCHAR(50) NOT NULL,
    date_released DATE NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_albums_artist_id
        FOREIGN KEY (artist_id) REFERENCES artists(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- DATE & TIME format in SQL
    -- DATE referes to YYYY-MM-DD
    -- TIME refers to HH:MM:SS
    -- DATETIME refers to YYYY-MM-DD HH:MM:SS


CREATE TABLE songs (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    length TIME NOT NULL,
    genre VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_songs_albums_id
        FOREIGN KEY (album_id) REFERENCES albums(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


CREATE TABLE playlists (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    datetime_created DATETIME NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlists_user_id
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);


CREATE TABLE playlists_songs (
    id INT NOT NULL AUTO_INCREMENT,
    playlist_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlists_songs_playlist_id
        FOREIGN KEY (playlist_id) REFERENCES playlists(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_playlists_songs_song_id
        FOREIGN KEY (song_id) REFERENCES songs(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);