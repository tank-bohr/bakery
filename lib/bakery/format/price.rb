# frozen_string_literal: true

module Bakery
  module Format
    class Price
      CENTS_IN_DOLLARS = 100

      attr_reader :value

      def initialize(value)
        @value = value
        freeze
      end

      def to_s
        format('$%.2f', value.fdiv(CENTS_IN_DOLLARS))
      end
    end
  end
end
