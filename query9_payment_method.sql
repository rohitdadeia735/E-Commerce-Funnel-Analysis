SELECT
    payment_method,
    COUNT(*)                                                      AS gross_orders,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')         AS shipped,
    COUNT(*) FILTER (WHERE transaction_type = 'Returned')        AS returned,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Returned')
        * 100.0 / NULLIF(COUNT(*) FILTER (WHERE transaction_type = 'Shipped'), 0), 1
    )                                                             AS refund_rate_pct,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Shipped'), 2)          AS gross_revenue
FROM unified_sales
WHERE payment_method IS NOT NULL
  AND payment_method != 'nan'
GROUP BY payment_method
ORDER BY gross_orders DESC;