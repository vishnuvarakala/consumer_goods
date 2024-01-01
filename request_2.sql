-- 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
-- unique_products_2020
-- unique_products_2021
 -- percentage_chg

WITH data as (
 Select cost_year, count(distinct product_code) as count from fact_manufacturing_cost group by cost_year)
Select t1.count as count2020, t2.count  as count2021, (t2.count /t1.count) *100 as perc_change from data t1, data t2 where t1.cost_year = 2020 and t2.cost_year = 2021;