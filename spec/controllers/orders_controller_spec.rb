require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:coin) { create(:coin) }

  let(:valid_attributes) do
    {
      process: 'buy',
      coin_id: coin.id,
      amount: 5,
      price: 1.20,
      price_currency: 'gbp',
      exchange: 'coinbase'
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
      order = create(:order, user: user)

      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      order = create(:order, user: user)
      get :show, params: {id: order.to_param}

      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, params: {order: valid_attributes}
        }.to change(user.orders, :count).by(1)
      end

      it "renders a JSON response with the new order" do
        post :create, params: {order: valid_attributes}

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(order_url(user.orders.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new order" do
        post :create, params: {order: invalid_attributes}

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { exchange: 'new_exchange' }
      }

      it "updates the requested order" do
        order = create(:order, user: user)
        put :update, params: {id: order.to_param, order: new_attributes}

        order.reload
        expect(order.exchange).to eq('new_exchange')
      end

      it "renders a JSON response with the order" do
        order = create(:order, user: user)
        put :update, params: {id: order.to_param, order: valid_attributes}

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the order" do
        order = create(:order, user: user)
        put :update, params: {id: order.to_param, order: invalid_attributes}

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order = create(:order, user: user)
      expect {
        delete :destroy, params: {id: order.to_param}
      }.to change(user.orders, :count).by(-1)
    end
  end

end
