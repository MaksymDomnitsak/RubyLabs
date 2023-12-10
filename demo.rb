# frozen_string_literal: true
require_relative 'main_application'
require_relative 'libs'

cart = Engine.run()

cart.show_all_items
Cart.total_price(cart)
puts "Cart price:#{cart.total_price}"
cart.each do |item|
  puts item[:product].price
end
puts "Порівняння двох товарів: "+(cart.items[20][:product] <=> cart.items[45][:product]).to_s
cart.remove_item(cart.items[0])
Cart.total_price(cart)
puts "Cart price:#{cart.total_price}"
cart.save_to_file('new_json_file', :json)
cart.save_to_file('new_csv_file', :csv)
cart.save_to_file('new_yaml_file', :yaml)
cart.delete_items
cart.show_all_items
Cart.total_price(cart)
puts "Cart price:#{cart.total_price}"

input_reader = InputReader.new
sets = MyApplicationDomnitsak::MyApplicationSettings.instance #Можна й інші валідатор і процес
process = ->(input) { input.to_i }

result = input_reader.read(
  welcome_message: "Enter a number:",
  process: process,
  validator: sets.validator,
  error_message: "Please enter a valid number."
)
puts result

#mech = LoginAndVisitPage.new # Mechanize, але з prom.ua не дуже хоче працювати
#mech.login(sets)