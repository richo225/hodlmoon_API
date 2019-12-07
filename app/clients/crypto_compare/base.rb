module CryptoCompare
  class Base
    def self.call
      new.call
    end

    def initialize; end

    def call
      raise NotImplementedError
    end

    private

    def uri
      raise NotImplementedError
    end

    def host
      ENV.fetch('CRYPTOCOMPARE_URL')
    end

    def headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'authorization': api_key
      }
    end

    def api_key
      "Apikey #{ENV.fetch('CRYPTOCOMPARE_API_KEY')}"
    end
  end
end
