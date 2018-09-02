# frozen_string_literal: true

require 'bakery/order'

module Bakery
  module Format
    def self.parse(str)
      count, code = str.split(/\s+/, 2)
      Order.new(count: count.to_i, code: code)
    end
  end
end

require 'bakery/format/price'
require 'bakery/format/result'
