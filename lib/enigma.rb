require 'date'

class Enigma

  ALPHABET = ('a'..'z').to_a

  def initialize

  end

  def rotate_letter(letter, amount)
    index = ALPHABET.index(letter)
    ALPHABET[index + amount]
  end

  def rotate_string(string, key)
    key_cycle = key.chars.cycle
    string.chars.map do |ch|
      rotate_letter(ch, key_cycle.next.to_i)
    end.join
  end

end
