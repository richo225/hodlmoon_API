# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  def index
    @orders = current_user.orders
  end

  # GET /orders/1
  def show; end

  # GET /orders/new
  def new
    @order = current_user.orders.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  def create
    @order = current_user.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'order was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'order was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = current_user.orders.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(
      :process,
      :coin_id,
      :amount,
      :price,
      :price_currency,
      :exchange
    )
  end
end
