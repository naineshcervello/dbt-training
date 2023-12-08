select
--from raw_orders
{{ dbt_utils.generate_surrogate_key(['orderid', 'o.customerid', 'o.productid']) }} as sk_orders,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.customerid,
o.productid,
o.ordersellingprice,
o.ordercostprice,
--from raw_customer
c.customername,
c.segment,
c.country,
--from raw_product
--p.productid,
p.category,
p.productname,
p.subcategory,
ordersellingprice - ordercostprice as orderprofit,
{{ markup('ordersellingprice', 'ordercostprice' ) }} as markup,
d.delivery_team
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid
left join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode