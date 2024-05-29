select * from {{ source('jaffle_shop', 'customers') }}


{%- if target.name == 'dev' -%}
where load_time >= dateadd('day', -1, current_timestamp)
{%- endif -%}