#!/bin/bash

# Source https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
# These variables are useful to invoke the build script regardless of the terminal current directory
SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
PROJECT_ROOT="${SCRIPT_DIR}/../"

DOCKER_SERVER=us.gcr.io
PROJECT_ID=my-awesome-project
IMAGE_NAME=dockeriser
VERSION=$(date +%Y%m%d_%H%M)

# Import helper functions
# shellcheck source=/_helpers.sh
. "${SCRIPT_DIR}/_helpers.sh"

function gradle_build { "${PROJECT_ROOT}"/gradlew build -x test -p "${PROJECT_ROOT}"; }
function docker_build { docker build -t "$1" "${PROJECT_ROOT}";  }
function docker_push { docker push "$1";  }

verify_installs docker

log_info "Starting Gradle build"

if ! gradle_build ; then
  log_error "Gradle build failed. Please fix errors and try again"
  exit 2
fi

log_info "Starting Docker build"

IMAGE_URL="$DOCKER_SERVER/$PROJECT_ID/$IMAGE_NAME"
VERSION_TAG="$IMAGE_URL:$VERSION"
LATEST_TAG="$IMAGE_URL:latest"

# i.e.: TAG=us.gcr.io/my-awesome-project/dockeriser:20200714_2001

if ! docker_build "$VERSION_TAG" ; then
  log_error "Docker build failed. Please fix errors and try again"
  exit 2
fi

log_info "Docker build successful"

if ! docker_build "$VERSION_TAG" ; then
  log_error "Docker build failed. Please fix errors and try again"
  exit 2
fi

log_info "Pushing Docker image"

if ! docker_push "$VERSION_TAG" ; then
  log_error "Docker image push failed. Please fix errors and try again"
  exit 2
fi

log_info "Docker image pushed. Available on $VERSION_TAG"
