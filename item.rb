# frozen_string_literal: true

class Item
  include Comparable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def method_missing(name, *args, &block)
    attribute_name = name.to_s

    if attribute_name.end_with?('=')
      dynamic_attribute = attribute_name.chomp('=')
      instance_variable_set("@#{dynamic_attribute}", args.first)
      self.class.send(:attr_accessor, dynamic_attribute)
    else
      instance_variable_get("@#{attribute_name}")
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.end_with?('=') || super
  end

  def info
    if block_given?
      yield(self)
    else
      self.to_s
    end
  end

  def <=>(other_item)
    self.price <=> other_item.price
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
