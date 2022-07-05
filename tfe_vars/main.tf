terraform {

  required_version = ">=1.2"

  
}

## https://registry.terraform.io/providers/hashicorp/tfe/latest/docs

variable "ARM_CLIENT_ID" {
    type = string
}

variable "ARM_CLIENT_SECRET" {
    type = string
    sensitive = true
}

variable "ARM_TENANT_ID" {
    type = string
}

variable "ARM_SUBSCRIPTION_ID" {
    type = string
}


resource "tfe_organization" "CloudFromScratch" {
  name  = "CloudFromScratch"
  email = "michael@azured.io"
}


resource "tfe_workspace" "TestSpace" {
  name         = "TestSpace"
  organization = tfe_organization.CloudFromScratch.name
}


resource "tfe_variable_set" "Azure" {
  name         = "Azure Dev Subscription"
  description  = "Azure Subscription Variables"
  organization = tfe_organization.CloudFromScratch.name
}


resource "tfe_variable" "appid" {
  key             = "ARM_CLIENT_ID"
  value           = var.ARM_CLIENT_ID
  category        = "env"
  variable_set_id = tfe_variable_set.Azure.id
}


resource "tfe_variable" "password" {
  key             = "ARM_CLIENT_SECRET"
  value           = var.ARM_CLIENT_SECRET
  category        = "env"
  variable_set_id = tfe_variable_set.Azure.id
  sensitive = true
}


resource "tfe_variable" "tenant" {
  key             = "ARM_TENANT_ID"
  value           = var.ARM_TENANT_ID
  category        = "env"
  variable_set_id = tfe_variable_set.Azure.id
}


resource "tfe_variable" "subscriptionId" {
  key             = "ARM_SUBSCRIPTION_ID"
  value           = var.ARM_SUBSCRIPTION_ID
  category        = "env"
  variable_set_id = tfe_variable_set.Azure.id
}
