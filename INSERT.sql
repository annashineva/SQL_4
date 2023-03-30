CREATE table IF NOT EXISTS Genres (
id SERIAL PRIMARY KEY,
genre_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Singers (
id SERIAL PRIMARY KEY,
singer_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresSingers (
id SERIAL PRIMARY KEY,
genre_id INTEGER NOT NULL REFERENCES Genres(id),
singer_id INTEGER NOT NULL REFERENCES Singers(id)
);

CREATE TABLE IF NOT EXISTS Albums (
id SERIAL PRIMARY KEY,
album_name TEXT NOT NULL,
release_year DATE NOT NULL CHECK (release_year > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS SingersAlbums (
id SERIAL PRIMARY KEY,
singer_id INTEGER NOT NULL REFERENCES Singers(id),
album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Tracks (
id SERIAL PRIMARY KEY,
track_name TEXT NOT NULL,
duration INTEGER NOT null CHECK (duration between 1 and 10000),
album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
id SERIAL PRIMARY KEY,
collection_name TEXT NOT NULL,
release_year DATE NOT NULL CHECK (release_year > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS TracksCollections (
id SERIAL PRIMARY KEY,
track_id INTEGER NOT NULL REFERENCES Tracks(id),
collection_id INTEGER NOT NULL REFERENCES Collections(id)
);

INSERT INTO Singers VALUES (1, 'twenty one pilots'), (2, 'Queen'), (3, 'Adele'), (4, 'Enimen'), (5, 'Green Day'), (6, 'Linkin Park'), (7, 'Ed Sheeran'), (8, 'The Weeknd');

INSERT INTO Genres VALUES (1, 'рок'), (2, 'поп'), (3, 'рэп'), (4, 'джаз'), (5, 'соул');

INSERT INTO Albums VALUES (1, 'Scaled and Icy', '2021-05-21'), (2, 'Made in Heaven', '1995-11-06'), (3, 'Thirty', '2021-11-19'), (4, 'Revival', '2017-12-15'), (5, 'Bullet in a Bible', '2015-11-15'), (6, 'Meteora', '2003-03-25'), (7, 'Plus', '2011-09-09'), (8, 'Starboy', '2016-11-25');

INSERT INTO Tracks VALUES (1, 'Bounce Man', 185, 1), (2, 'Good Day', 204, 1), (3, 'I Was Born to Love You', 289, 2), (4, 'Let Me Live', 289, 2),(5, 'Easy on Me', 224, 3), (6, 'I Drink Wine', 376, 3), (7, 'Believe', 315, 4), (8, 'River', 221, 4), (9, 'American Idiot', 272, 5), (10, 'Holiday', 252, 5), (11, 'Somewhere I Belong', 214, 6), (12, 'Numb', 188, 6), (13, 'Wake Me Up', 229, 7), (14, 'Give Me Love', 526, 7), (15, 'I Feel It Coming', 269, 8), (16, 'Sidewalks', 231, 8);

INSERT INTO Collections VALUES (1, 'Rock Hits', '2005-05-13'), (2, 'Best songs ever', '1998-10-06'), (3, 'New wave', '2020-06-19'), (4, 'Feel the rhythm', '2013-01-01'), (5, 'Favorite songs', '2007-08-15'), (6, 'In my heart', '2009-04-25'), (7, 'Love songs', '2018-09-23'), (8, 'Dance music', '2022-10-10');

INSERT INTO GenresSingers VALUES (1, 1, 1), (2, 1, 2), (3, 2, 3), (4, 5, 3),(5, 3, 4), (6, 1, 5),  (7, 1, 6),  (8, 2, 7),  (9, 2, 8);

INSERT INTO SingersAlbums VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4),(5, 5, 5), (6, 6, 6),  (7, 7, 7),  (8, 8, 8);

INSERT INTO TracksCollections VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4),(5, 5, 5), (6, 6, 6),  (7, 7, 7),  (8, 8, 8),  (9, 9, 1),  (10, 10, 2),  (11, 11, 3),  (12, 12, 4),  (13, 13, 5),  (14, 14, 6),  (15, 15, 7),  (16, 16, 8);