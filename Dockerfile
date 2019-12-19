# Base image
FROM ruby:2.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs git

# Create and set working directory
RUN mkdir /app
WORKDIR /app

# Copy gemfile and install gems
COPY Gemfile* ./

RUN gem update --system && \
gem update bundler && \
bundle install --jobs 4 --retry 5

# Copy application code
RUN git init --bare
COPY . .

EXPOSE 3000

# Run the app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
