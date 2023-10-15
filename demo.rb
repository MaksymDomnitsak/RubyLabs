# frozen_string_literal: true
require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://prom.ua/ua/Planshetnye-netbuki"))
puts page.css('li span')[0].text   # => Nokogiri::HTML::Document
