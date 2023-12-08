{{
    config(
        materialized='table'
    )
}}
select * from 
{{ source('globalmart', 'orders') }}
--RAW.GLOBALMART.ORDERS