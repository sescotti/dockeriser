#!/bin/bash

# Source https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
# These variables are useful to invoke the build script regardless of the terminal current directory
SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
PROJECT_ROOT="${SCRIPT_DIR}/../"

# Import helper functions
# shellcheck source=/_helpers.sh
. "${SCRIPT_DIR}/_helpers.sh"

function gradle_build { "${PROJECT_ROOT}"/gradlew build -x test -p "${PROJECT_ROOT}"; }
function docker_build { docker build -t "dockeriser:$(date +%Y%m%d_%H%M)" "${PROJECT_ROOT}";  }

verify_installs docker

log_info "Starting Gradle build"

if ! gradle_build ; then
  log_error "Gradle build failed. Please fix errors and try again"
  exit 2
fi

log_info "Starting Docker build"

if ! docker_build ; then
  log_error "Docker build failed. Please fix errors and try again"
  exit 2
fi

log_info "Build successful"
