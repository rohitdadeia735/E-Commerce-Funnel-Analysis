SELECT
    platform,
    month,
    month_num,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Shipped'), 2)    AS gross_revenue,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Returned'), 2)   AS refund_amount,
    ROUND(SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Shipped')
        - SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Returned')
    , 2)                                                    AS net_revenue,
    ROUND(
        SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Returned')
        * 100.0
        / NULLIF(SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Shipped'), 0)
    , 1)                                                    AS revenue_lost_pct
FROM unified_sales
GROUP BY platform, month, month_num
ORDER BY platform, month_num;