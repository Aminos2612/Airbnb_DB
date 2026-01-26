USE amine_airbnb;

-- TEST CASE 1: Verify that every completed booking has at least one payment

SELECT b.id AS booking_id, b.status, COUNT(p.id) AS payment_count
FROM bookings b
LEFT JOIN payments p ON p.booking_id = b.id
WHERE b.status = 'completed'
GROUP BY b.id, b.status;


-- TEST CASE 2: Validate host→property→booking chain for data integrity

SELECT b.id AS booking_id,
       g.id AS guest_id,
       p.id AS property_id,
       h.id AS host_id,
       u.name AS host_name
FROM bookings b
JOIN guests g ON b.guest_id = g.id
JOIN properties p ON b.property_id = p.id
JOIN hosts h ON p.host_id = h.id
JOIN users u ON h.user_id = u.id
ORDER BY b.id;




-- TEST CASE 3: Verify commission correctness relative to total price

SELECT b.id AS booking_id,
       b.total_price,
       pc.guest_fee,
       pc.host_fee,
       (pc.guest_fee + pc.host_fee) AS total_commission
FROM bookings b
JOIN platform_commissions pc ON pc.booking_id = b.id
ORDER BY b.id;
