require './test/test_helper'
require './lib/enigma'

class KeyHandlingTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_turns_integers_into_strings_of_specified_length
    assert_equal '0001', @e.int_to_string(1, 4)
    assert_equal '1234', @e.int_to_string(1234, 4)
  end


  def test_it_can_generate_a_random_key_of_length_four_by_default
    actual = @e.random_key
    assert_instance_of String, actual
    assert_equal 4, actual.length
    assert actual[/\d{4}/]
  end

  def test_it_can_generate_a_random_key_of_any_length
    actual = @e.random_key(7)
    assert_instance_of String, actual
    assert_equal 7, actual.length
    assert actual[/\d{7}/]
  end

  def test_it_turns_keys_into_amounts
    assert_equal [41,15,52,21], @e.key_to_amounts('41521')
  end

  def test_it_turns_keys_into_amounts
    assert_equal [41,15,52,21], @e.key_to_amounts('41521')
  end

  def test_it_turns_keys_and_offsets_into_amounts
    assert_equal [42,17,55,25], @e.key_to_amounts_with_offsets('41521', [1,2,3,4])
  end


end
