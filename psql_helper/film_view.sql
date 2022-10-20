CREATE VIEW film_view AS 
(SELECT film.title, film.genre from films 
    where genre = comedy;)
