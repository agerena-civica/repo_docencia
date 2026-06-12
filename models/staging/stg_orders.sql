-- Staging de pedidos: casting y renaming desde la source Bronze.
-- No deduplica todavía; eso es trabajo de la capa Silver.
select
    cast(order_id    as integer)      as order_id,
    cast(customer_id as integer)      as customer_id,
    cast(order_date  as timestamp)    as order_date,
    lower(trim(status))               as status,
    cast(amount      as number(12,2)) as amount
from {{ source('raw_ecommerce', 'raw_orders') }}
