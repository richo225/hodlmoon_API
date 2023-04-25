source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activerecord-import', '~> 1.0.4'
gem 'devise_token_auth'
gem 'dotenv-rails'
gem 'fast_jsonapi'
gem 'graphql'
gem 'httparty', '~> 0.17.3'
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'
gem 'mini_magick'
gem 'money-rails', '~> 1.13.3'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'pg', '~> 1.2'
gem 'puma', '~> 4.3'
gem 'rack-cors'
gem 'rails', '~> 5.2'
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
  gem 'faker', '~> 2.10.1'
  gem 'pry'
  gem 'pry-byebug'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.2.1'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 3.9.0'
  gem 'vcr'
  gem 'webmock', '~> 3.8'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
