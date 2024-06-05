with source as (

    select * from {{ source('jaffle_shop', 'raw_customers') }}

),

customers as (

    select
        id as customer_id,
        split_part(name, ' ', 1) as first_name, 
        split_part(name, ' ', 2) as last_name

    from source
)

select * from customers