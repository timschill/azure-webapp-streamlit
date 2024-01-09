#!/bin/bash

if [ -z "$1" ]
    then
        echo "No argument supplied"
        exit 1
fi

docker buildx build --load -t evolatedev.azurecr.io/azure-webapp-streamlit:$1 --platform linux/amd64 .
# ask user if they want to push to ACR
read -p "Do you want to push to ACR? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
    then
        docker push evolatedev.azurecr.io/azure-webapp-streamlit:$1
fi