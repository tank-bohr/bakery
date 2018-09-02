# frozen_string_literal: true

require 'bakery/format/price'

RSpec.describe Bakery::Format::Price do
  describe '#to_s' do
    subject(:price) { described_class.new(16_99) }

    it 'formats price' do
      expect(price.to_s).to eq '$16.99'
    end
  end
end
