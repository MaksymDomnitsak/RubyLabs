# frozen_string_literal: true
require_relative 'item_container'
require 'csv'
require 'json'

class Cart
  include ItemContainer

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
    else
      puts "Unsupported format for saving: #{format}"
    end
  end

  def save_to_json(filename)
    File.open(filename + '.json', 'w') do |file|
      file.write(JSON.generate(@items.map(&:to_h)))
    end
  end

  def save_to_csv(filename)
    CSV.open(filename + '.csv', 'w') do |csv|
      csv << ["Name","Type","Price","Shop","Quantity"]
      @items.each do |item|
        csv << [item[:product].name, item[:product].type, item[:product].price, item[:product].shop, item[:quantity]]
      end
    end
  end
end
