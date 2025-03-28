{{

    config(materialized='table')
}}

select 
* 
from 
{{source('QWT_RAW','raw_emp_office')}}