#!/bin/bash
set -euo pipefail

function change_core() {
  local old_uid=500
  local old_gid=500
  local new_uid=${DOCKER_UID:-${old_uid}}
  local new_gid=${DOCKER_GID:-${old_gid}}
  groupmod -g "${new_gid}" core
  usermod -u "${new_uid}" core
}

function main() {
  change_core
  # agrozyme.alpine.function.sh change_core
  chown -R core:core /var/log/fluent
  exec fluentd --user core --group core
}

main "$@"
