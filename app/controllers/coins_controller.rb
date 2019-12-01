class CoinsController < ApplicationController
  before_action :set_coin, only: [:show]

  # GET /coins
  def index
    render json: Coin.all
  end

  # GET /coins/1
  def show
    render json: @coin
  end

  private

  def set_coin
    @coin = Coin.find(params[:id])
  end
end
