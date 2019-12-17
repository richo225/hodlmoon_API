require 'rails_helper'

RSpec.describe HoldingsController, type: :controller do
  let(:user) { create(:user) }
  let!(:holding) { create(:holding, user: user) }

  before do
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end

  describe "GET #index", :vcr do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show", :vcr do
    it "returns a success response" do
      get :show, params: { id: holding.to_param }

      expect(response).to be_successful
    end
  end
end
