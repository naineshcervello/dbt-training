{{
    config(
        materialized='table'
    )
}}

with orders as
(
    select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
)
select 
distinct o_orderdate,
sum(o_totalprice) over( partition by o_orderdate order by o_orderkey range between unbounded preceding and current row) as cumulative_sales
from orders
order by o_orderdate