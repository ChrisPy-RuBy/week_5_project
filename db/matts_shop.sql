DROP TABLE IF EXISTS hipsterology;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  artist_name VARCHAR(255) not null
);

CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  genre_name VARCHAR(255) not null
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) not null,
  artist INT4 REFERENCES artists(id),
  genre INT4 REFERENCES genres(id),
  release_year INT4,
  buy_price INT4,
  sell_price INT4,
  number_in_stock INT4,
  number_on_order INT4,
  album_artwork VARCHAR(255)
);

CREATE TABLE hipsterology (
  id SERIAL8 PRIMARY KEY,
  item_name VARCHAR(255) not null,
  buy_price INT4,
  sell_price INT4,
  number_in_stock INT4,
  number_on_order INT4
);

-- INSERT INTO albums (
--     album_artwork ) VALUES (
--  'https://vignette3.wikia.nocookie.net/harrypotter/images/9/96/Gryffindor_crest_by_tuliipiie-d491bqc.jpg/revision/latest/scale-to-width-down/394?cb=2013050823170');
 