FROM ruby:2.5.1-alpine
MAINTAINER Botond Orban <orbanbotond@gmail.com>

RUN apk add --no-cache build-base postgresql postgresql-dev libpq

WORKDIR /app
COPY . /app
RUN bundle install -j $(nproc)
COPY . /app

EXPOSE 2300
ENTRYPOINT ["bundle", "exec"]
