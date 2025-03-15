# Project

A small project that loads, extracts, transforms and visualizes data from the StackOverflow survey using batchprocessing in GCP. 

Closing project of the data engineering zoomcamp 2025[https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main].

# Problem-Description

TODO

# Techstack

- *Terraform*: Setting up the IaC
- *Kastra*: Orchestrate a Pipeline for processing loading data into a datalake and then into a data warehouse
- *DBT/BigQuery*: Transforming the data in the data warehouse: prepare and cluster it for the dashboard
- *Google Data Studio*: Building a dashboard with two tiles to visualize the data


# Technical Details

## 0. Data-Source
https://survey.stackoverflow.co/

Sadly, it does not seem to be possible to gather the data automatically with a script due to changing link structures.

Examples:
- https://info.stackoverflowsolutions.com/rs/719-EMH-566/images/stack-overflow-developer-survey-2022.zip
- https://survey.stackoverflow.co/datasets/stack-overflow-developer-survey-2016.zip


Therefore, downloading the zip-files manually in every new year seems to be mandatory.

The .zip files are located in "00_data".



## 1. IaC with Terraform

### Description
- creating a databucket
- creating a dataset (staging)
- creating a dataset

### Usage
- create service-account in GCP and export credentials as JSON
- adjust path to this JSON in main.tf
- adjust project-name and region

- run "terraform init", "terraform plan", "terraform apply"


## 2. Workflow-Orchestration and Data-Ingestion with Kaestra

### Description
- setting up key-value-variables for GCP in Kaestra
- extract the .zip files (located in "00_data") and upload the .csv files to GCS in batches
- create external tables and non-external tables in BigQuery

### Usage
- execute "docker compose up -d" to run kaestra (in the docker-compose, the local folder with the csv files is mapped as value so Kestra can find the local files)
- open "http://localhost:8080" 
- import the flow "01_key_values.yaml" execute it to set the credentials
    - note: copy the credentials of the GCP service account from the JSON to 01_key_values.yaml

- import and execute either
    - "02_stackoverlow_ingestion_with_inputs.yaml" to execute the ingestion for one year
    - "03_stackoverlow_ingestion_scheduled.yaml", where all years can be executed at once using the backfill-function (start: "2020-01-01 00:00:00", end: "2025-01-01 00:00:00")

## 3. Transformations with DBT


### Description
- see lineage for overview

#### Models
- stg_stackoverflow_meta.sql --> counting respondents per year
- stackoverflow_meta.sql --> copy of stg_stackoverflow_meta, yould be omitted

- stg_stackoverflow_data.sql --> union of the tables of four years with selected columns and renaming
- stackoverflow_data_participants.sql --> distincting participants in professional/non-professional developers and in data-related or non-data-related jobs
- stackoverflow_data_unnested.sql --> unnesting of nested columns "DatabaseHaveWorkedWith" and "DatabaseWandToWorkWith" and joining with stackoverflow_data_participants
- stackoverflow_data_clustered.sql --> final data table for the front-end, partitioned by year and clustered by "participant_description" and "participant_developer_description"


### Usage
- set up DBT with BigQuery-connection, Repository-connection, and, if desired, multiple environments
- execute dbt-build in development-env and later in production-env


## 4. Building dashboard with Google Data Studio



