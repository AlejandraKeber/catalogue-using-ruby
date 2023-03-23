CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (author_id) REFERENCES author(id),
    FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE game (  
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  last_played DATE,
  PRIMARY KEY (id)
);

CREATE TABLE book (  
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(250),
  cover_state VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE music_albums (  
  id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(250),
  last_name VARCHAR(250)
);

CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(250),
  color VARCHAR(250)
);

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250)
);
