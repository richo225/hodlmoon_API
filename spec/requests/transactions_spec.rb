require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  # let(:user) { create(:user) }
  #
  # # before do
  # #   sign_in(user)
  # #   request.headers.merge!(user.create_new_auth_token)
  # # end

  describe "GET /transactions" do
    xit "works! (now write some real specs)" do
      get transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
