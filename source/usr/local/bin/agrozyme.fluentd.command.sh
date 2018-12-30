#!/bin/bash
set -euo pipefail

function create_core() {
  groupadd -rg 500 core
  useradd -Nr -u 500 -g core -s /bin/sh -c core core
}

function main() {
  # create_core
  id
  cat /etc/passwd
  agrozyme.alpine.function.sh change_core
  chown -R core:core /var/log/fluent
  exec fluentd --user core --group core
}

main "$@"
