select 
--from order table
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice,
o.ordercostprice,
o.ordersellingprice - o.ordercostprice as orderprofit,

--from customer table
c.customerid,
c.customername,
c.segment,
c.country,

--from product table
p.category,
p.productname,
p.subcategory,
p.productid
from {{ ref('raw_orders') }} o
left join {{ ref('raw_customers') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_products') }} as p
on o.productid = p.productid
