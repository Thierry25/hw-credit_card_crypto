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
    multipled = nums_a.reverse.each_with_index.map { |val, index| index.odd? ? val : val * 2 }
    sum = 0
    multipled.each do |val|
      val = (val % 10) + (val / 10) if val >= 10
      sum += val
    end
    last_digit == ((10 - (sum % 10)) % 10)
  end
end
