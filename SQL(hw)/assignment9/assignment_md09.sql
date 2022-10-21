SELECT
	date_trunc('day',rental_date) AS day,
	count(inventory_id) AS number_of_movies,
	count(DISTINCT customer_id) AS number_of_customers
	
FROM public.rental
WHERE date_trunc('day',rental_date) BETWEEN '2005-08-01' AND'2005-08-31'
	  
GROUP BY date_trunc('day',rental_date)
ORDER BY day;
		  



	
