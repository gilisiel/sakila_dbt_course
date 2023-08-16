{{ config(materialized='table',alias='customers_alias',schema='new') }}
select
*
from
{{ ref('hello_world') }}
where customer_id < {{ var('cust_id') }}
       