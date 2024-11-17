terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.11.2"
    }
  }
}

provider "google" {
  project = "datatalksclub-441720"
  region  = "europe-west3"
}

resource "google_storage_bucket" "datatalks_bucket" {
  name          = "datatalksclub-441720_bucket"
  location      = "EU"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}