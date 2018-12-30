# Summary
Fluentd Docker image

# Settings
- Log Directory: /var/log/fluent
- Default Configuration Directory: /etc/fluent
- Custom Configuration Files: /usr/local/etc/fluent/*.conf

# Example Configuration Files
- store in source code repository folder: `example`
- `fluent.conf`: run `fluentd --setup` to generate the default configuration file
- `forward.conf`: input forward with tag `docker.*`
- `tail.conf`: input tail with docker log json-file
