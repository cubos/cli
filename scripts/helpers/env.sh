#!/bin/bash

# Log an environment variable to the console
#
# arg: $1 description of the environment variable
# arg: $2 value of the environment variable
log_env() {
  name="${1}"
  value="${2}"

  if [ -z "${value}" ]; then
    value="(undefined)"
  fi

  echo -e "${C_BOLD}${C_CYAN}${name}: ${C_RESET}${value}"
}

# Print error message to the console and exit the script
#
# arg: $* error message
throw() {
  message="$*"

  log_e "$message" >&2
  exit 1
}

# Check if a command is available and throw if not
#
# arg: $1 command name
needs_command() {
  command="${1}"

  if ! [ -x "$(command -v "${command}")" ]; then
    throw "${command} is not installed"
  fi
}

# Check if an environment is set and not empty and throw if not
#
# arg: $1 environment variable name
needs_env() {
  name="${1}"

  if [ -z "${!name}" ]; then
    throw "Environment variable ${name} is not set"
  fi
}
