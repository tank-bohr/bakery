# frozen_string_literal: true

require 'bakery/format'

RSpec.describe Bakery::Format do
  describe '::parse' do
    it 'returns an order' do
      order = described_class.parse('10 VS5')
      expect(order.count).to eq(10)
      expect(order.code).to eq('VS5')
    end
  end
end
