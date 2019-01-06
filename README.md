# Summary
Fluentd Docker image

# Settings
- Log Directory: /var/log/fluent
- Default Configuration Directory: /etc/fluent
- Custom Configuration Files: /usr/local/etc/fluent/*.conf

# Example Configuration Files
- store in source code repository folder: `example`

- `fluent.conf`: run `fluentd --setup` to generate the default configuration file

- `forward.conf`: input forward, output file
  - `docker-compose.yml` setting:
  ```yml
  logging:
    driver: "fluentd"
    options:
      fluentd-address: "localhost:24224"
      fluentd-async-connect: "true"
      tag: docker.{{.Name}}
  ```

- `tail.file.conf`: input tail, output file
  - for the `fluentd` container `docker-compose.yml` setting:

  ```yml
  volumes:
    - /var/lib/docker/containers:/var/lib/docker/containers/
  ```

  - for other containers `docker-compose.yml` setting:

  ```yml
  logging:
    options:
      tag: docker.{{.Name}}
  ```

- `tail.elasticsearch.conf`: input tail, output elasticsearch
  - for the `fluentd` container `docker-compose.yml` setting:

  ```yml
  volumes:
    - /var/lib/docker/containers:/var/lib/docker/containers/
  ```

  - for other containers `docker-compose.yml` setting:

  ```yml
  logging:
    options:
      tag: docker.{{.Name}}
  ```
