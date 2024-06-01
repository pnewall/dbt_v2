with source as (

    select * from {{ source('raw', 'raw_payment') }}

),

payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,

-- amount is in cents, convert it to dollars via a macro

        {{ cents_to_dollars('amount', 4) }} as amount,
        created as created_at

    from source

)

select * from payments