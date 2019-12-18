# frozen_string_literal: true

module CryptoCompare
  class LatestNews < Base
    def call
      HTTParty.get(uri, headers: headers)
    end

    private

    def uri
      "#{host}/data/v2/news/?lang=EN&sortOrder=popular&feeds=cointelegraph"
    end
  end
end
