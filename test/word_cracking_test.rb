require './test/test_helper'
require './lib/cracker'

class WordCrackingTest < Minitest::Test

  def setup
    @cracker = Cracker.new('mhoztskjkezgfuy tbkgdev tskjkezgbtfcblrggozgynjgpizottnltwuyx kux paltfzh zoutfpm bpelfiy yakeretfuyyvkytskjkez
', ReliableDate.new('051118'), nil)
  end

  def test_it_exists
    assert @cracker.is_a?(WordCracking)
  end

  def test_when_it_has_no_assumptions_it_can_still_crack_the_encryption_by_checking_for_common_words
    assert_equal '11857', @cracker.crack
  end

  def test_check_next_possible_amounts_for_word_count
    11857.times{@cracker.next_possible_key}
    assert_equal ({'11857'=>4}), @cracker.check_next_possible_amounts_for_word_count
  end


  def test_method_check_all_possible_amounts_and_find_key_that_results_in_most_words
    assert_equal '11857', @cracker.check_all_possible_amounts_and_find_key_that_results_in_most_words
  end
end
