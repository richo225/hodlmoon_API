# Base image
FROM ruby:2.7.0

ENV BUNDLER_VERSION=2.3.24

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends

RUN gem install bundler -v 2.3.24

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install
COPY . ./

# Start the main process.
EXPOSE $PORT
CMD ["rails", "server", "-b", "0.0.0.0"]
