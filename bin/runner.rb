# frozen_string_literal: true

require 'bakery'

db = Bakery::DB.from_yaml('db/products.yml')
bakery = Bakery::Bakery.new(db)

until STDIN.eof?
  line = gets.chomp
  order = Bakery::Format.parse(line)
  bakery.handle(order).display
end
