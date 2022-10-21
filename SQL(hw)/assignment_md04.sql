SELECT address_id, address, address2, district, city_id, postal_code
FROM public.address
WHERE district = 'Texas'
ORDER BY address;
