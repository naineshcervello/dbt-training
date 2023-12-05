{{
    config(
        materialized='view'
    )
}}
select * from 
RAW.GLOBALMART.PRODUCT