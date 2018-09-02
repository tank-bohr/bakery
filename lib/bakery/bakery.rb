# frozen_string_literal: true

module Bakery
  class Bakery
    attr_reader :db

    def initialize(db)
      @db = db
      freeze
    end

    def handle(order, allocatable = ::Bakery)
      item = db.find(order.code)
      list = allocatable.allocate(order.count, item.packs)

      Format::Result.new(order, list)
    end
  end
end
