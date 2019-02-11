require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = create(:order)
  end

  it "renders attributes in <p>" do
    render
  end
end
