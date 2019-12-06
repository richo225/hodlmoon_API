require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { create(:user) }
  let(:coin) { create(:coin) }
  let(:exchange) { create(:exchange) }

  let(:valid_attributes) do
    {
      process: 'buy',
      coin_id: coin.id,
      amount: 5,
      price: 1.20,
      price_currency: 'gbp',
      exchange_id: exchange.id
    }
  end
  let(:invalid_attributes) do
    {
      process: 'invalid_process'
    }
  end

  before do
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end

  describe "GET #index" do
    it "returns a success response" do
      create(:transaction, user: user)

      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      transaction = create(:transaction, user: user)
      get :show, params: { id: transaction.to_param }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new transaction" do
        expect {
          post :create, params: { transaction: valid_attributes }
        }.to change(user.transactions, :count).by(1)
      end

      it "renders a JSON response with the new transaction" do
        post :create, params: { transaction: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(transaction_url(user.transactions.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new transaction" do
        post :create, params: { transaction: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_exchange) { create(:exchange) }
      let(:new_attributes) {
        { exchange_id: new_exchange.id }
      }

      it "updates the requested transaction" do
        transaction = create(:transaction, user: user)
        put :update, params: { id: transaction.to_param, transaction: new_attributes }

        transaction.reload
        expect(transaction.exchange).to eq(new_exchange)
      end

      it "renders a JSON response with the transaction" do
        transaction = create(:transaction, user: user)
        put :update, params: { id: transaction.to_param, transaction: valid_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the transaction" do
        transaction = create(:transaction, user: user)
        put :update, params: { id: transaction.to_param, transaction: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested transaction" do
      transaction = create(:transaction, user: user)
      expect {
        delete :destroy, params: { id: transaction.to_param }
      }.to change(user.transactions, :count).by(-1)
    end
  end
end
