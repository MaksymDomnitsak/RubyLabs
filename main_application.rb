# frozen_string_literal: true

class MainApplication
  require_relative 'libs'

  #@@path_for_csv = "D:/Csv/"
  #@@path_for_json = "D:/Json/"
  @url="https://prom.ua/ua/Monitory"

  def self.get_items
    parser = Parser.new(@url)

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
