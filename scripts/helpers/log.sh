#!/usr/bash
set -e

color() { printf "\033[%sm" "$*"; }

# Color https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#256-colors

C_RESET=$(color 0)
C_DEFAULT=$(color 39)

C_BOLD='\033[1m'
C_ITALIC='\033[3m'
C_UNDERLINE='\033[4m'

C_BLACK=$(color 30)
C_RED=$(color 31)
C_GREEN=$(color 32)
C_YELLOW=$(color 33)
C_BLUE=$(color 34)
C_MAGENTA=$(color 35)
C_CYAN=$(color 36)
C_LIGHT_GRAY=$(color 37)
C_DARK_GRAY=$(color 90)
C_LIGHT_RED=$(color 91)
C_LIGHT_GREEN=$(color 92)
C_LIGHT_YELLOW=$(color 93)
C_LIGHT_BLUE=$(color 94)
C_LIGHT_MAGENTA=$(color 95)
C_LIGHT_CYAN=$(color 96)
C_WHITE=$(color 97)

C_GOOGLE_CLOUD=$(color "38;2;66;133;244")
C_FIREBASE=$(color "38;5;220")

# Print ERROR message to the console
#
# arg: $* message
log_e() {
  echo -e "${C_BOLD}${C_RED}⛔  $*${C_RESET}"
}

# Print INFO message to the console
#
# arg: $* message
log_i() {
  echo -e "${C_BOLD}${C_LIGHT_CYAN}ℹ  $*${C_RESET}"
}

# Print WARNING message to the console
#
# arg: $* message
log_w() {
  echo -e "${C_BOLD}${C_YELLOW}⚠  $*${C_RESET}"
}

# Print DEBUG message to the console
#
# arg: $* message
log_d() {
  echo -e "${C_BOLD}${C_BLUE}🔍  $*${C_RESET}"
}

# Print VERBOSE message to the console
#
# arg: $* message
log_v() {
  echo -e "${C_BOLD}${C_LIGHT_GRAY}➡️  $*${C_RESET}"
}
