{{ config(materialized='table') }}

select
  {{ dbt_utils.generate_surrogate_key(['id']) }} as province_sk,
  id as province_id,
  statnaam as province_name,
  geom as province_geometry,
  {{ common_columns() }}
from st_read({{ source("geojson_external", "nl_provinces") }}) as src
union all
select
  'unknown' as province_sk,
  -1 as province_id,
  'unknown' as province_name,
  NULL as province_geometry,
  {{ common_columns() }}
