#creating tables
CREATE TABLE product (
	name_of_product varchar,
	category varchar,
	date_added date,
	person_added varchar,
	product_id int
);

CREATE TABLE product_price (
	product_id int,
	price float,
	discount float DEFAULT (0),
	time_updated time,
	person_updated varchar
);

CREATE TABLE product_price_change_log (
	old_value float,
	new_value float,
	person_updated varchar,
	time_updated time
);

#queries to join tables

SELECT 
	P.name_of_product,
	P.category,
	PP.price,
	PP.person_updated,
	PP.time_updated	
FROM public.product AS P 
	INNER JOIN public.product_price AS PP
	ON P.product_id = PP.product_id;
