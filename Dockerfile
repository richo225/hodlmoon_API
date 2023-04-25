# Base image
FROM ruby:2.7.0
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends

WORKDIR /app
COPY Gemfile* /app/
ENV BUNDLE_PATH /bundler_gems
RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
