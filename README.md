# Project

A small project that loads, extracts, transforms and visualizes data from the StackOverflow survey using batchprocessing in GCP. 

Closing project of the data engineering zoomcamp 2025[https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main].


# Techstack

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
Furthermore, I decided to unzip the ZIP-files manually to extract the relevant .csv files, because also their naming structure is changing.

The extracted .csv files are located in 00_data/unzipped.



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
- upload the extracted .csv files (located in 00_data/unzipped) to GCS in batches
- create external tables and non-external tables in BigQuery

### Usage
- execute "docker compose up -d" to run kaestra (in the docker-compose, the local folder with the csv files is mapped as value so Kestra can find the local files)
- open "http://localhost:8080" 
- import the flows from "02_ingestion_kaestra" to kaestra and execute them

- note: copy the credentials of the GCP service account from the JSON to 01_key_values.yaml


## 3. Transformations with DBT



## 4. Building dashboard with Google Data Studio



