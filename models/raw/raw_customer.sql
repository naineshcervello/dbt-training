{{
    config(
        materialized='table'
    )
}}
select * from 
--raw.globalmart.customer
{{ source('globalmart', 'customer') }}