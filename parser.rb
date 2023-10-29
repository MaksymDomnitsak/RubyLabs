# frozen_string_literal: true
#require_relative "libs.rb"
class Parser

  @url = "https://prom.ua/ua/Planshetnye-netbuki"
  def parse_item(selection_condition, regex=/ланш/)
    html = Nokogiri::HTML(URI.open(@url))
    selected_items = html.css(selection_condition)

  end
end
