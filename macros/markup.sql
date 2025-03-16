{% macro markup(sellingprice, costprice) %}
(({{sellingprice}} - {{costprice}})/{{costprice}})*100
{% endmacro %}