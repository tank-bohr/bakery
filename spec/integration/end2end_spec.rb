# frozen_string_literal: true

require 'bakery'

RSpec.describe 'End to end' do
  let(:db) { Bakery::DB.from_yaml('db/products.yml') }

  let(:bakery) { Bakery::Bakery.new(db) }

  let(:input) do
    [
      '10 VS5',
      '14 MB11',
      '13 CF'
    ]
  end

  let(:output) do
    <<~OUTPUT
      10 VS5 $17.98
      \t2 x 5 $8.99
      14 MB11 $54.80
      \t1 x 8 $24.95
      \t3 x 2 $9.95
      13 CF $25.85
      \t2 x 5 $9.95
      \t1 x 3 $5.95
    OUTPUT
  end

  it 'parses input and formats result' do
    results = input
      .map(&Bakery::Format.method(:parse))
      .map(&bakery.method(:handle))

    expect(results.reduce('') { |acc, result| acc + result.to_s }).to eq(output)
  end
end
