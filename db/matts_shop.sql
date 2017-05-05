DROP TABLE IF EXISTS hipsterology;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS artist;


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
  number_on_order INT4
);

CREATE TABLE hipsterology (
  id SERIAL8 PRIMARY KEY,
  item_name VARCHAR(255) not null,
  buy_price INT4,
  sell_price INT4,
  number_in_stock INT4,
  number_on_order INT4
);