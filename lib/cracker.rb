require_relative 'crypter'
require_relative 'key_handling'
require_relative 'rotation'

class Cracker < Crypter
  include KeyHandling
  include Rotation

  def initialize(string, date)
    @string = string
    @date = date
    @possible_key_values = (0..9999)
  end

  def next_possible_amounts
    @possible_key.next
  end

  private

  attr_reader :possible_key
end
