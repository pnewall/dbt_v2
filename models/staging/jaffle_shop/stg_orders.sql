with source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _etl_loaded_at as loaded_time

    from source
)

select * from orders
