require 'date'

class Enigma

  CHARACTER_MAP = ('a'..'z').to_a + ('0'..'9').to_a + [' ', ",", "."]

  def initialize

  end

  def rotate_letter(letter, amount)
    index = CHARACTER_MAP.index(letter)
    CHARACTER_MAP[(index + amount) % 39]
  end

  def rotate_string(string, amounts)
    amounts_cycle = amounts.cycle
    string.chars.map do |ch|
      rotate_letter(ch, amounts_cycle.next.to_i)
    end.join
  end

end
