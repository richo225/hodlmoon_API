module Types
  class Url < Types::BaseScalar
    def self.coerce_input(input_value, _context)
      url = URI.parse(input_value)
      raise GraphQL::CoercionError, "#{input_value.inspect} is not a valid URL" unless valid_url(url)

      url
    end

    def self.coerce_result(ruby_value, _context)
      ruby_value.to_s
    end

    private

    def valid_url(url)
      url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
    end
  end
end
