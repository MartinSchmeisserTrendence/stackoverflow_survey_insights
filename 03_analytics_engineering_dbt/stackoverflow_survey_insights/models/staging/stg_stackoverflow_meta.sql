{{ config(materialized='table') }}

SELECT 2020 AS year, COUNT(Respondent) as participant_counter
FROM {{ source('staging','stackoverflow_survey_2020') }}

UNION ALL

SELECT 2021 AS year, COUNT(ResponseId) as participant_counter
FROM {{ source('staging','stackoverflow_survey_2021') }}

UNION ALL

SELECT 2022 AS year, COUNT(ResponseId) as participant_counter
FROM {{ source('staging','stackoverflow_survey_2022') }}

UNION ALL

SELECT 2023 AS year, COUNT(ResponseId) as participant_counter
FROM {{ source('staging','stackoverflow_survey_2023') }}

UNION ALL

SELECT 2024 AS year, COUNT(ResponseId) as participant_counter
FROM {{ source('staging','stackoverflow_survey_2024') }}