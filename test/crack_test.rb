require './test/test_helper'
require './lib/decrypter'
require './lib/encrypter'

class CrackTest < Minitest::Test

  def setup
    @d = Decrypter.new('keder ohulw', nil, ReliableDate.new('040895'))
  end

  def test_it_decrypts_a_string
    skip
    expected = {
      decryption: "hello world end",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @d.result
  end

  def test_it_can_iterate_through_possible_amounts_generated_from_keys_five_digits_long
    assert_equal [0,0,0,0], next_possible_amounts
    assert_equal [0,0,0,1], next_possible_amounts
  end

end
