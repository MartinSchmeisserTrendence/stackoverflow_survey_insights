terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  # Credentials only needs to be set if you do not have the GOOGLE_APPLICATION_CREDENTIALS set
  credentials = "/Users/martinschmeisser/Entwicklung/Zoomcamp/KEYS/serviceaccount_key.json"
  project = "playground-martin"
  region  = "europe-west1"
}

resource "google_storage_bucket" "data-lake-bucket" {
  name          = "playground-martin-stackoverflow-survey-data-bucket"
  location      = "EU"

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365  // days
    }
  }

  force_destroy = true
}

resource "google_bigquery_dataset" "dataset-staging" {
  dataset_id = "stackoverflow_staging"
  project    = "playground-martin"
  location   = "EU"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "stackoverflow"
  project    = "playground-martin"
  location   = "EU"
}