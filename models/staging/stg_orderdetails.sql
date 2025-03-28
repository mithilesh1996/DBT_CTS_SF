{{
config
(
    materialized='table',
    unique_key=['orderid','lineno']
)
}}



select 
od.*,
o.orderdate 
from {{ source('QWT_RAW', 'raw_orders') }} o
inner join 
{{ source('QWT_RAW', 'raw_orderdetails') }} od 
on 
o.orderid=od.orderid



{% if is_incremental() %}

where o.orderdate > (select max(orderdate) from {{this}})

{% endif %}