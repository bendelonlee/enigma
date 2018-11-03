require_relative 'crypter'

class Cracker < Crypter

  def initialize(string, date)
    @string = string
    @date = date
  end

  def next_possible_amounts
    @possible_key.next
  end
end
