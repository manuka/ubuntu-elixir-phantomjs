FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV ERLANG_REPO_PKG_VERSION 1.0
ENV ERLANG_PKG_VERSION 1:18.3.4

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
 build-essential; \
 \
 curl -O https://packages.erlang-solutions.com/erlang-solutions_${ERLANG_REPO_PKG_VERSION}_all.deb; \
 \
 dpkg -i erlang-solutions_${ERLANG_REPO_PKG_VERSION}_all.deb; \
 apt-get update; \
 apt-get install -y --no-install-recommends \
 esl-erlang=${ERLANG_PKG_VERSION} \
 elixir \
 postgresql-client \
 phantomjs; \
 \
 rm -rf /var/lib/apt/lists/*;

CMD ["/bin/sh"]
