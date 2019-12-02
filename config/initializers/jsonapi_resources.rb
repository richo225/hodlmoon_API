JSONAPI.configure do |config|
  # Resource cache
  # An ActiveSupport::Cache::Store or similar, used by Resources with caching enabled.
  # Set to `nil` (the default) to disable caching, or to `Rails.cache` to use the
  # Rails cache store.
  config.resource_cache = Rails.cache

  #:underscored_route, :camelized_route, :dasherized_route, or custom
  config.json_key_format = :underscored_key

  # :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged

  config.default_page_size = 20 # default is 10
  config.maximum_page_size = 40 # default is 20
end
