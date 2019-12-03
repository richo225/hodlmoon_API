class MarketDataController < ApplicationController
  # GET /market_data
  def index
    data = CoinMarketCap::RetrieveMarketData.call.parsed_response['data']
    render json: data
  end
end
