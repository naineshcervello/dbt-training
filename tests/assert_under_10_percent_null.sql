-- any row shows up in this test will fail this test

select
sum(case when id is null then 1 else 0  end)/count(*) as total_nulls
from {{ ref('first_model') }}