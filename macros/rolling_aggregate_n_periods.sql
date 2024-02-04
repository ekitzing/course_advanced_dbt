{% macro rolling_aggregate_n_periods(column_name, partition_by, agg='avg', num=7, periods='days',order_by='created_at') %}
    {{ agg }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ num - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ agg }}_{{ num }}_{{ periods }}_{{ column_name }}
{% endmacro %}
