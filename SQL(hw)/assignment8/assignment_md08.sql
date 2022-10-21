SELECT DISTINCT
	C.customer_id, 
	C.first_name, 
	C.last_name, 
	F.title,
	to_char(R.rental_date,'HH12:MI:SS:AM') AS rental_date,
	EXTRACT(DAY FROM R.rental_date) AS day_of_week
FROM public.rental as R
INNER JOIN public.customer as C ON R.customer_id = C.customer_id
INNER JOIN public.inventory AS I ON I.inventory_id = R.inventory_id
INNER JOIN public.film AS F ON F.film_id = I.film_id
WHERE CAST(R.rental_date AS date) = '2005-06-16'
ORDER BY last_name;
