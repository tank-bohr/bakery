# frozen_string_literal: true

require 'bakery'

RSpec.describe Bakery do
  describe '::allocate' do
    shared_examples 'allocatable' do |count, quantities, result|
      subject { described_class.allocate(count, packs).map(&:quantity) }

      let(:packs) do
        quantities.map { |quantity| double(quantity: quantity) }
      end

      it { is_expected.to contain_exactly(*result) }
    end

    it_behaves_like 'allocatable', 10, [3, 5], [5, 5]
    it_behaves_like 'allocatable', 14, [2, 5, 8], [8, 2, 2, 2]
    it_behaves_like 'allocatable', 13, [3, 5, 9], [5, 5, 3]
    it_behaves_like 'allocatable', 11, [5, 7], []
  end
end
