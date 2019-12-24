.PHONY: default
default: help;

STACK_SLUG := matchilling/imagemagick7-centos
STACK_VERSION := latest

help:                ## Show this help
	@echo '----------------------------------------------------------------------'
	@echo $(STACK_SLUG)
	@echo '----------------------------------------------------------------------'
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	@echo '----------------------------------------------------------------------'

build:               ## Build the container
	@docker build \
		--file Dockerfile \
		--tag "${STACK_SLUG}:${STACK_VERSION}" .

delete:
	@docker rmi "${STACK_SLUG}:${STACK_VERSION}"

release:             ## Push image to docker registry
	@docker push "${STACK_SLUG}:${STACK_VERSION}"
