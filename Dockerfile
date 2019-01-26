FROM agrozyme/ruby:2.5
COPY rootfs /
RUN set +e -uxo pipefail && chmod +x /usr/local/bin/* && /usr/local/bin/docker-build.lua
EXPOSE 24224 5140
CMD ["/usr/local/bin/docker-run.lua"]
