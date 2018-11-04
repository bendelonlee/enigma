require './test/test_helper'
require './lib/cracker'

class WordCrackingTest < Minitest::Test

  def setup
    @cracker = Cracker.new('keder ohulwthnw', ReliableDate.new('040895'), nil)
  end

  def test_it_exists
    @cracker.is_a?(WordCracking)
  end

  def test_when_it_has_no_assumptions_it_can_still_crack_the_encryption_by_checking_for_common_words
    skip
    assert_equal '02715', @cracker.crack
  end

  def test_check_next_possible_amounts_for_word_count
    skip
    2715.times{@cracker.next_possible_key}
    assert_equal ({'02715'=>2}), @cracker.check_next_possible_amounts_for_word_count
  end

  def test_make_word
    skip
    amounts_cycle = [3, 27, 73, 20].cycle
    assert_equal 'hello', @cracker.make_word(amounts_cycle)
    assert_equal 'world', @cracker.make_word(amounts_cycle)
    assert_equal 'end', @cracker.make_word(amounts_cycle)
  end

  def test_make_word_simply
    @cracker.instance_variable_set(:@string, 'iahppf uhjs wprls')
    amounts_cycle = [0, 1].cycle
    assert_equal 'i', @cracker.make_word(amounts_cycle)
    assert_equal 'hope', @cracker.make_word(amounts_cycle)
    assert_equal 'this', @cracker.make_word(amounts_cycle)
    assert_equal 'works', @cracker.make_word(amounts_cycle)
  end

  def test_method_check_all_possible_amounts_and_find_key_that_results_in_most_words
    skip
    assert_equal '02715', @cracker.check_all_possible_amounts_and_find_key_that_results_in_most_words
  end
end
