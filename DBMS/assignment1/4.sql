select * from customer_list cl
	where cl.country = 'Canada' and cl_id in (
	select r.customer_id from actor a, film_actor fa, inventory i, rental r
	where a.first_name = 'NICK' and a.last_name = 'WAHLBERG' and a.actor_id = fa.actor_id
			and fa.film_id = i.film_id and i.inventory_id = r.inventory_id);
