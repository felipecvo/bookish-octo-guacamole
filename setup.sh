#!/bin/bash

GROUP=rg-2tdsa-sprint4
ACR_NAME=pf2128sprint42tdsa
WEBAPP_NAME="pf2128guacamole"
APP_SERVICE_PLAN="plan-pf2128guacamole"
LOCATION=eastus2

az group create -n $GROUP -l $LOCATION

az acr create --resource-group $GROUP --name $ACR_NAME --sku Basic --admin-enabled

# Criar o Plano de Serviço
az appservice plan create \
  --name $APP_SERVICE_PLAN \
  --resource-group $GROUP \
  --location "koreacentral" \
  --sku F1 \
  --is-linux

# Criar o Serviço de Aplicativo
az webapp create \
  --name $WEBAPP_NAME \
  --resource-group $GROUP \
  --plan $APP_SERVICE_PLAN \
  -i ${ACR_NAME}.azurecr.io/guacamole:latest

  az webapp config appsettings set \
  --name "$WEBAPP_NAME" \
  --resource-group "$GROUP" \
  --settings \
    WEBSITES_PORT=8080