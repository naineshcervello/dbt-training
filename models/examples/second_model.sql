{{
    config(
        materialized='view'
    )
}}
select * from {{ ref('first_model') }}