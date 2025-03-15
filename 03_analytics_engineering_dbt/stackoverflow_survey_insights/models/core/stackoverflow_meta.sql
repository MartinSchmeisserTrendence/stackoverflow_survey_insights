{{ config(materialized='table') }}

SELECT *
FROM {{ ref('stg_stackoverflow_meta') }}