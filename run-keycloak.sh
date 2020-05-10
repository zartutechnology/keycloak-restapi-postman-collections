#!/bin/bash

# download latest keycloak
docker pull jboss/keycloak

current_path=$(pwd)

echo $current_path

# run keycloak
docker run -d -p 8080:8080 -p 8443:8443 -e KEYCLOAK_LOGLEVEL=DEBUG -e KEYCLOAK_USER=keycloak \
	-e KEYCLOAK_PASSWORD=keycloak -e DB_PASSWORD=keycloak -e KEYCLOAK_IMPORT=/tmp/heroes-realm.json \
	-v $current_path/heroes-realm.json:/tmp/heroes-realm.json --name keycloak jboss/keycloak 
