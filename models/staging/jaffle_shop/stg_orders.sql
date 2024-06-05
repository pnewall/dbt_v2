with source as (

    select * from {{ source('jaffle_shop', 'raw_orders') }}

),

orders as (

    select
        id as order_id,
        customer as customer_id,
        ordered_at as order_date,
        store_id,
        subtotal,
        tax_paid,
        order_total,
        status

    from source
)

select * from orders
