use sakila;
drop table rentals_may;
# Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE rentals_may (
    rental_id int unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rental_date DATETIME default null,
    inventory_id int unique,
    customer_id int,
    return_date DATETIME default null,
    staff_id int,
    last_update TIMESTAMP default null
);
# Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
INSERT INTO rentals_may (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT *
 FROM sakila.rental
where  MONTH(rental_date) like '%5';
# Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june (
    rental_id int unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rental_date DATETIME default null,
    inventory_id int unique,
    customer_id int,
    return_date DATETIME default null,
    staff_id int,
    last_update TIMESTAMP default null
);
# Insert values in the table rentals_may using the table rental, filtering values only for the month of June.
INSERT INTO rentals_june (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT *
 FROM sakila.rental
where  MONTH(rental_date) like '%6';
# Check the number of rentals for each customer for May.
SELECT 
    CONCAT((c.first_name), ' ', (c.last_name)) AS customer_name,
    COUNT(rental_id) AS number_of_borrowed_films_may
FROM
    rentals_may r
        INNER JOIN
    customer c ON r.customer_id = c.customer_id
GROUP BY 1
ORDER BY 1;
# Check the number of rentals for each customer for June.

SELECT 
    CONCAT((c.first_name), ' ', (c.last_name)) AS customer_name,
    COUNT(rental_id) AS number_of_borrowed_films_june
FROM
    rentals_june rj
        INNER JOIN
    customer c ON rj.customer_id = c.customer_id
GROUP BY 1
ORDER BY 1;