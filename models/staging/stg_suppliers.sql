{{config(materialised='table')}}

select * from {{source('QWT_RAW','raw_supplier')}}