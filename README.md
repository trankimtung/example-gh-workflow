# Introduction

This is a simple project to demonstrate a CI workflow using GitHub Action workflow.

# CI Workflow

The CI workflow is defined in the `.github/workflows/ci.yml` file.

It consists of the following stages:

- Build application
    - Build a simple Java application using Gradle
    - Run the application as an integration test
    - Save the application distribution packages as artifacts
- Build container image
    - Retrieve the application distribution packages from the previous stage
    - Build a Docker image
    - Run the Docker image as an integration test
    - Scan the Docker image for security vulnerabilities using Snyk

The CI workflow is triggered on every push to the `main` branch.
It can also be triggered manually by running the `Continuous Integration` workflow from the GitHub Actions tab.

# Building the application

The application and its container image can be built using the following command:

```shell
make build
```

To override the application version, override the `APP_VERSION` variable:

```shell
make build APP_VERSION=1.0.0
```

See `Makefile` for more details.

# Versioning

The application version is defined in the `gradle.properties` file.
This file must be kept updated with every new version release.
