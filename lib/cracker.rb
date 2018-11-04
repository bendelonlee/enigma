require_relative 'crypter'
require_relative 'date_handling'


class Cracker < Crypter
  include DateHandling

  def initialize(string, date, assumption = nil)
    @string = string
    @date = date
    @possible_key_values = (0..99999).to_a
    @assumption = assumption ? assumption : {string:' end', location: -4}
  end

  def next_possible_amounts
    #will likely want to delete
    key_to_amounts(int_to_string(@possible_key_values.shift))
  end

  def next_possible_key
    int_to_string(@possible_key_values.shift)
  end

  def next_possible_amounts_adjusted_with_date
    key_to_amounts_with_offsets(next_possible_key, offsets)
  end

  def offsets
    ddmmyy_to_offsets(@date.ddmmyy)
  end

  def check_next_possible_amounts
    next_possible_amounts_adjusted_with_date
  end

  def which_amount_at_beginning_of_assumption_string

  end

  def positive_assumption_location
    ass_loc = @assumption[:location]
    require 'pry'; binding.pry
    ass_loc >= 0 ? ass_loc : @string.size + ass_loc
  end

  private

  attr_reader :possible_key_values, :assumption
end
