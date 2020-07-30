# Logging functions (with colours)
# Usage log_error "Log entry"
function log_error { echo -e "[\x1B[31mERROR\x1B[0m] $1"; }
function log_info  { echo -e "[\x1B[94mINFO\x1B[0m] $1"; }
function log_warn  { echo -e "[\x1B[93mWARN\x1B[0m] $1" ; }

# Verifies if program is installed locally
# Usage: verify_installs docker java kubectl
function verify_installs {

  log_info "Verifying prerequisites..."
  CAN_EXECUTE=true

  for var in "$@"; do

    if [ -z "$(command -v "$var")" ]; then
      log_error "Fatal error: $var not found. Please install it to run this script"
      CAN_EXECUTE=false
    fi

  done

  if ! $CAN_EXECUTE ; then
    log_error "Please first fix the errors above and try again"
    exit 1
  else
    log_info "All good"
  fi

}