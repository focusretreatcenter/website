#!/usr/bin/env bash

# Please Use Google Shell Style: https://google.github.io/styleguide/shell.xml

# ---- Start unofficial bash strict mode boilerplate
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit  # always exit on error
set -o errtrace # trap errors in functions as well
set -o pipefail # don't ignore exit codes when piping output
set -o posix    # more strict failures in subshells
# set -x          # enable debugging

IFS=$'\n\t'
# ---- End unofficial bash strict mode boilerplate

install_zola() {
  zola_url="https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
  # install zola
  mkdir -p ./local/bin
  wget --quiet --output-document=- "${zola_url}" |
    tar --extract --gzip --file - --directory local/bin
  chmod 755 local/bin/zola
}

main() {
  cd "$(dirname "${BASH_SOURCE[0]}")/.."
  export PATH="${PWD}/local/bin:${PATH}"
  pwd
  if [[ -f .env ]]; then
    source ./.env
  fi
  if ! command -v zola &>/dev/null; then
    install_zola
  fi
  version=$(zola --version | cut -d " " -f 2 2>/dev/null || /bin/true)
  if [[ "${version}" != "${ZOLA_VERSION}" ]]; then
    install_zola
  fi
  zola build
}

main "$@"
