# frozen_string_literal: true

module Bakery
  class Item
    attr_reader :name, :code, :packs

    def initialize(name:, code:, packs:)
      @name = name
      @code = code
      @packs = packs
      freeze
    end
  end
end
