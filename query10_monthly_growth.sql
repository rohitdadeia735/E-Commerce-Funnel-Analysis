SELECT
    month,
    month_num,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')         AS total_shipped,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Shipped'), 2)          AS gross_revenue,
    ROUND(SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Shipped')
        - SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Returned')
    , 2)                                                          AS net_revenue,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Cancelled')
        * 100.0 / COUNT(*), 1
    )                                                             AS cancel_rate_pct,
    ROUND(
        COUNT(*) FILTER (WHERE transaction_type = 'Returned')
        * 100.0 / NULLIF(COUNT(*) FILTER (WHERE transaction_type = 'Shipped'), 0), 1
    )                                                             AS refund_rate_pct
FROM unified_sales
GROUP BY month, month_num
ORDER BY month_num;