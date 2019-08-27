select fl.title , count(all fl.title) from film_list fl, inventory i, rental r
	where fl.category = 'Horror'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        Group by title order by count(all fl.title) desc limit 3;

