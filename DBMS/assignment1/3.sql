select * from customer_list cl
	where country = 'India' and cl_id in (
	select r.customer_id from film_list fl, inventory i , rental r
	where fl.category = 'Sports' and fl.film_id = i.film_id and r.inventory_id = i.inventory_id
	Group by r.customer_id);

