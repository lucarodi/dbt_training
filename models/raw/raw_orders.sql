
{{
    config(
        materialized='table'
    )
}}

select * from raw.GLOBALMART.ORDERS