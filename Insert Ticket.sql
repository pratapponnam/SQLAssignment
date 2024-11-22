--craete a temp table with unique records

CREATE TABLE Ticket_stage_unique AS
WITH Deduplicated AS (
    SELECT 
        row_id, customer_id, driver_id, bus_id, route_num, departure_stop,
        arrival_stop, price_adult, price_child, no_of_adults, no_of_children,
        pass, ticket_date_time, total_price,
        ROW_NUMBER() OVER (PARTITION BY customer_id, ticket_date_time, route_num ORDER BY row_id) AS row_num
    FROM Ticket_stage
)
SELECT 
    row_id, customer_id, driver_id, bus_id, route_num, departure_stop,
    arrival_stop, price_adult, price_child, no_of_adults, no_of_children,
    pass, ticket_date_time, total_price
FROM Deduplicated
WHERE row_num = 1;

--insert them into main table
INSERT INTO Ticket (
    customer_id, driver_id, bus_id, route_num, departure_stop,
    arrival_stop, price_adult, price_child, no_of_adults, no_of_children,
    pass, ticket_date_time, total_price
)
SELECT 
    customer_id, driver_id, bus_id, route_num, departure_stop,
    arrival_stop, price_adult, price_child, no_of_adults, no_of_children,
    pass, ticket_date_time, total_price
FROM Ticket_stage_unique
WHERE (customer_id, ticket_date_time, route_num) NOT IN (
    SELECT customer_id, ticket_date_time, route_num FROM Ticket
);


