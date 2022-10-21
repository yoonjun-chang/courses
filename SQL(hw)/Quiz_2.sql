--Quiz 2

--Question #1
SELECT
	C.customer_id,
	C.first_name,
	C.last_name,
	
	(SELECT SUM(P.amount) FROM PUBLIC.payment AS P
	 WHERE P.customer_id = C.customer_id
	 --AND payment_date BETWEEN '2007-03-01' AND '2007-03-31') AS march_payment,
	 AND date_trunc('month', P.payment_date) = '2007-03-01') AS march_payment,
	 
	(SELECT SUM(P.amount) FROM PUBLIC.payment AS P
	 WHERE P.customer_id = C.customer_id
	 --AND payment_date BETWEEN '2007-04-01' AND '2007-04-30') AS april_payment,
	 AND date_trunc('month', P.payment_date) = '2007-04-01') AS april_payment,
	 
	(SELECT SUM(P.amount) FROM PUBLIC.payment AS P
	 WHERE P.customer_id = C.customer_id
	 --AND payment_date BETWEEN '2007-05-01' AND '2007-05-31') AS may_payment
	 AND date_trunc('month', P.payment_date) = '2007-05-01') AS may_payment
	 
FROM PUBLIC.customer AS C
ORDER BY last_name;

--Question #2
SELECT
	C.customer_id,
	C.first_name,
	C.last_name,
	
	(SELECT MAX(F.rental_rate) FROM PUBLIC.film AS F
		 INNER JOIN PUBLIC.inventory AS I ON I.film_id = F.film_id
		 INNER JOIN PUBLIC.rental AS R ON R.inventory_id = I.inventory_id
		 WHERE C.customer_id = R.customer_id
		 AND date_trunc('month', R.rental_date) = '2005-05-01') AS may,
	 
	 (SELECT MAX(F.rental_rate) FROM PUBLIC.film AS F
		 INNER JOIN PUBLIC.inventory AS I ON I.film_id = F.film_id
		 INNER JOIN PUBLIC.rental AS R ON R.inventory_id = I.inventory_id
		 WHERE C.customer_id = R.customer_id
		 AND date_trunc('month', R.rental_date) = '2005-06-01') as june,
	 
	 (SELECT MAX(F.rental_rate) FROM PUBLIC.film AS F
		 INNER JOIN PUBLIC.inventory AS I ON I.film_id = F.film_id
		 INNER JOIN PUBLIC.rental AS R ON R.inventory_id = I.inventory_id
		 WHERE C.customer_id = R.customer_id
		 AND date_trunc('month', R.rental_date) = '2005-07-01') as july
	 
FROM PUBLIC.customer AS C
ORDER BY last_name;
