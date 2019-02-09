# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:portfolio) { create(:portfolio, user: user) }
  let(:coin) { create(:coin) }

  let(:valid_attributes) {
    {
      process: 'buy',
      coin_id: coin.id,
      amount: 5,
      price: 1.20,
      price_currency: 'gbp',
      exchange: 'coinbase',
      portfolio_id: portfolio.id
    }
  }
  let(:invalid_attributes) do
    {
      amount: 5,
      price: 1.20
    }
  end

  before { sign_in(user) }

  describe 'GET #index' do
    it 'returns a success response' do
      create(:order, portfolio: portfolio)
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      order = create(:order, portfolio: portfolio)
      get :show, params: { id: order.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      order = create(:order, portfolio: portfolio)
      get :edit, params: { id: order.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Order' do
        expect do
          post :create, params: { order: valid_attributes }
        end.to change(Order, :count).by(1)
      end

      it 'redirects to the created order' do
        post :create, params: { order: valid_attributes }
        expect(response).to redirect_to(Order.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { order: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested order' do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: new_attributes }
        order.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the order' do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: valid_attributes }
        expect(response).to redirect_to(order)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested order' do
      order = Order.create! valid_attributes
      expect do
        delete :destroy, params: { id: order.to_param }
      end.to change(Order, :count).by(-1)
    end

    it 'redirects to the orders list' do
      order = Order.create! valid_attributes
      delete :destroy, params: { id: order.to_param }
      expect(response).to redirect_to(orders_url)
    end
  end
end
