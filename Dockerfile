FROM agrozyme/ruby:2.5
COPY source /

RUN set -euxo pipefail \
  && chmod +x /usr/local/bin/*.sh \
  && apk add --no-cache --virtual .build-dependencies build-base ruby-dev gnupg \
  && gem install fluentd -v 1.3.2 --no-document --no-ri --no-rdoc \
  && gem install oj json bigdecimal fluent-plugin-forest fluent-plugin-rewrite-tag-filter --no-document --no-ri --no-rdoc \
  && apk del .build-dependencies \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem \
  && mkdir -p /var/log/fluent /usr/local/etc/fluent \
  && fluentd --dry-run

EXPOSE 24224 5140
CMD ["agrozyme.fluentd.command.sh"]
