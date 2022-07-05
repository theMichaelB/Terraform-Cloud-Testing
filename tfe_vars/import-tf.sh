#!/bin/bash 

terraform import tfe_organization.CloudFromScratch CloudFromScratch

terraform import tfe_workspace.TestSpace CloudFromScratch/TestSpace