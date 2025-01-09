terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.80.0"
    }
  }

  required_version = ">= 1.4.6"
}

provider "google" {
  project = var.project_id
  region  = "europe-west3"
  zone    = "europe-west3-a"
}