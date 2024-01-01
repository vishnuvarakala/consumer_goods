
-- 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, segment
-- product_count_2020 , product_count_2021 ,difference

with data as (
select segment, count(distinct product) as product_count, cost_year from dim_product dp
join fact_manufacturing_cost fmc on dp.product_code = fmc.product_code
group by segment
)

select t1.segment, t1.product_count as product_count_2020, t2.product_count  as product_count_2021, (t1.product_count-t2.product_count) as difference  

from data t1, data t2 where t1.cost_year = 2020 and t2.cost_year= 2021;