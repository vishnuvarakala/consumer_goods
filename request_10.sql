-- 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these
-- fields, division , product_code, product , total_sold_quantity ,rank_order

WITH RankedProducts AS (
    SELECT
        division,
        fsm.product_code,
        product,
        SUM(sold_quantity) AS total_sold_quantity,
        RANK() OVER (PARTITION BY division ORDER BY SUM(sold_quantity) DESC) AS rank_order
    FROM dim_product dp

join fact_sales_monthly fsm on dp.product_code = fsm.product_code 

where fiscal_year = '2021'
    GROUP BY
        division, product_code, product
)
SELECT
    division,
    product_code,
    product,
    total_sold_quantity,
    rank_order
FROM
    RankedProducts
WHERE
    rank_order <= 3;