require './test/test_helper'
require './lib/cracker'

class CrackerTest < Minitest::Test

  def setup
    @cracker = Cracker.new('keder ohulwthnw', ReliableDate.new('040895'))
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_possible_key_values_start_as_0_to_99999_by_default
    assert_equal (0..99999).to_a, @cracker.send(:possible_key_values)
  end

  def test_it_defaults_to_assumming_that_the_word_end_preceded_by_a_space_will_be_at_the_end_of_a_message
    assert_equal ({string:' end', location: -4}), @cracker.send(:assumption)
  end

  def test_it_can_check_amounts_against_assumptions_and_find_that_the_key_used_is_not_valid
    refute @cracker.check_next_possible_amounts
  end

  def test_check_next_possible_returns_key_when_key_is_correct
    2715.times{@cracker.next_possible_key}
    assert_equal '02715', @cracker.check_next_possible_amounts
  end

  def test_it_keeps_going_until_it_finds_a_key_that_causes_the_assumption_to_be_true_then_returns_key
    assert_equal '02715', @cracker.crack
  end

  def test_offsets_returns_offsets_from_stored_date
    assert_equal [1, 0, 2, 5], @cracker.offsets
  end

  def test_next_possible_amounts_returns_correctly
    assert_equal [1, 0, 2, 5], @cracker.next_possible_amounts
    assert_equal [1, 0, 2, 6], @cracker.next_possible_amounts
  end

  def test_which_amount_at_beginning_of_assumption_string
    assert_equal 3, @cracker.which_amount_at_beginning_of_assumption_string
  end

  def test_positive_assumption_location
    assert_equal 11, @cracker.positive_assumption_location
  end

end
