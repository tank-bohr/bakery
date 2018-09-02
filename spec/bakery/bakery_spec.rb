# frozen_string_literal: true

require 'bakery'

RSpec.describe Bakery::Bakery do
  describe '#handle' do
    let(:db) { double('Bakery::DB') }
    let(:order) { double('Bakery::Order', code: code, count: count) }
    let(:item) { double('Bakery::Item', packs: packs) }
    let(:code) { 'BB' }
    let(:count) { 10 }
    let(:packs) { double }
    let(:result_list) { [1, 2, 3] }
    let(:allocatable) { double }

    subject(:bakery) { described_class.new(db) }

    before do
      allow(db).to receive(:find).with(code).and_return(item)
      allow(allocatable).to receive(:allocate)
        .with(count, packs).and_return(result_list)
    end

    it 'finds an item and allocates the order' do
      result = bakery.handle(order, allocatable)
      expect(db).to have_received(:find)
      expect(allocatable).to have_received(:allocate)
      expect(result.list).to eq(result_list)
    end
  end
end
