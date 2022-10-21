SELECT C.customer_id, C.first_name, C.last_name, R.rental_date
FROM public.film AS F
INNER JOIN public.inventory AS I 
	ON F.film_id = I.film_id
INNER JOIN public.rental AS R 
	ON R.inventory_id = I.inventory_id
INNER JOIN public.customer AS C 
	ON C.customer_id = R.customer_id
WHERE F.title = 'Timberland Sky'
ORDER BY R.rental_date;
