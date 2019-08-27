select f.film_id,f.title from category c , film_category fc, film f
where c.category_id = fc.category_id
        and c.name = 'Comedy'
        and fc.film_id = f.film_id
        and f.rating ='PG-13';

