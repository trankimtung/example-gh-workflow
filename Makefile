APP_NAME = "hello"
APP_VERSION = $(shell sed -n 's/^version=//p' gradle.properties)
IMAGE_TAG = ${APP_NAME}:${APP_VERSION}

build_app:
	./gradlew clean build -Pversion=${APP_VERSION}

build_container_image:
	docker build -t ${IMAGE_TAG} --build-arg APP_VERSION=${APP_VERSION} .

build: build_app build_container_image
