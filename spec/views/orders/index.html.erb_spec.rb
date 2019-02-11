# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'orders/index', type: :view do
  before(:each) do
    assign(:orders, create_list(:order, 2))
  end

  it 'renders a list of orders' do
    render
  end
end
