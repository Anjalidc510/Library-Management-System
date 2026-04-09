SELECT item_name, date FROM bookings 
JOIN items ON bookings.item_id = items.item_id 
ORDER BY date DESC LIMIT 1;

SELECT SUM(b.quantity * i.rate) AS total_nov_billing
FROM bookings b JOIN items i ON b.item_id = i.item_id
WHERE b.date BETWEEN '2021-11-01' AND '2021-11-30';

SELECT booking_id, SUM(b.quantity * i.rate) AS total_bill
FROM bookings b JOIN items i ON b.item_id = i.item_id
GROUP BY booking_id HAVING total_bill > 1000;

WITH MonthlyTotals AS (
    SELECT 
        strftime('%m', date) AS Month, 
        item_id, 
        SUM(quantity) as TotalQty
    FROM bookings
    GROUP BY Month, item_id
)
SELECT Month, item_id, TotalQty
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY Month ORDER BY TotalQty DESC) as MostRank,
           RANK() OVER(PARTITION BY Month ORDER BY TotalQty ASC) as LeastRank
    FROM MonthlyTotals
)
WHERE MostRank = 1 OR LeastRank = 1;

SELECT booking_id, SUM(b.quantity * i.rate) AS total_bill
FROM bookings b JOIN items i ON b.item_id = i.item_id
GROUP BY booking_id ORDER BY total_bill DESC LIMIT 1 OFFSET 1;
