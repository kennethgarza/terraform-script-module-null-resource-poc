terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }

    restapi = {
      source = "Mastercard/restapi"
    }
  }

  backend "local" {} ## we are only testing here
}

variable "octopus_address" {
  description = "the octopus address"
  type = string
  default = "http://octopus:8080"
}

variable "octopus_api_key" {
  description = "the octopus api key"
  type = string
  sensitive = true
  default = "API-L2GV2ELTCZDRANT1OQO045GPZHXFGWR"
}

provider "octopusdeploy" {
  address = var.octopus_address
  api_key = var.octopus_api_key
}

provider "restapi" {
  uri                   = var.octopus_address
  write_returns_object  = true
  create_returns_object = true
  debug                 = true

  headers = {
    "X-Octopus-ApiKey"  = var.octopus_api_key,
    "Content-Type"      = "application/json"
  }
}
