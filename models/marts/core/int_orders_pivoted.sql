{%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

with payments as (

    select * from {{ ref('stg_payments') }}

),

pivoted as (

    select
        order_id,

        {%- for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
		{%- if not loop.last -%}
			,
		{%- endif %}
		{% endfor -%}

        {#- the original problem with the code above was that a trailing comma on the final line will cause a SQL error -#}

        {#- i.e sum(case when payment_method = '{{ payment_method }}'' then amount else 0) as {{ payment_method }}_amount, -#}

        from payments
        where status = 'success'
        group by 1
)

select * from pivoted