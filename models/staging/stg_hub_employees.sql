{{
    config(materialized='table')
}}

select 
md5(office) as officehashkey,
current_timestamp as LOADDATE,
filename,
office 
from 
{{source('QWT_RAW','raw_employees')}}