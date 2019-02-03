# Base image
FROM ruby:2.3.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Create and set working directory
RUN mkdir /app
WORKDIR /app

# Copy gemfile and install gems
COPY Gemfile* ./
RUN bundle install

# Copy application code
COPY . .

EXPOSE 3000

# Run the app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
