# frozen_string_literal: true

class Item

  attr_accessor :name,:type,:price,:shop,:availability

  def initialize(name,type,price,shop,availability = false)
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
    "Item: #{@name}, Type: #{@type}, Price: #{@price}, Shop: #{@shop}, Is available: #{@availability}"
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
