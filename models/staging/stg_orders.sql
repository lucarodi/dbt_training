
select 
-- from orders
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid' , 'p.productid']) }} as key_orders,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit,
o.ORDERSELLINGPRICE,
o.ORDERCOSTPRICE,
-- from products
p.productid,
p.productname,
p.category,
p.subcategory,
{{ markup('ordersellingprice', 'ORDERCOSTPRICE') }} as markup,
-- from customers
c.customername,
c.customerid,
c.segment,
c.country,
d.delivery_team
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid 
left join {{ ref('delivery_team') }} as d 
on o.shipmode = d.shipmode