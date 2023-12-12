{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('first_model') }}
union all 
select 7 as id