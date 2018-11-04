require './test/test_helper'
require './lib/cracker'

class CrackerTest < Minitest::Test

  def setup
    @cracker = Cracker.new('keder ohulw', ReliableDate.new('040895'))
  end

  def test_it_exists
    assert_instance_of Cracker, @cracker
  end

  def test_possible_key_values_start_as_0_to_99999_by_default
    assert_equal (0..99999).to_a, @cracker.send(:possible_key_values)
  end

  def test_it_decrypts_a_string
    skip
    expected = {
      decryption: "hello world end",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @cracker.result
  end

  def test_it_can_iterate_through_possible_amounts_generated_from_keys_five_digits_long
    assert_equal [0,0,0,0], @cracker.next_possible_amounts
    assert_equal [0,0,0,1], @cracker.next_possible_amounts
  end

  def test_it_defaults_to_assumming_that_the_word_end_preceded_by_a_space_will_be_at_the_end_of_a_message
    assert_equal [{string:' end', location: -4}], @cracker.send(:assumptions)
  end

  def test_it_can_check_amounts_against_assumptions_and_find_that_the_key_used_is_not_valid
    skip
    refute @cracker.check_next_possible_amounts
  end

  def test_it_can_iterate_through_more_possible_amounts_generated_from_keys_five_digits_long
    1234.times { @cracker.next_possible_amounts }
    assert_equal [1, 12, 23, 34], @cracker.next_possible_amounts
    assert_equal [1, 12, 23, 35], @cracker.next_possible_amounts
  end

  def test_offsets_returns_offsets_from_stored_date
    assert_equal [1, 0, 2, 5], @cracker.offsets
  end

  def test_next_possible_amounts_adjusted_with_date_returns_correctly
    assert_equal [1, 0, 2, 5], @cracker.next_possible_amounts_adjusted_with_date
    assert_equal [1, 0, 2, 6], @cracker.next_possible_amounts_adjusted_with_date
  end

end
