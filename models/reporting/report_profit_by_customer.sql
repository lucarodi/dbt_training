select customerid,
customername,
segment,
country,
sum( orderprofit ) as profit
from {{ ref('stg_orders') }} 
group by 
customerid,
customername,
segment,
country
order by profit desc