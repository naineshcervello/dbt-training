{{
    config(
        materialized='view'
    )
}}
select * from 
RAW.GLOBALMART.CUSTOMER