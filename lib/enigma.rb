require 'date'

class Enigma

  CHARACTER_MAP = ('a'..'z').to_a + ('0'..'9').to_a + [' ', ",", "."]

  def initialize

  end

  def rotate_letter(letter, amount)
    index = CHARACTER_MAP.index(letter)
    CHARACTER_MAP[(index + amount) % 39]
  end

  def rotate_string_by_amounts(string, amounts)
    amounts_cycle = amounts.cycle
    string.chars.map do |ch|
      rotate_letter(ch, amounts_cycle.next.to_i)
    end.join
  end

  def rotate_string_by_key(string, key)
    rotate_string_by_amounts(string, key_to_amounts(key))
  end

  def key_to_amounts(key)
    key.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def key_to_amounts_with_offsets(key, offsets)
    offsets_cycle = offsets.cycle
    key_to_amounts(key).map { |n| n + offsets_cycle.next }
  end

end
