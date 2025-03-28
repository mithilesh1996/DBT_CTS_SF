{{config(materialized='table')}}
 
select
OrderID ,
LineNo  ,
ShipperID   ,
CustomerID  ,
ProductID   ,
EmployeeID  ,
split_part(ShipmentDate,' ',1)::date AS ShipmentDate,
Status  
from
{{ source('QWT_RAW','raw_shipments') }}