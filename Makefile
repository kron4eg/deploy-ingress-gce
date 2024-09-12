# SPDX-FileCopyrightText: 2024 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0

.ONESHELL:
.SHELLFLAGS 	 := -eu -o pipefail -c
SHELL 			 := bash
MAKEFLAGS 		 += --warn-undefined-variables
MAKEFLAGS 		 += --no-builtin-rules
IMAGE_REPOSITORY := europe-docker.pkg.dev/gardener-project/releases/ingress-gce
IMAGE_TAG        := $(shell git describe --tags --always)

.PHONY: build
build: docker-image

.PHONY: release
release: build docker-login

.PHONY: docker-image
docker-image:
	@docker buildx build -t kron4eg/ingress-gce --platform linux/arm64,linux/amd64 --load .

.PHONY: docker-login
docker-login:
	@gcloud auth activate-service-account --key-file .kube-secrets/gcr/gcr-readwrite.json
