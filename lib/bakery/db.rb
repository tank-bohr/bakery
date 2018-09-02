# frozen_string_literal: true

require 'yaml'

module Bakery
  class DB
    attr_reader :items

    def self.from_yaml(path) # rubocop:disable Metrics/MethodLength
      yaml = File.read(path)
      data = YAML.safe_load(yaml)
      items = data.map do |item_data|
        Item.new(
          name: item_data['name'],
          code: item_data['code'],
          packs: item_data['packs'].map do |pack_data|
            Pack.new(
              quantity: pack_data['quantity'],
              price: pack_data['price']
            )
          end
        )
      end

      new(items: items)
    end

    def initialize(items:)
      @items = items.freeze
      freeze
    end

    def find(code)
      items.find { |item| item.code == code }
    end
  end
end
