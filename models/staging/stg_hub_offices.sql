{{config(materialized = 'table')}}
 
select
 
md5(office) as officehashkey,
current_timestamp as loaddate,
filename as recordsource,
office
from
{{source('QWT_RAW','raw_offices')}}