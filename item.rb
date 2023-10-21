# frozen_string_literal: true

class Item

  attr_accessor :name,:type,:price,:company,:availability

  def initialize(name,type,price,company,availability)
    @name,@type,@price,@company,@availability = name,type,price,company,availability
  end

  def info
    if block_given?
      yield(self)
    else
      self.to_s
    end
  end

  def to_s
    "Item: #{@name}, Type: #{@type}, Price: #{@price}, Company: #{@company}, Is available: #{@availability > 0 ? "true" : "false"}"
  end

  def to_h
    {
      name: @name,
      type: @type,
      price: @price,
      company: @company,
      availability: @availability
    }
  end
end
