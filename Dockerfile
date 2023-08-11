FROM ruby:3.2.2-alpine3.18

RUN apk update && apk upgrade && apk add --no-cache \
    bash \
    build-base \
    nodejs \
    libpq-dev \
    postgresql-client \
    tzdata \
    gcompat \
    && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app

COPY . .

RUN gem update --system \
    && gem install bundler \
    && bundle install
