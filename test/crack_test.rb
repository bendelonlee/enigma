require './test/test_helper'
require './lib/decrypter'
require './lib/encrypter'

class CrackTest < Minitest::Test

  def setup
    @d = Decrypter.new('keder ohulw', nil, ReliableDate.new('040895'))
  end

  def test_it_decrypts_a_string
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @d.result
  end

end
