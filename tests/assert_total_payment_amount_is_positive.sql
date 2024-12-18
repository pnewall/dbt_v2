select
    order_id, 
    amount as amount
from {{ ref('stg_payments') }}
where
    amount < 0