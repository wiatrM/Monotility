# Use ./modules/gke to create dev kubernetes cluster

module "dev_gke_deployment" {
  source = "./modules/gke"
  env = "dev"
  region = "europe-central2"
  zone = "europe-central2-a"
  project_id = var.project_id
  credentials_file = "../../monotility-415613-b53c2b3dea2c.json"
}

provider "google" {
  credentials = file("../monotility-415613-b53c2b3dea2c.json")
  project = var.project_id
  region = var.region
  zone = var.zone
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
