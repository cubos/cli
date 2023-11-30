#!/bin/bash
set -e

# Check if the script is running in GitLab CI
#
# returns: true if the script is running in GitLab CI, false otherwise
is_in_gitlab_ci() {
  if [ "${GITLAB_CI}" == "true" ]; then
    true
  else
    false
  fi
}

# Print GitLab CI section start
#
# arg: $1 section ID
# arg: $2 section label
# arg: $3 collapsed (optional, default: false)
gitlab_ci_section_start() {
  id="$1"
  label="$2"
  collapsed="${3:-false}"

  if is_in_gitlab_ci; then
    if [ "${collapsed}" == "true" ]; then
      collapsed="collapsed=true"
    else
      collapsed="collapsed=false"
    fi

    echo -e "\033[0Ksection_start:$(date +%s):${id}[${collapsed}]\r\033[0K${C_BLUE}${C_BOLD}${label}${C_RESET}"
  fi
}

# Print GitLab CI section end
#
# arg: $1 section ID
gitlab_ci_section_end() {
  id="$1"

  if is_in_gitlab_ci; then
    echo -e "\033[0Ksection_end:$(date +%s):${1}\r\033[0K"
  fi
}
