class HoldingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_holding, only: [:show]

  def index
    @holdings = current_user.holdings.order(:total_price_cents)
    render json: HoldingSerializer.new(@holdings).serialized_json
  end

  def show
    render json: HoldingSerializer.new(@holding).serialized_json
  end

  private

  def set_holding
    @holding = current_user.holdings.find(params[:id])
  end
end
