require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:valid_attributes) do
    {
      coin: "Ethereum",
      amount: 89,
      currency: "gbp",
      exchange: "Coinbase"
    }
  end

  let(:invalid_attributes) { { amount: 0 } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TransactionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      Transaction.create!(valid_attributes)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      transaction = Transaction.create!(valid_attributes)
      get :show, params: { id: transaction.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Transaction' do
        expect do
          post :create, params: { transaction: valid_attributes }, session: valid_session
        end.to change(Transaction, :count).by(1)
      end

      it 'renders a JSON response with the new transaction' do
        post :create, params: { transaction: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(transaction_url(Transaction.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new transaction' do
        post :create, params: { transaction: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { amount: 3 } }

      it 'updates the requested transaction' do
        transaction = Transaction.create!(valid_attributes)
        put :update, params: { id: transaction.to_param, transaction: new_attributes }, session: valid_session
        transaction.reload
        expect(transaction.amount).to eq(3)
      end

      it 'renders a JSON response with the transaction' do
        transaction = Transaction.create!(valid_attributes)

        put :update, params: { id: transaction.to_param, transaction: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the transaction' do
        transaction = Transaction.create!(valid_attributes)

        put :update, params: { id: transaction.to_param, transaction: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested transaction' do
      transaction = Transaction.create!(valid_attributes)
      expect do
        delete :destroy, params: { id: transaction.to_param }, session: valid_session
      end.to change(Transaction, :count).by(-1)
    end
  end
end
