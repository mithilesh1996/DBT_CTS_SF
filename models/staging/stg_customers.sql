{{
    config(
        materialized='table'
    )
}}

SELECT * 
FROM {{ source('QWT_RAW', 'raw_customers') }}