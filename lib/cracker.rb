require_relative 'crypter'

class Cracker < Crypter

  def initialize(string, date)
    @string = string
    @date = date
    @possible_key = '999'
  end

  def next_possible_amounts
    @possible_key.next
  end

  private

  attr_reader :possible_key
end
