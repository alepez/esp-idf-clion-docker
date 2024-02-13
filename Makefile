MANTAINER=alepez
IMAGE_NAME=esp-idf-clion
ESP_VERSION=4.4.6
VERSION=${ESP_VERSION}.3
TAG=${MANTAINER}/${IMAGE_NAME}:${VERSION}

.PHONY: build
build:
	docker build -f Dockerfile -t ${TAG} --build-arg ALEPEZ_ESP_IDF_DOCKER_VERSION=${VERSION} .

.PHONY: publish
publish: build
	docker push ${TAG}
