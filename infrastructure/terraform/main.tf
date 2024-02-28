# Use ./modules/gke to create dev kubernetes cluster

module "dev_gke_deployment" {
  source = "./modules/gke-cluster"
  env = "dev"
  region = var.region
  zone = var.zone
  project_id = var.project_id
  credentials_file = "../${var.credentials_file}"
}

provider "google" {
  credentials = file(var.credentials_file)
  project = var.project_id
  region = var.region
  zone = var.zone
  scopes = [
    # Default scopes
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    "https://www.googleapis.com/auth/devstorage.full_control",

    # Required for google_client_openid_userinfo
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

terraform {
  backend "gcs" {
    bucket = "monotility-tf-state-bucket"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.26"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.12"
    }
  }
}
