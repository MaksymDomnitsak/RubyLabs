# frozen_string_literal: true

class Item

  attr_accessor :name,:type,:price,:shop,:availability

  def initialize(name,type,price,company,availability = 0)
    @name,@type,@price,@shop,@availability = name,type,price,shop,availability
  end

  def info
    if block_given?
      yield(self)
    else
      self.to_s
    end
  end

  
  def to_s
    "Item: #{@name}, Type: #{@type}, Price: #{@price}, Company: #{@shop}, Is available: #{@availability.to_i > 0 ? 'true' : 'false'}"
  end

  def to_h
    {
      name: @name,
      type: @type,
      price: @price,
      company: @shop,
      availability: @availability
    }
  end
end
