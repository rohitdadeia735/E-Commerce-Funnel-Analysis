SELECT
    item_description,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')  AS times_sold,
    COUNT(*) FILTER (WHERE transaction_type = 'Returned') AS times_returned,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Returned')
        * 100.0 / COUNT(*) FILTER (WHERE transaction_type = 'Shipped'), 1
    ) AS return_rate_pct
FROM unified_sales
WHERE item_description IS NOT NULL
  AND item_description != 'NaN'
GROUP BY item_description
HAVING COUNT(*) FILTER (WHERE transaction_type = 'Shipped') >= 10
ORDER BY return_rate_pct DESC
LIMIT 10;