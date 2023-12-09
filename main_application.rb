# frozen_string_literal: true

class MainApplication
  require_relative 'libs'

  def self.get_items(url)
    parser = Parser.new(url)

    items = parser.parse_item(
      '[data-qaid="product_presence"]',
      /Готово до відправки/,
      {
        name: '[data-qaid="product_name"]',
        price: '[data-qaid="product_price"]',
        shop: '[data-qaid="company_name"]',
        availability: '[data-qaid="product_presence"]'
      }
    )
  
   items
  end


end
