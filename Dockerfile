FROM agrozyme/ruby:2.5
COPY source /

RUN set -euxo pipefail \
  && chmod +x /usr/local/bin/*.sh \
  && apk add --no-cache build-base ruby-dev su-exec tini \
  && gem install fluentd -v 1.3.2 --no-document --no-ri --no-rdoc \
  && gem install oj json bigdecimal fluent-plugin-forest fluent-plugin-rewrite-tag-filter --no-document --no-ri --no-rdoc \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem \
  && mkdir -p /etc/fluent/plugin /var/log/fluent /usr/local/etc/fluent \
  && fluentd --dry-run

EXPOSE 24224 5140
ENTRYPOINT ["tini",  "--"]
CMD ["su-exec", "root", "agrozyme.fluentd.command.sh"]
