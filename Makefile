MANTAINER=alepez
IMAGE_NAME=esp-idf-clion
VERSION=4.3.1
TAG=${MANTAINER}/${IMAGE_NAME}:${VERSION}

.PHONY: build
build:
	docker build -f Dockerfile -t ${TAG} --build-arg ESP_IDF_VERSION=${VERSION} .

.PHONY: publish
publish: build
	docker push ${TAG}
