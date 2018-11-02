require './test/test_helper'
require './lib/enigma'
class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @e
  end

  def test_it_encrypts
    skip
    actual = @e.encrypt("This secret must be kept secret")
    assert_equal "Soemthing", actual
  end


  def test_it_rotates_a_letter
    assert_equal 'b', @e.rotate_letter('a', 1)
    assert_equal 'a', @e.rotate_letter(' ', 1)
  end

  def test_it_rotates_a_string_by_amounts
    assert_equal 'bcad', @e.rotate_string_by_amounts('aaaa', [1, 2, 0, 3])

  end

  def test_it_rotates_a_string_by_key
    assert_equal ' i i ', @e.rotate_string_by_key('zzzzz', '010')
  end

  def test_it_rotates_a_string_by_key_and_offsets
    assert_equal 'bldkc', @e.rotate_string_by_key_and_offsets('     ', '010',[1,2,3])
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
