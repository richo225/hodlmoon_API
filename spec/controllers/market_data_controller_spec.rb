require 'rails_helper'

RSpec.describe MarketDataController, type: :controller do
  describe "GET #index", :vcr do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end
end
