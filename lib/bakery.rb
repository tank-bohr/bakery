# frozen_string_literal: true

module Bakery
  EMPTY_ARRAY = [].freeze

  def self.allocate(count, packs)
    solutions = packs
      .select { |pack| pack.quantity <= count }
      .map    { |pack| [pack] + allocate(count - pack.quantity, packs) }
      .select { |solution| solution.sum(&:quantity) == count }
    solutions.any? ? solutions.min_by(&:count) : EMPTY_ARRAY
  end
end

require 'bakery/db'
require 'bakery/item'
require 'bakery/pack'
require 'bakery/order'
require 'bakery/format'
require 'bakery/bakery'
