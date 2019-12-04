class NewsController < ApplicationController
  # GET /news
  def index
    data = CryptoCompare::LatestNews.call.parsed_response["Data"]
    render json: data
  end
end
