terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }

  backend "local" {} ## we are only testing here
}

provider "octopusdeploy" {
  address = "http://octopus:8080"
  api_key = "API-L2GV2ELTCZDRANT1OQO045GPZHXFGWR"
}
