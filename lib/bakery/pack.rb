# frozen_string_literal: true

module Bakery
  class Pack
    attr_reader :quantity, :price

    def initialize(quantity:, price:)
      @quantity = quantity
      @price = price
      freeze
    end
  end
end
