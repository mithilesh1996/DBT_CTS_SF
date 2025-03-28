{{
    config(materialized='view', schema='reporting_dev')
}}

{% set linenumber = get_line_orders() %}

select orderid,

 {% for i in linenumber %}
    sum(case when lineno={{i}} then linesalesamount end) as lineno{{i}},
 {%endfor %}
COALESCE(lineno1,0)+COALESCE(lineno2,0)+COALESCE(lineno3,0) as totalsales
from {{ ref('fct_orders') }}
group by orderid