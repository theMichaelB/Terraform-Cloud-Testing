#!/bin/bash


export ARM_SUBSCRIPTION_ID=$(cat ../../azure_credentials.json | jq -r .subscriptionId)
export ARM_TENANT_ID=$(cat ../../azure_credentials.json | jq -r .tenant)
export ARM_CLIENT_ID=$(cat ../../azure_credentials.json | jq -r .appId)
export ARM_CLIENT_SECRET=$(cat ../../azure_credentials.json | jq -r .password)

terraform apply \
    -var="ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID" \
    -var="ARM_TENANT_ID=$ARM_TENANT_ID" \
    -var="ARM_CLIENT_ID=$ARM_CLIENT_ID" \
    -var="ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET" 
    