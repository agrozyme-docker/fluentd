FROM agrozyme/ruby:2.5
COPY source /

RUN set -euxo pipefail \
  && chmod +x /usr/local/bin/*.sh \
  && apk add --no-cache build-base ruby-dev \
  && gem install oj -v 3.3.10 --no-document --no-ri --no-rdoc \
  && gem install fluentd -v 1.2.4 --no-document --no-ri --no-rdoc \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem \
  && mkdir -p /etc/fluent/plugin /var/log/fluent /usr/local/etc/fluent

EXPOSE 24224 5140
CMD ["agrozyme.fluentd.command.sh"]