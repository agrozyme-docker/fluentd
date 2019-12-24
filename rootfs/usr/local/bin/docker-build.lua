#!/usr/bin/lua
local core = require("docker-core")

local function main()
  -- core.run("apk add --no-cache lua-rex-pcre")
  core.run("apk add --no-cache --virtual .build-dependencies build-base ruby-dev gnupg")
  core.run("gem install --no-document oj json bigdecimal fluentd")
  core.run(
    "gem install --no-document fluent-plugin-forest fluent-plugin-rewrite-tag-filter fluent-plugin-script fluent-plugin-influxdb fluent-plugin-elasticsearch"
  )
  -- core.run(
  --   "gem install --no-document $(gem list -r --no-versions ^fluent-plugin-* | grep -Ev '(-aerospike|-aerospike-cluster|-amplitude|-amq|-arango|-arrow|-azuretables|-better-timestamp|-better-timestamp-timekey|-cassandra)$' | sort)"
  -- )
  core.run("apk del .build-dependencies")
  core.run("rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem")
  core.run("mkdir -p /var/log/fluent /usr/local/etc/fluent")
  core.run("fluentd --dry-run")
end

main()
