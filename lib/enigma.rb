require 'date'

class Enigma

  def initialize(char_map_options = nil)
    @character_map = ('a'..'z').to_a << ' '
  end

  def random_key(length = nil)
    length ||= 4
    n = rand(10**length)
    int_to_string(n, length)
  end

  def int_to_string(int, length)
    str = int.to_s
    diff = length - str.size
    '0' * diff + str
  end

  def rotate_letter(letter, amount)
    index = @character_map.index(letter)
    @character_map[(index + amount) % @character_map.length]
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

  def rotate_string_by_key_and_offsets(string, key, offsets)
    first_result = rotate_string_by_key(string, key)
    rotate_string_by_amounts(first_result, offsets)
  end

  def key_to_amounts(key)
    key.chars.each_cons(2).map { |pair| pair.join.to_i }
  end

  def key_to_amounts_with_offsets(key, offsets)
    offsets_cycle = offsets.cycle
    key_to_amounts(key).map { |n| n + offsets_cycle.next }
  end

end
