class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio, only: [:show]

  def show
    render json: PortfolioSerializer.new(@portfolio).serialized_json
  end

  private

  def set_portfolio
    @portfolio = current_user.portfolio
  end
end
