FROM agrozyme/ruby:2.5
COPY source /

RUN set -euxo pipefail \
  && chmod +x /usr/local/bin/*.sh \
  && apk add --no-cache --virtual .build-dependencies build-base ruby-dev \
  && gem install --no-document --no-ri --no-rdoc fluentd -v 1.3.2 \
  && gem install --no-document --no-ri --no-rdoc oj json fluent-plugin-forest fluent-plugin-rewrite-tag-filter fluent-plugin-script fluent-plugin-influxdb fluent-plugin-elasticsearch \
  && apk del .build-dependencies \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem \
  && mkdir -p /var/log/fluent /usr/local/etc/fluent \
  && fluentd --dry-run

EXPOSE 24224 5140
CMD ["agrozyme.fluentd.command.sh"]
