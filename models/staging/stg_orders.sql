{{
    config(
        materialized='incremental',
        unique_key=['orderid']
    )
}}
select * from 
{{ source('QWT_RAW', 'raw_orders') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where orderdate > (select max(orderdate) from {{ this }}) 
{% endif %}
