{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['stations.code']) }}             AS station_sk,
    stations.id                                  AS station_id,
    stations.code                                AS station_code,
    stations.name_long                           AS station_name,
    stations.type                                AS station_type,
    st_point(stations.geo_lng, stations.geo_lat) AS station_geo_location,
    coalesce(dim_mun.municipality_sk, 'unknown') AS municipality_sk,
    {{ common_columns() }}
FROM {{ source("external_db", "stations") }} AS stations
LEFT JOIN {{ ref("dim_municipalities") }} AS dim_mun
    ON st_contains(
        dim_mun.municipality_geometry, st_point(stations.geo_lng, stations.geo_lat)
    )
WHERE stations.country = 'NL'
