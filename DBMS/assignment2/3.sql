select sum(s.amount) from film_list fl, inventory i, rental r, sale s
where fl.category = 'Animation'
        and fl.film_id = i.film_id
        and i.inventory_id = r.inventory_id
        and r.rental_id = p.rental_id;

