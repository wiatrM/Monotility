variable "env" {
  description = "The stage of the environment: dev, stg, or prod"
  type = string
  validation {
    condition = can(regex("^(dev|stg|prod)$", var.env))
    error_message = "Enviroment must be dev, stg or prod"
  }
}

variable "credentials_file" {
  description = "The path to the GCP credentials file"
  type = string
}

variable "project_id" {
  description = "The GCP project ID"
  type = string
}

variable "region" {
  description = "The GCP region"
  type = string
  default = "europe-central2"
}

variable "zone" {
  description = "The GCP zone"
  type = string
  default = "europe-central2-a"
}
