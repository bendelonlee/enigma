require_relative 'crypter'
require_relative 'date_handling'


class Cracker < Crypter
  include DateHandling

  def initialize(string, date, assumptions = nil)
    @string = string
    @date = date
    @possible_key_values = (0..99999).to_a
    @assumptions = assumptions ? assumptions : [{string:' end', location: -4}]
  end

  def next_possible_amounts
    key_to_amounts(int_to_string(@possible_key_values.shift))
  end

  def next_possible_amounts_adjusted_with_date
    (next_possible_amounts)
  end

  def offsets
    ddmmyy_to_offsets(@date.ddmmyy)
  end

  def check_next_possible_amounts
    key_to_amounts_with_offsets(next_possible_amounts, offsets)
  end

  private

  attr_reader :possible_key_values, :assumptions
end
