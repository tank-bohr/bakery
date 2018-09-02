# frozen_string_literal: true

module Bakery
  class Order
    attr_reader :count, :code

    def initialize(count:, code:)
      @count = count
      @code = code
      freeze
    end
  end
end
