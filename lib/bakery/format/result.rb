# frozen_string_literal: true

module Bakery
  module Format
    class Result
      attr_reader :order, :list

      def initialize(order, list)
        @order = order
        @list = list.freeze
        freeze
      end

      def to_s
        display_total + display_list
      end

      def display
        print to_s
      end

      def display_list
        if list.any?
          display_grouped_list
        else
          display_impossible
        end
      end

      def display_total
        "#{order.count} #{order.code} #{total}\n"
      end

      private

      def total
        Price.new(list.sum(&:price))
      end

      def display_grouped_list
        grouped.reduce('') do |acc, (n, pack)|
          acc + "\t#{n} x #{pack.quantity} #{Price.new(pack.price)}\n"
        end
      end

      def display_impossible
        "Impossible\n"
      end

      def grouped
        list
          .group_by(&:quantity)
          .map { |_, packs| [packs.count, packs.first] }
          .sort_by { |_, pack| -pack.quantity }
      end
    end
  end
end
