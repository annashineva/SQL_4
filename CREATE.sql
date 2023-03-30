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