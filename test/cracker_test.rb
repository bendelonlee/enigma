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

end
