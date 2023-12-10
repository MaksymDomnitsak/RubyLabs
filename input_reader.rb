# frozen_string_literal: true
class InputReader
  def read(welcome_message: nil, process: nil, validator: nil, error_message: nil)
    puts welcome_message if welcome_message

    loop do
      print "> "
      input = gets.chomp

      if validator && !validator.call(input)
        puts error_message || "Invalid input. Please try again."
        next
      end

      result = process ? process.call(input) : input

      return result
    end
  end
end
