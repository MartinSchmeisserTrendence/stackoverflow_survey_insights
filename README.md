# Project

A small project that loads, extracts, transforms and visualizes data from the StackOverflow survey. 

Closing project of the data engineering zoomcamp 2025[https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main].


# Techstack

- Batchprocessing
- GCP//

- *Terraform*: Setting up the IaC
- *Kastra/DLT*: Orchestrate a Pipeline for processing this dataset and putting it to a datalake
- *Kaestra*: Creating a pipeline for moving the data from the lake to a data warehouse
- *DBT/BigQuery*: Transforming the data in the data warehouse: prepare and cluster it for the dashboard
- *Google Data Studio*: Building a dashboard with two tiles to visualize the data


# Technical Details

## 0. Data-Source
https://survey.stackoverflow.co/


It does not seem to be possible to gather the data automatically with a script due to changing link structures.

Examples:
- https://info.stackoverflowsolutions.com/rs/719-EMH-566/images/stack-overflow-developer-survey-2022.zip
- https://survey.stackoverflow.co/datasets/stack-overflow-developer-survey-2016.zip


Therefore, downloading the zip-files manually in every new year seems to be mandatory.



## 1. IaC with Terraform
## 2. Workflow-Orchestration and Data-Ingestion with Kaestra
## 3. Transformations with DBT
## 4. Building dashboard with Google Data Studio



