# frozen_string_literal: true

# Skrr
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    last_digit = nums_a.pop
    # TODO: use the integers in nums_a to validate its last check digit
    multipled = nums_a.each_with_index.map { |val, index| index.even? ? val : val * 2 }
    sum = multipled.reduce do |val1, val2|
      val2 = (val2 / 10) + (val2 % 10) if val2 > 10
      val1 + val2
    end
    last_digit == (10 - (sum % 10))
  end
end
