FROM alpine:3.20 AS build

ARG APP_NAME=hello

WORKDIR /build

COPY build/distributions/${APP_NAME}-*.tar .
COPY gradle.properties .
RUN mkdir app \
    && APP_VERSION=$(sed -n 's/^version=//p' gradle.properties) \
    && tar xvf ${APP_NAME}-$APP_VERSION.tar --strip-components 1 -C app


FROM eclipse-temurin:21-alpine

WORKDIR /app

COPY --from=build /build/app .
ENV PATH="/app/bin:${PATH}"

ENTRYPOINT ["hello"]
