{{config(materialised='table',schema='salesmart_dev')}}

select * from 
{{ref('trf_products')}}