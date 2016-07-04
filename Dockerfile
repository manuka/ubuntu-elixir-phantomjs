FROM manuka/ubuntu-elixir

ENV PHANTOMJS_VERSION 2.1.1

RUN apt-get update; \
  apt-get install -y --no-install-recommends \
  fontconfig; \
  \
  curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 | tar -jxf - --strip-components=2 -C /usr/local/bin/ phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/; \
  \
  rm -rf /var/lib/apt/lists/*;

CMD ["/bin/sh"]
