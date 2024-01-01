

-- 5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
-- product_code , product , manufacturing_cost



(select  dp.product_code , dp.product,  fmc.manufacturing_cost from dim_product dp
join fact_manufacturing_cost fmc on dp.product_code = fmc.product_code
order by fmc.manufacturing_cost desc 
limit 1)

UNION

(select  dp.product_code , dp.product,  fmc.manufacturing_cost from dim_product dp
join fact_manufacturing_cost fmc on dp.product_code = fmc.product_code
order by fmc.manufacturing_cost asc 
limit 1);
