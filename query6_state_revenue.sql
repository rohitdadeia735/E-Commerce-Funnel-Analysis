SELECT
    ship_to_state,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')  AS times_sold,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Shipped'), 2)   AS gross_revenue,
    ROUND(SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Shipped')
        - SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Returned')
    , 2)                                                  AS net_revenue
FROM unified_sales
WHERE ship_to_state IS NOT NULL
GROUP BY ship_to_state
ORDER BY net_revenue DESC
LIMIT 10;