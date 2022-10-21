/* Question 1 */

SELECT actor_id, first_name, last_name
FROM public.actor
WHERE first_name IN ('Penelope', 'Kenneth')
ORDER BY last_name;

/* Question 2 */

SELECT first_name
FROM public.actor
WHERE first_name LIKE 'C%'
ORDER BY first_name;