module Rotation
    def rotate_letter(letter, amount)
      return letter unless @character_map.include?(letter)
      index = @character_map.index(letter)
      @character_map[(shift(index, amount)) % @character_map.length]
    end

    def shift(index, amount)
      case @direction
      when :forward
        index + amount
      when :backward
        index - amount
      end
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
end
