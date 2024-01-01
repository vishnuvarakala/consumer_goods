



-- 6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the
-- Indian market. The final output contains these fields, customer_code customer ,average_discount_percentage

select fpid.customer_code , customer , pre_invoice_discount_pct from fact_pre_invoice_deductions fpid
join dim_customer dm on fpid.customer_code = dm.customer_code 
where fiscal_year = '2021' and market = 'India' and pre_invoice_discount_pct > (select avg(pre_invoice_discount_pct) from fact_pre_invoice_deductions) 
order by pre_invoice_discount_pct  desc limit 5 ;
