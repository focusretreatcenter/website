#!/usr/bin/env bash

# Please Use Google Shell Style: https://google.github.io/styleguide/shell.xml

# ---- Start unofficial bash strict mode boilerplate
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit  # always exit on error
set -o errtrace # trap errors in functions as well
set -o pipefail # don't ignore exit codes when piping output
set -o posix    # more strict failures in subshells
# set -x          # enable debugging

IFS="$(printf "\n\t")"
# ---- End unofficial bash strict mode boilerplate

slug() {

  # lowercase
  # spaces to dashes
  # collapse double dashes
  # Delete everything other than letters, numbers, dash
  # remove trailing dash
  echo "$@" |
    tr '[:upper:]' '[:lower:]' |
    sed -e 's/\s/-/g' -e 's/--/-/g' |
    tr -c -d "a-z0-9-" |
    sed -e 's/-$//'
}

cd "$(dirname "${BASH_SOURCE[0]}")/.."

dest_dir="content/blog"
mkdir -p "${dest_dir}"

# read -r -p "Title: " title
name=$(slug "$@")

publish_date=$(date -u +%Y-%m-%d)
prefix=$(echo "${publish_date}" | tr -d -)

dest_path="${dest_dir}/${prefix}-${name}/index.md"
mkdir -p "$(dirname "${dest_path}")"
cat <<EOF >"${dest_path}"
+++
title = "$@"
slug = "/${name}"
date = ${publish_date}
description = ""
[extra]
author = "Pete Lyons"
image = ""
+++
EOF
"${EDITOR}" "${dest_path}"
