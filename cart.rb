# frozen_string_literal: true
require 'csv'
require 'json'
require_relative 'item_container'

class Cart
  include ItemContainer

  attr_accessor :items,:total_price

  def initialize
    @items = []
    @total_price = 0
  end

  def save_to_file(filename, format = :json)
    case format
    when :json
      save_to_json(filename)
    when :csv
      save_to_csv(filename)
    when :yaml
      save_to_yaml(filename)
    else
      puts "Unsupported format for saving: #{format}"
    end
  end

  def save_to_json(filename)
    File.open(filename + '.json', 'w') do |file|
      file.write(JSON.pretty_generate(@items.map(&:to_h)))
    end
  end

  def save_to_csv(filename)
    CSV.open(filename + '.csv', 'w') do |csv|
      csv << %w[Name Type Price Shop Quantity]
      @items.each do |item|
        csv << [item[:product].name, item[:product].type, item[:product].price, item[:product].shop, item[:quantity]]
      end
    end
  end

  def save_to_yaml(filename)
    data = {
      items: @items.map { |item| item.to_h },
      total_items: self.items.length
    }

    File.open(filename, 'w') do |file|
      file.write(data.to_yaml)
    end
  end
end
