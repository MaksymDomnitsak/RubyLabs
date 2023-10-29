# frozen_string_literal: true

module ItemContainer
  module ClassMethods
    def total_price
      @total_price ||= 0
      @items.each do |item|
        @total_price += item.product.price * item.quantity
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
      if(method.to_s = "show_all_items")
        define_method(method) do
          @items.each { |i|
            puts item.product.to_s+", quantity: "+item.quantity
          }
        end
        send(method,*args,&block)
      end
    end
  end

  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.send(:include, InstanceMethods)
  end

end


