SELECT
    platform,
    COUNT(*) AS gross_orders,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')    AS shipped,
    COUNT(*) FILTER (WHERE transaction_type = 'Cancelled')  AS cancelled,
    COUNT(*) FILTER (WHERE transaction_type = 'Returned')   AS returned,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Cancelled') 
        * 100.0 / COUNT(*), 1
    ) AS cancel_rate_pct,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Returned') 
        * 100.0 / COUNT(*) FILTER (WHERE transaction_type = 'Shipped'), 1
    ) AS refund_rate_pct
FROM unified_sales
GROUP BY platform
ORDER BY platform;