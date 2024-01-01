-- 9. Which channel helped to bring more gross sales in the fiscal year 2021
-- and the percentage of contribution? The final output contains these fields,
-- channel , gross_sales_mln , percentage

select dc.channel, sum(fgp.gross_price*fsm.sold_quantity) as gross_sales ,

(SUM(fgp.gross_price * fsm.sold_quantity) / total.total_gross_sales) * 100 AS percentage_contribution

from fact_gross_price fgp

join fact_sales_monthly fsm on fgp.product_code = fsm.product_code
join dim_customer dc on fsm.customer_code = dc.customer_code 

join (

select (SUM(fgp.gross_price * fsm.sold_quantity)) as total_gross_sales

from fact_gross_price fgp

join fact_sales_monthly fsm on fgp.product_code = fsm.product_code
join dim_customer dc on fsm.customer_code = dc.customer_code 

where  fgp.fiscal_year = 2021

) as total 

where fgp.fiscal_year = 2021 
group by dc.channel
order by gross_sales desc ;
