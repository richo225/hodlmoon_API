require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe "GET /transactions" do
    it "is successful" do
      get transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
