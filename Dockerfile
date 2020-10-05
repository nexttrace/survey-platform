# Inspired by https://github.com/ledermann/docker-rails-base
FROM gcr.io/dynamic-return-274121/nexttrace-base:latest AS base
FROM ruby:2.7.2-alpine

# Add user
RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app

RUN apk add --update --no-cache \
      postgresql-client \
      tzdata \
      file \
      libc6-compat

# Configure Rails
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

WORKDIR /app

# Write GIT commit SHA and TIME to env vars
ARG COMMIT_SHA
ARG COMMIT_TIME

ENV COMMIT_SHA ${COMMIT_SHA}
ENV COMMIT_TIME ${COMMIT_TIME}

# Copy app with gems from former build stage
COPY --from=base --chown=app:app /usr/local/bundle/ /usr/local/bundle/
COPY --from=base --chown=app:app /app /app

USER app

# Create missing directories because .dockerignore excludes are broken
# https://github.com/moby/moby/issues/30018
RUN mkdir -p /app/log /app/tmp/cache /app/tmp/pids /app/tmp/sockets /app/tmp/storage

CMD ["bin/cloud-run-server"]
