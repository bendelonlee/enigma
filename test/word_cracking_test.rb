require './test/test_helper'
require './lib/cracker'

class WordCrackingTest < Minitest::Test

  def test_it_exists
    @cracker = Cracker.new('keder ohulwthnw', ReliableDate.new('040895'), nil)
    @cracker.is_a?(WordCracking)
  end

  def test_when_it_has_no_assumptions_it_can_still_crack_the_encryption_by_checking_for_common_words
    skip
    assert_equal '02715', @cracker.crack
  end

  def test_method_check_all_possible_amounts_and_find_key_that_results_in_most_words
    skip
    assert_equal '02715', @cracker.check_all_possible_amounts_and_find_key_that_results_in_most_words
  end
end
