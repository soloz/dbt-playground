with orders as (
    select * from {{ ref('raw_orders') }}
)

select         
    orderid,
    sum(ordersellingprice) as total_selling_price
from orders 
group by orderid
having total_selling_price < 0
