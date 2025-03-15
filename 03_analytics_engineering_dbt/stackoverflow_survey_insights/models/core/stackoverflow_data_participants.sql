{{ config(materialized='table') }}

-- overwriting participant description to distinct only between professional and non-professional developers
WITH cte_overwrite_participant_description AS (
    SELECT * REPLACE(
           CASE 
               WHEN participant_description = 'I am a developer by profession'
               THEN 'professional_developer'
               ELSE 'non_professional_developer'
           END AS participant_description
    )
    FROM {{ ref('stg_stackoverflow_data') }}
),

-- overwriting developer description to distinct only between data-related and non-data-related jobs
cte_overwrite_developer_description AS (
    SELECT * REPLACE (
           CASE 
               WHEN LOWER(participant_developer_description) LIKE "%data%"
               THEN 'data_related_job'
               ELSE 'non_data_related_job'
           END AS participant_developer_description
    )
    FROM cte_overwrite_participant_description
)

SELECT year, respondent_id, participant_description, participant_developer_description
FROM cte_overwrite_developer_description