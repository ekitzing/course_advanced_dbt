{%- macro incremental_window(column_name = 'created_at', lookback_window = -2, periods = 'day') -%}

{% if is_incremental() %}

    WHERE {{ column_name }} >= (SELECT DATEADD('{{ periods }}' , {{ lookback_window }}, MAX( {{ column_name }} )) FROM {{ this }} )

{% endif %}

{%- endmacro -%}
