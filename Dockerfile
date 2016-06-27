FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV ERLANG_VERSION 1.0

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update; \
 apt-get install -y --no-install-recommends \
 curl \
 ca-certificates \
 build-essential; \
 \
 curl -O https://packages.erlang-solutions.com/erlang-solutions_${ERLANG_VERSION}_all.deb; \
 \
 dpkg -i erlang-solutions_${ERLANG_VERSION}_all.deb; \
 apt-get update; \
 apt-get install -y --no-install-recommends \
 esl-erlang \
 elixir \
 git \
 postgresql-client \
 phantomjs; \
 \
 rm -rf /var/lib/apt/lists/*;

CMD ["/bin/sh"]
