# frozen_string_literal: true

module MyApplicationDomnitsak
  require_relative 'main_application.rb'
  require_relative 'libs.rb'

  class MyApplicationSettings
    require_relative 'user.rb'
    include Singleton

    attr_accessor :web_address, :validator, :file_ext, :parse_item, :user

    def initialize
      @web_address = "https://prom.ua/ua/Monitory"
      @validator = lambda { |page_count| page_count.to_i.between?(1, 100) }
      @file_ext = 'rb'
      @parse_item = /Готово до відправки/
      file_pass = File.open('text.txt')
      @user = User.new('domnitsak.maksym@chnu.edu.ua', file_pass.read)
      file_pass.close
    end

  end
end
