# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "data-button-357010"
  region  = "us-central1"
}


terraform {
  backend "gcs" {
    bucket = ""
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}