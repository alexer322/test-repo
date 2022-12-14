SHELL := /bin/bash

DOCKER_IMAGE ?= ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}
DOCKER_IMAGE_NAME ?= py1
DOCKER_IMAGE_TAG ?= v1

.PHONY: all_deploy docker_build docker_run docker_stop docker_rm docker_images docker_ps delete whatch 

all_deploy: \
docker_build \
docker_run

delete: \
docker_stop \
docker_rm

whatch: \
docker_ps \
docker_images

docker_build:
	docker build \
	-t \
	${DOCKER_IMAGE} \
	.

docker_run:
	docker run \
	-d \
	-p 80:80 \
	${DOCKER_IMAGE}

docker_stop:
	docker stop $$(docker ps -q --filter ancestor=${DOCKER_IMAGE})

docker_rm:
	docker rmi --force $$(docker images -q ${DOCKER_IMAGE} | uniq)

docker_ps:
	docker ps

docker_images:
	docker images
