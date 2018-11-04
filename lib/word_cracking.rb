require_relative 'words'
module WordCracking
  def check_all_possible_amounts_and_find_key_that_results_in_most_words
    keys_and_word_counts = {}
    until @possible_key_values.empty?
      result = check_next_possible_amounts_for_word_count
      keys_and_word_counts.merge(result) if result
      require 'pry'; binding.pry if result
    end
    result = keys_and_word_counts.max_by{|key,word_count| word_count}
    result ? result[0] : "Couldn't crack"
  end

  def check_next_possible_amounts_for_word_count
    amounts_cycle = next_possible_amounts.cycle
    word_count = 0; word = ''
    while word_count >= 0 && word != :string_ends
      word = make_word(amounts_cycle)
      Words.common?(word) ? word_count += 1 : word_count -= 1
    end
    word_count > 0 ? {current_key => word_count} : nil
  end

  def make_word(amounts_cycle)
    word = ""
    @string[@index..-1].chars.each_with_index do |char, i|
      letter = rotate_letter(char, amounts_cycle.peek)
      if letter == " "
        # require 'pry'; binding.pry
        next if word.empty?
        @index += i + 1; return word
      else
        word += letter
      end
      amounts_cycle.next
    end
    return word
  end
end
