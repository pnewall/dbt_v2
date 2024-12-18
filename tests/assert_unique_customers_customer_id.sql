select 
    customer_id,
    count(1)
from
    {{ ref('stg_customers') }}
group by customer_id having count(1) > 1