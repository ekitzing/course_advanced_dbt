SELECT
date_week,
user_id,
{{- rolling_aggregate_n_periods ('login_count', 'user_id', num=30, order_by='date_week') -}}
FROM {{ref('fct_active_users')}}
