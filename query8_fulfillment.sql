SELECT
    platform,
    fulfillment_type,
    COUNT(*)                                                      AS gross_orders,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')         AS shipped,
    COUNT(*) FILTER (WHERE transaction_type = 'Cancelled')       AS cancelled,
    COUNT(*) FILTER (WHERE transaction_type = 'Returned')        AS returned,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Cancelled')
        * 100.0 / COUNT(*), 1
    )                                                             AS cancel_rate_pct,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Returned')
        * 100.0 / NULLIF(COUNT(*) FILTER (WHERE transaction_type = 'Shipped'), 0), 1
    )                                                             AS refund_rate_pct
FROM unified_sales
WHERE fulfillment_type IS NOT NULL
GROUP BY platform, fulfillment_type
ORDER BY platform, gross_orders DESC;