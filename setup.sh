#!/bin/bash

GROUP=rg-2tdsa-sprint4
ACR_NAME=pf2128sprint42tdsa

az group create -n $GROUP -l eastus2

az acr create --resource-group $GROUP --name $ACR_NAME --sku Basic