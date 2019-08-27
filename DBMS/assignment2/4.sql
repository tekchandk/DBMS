select fl.category, count( all fl.category) from film_list fl
	where fl.film_id
	in 
        (select i.film_id
		from customer_list cl, rental r, inventory i
		where cl.first_name = 'PATRICIA' cl.last_name = 'JOHNSON'
        and cl.ID = r.customer_id
        and r.inventory_id = i.inventory_id
        Group by i.film_id)
        Group by fl.category order by count(all fl.category) desc, fl.category asc limit 3;

