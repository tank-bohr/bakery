# frozen_string_literal: true

require 'bakery/pack'
require 'bakery/order'
require 'bakery/format'

RSpec.describe Bakery::Format::Result do
  let(:order) { Bakery::Order.new(code: code, count: count) }

  let(:code) { 'MB11' }
  let(:count) { 14 }

  let(:list) do
    [
      Bakery::Pack.new(quantity: 8, price: 24_95),
      Bakery::Pack.new(quantity: 2, price: 9_95),
      Bakery::Pack.new(quantity: 2, price: 9_95),
      Bakery::Pack.new(quantity: 2, price: 9_95)
    ]
  end

  describe '#display_list' do
    subject { described_class.new(order, list).display_list }

    context 'when order is possible' do
      it { is_expected.to eq("\t1 x 8 $24.95\n\t3 x 2 $9.95\n") }
    end

    context 'when order is impossible' do
      let(:list) { [] }

      it { is_expected.to eq("Impossible\n") }
    end
  end

  describe '#display_total' do
    subject { described_class.new(order, list).display_total }

    it { is_expected.to eq("14 MB11 $54.80\n") }
  end
end
