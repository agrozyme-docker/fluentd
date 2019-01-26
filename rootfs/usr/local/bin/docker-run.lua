#!/usr/bin/lua
local core = require("docker-core")

local function main()
  core.update_user()
  core.clear_path("/run/apache2")
  core.chown("/var/log/fluent")
  core.run("fluentd")
end

main()
