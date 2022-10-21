With May (customer_id, may_rental) AS 
	(SELECT customer_id, COUNT(*)
	 FROM PUBLIC.rental
	 WHERE rental_date BETWEEN '2005-05-01' AND'2005-05-31'
	 GROUP BY customer_id),
	 
	June (customer_id, june_rental) AS
	(SELECT customer_id, COUNT(*)
	 FROM PUBLIC.rental
	 WHERE rental_date BETWEEN '2005-06-01' AND '2005-06-30'
	 GROUP BY customer_id),

	July (customer_id, july_rental) AS
	(SELECT customer_id, COUNT(*)
	 FROM PUBLIC.rental
	 WHERE rental_date BETWEEN '2005-07-01' AND '2005-07-31'
	 GROUP BY customer_id)
	 
SELECT 
	C.customer_id,
	C.first_name,
	C.last_name,
	may_rental,
	june_rental,
	july_rental	
FROM PUBLIC.customer AS C 
	LEFT JOIN May ON C.customer_id = May.customer_id
	LEFT JOIN June 
	ON may.customer_id = June.customer_id
	LEFT JOIN July
	ON June.customer_id = July.customer_id
ORDER BY C.last_name;
