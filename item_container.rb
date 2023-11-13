# frozen_string_literal: true

module ItemContainer
  module ClassMethods
    def total_price(cart)
      cart.total_price = 0.0
      cart.items.each do |item|
        price = item[:product].price.to_s.tr(' ','').tr('₴','')
        cart.total_price += price.to_f * item[:quantity]
      end
    end
  end

  module InstanceMethods
    def add_item(product, quantity = 1)
      @items << { product: product, quantity: quantity }
    end

    def remove_item(item)
      @items.delete(item)
    end

    def delete_items
      @items = []
    end

    def method_missing(method, *args, &block)
      if method.to_s.strip.eql?('show_all_items'.to_s)
        ItemContainer.define_method('show_all_items') do
          res = ''
          items.each { |item|
            res += item[:product].to_s+", quantity: "+item[:quantity].to_s+"\n"
          }
          puts res
        end
        public_send(method,*args)
      else
        super.method_missing(method, *args, &block)
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?('show_') || super
    end
  end

  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.send(:include, InstanceMethods)
  end

end


