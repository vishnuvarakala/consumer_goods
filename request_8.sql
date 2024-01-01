-- 8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity,
-- Quarter , total_sold_quantity

select  quarter(date) as quarter, sold_quantity  from fact_sales_monthly

where fiscal_year = '2020' group by quarter order by sold_quantity desc ;