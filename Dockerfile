FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
ENV ERLANG_VERSION 1.0

RUN apt-get update; \
 apt-get install -y --no-install-recommends curl ca-certificates; \
 \
 curl -O https://packages.erlang-solutions.com/erlang-solutions_${ERLANG_VERSION}_all.deb; \
 \
 dpkg -i erlang-solutions_${ERLANG_VERSION}_all.deb; \
 apt-get update; \
 apt-get install -y --no-install-recommends \
 git \
 esl-erlang \
 elixir \
 postgresql-client \
 phantomjs; \
 \
 rm -rf /var/lib/apt/lists/*;

RUN mix local.hex --force; \
    mix local.rebar --force

WORKDIR /app

COPY . /app
CMD ["/bin/sh"]
