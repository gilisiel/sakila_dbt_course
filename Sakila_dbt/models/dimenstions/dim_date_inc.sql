{{config(materialized='ephemeral') }}
SELECT
*
from {{ ref('dim_date') }}
where 1=1


{% if is_incremental() %}
and date_key::timestamp > (select max(date_key) - INTERVAL '3 DAY' from {{this}})
{% endif %}