FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update; \
 apt-get install -y --no-install-recommends \
 curl \
 git \
 ca-certificates \
 build-essential;

ENV ERLANG_REPO_PKG_VERSION 1.0
ENV ERLANG_PKG_VERSION 1:18.3.4
ENV PHANTOMJS_VERSION 2.1.1

RUN curl -O https://packages.erlang-solutions.com/erlang-solutions_${ERLANG_REPO_PKG_VERSION}_all.deb; \
 \
 dpkg -i erlang-solutions_${ERLANG_REPO_PKG_VERSION}_all.deb; \
 apt-get update; \
 apt-get install -y --no-install-recommends \
 esl-erlang=${ERLANG_PKG_VERSION} \
 elixir \
 postgresql-client \
 fontconfig; \
 \
 curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 | tar -jxf - --strip-components=2 -C /usr/local/bin/ phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/; \
 \
 rm -rf /var/lib/apt/lists/*;

CMD ["/bin/sh"]
