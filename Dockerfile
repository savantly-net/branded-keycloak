ARG KEYCLOAK_VERSION=21.1.2
FROM docker.io/bitnami/keycloak:${KEYCLOAK_VERSION}

COPY keywind/keywind.jar /opt/bitnami/keycloak/providers/keywind.jar

COPY themes/custom /opt/bitnami/keycloak/themes/custom
