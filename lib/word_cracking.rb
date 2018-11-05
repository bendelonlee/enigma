require_relative 'words'
require_relative 'decrypter'
module WordCracking
  def check_all_possible_amounts_and_find_key_that_results_in_most_words
    keys_and_word_counts = {}
    until @possible_key_values.empty?
      result = check_next_possible_amounts_for_word_count
      keys_and_word_counts.merge!(result) if result
    end
    result = keys_and_word_counts.max_by{|key,word_count| word_count}
    result ? result[0] : "Couldn't crack"
  end

  def check_next_possible_amounts_for_word_count
    new_key = next_possible_key
    @decrypter = Decrypter.new(@string[0..20], new_key, @date)
    word_count = Words.word_count(@decrypter.decrypt_string)
    word_count > 0 ? {new_key => word_count} : nil
  end

end
