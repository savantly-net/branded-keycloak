REPO_NAME ?= savantly/keycloak
COMMIT_HASH = $(shell git rev-parse --short HEAD)
APP_VERSION ?= 21.1.2

IMAGE_NAME_COMMIT=$(REPO_NAME):$(COMMIT_HASH)
IMAGE_NAME_VERSION=$(REPO_NAME):$(APP_VERSION)

.PHONY: build-image
build-image:
	docker build -t $(IMAGE_NAME_COMMIT) -t $(IMAGE_NAME_VERSION) .

.PHONY: push-image
push-image:
	docker buildx build --platform linux/amd64 --build-arg=KEYCLOAK_VERSION=$(APP_VERSION) -t $(IMAGE_NAME_COMMIT) -t $(IMAGE_NAME_VERSION) --push .

.PHONY: dev
dev:
	docker compose up