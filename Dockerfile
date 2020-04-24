# Inspired by https://github.com/ledermann/docker-rails-base
FROM ruby:2.7.1-alpine AS builder

# Add basic packages
RUN apk add --update --no-cache \
      build-base \
      postgresql-dev \
      git \
      nodejs \
      yarn \
      tzdata \
      file

WORKDIR /app

# Install standard Node modules
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

# Install standard gems
COPY Gemfile* .ruby-version /app/
RUN bundle config --local frozen 1 && \
    bundle config --local build.sassc --disable-march-tune-native && \
    bundle install -j4 --retry 3

# Install Ruby gems (for production only)
COPY Gemfile* /app/
RUN bundle config --local without 'development test' && \
            bundle install -j4 --retry 3 && \
            # Remove unneeded gems
            bundle clean --force && \
            # Remove unneeded files from installed gems (cached *.gem, *.o, *.c)
            rm -rf /usr/local/bundle/cache/*.gem && \
            find /usr/local/bundle/gems/ -name "*.c" -delete && \
            find /usr/local/bundle/gems/ -name "*.o" -delete

# Copy the whole application folder into the image
COPY . /app

# Compile assets with Webpacker or Sprockets
RUN RAILS_ENV=production \
    SECRET_KEY_BASE=watermelonwatermelonwatermelonwatermelonwatermelon \
    ASSET_COMPILATION=true \
    bundle exec rails assets:precompile

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache vendor/bundle test spec

FROM ruby:2.7.1-alpine

# Add user
RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app

RUN apk add --update --no-cache \
      postgresql-client \
      tzdata \
      file

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
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /app /app

USER app

# Create missing directories because .dockerignore excludes are broken
# https://github.com/moby/moby/issues/30018
RUN mkdir -p /app/log /app/tmp/cache /app/tmp/pids /app/tmp/sockets /app/tmp/storage

CMD ["bin/puma", "-C", "config/puma.rb"]
