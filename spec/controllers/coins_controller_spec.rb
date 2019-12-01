require 'rails_helper'

RSpec.describe CoinsController, type: :controller do
  let!(:coin) { create(:coin) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: coin.to_param }

      expect(response).to be_success
    end
  end
end
