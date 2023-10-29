# frozen_string_literal: true

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
    File.open(filename, 'w') do |file|
      @items.each { |i|
        file.write(JSON.generate(i.map(&:to_h)))
      }
    end
  end

  def save_to_csv(filename)
    CSV.open(filename, 'w') do |csv|
      csv << ["Name","Type","Price","Company","Quantity"]
      @items.each do |item|
        csv << [item.name, item.type, item.price, item.company, item.quantity]
      end
    end
  end
end
