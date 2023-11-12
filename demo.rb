# frozen_string_literal: true
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require_relative 'main_application'
require_relative 'cart'

cart = Cart.new()
MainApplication.get_items.each do |item|
    cart.add_item(item, 1)
end
cart.save_to_file('new_json_file', :json)