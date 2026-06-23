SELECT
    item_description,
    COUNT(*) FILTER (WHERE transaction_type = 'Shipped')  AS times_sold,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Shipped'), 2)   AS gross_revenue,
    ROUND(SUM(ABS(invoice_amount))
        FILTER (WHERE transaction_type = 'Returned'), 2)  AS refund_amount,
    ROUND(SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Shipped')
        - SUM(ABS(invoice_amount)) FILTER (WHERE transaction_type = 'Returned')
    , 2)                                                  AS net_revenue
FROM unified_sales
WHERE item_description IS NOT NULL
  AND item_description != 'NaN'
GROUP BY item_description
HAVING COUNT(*) FILTER (WHERE transaction_type = 'Shipped') > 0
ORDER BY gross_revenue DESC
LIMIT 10;