SELECT 
    d.name AS driver_name, 
    COUNT(DISTINCT DATE(t.ticket_date_time) || '-' || t.bus_id) AS trips_completed
FROM 
    Ticket t
JOIN 
    Driver d
ON 
    t.driver_id = d.row_id
WHERE 
    d.name = 'David Brown' 
    AND t.ticket_date_time >= DATE('now', '-7 days') 
    AND t.ticket_date_time < DATE('now')
GROUP BY 
    d.name;
	
SELECT 
    driver_id, 
    COUNT(row_id) AS trips_completed
FROM 
    Ticket
WHERE 
    ticket_date_time >= DATE('now', '-7 days') 
    AND ticket_date_time < DATE('now')
GROUP BY 
    driver_id;
