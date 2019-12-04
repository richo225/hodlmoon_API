class CoinsController < ApplicationController
  before_action :set_coin, only: [:show]

  # GET /coins
  def index
    @coins = Coin.order(:cmc_rank)
    render json: CoinSerializer.new(@coins).serialized_json
  end

  # GET /coins/1
  def show
    render json: CoinSerializer.new(@coin).serialized_json
  end

  private

  def set_coin
    @coin = Coin.find(params[:id])
  end
end
