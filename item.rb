# frozen_string_literal: true

class Item

  attr_accessor :name
  attr_accessor :type
  attr_accessor :price
  attr_accessor :company
  attr_accessor :availability

  def initialize(name,type,price,company,availability)
    @name,@type,@price,@company,@availability = name,type,price,company,availability
  end

  def info
    yield
  end

  def to_s

  end

  def to_h

  end
end
