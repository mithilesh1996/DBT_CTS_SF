import snowflake.snowpark.functions as f

def model(dbt,session):

    stg_customer_df = dbt.source('QWT_RAW','raw_customers')

    return stg_customer_df