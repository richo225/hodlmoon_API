class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show]

  # GET /exchanges
  def index
    @exchanges = Exchange.all
    render json: ExchangeSerializer.new(@exchanges).serialized_json
  end

  # GET /exchanges/1
  def show
    render json: ExchangeSerializer.new(@exchange).serialized_json
  end

  private

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end
