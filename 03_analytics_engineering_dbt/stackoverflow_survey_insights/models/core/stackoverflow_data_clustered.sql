{{ config(
    materialized='table',
    partitions={
        "field": "year"
    },
    cluster_by=['participant_description', 'participant_developer_description']
) }}

SELECT *
FROM {{ ref('stackoverflow_data_unnested') }}