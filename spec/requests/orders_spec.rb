require 'rails_helper'

RSpec.describe "Orders", type: :request do
  # let(:user) { create(:user) }
  #
  # # before do
  # #   sign_in(user)
  # #   request.headers.merge!(user.create_new_auth_token)
  # # end

  describe "GET /orders" do
    xit "works! (now write some real specs)" do
      get orders_path
      expect(response).to have_http_status(200)
    end
  end
end
