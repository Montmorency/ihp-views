-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE genres AS ENUM ('comedy', 'drama', 'horror', 'animated');
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE admins (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE films (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    genre genres NOT NULL
);
CREATE TABLE favourite_films (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    film_id UUID NOT NULL
);
CREATE INDEX favourite_films_user_id_index ON favourite_films (user_id);
CREATE INDEX favourite_films_film_id_index ON favourite_films (film_id);
ALTER TABLE favourite_films ADD CONSTRAINT favourite_films_ref_film_id FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE NO ACTION;
ALTER TABLE favourite_films ADD CONSTRAINT favourite_films_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
