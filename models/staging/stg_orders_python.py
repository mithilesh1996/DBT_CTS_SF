import snowflake.snowpark.functions as f

def model(dbt, session):

    dbt.config(materialized='incremental',unique_key=['orderid'])

    orders_df=dbt.source('QWT_RAW','raw_orders')

    if dbt.is_incremental:
 
        max_from_orders = f"select max(orderdate) from {dbt.this}"
 
        orders_df = orders_df.filter(orders_df.orderdate > session.sql(max_from_orders).collect()[0][0])
 
    return orders_df

    