require_relative 'crypter'
require_relative 'key_handling'
require_relative 'rotation'

class Cracker < Crypter
  include KeyHandling
  include Rotation

  def initialize(string, date, assumptions = nil)
    @string = string
    @date = date
    @possible_key_values = (0..99999).to_a
    @assumptions = assumptions ? assumptions : [{string:' end', location: -4}]
  end

  def next_possible_amounts
    key_to_amounts(int_to_string(@possible_key_values.shift))
  end

  private

  attr_reader :possible_key_values, :assumptions
end
