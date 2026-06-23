SELECT
    ship_to_state,
    COUNT(*)                                                      AS gross_orders,
    COUNT(*) FILTER (WHERE transaction_type = 'Cancelled')       AS cancelled,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Cancelled')
        * 100.0 / COUNT(*), 1
    )                                                             AS cancel_rate_pct
FROM unified_sales
WHERE ship_to_state IS NOT NULL
GROUP BY ship_to_state
HAVING COUNT(*) >= 20
ORDER BY cancel_rate_pct DESC
LIMIT 10;