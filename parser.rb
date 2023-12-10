# frozen_string_literal: true
require_relative "libs"
require 'nokogiri'
require 'open-uri'

class Parser

  def initialize(url)
    @url = url
  end


  def parse_item(selection_condition, value_regex = /./, attribute_selectors = {})
    html = Nokogiri::HTML(URI.open(@url))
    gallery_items = html.css('[data-qaid="product_block"]')
    item_type = html.at_css('ol[data-qaid="breadcrumbs_seo"] li[data-qaid="breadcrumbs_seo_item"]:last-child')&.text&.strip

    items = []

    gallery_items.each do |product_block|
      next unless product_block.at_css("#{selection_condition}:contains('#{value_regex.source}')")
      item = Item.new("")

      attribute_selectors.each do |attribute, selector|
        item.instance_variable_set('@'.to_s+attribute.to_s,product_block.at_css(selector)&.text&.strip)
      end

      item.availability = get_availability_value(item.availability)
      item.type = item_type
      items << item
    end

    items
  end


  def get_availability_value(availability)
    availability == 'Готово до відправки' ? true : false
  end

end
