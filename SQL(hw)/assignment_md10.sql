SELECT
	CU.customer_id,
	CU.first_name,
	CU.last_name,
	(SELECT count(*)
	 FROM public.rental AS R 
	 WHERE R.customer_id = CU.customer_id
	 AND R.rental_date BETWEEN '2005-05-01' AND '2005-05-31') AS may_rental,
	 (SELECT count(*)
	 FROM public.rental AS R 
	 WHERE R.customer_id = CU.customer_id
	 AND R.rental_date BETWEEN '2005-06-01' AND '2005-06-30') AS june_rental,
	 (SELECT count(*)
	 FROM public.rental AS R 
	 WHERE R.customer_id = CU.customer_id
	 AND R.rental_date BETWEEN '2005-07-01' AND '2005-07-31') AS july_rental
FROM public.customer AS CU
ORDER BY last_name;

