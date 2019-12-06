class ExchangeSerializer
  include FastJsonapi::ObjectSerializer

  cache_options enabled: true, cache_length: 7.days
  attributes :name
end
