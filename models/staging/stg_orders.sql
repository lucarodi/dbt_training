
select 
-- from orders
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
-- from customers
c.customername,
c.customerid,
c.segment,
c.country
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_product') }} as p 
on o.productid = p.productid
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
