#!/bin/bash
set -euo pipefail

function main() {
  # agrozyme.alpine.function.sh change_core
  chown -R core:core /var/log/fluent
  exec fluentd --user core --group core
}

main "$@"
