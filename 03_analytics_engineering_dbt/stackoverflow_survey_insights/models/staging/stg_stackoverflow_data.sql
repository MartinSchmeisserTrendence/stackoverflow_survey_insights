{{ config(materialized='table') }}

-- only union spefiic columns here because the column naming and data structures differs a lot between the years 

SELECT
    2020 AS year,
    Respondent as respondent_id,
    MainBranch AS participant_description,
    DevType AS participant_developer_description,
    DatabaseWorkedWith AS DatabaseHaveWorkedWith,
    DatabaseDesireNextYear AS DatabaseWantToWorkWith
FROM {{ source('staging','stackoverflow_survey_2020') }}

UNION ALL

SELECT
    2021 AS year,
    ResponseId as respondent_id,
    MainBranch AS participant_description,
    DevType AS participant_developer_description,
    DatabaseHaveWorkedWith,
    DatabaseWantToWorkWith
FROM {{ source('staging','stackoverflow_survey_2021') }}

UNION ALL

SELECT
    2022 AS year,
    ResponseId as respondent_id,
    MainBranch AS participant_description,
    DevType AS participant_developer_description,
    DatabaseHaveWorkedWith,
    DatabaseWantToWorkWith
FROM {{ source('staging','stackoverflow_survey_2022') }}

UNION ALL

SELECT
    2023 AS year,
    ResponseId as respondent_id,
    MainBranch AS participant_description,
    DevType AS participant_developer_description,
    DatabaseHaveWorkedWith,
    DatabaseWantToWorkWith
FROM {{ source('staging','stackoverflow_survey_2023') }}

UNION ALL

SELECT
    2024 AS year,
    ResponseId as respondent_id,
    MainBranch AS participant_description,
    DevType AS participant_developer_description,
    DatabaseHaveWorkedWith,
    DatabaseWantToWorkWith
FROM {{ source('staging','stackoverflow_survey_2024') }}