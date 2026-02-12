{% macro common_columns() %}
  last_update_dt: get_current_timestamp(),
  invocation_id: '{{ invocation_id }}'
{% endmacro %}
