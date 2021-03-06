require_relative 'crypter'
require_relative 'date_handling'
require_relative 'word_cracking'

class Cracker < Crypter
  include WordCracking
  include DateHandling

  def initialize(string, date, assumption = {string:' end', location: -4})
    @string = string
    @date = date
    @possible_key_values = (0..99999).to_a
    @assumption = assumption
    set_defaults
    assumption ? extract_info_from_assumption : setup_for_wordcracking
  end

  def setup_for_wordcracking
    @direction = :backward; @index = 0
  end

  def extract_info_from_assumption
    @positive_assumption_location = positive_assumption_location
    @cycle_start_index = which_amount_at_beginning_of_assumption_string
  end

  def next_possible_key
    int_to_string(@possible_key_values.shift)
  end

  def next_possible_amounts
    key_to_amounts_with_offsets(next_possible_key, offsets)
  end

  def offsets
    ddmmyy_to_offsets(@date.ddmmyy)
  end

  def crack
    if @assumption
      check_all_possible_amounts_against_assumption_until_one_passes
    else
      check_all_possible_amounts_and_find_key_that_results_in_most_words
    end
  end

  def check_all_possible_amounts_against_assumption_until_one_passes
    until @possible_key_values.empty?
      result = check_next_possible_amounts_against_assumption
      return result if result
    end
    "Couldn't crack"
  end

  def check_next_possible_amounts_against_assumption
    i = @positive_assumption_location
    amounts_cycle = next_possible_amounts.rotate(@cycle_start_index).cycle
    assumption[:string].chars.each do |char|
      return false unless rotate_letter(char, amounts_cycle.next) == @string[i]
      i += 1
    end
    current_key
  end

  def current_key
    int_to_string(@possible_key_values[0] - 1)
  end

  def which_amount_at_beginning_of_assumption_string
    @positive_assumption_location % 4
  end

  def positive_assumption_location
    ass_loc = @assumption[:location]
    ass_loc >= 0 ? ass_loc : @string.size + ass_loc
  end

  private

  attr_reader :possible_key_values, :assumption
end
