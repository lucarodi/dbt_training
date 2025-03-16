{% macro limitdata_in_dev(columnname) %}

{% if target.name == 'development' %}
where {{column_name }} >= dataadd('day' , -30 , current_timesamp)
{% endif %}
{% endmacro %}
