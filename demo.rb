# frozen_string_literal: true
require_relative 'main_application'
require_relative 'libs'

cart = Engine.run()

Cart.total_price(cart)
puts "Cart price:#{cart.total_price}"
cart.remove_item(cart.items[0])
Cart.total_price(cart)
puts "Cart price:#{cart.total_price}"
cart.show_all_items
cart.save_to_file('new_json_file', :json)
cart.save_to_file('new_csv_file', :csv)
cart.delete_items
cart.show_all_items
Cart.total_price(cart)
puts "Cart price:#{cart.total_price}"