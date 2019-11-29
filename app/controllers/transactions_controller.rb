class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = current_user.transactions

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def transaction_params
    params.require(:transaction).permit(
      :process,
      :coin_id,
      :amount,
      :price,
      :price_currency,
      :exchange
    )
  end
end