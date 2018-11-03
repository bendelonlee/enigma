require './test/test_helper'
require './lib/decrypter'
require './lib/encrypter'

class DecrypterTest < Minitest::Test

  def setup
    @d = Decrypter.new('keder ohulw', '02715', SimpleDate.new('040895'))
  end

  def test_its_direction_is_backward_by_default
    assert_equal :backward, @d.send(:direction)
  end

  def test_it_exists
    assert_instance_of Decrypter, @d
  end

  def test_it_decrypts_a_string
    assert_equal 'hello world', @d.decrypt_string
  end

  def test_it_returns_a_hash_as_a_result
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @d.result
  end



end
