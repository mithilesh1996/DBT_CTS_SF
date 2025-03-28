{{

  config(materialized='table', schema='transforming_dev')

}}

select
ss.OrderID,
ss.LineNo,
ss.Status as currentstatus,
sh.companyname,
ss.ShipmentDate
from 
{{ ref('shipments_snapshot') }} ss inner join 
{{ ref('lkp_shippers') }} sh on 
ss.ShipperID=sh.ShipperID
where ss.dbt_valid_to is null
