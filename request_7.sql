-- 7. Get the complete report of the Gross sales amount for the customer “Atliq
-- Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions.
-- The final report contains these columns: Month , Year , Gross sales Amount

select month(date) as month, year(date) as year , fsm.sold_quantity*fgp.gross_price as Gross_sales_Amount from fact_gross_price fgp

join fact_sales_monthly fsm on fgp.product_code = fsm.product_code
join dim_customer dc on fsm.customer_code = dc.customer_code 

where customer = 'Atliq Exclusive'

group by month order by Gross_sales_Amount desc ;