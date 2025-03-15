{{ config(materialized='table') }}


WITH cte_databases_have_worked_with AS (
    SELECT
        respondent_id,
        database AS DatabaseHaveWorkedWith
    FROM
        {{ ref('stg_stackoverflow_data') }},
        UNNEST(SPLIT(DatabaseHaveWorkedWith, ';')) AS database
),

cte_databases_want_to_work_with AS (
    SELECT
        respondent_id,
        database AS DatabaseWantToWorkWith
    FROM
        {{ ref('stg_stackoverflow_data') }},
        UNNEST(SPLIT(DatabaseWantToWorkWith, ';')) AS database
)


SELECT *
FROM {{ ref('stackoverflow_data_participants') }}
LEFT JOIN cte_databases_have_worked_with USING (respondent_id)
LEFT JOIN cte_databases_want_to_work_with USING (respondent_id)
