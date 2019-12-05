require 'rails_helper'

RSpec.describe ExchangesController, type: :controller do
  let!(:exchange) { create(:exchange) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: exchange.to_param }

      expect(response).to be_successful
    end
  end
end
