source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activerecord-import', '~> 1.0'
gem 'devise_token_auth'
gem 'dotenv-rails'
gem 'fast_jsonapi'
gem 'graphql'
gem 'httparty', '~> 0.16.2'
gem 'mini_magick'
gem 'money-rails', '~> 1.14.0'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'pg', '~> 1.2'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'rails', '~> 6.0'
gem 'whenever'

group :production do
  gem "aws-sdk-s3", require: false
  gem 'dalli'
end

group :development, :test do
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.9.1'
  gem 'pry'
  gem 'pry-byebug'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 5.0.1'
  gem 'vcr'
  gem 'webmock', '~> 3.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
