require './test/test_helper'
require './lib/enigma'
class EncryptionTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_it_encrypts_a_string
    @e.encrypt(nil, "02715", "040895")
    assert_equal 'keder ohulw', @e.encrypt_string("hello world")
  end



end
