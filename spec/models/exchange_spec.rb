require 'rails_helper'

RSpec.describe Exchange, type: :model do
  it 'is valid with valid_attributes' do
    exchange = build(:exchange)
    expect(exchange).to be_valid
  end

  it 'is invalid without a process' do
    exchange = build(:exchange, name: nil)
    expect(exchange).to_not be_valid
  end
end
