require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  let(:user) { create(:user) }
  let!(:holding) { create_list(:holding, 3, user: user) }
  let!(:portfolio) { create(:portfolio, user: user) }

  before do
    sign_in(user)
    request.headers.merge!(user.create_new_auth_token)
  end

  describe "GET #show", :vcr do
    it "returns a success response" do
      get :show, params: {}
      expect(response).to be_successful
    end
  end
end
