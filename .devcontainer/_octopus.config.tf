## basic configuration
locals {
    environments = [
        "PREPROD",
        "UAT",
        "PROD"
    ]

    tenant_tags = [
        "FI-Hosted",
        "BOK",
        "FI-Template"
    ]
}

resource "octopusdeploy_environment" "envs" {
    for_each = toset(local.environments)
    name = each.value
}

resource "octopusdeploy_tag_set" "tenant_tags" {
    name = "Tenant"
}

resource "octopusdeploy_tag" "tenant_tags" {
    for_each = toset(local.tenant_tags)

    color      = "#FF0000"
    tag_set_id = octopusdeploy_tag_set.tenant_tags.id
    name = each.value
}