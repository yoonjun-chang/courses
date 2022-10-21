SELECT
	C.customer_id,
	C.first_name,
	C.last_name,
	MAY.may_rental,
	MAY.title,
	JUNE.june_rental,
	JUNE.title,
	JULY.july_rental,
	JULY.title
FROM PUBLIC.customer AS C
LEFT JOIN LATERAL (
	SELECT
		F.title,
		R.rental_date AS may_rental
	FROM PUBLIC.rental AS R
	INNER JOIN PUBLIC.inventory AS I
		ON I.inventory_id = R.inventory_id
	INNER JOIN PUBLIC.film AS F
		ON F.film_id = I.film_id
	WHERE R.customer_id = C.customer_id
		AND date_trunc('month', R.rental_date) = '2005-05-01'
	ORDER BY R.rental_date DESC
	OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY
	) AS MAY ON TRUE
	
LEFT JOIN LATERAL (
	SELECT
		F.title,
		R.rental_date AS june_rental
	FROM PUBLIC.rental AS R
	INNER JOIN PUBLIC.inventory AS I
		ON I.inventory_id = R.inventory_id
	INNER JOIN PUBLIC.film AS F
		ON F.film_id = I.film_id
	WHERE R.customer_id = C.customer_id
		AND date_trunc('month', R.rental_date) = '2005-06-01'
	ORDER BY R.rental_date DESC
	OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY
	) AS JUNE ON TRUE
	
CROSS JOIN LATERAL (
	SELECT
		F.title,
		R.rental_date AS july_rental
	FROM PUBLIC.rental AS R
	INNER JOIN PUBLIC.inventory AS I
		ON I.inventory_id = R.inventory_id
	INNER JOIN PUBLIC.film AS F
		ON F.film_id = I.film_id
	WHERE R.customer_id = C.customer_id
		AND date_trunc('month', R.rental_date) = '2005-07-01'
	ORDER BY R.rental_date DESC
	OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY
	) AS JULY
ORDER BY C.last_name;
